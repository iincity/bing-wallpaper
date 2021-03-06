﻿using Newtonsoft.Json;
using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;

namespace bing_wallpaper
{
    public class BingUtils
    {
        public static readonly string BING_IMG_URL_JSON = "http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=";
        public static readonly string BING_URL = "http://www.bing.com";
        public static readonly string BING_RESOLUTION = "_1920x1080.jpg";
        private static string LOCAL_IMAGE_FILE_JPG = System.IO.Path.GetTempPath() + "bing-wallpaper.jpg";
        public static string LOCAL_CONFIGURATION_FILE_JSON = System.IO.Path.GetTempPath() + "bing-wallpaper.json";
        
        private static BingObject Step1_DownloadBingConfigFile(string location)
        {
            BingObject newBingObject = null, actualBingObject = null;
            string json = string.Empty;
            try
            {
                string url = string.Format("{0}{1}", BING_IMG_URL_JSON, location);
                if (Utils.IsInternetAvailable())
                {
                    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                    using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                    using (Stream stream = response.GetResponseStream())
                    using (StreamReader reader = new StreamReader(stream))
                    {
                        json = reader.ReadToEnd();
                        newBingObject = JsonConvert.DeserializeObject<BingObject>(json);

                        if (File.Exists(LOCAL_CONFIGURATION_FILE_JSON))
                        {
                            string fileJson = File.ReadAllText(LOCAL_CONFIGURATION_FILE_JSON);
                            actualBingObject = JsonConvert.DeserializeObject<BingObject>(fileJson);
                            newBingObject.config = actualBingObject.config;
                            File.Delete(LOCAL_CONFIGURATION_FILE_JSON);
                        }
                        File.WriteAllText(LOCAL_CONFIGURATION_FILE_JSON, JsonConvert.SerializeObject(newBingObject));
                    }
                }
                else
                {
                    throw new WebException();
                }
            }
            catch
            {
                //Fallo en la red, obtenemos el temporal
                json = File.ReadAllText(LOCAL_CONFIGURATION_FILE_JSON);
                newBingObject = JsonConvert.DeserializeObject<BingObject>(json);
            }
            return newBingObject;
        }

        private static void Step2_DownloadImageFile(string url)
        {
            try
            {
                if (Utils.IsInternetAvailable())
                {
                    WebClient webClient = new WebClient();
                    webClient.DownloadFile(url, LOCAL_IMAGE_FILE_JPG);
                }
            }
            catch { }
        }

        public static BingObject ReadConfig()
        {
            BingObject result = null;
            if (File.Exists(LOCAL_CONFIGURATION_FILE_JSON))
            {
                string fileJson = File.ReadAllText(LOCAL_CONFIGURATION_FILE_JSON);
                result = JsonConvert.DeserializeObject<BingObject>(fileJson);
            }
            return result;
        }
        public static string GetWallpaperFromBing(string location, ref BingObject bingObject)
        {
            try
            {
                bingObject = Step1_DownloadBingConfigFile(location);
                string url = string.Format("{0}{1}{2}", BING_URL, bingObject?.images?.FirstOrDefault()?.urlbase, BING_RESOLUTION);
                Debug.Print("La imagen está en: {0}", url);
                Step2_DownloadImageFile(url);
            }
            catch(Exception ex) {
                Debug.Print(ex.Message);
            }
            return LOCAL_IMAGE_FILE_JPG;
        }
    }
}
