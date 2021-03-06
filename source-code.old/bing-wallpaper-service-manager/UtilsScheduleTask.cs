﻿using Microsoft.Win32.TaskScheduler;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace bing_wallpaper_service_manager
{
    public class UtilsScheduleTask
    {
        public static bool DeleteScheduleTask(string taskName)
        {
            bool result = false;
            try
            {
                if (ExistsScheduleTask(taskName))
                {
                    using (TaskService tasksrvc = new TaskService())
                    {
                        tasksrvc.RootFolder.DeleteTask(taskName);
                    }
                }
            }
            catch { }
            return result;
        }

        public static bool ExistsScheduleTask(string taskName)
        {
            using (TaskService tasksrvc = new TaskService())
            {
                return tasksrvc.FindTask(taskName) != null;
            }
        }

        public static bool CreateScheduleTask(string taskName, string description, bool runAtStartup, string executionPeriod)
        {
            bool result = false;
            try
            {
                using (TaskService ts = new TaskService())
                {
                    // Create a new task definition for the local machine and assign properties
                    TaskDefinition td = TaskService.Instance.NewTask();
                    td.RegistrationInfo.Description = description;
                    td.Settings.DisallowStartIfOnBatteries = false;
                    td.Settings.StopIfGoingOnBatteries = false;
                    td.Settings.RunOnlyIfNetworkAvailable = true;
                    td.Settings.MultipleInstances = TaskInstancesPolicy.StopExisting;

                    // Create a trigger that fires when log in
                    if (runAtStartup)
                    {
                        LogonTrigger lt = new LogonTrigger();
                        td.Triggers.Add(lt);

                        //Creating boot trigger that fires 2 minutes after the system starts.
                        //---NO LONGER NECESSARY
                        /*BootTrigger bt = new BootTrigger();
                        bt.Delay = TimeSpan.FromMinutes(2);
                        td.Triggers.Add(bt);*/
                    }

                    switch (executionPeriod) {
                        default:
                        case "Every Day":
                            // Create a trigger that runs every day at 9:05.
                            DailyTrigger dt = new DailyTrigger();
                            dt.StartBoundary = DateTime.Today + TimeSpan.FromHours(9) + TimeSpan.FromMinutes(5);
                            dt.DaysInterval = 1;
                            td.Triggers.Add(dt);
                            break;
                        case "Every Week":
                            WeeklyTrigger wt = new WeeklyTrigger();
                            wt.StartBoundary = DateTime.Today + TimeSpan.FromHours(9) + TimeSpan.FromMinutes(5);
                            wt.DaysOfWeek = DaysOfTheWeek.Monday;
                            wt.WeeksInterval = 1;
                            td.Triggers.Add(wt);
                            break;
                        case "Every Month":
                            MonthlyTrigger mt = new MonthlyTrigger();
                            mt.StartBoundary = DateTime.Today + TimeSpan.FromHours(9) + TimeSpan.FromMinutes(5);
                            mt.RunOnLastDayOfMonth= true;
                            mt.MonthsOfYear = MonthsOfTheYear.AllMonths;
                            td.Triggers.Add(mt);
                            break;
                        case "Every 3 Months":
                            MonthlyTrigger mt2 = new MonthlyTrigger();
                            mt2.StartBoundary = DateTime.Today + TimeSpan.FromHours(9) + TimeSpan.FromMinutes(5);
                            mt2.RunOnLastDayOfMonth = true;
                            mt2.MonthsOfYear = MonthsOfTheYear.January | MonthsOfTheYear.March | MonthsOfTheYear.May | MonthsOfTheYear.July | MonthsOfTheYear.September | MonthsOfTheYear.November;
                            td.Triggers.Add(mt2);
                            break;
                        case "Never More":
                            ts.RootFolder.DeleteTask(taskName, false);
                            result = true;
                            return result;
                    }
                   

                    //string programFiles = Environment.ExpandEnvironmentVariables("%ProgramW6432%");
                    string workingDirectory = string.Format(@"{0}\{1}", Environment.ExpandEnvironmentVariables("%ProgramFiles(x86)%"), "Bing Wallpaper");
                    string programUri = string.Format(@"{0}\{1}", workingDirectory, "BingWallpaper.exe");

                    // Create an action that will launch Notepad whenever the trigger fires
                    td.Actions.Add(programUri,null, workingDirectory);
                   
                    // Register the task in the root folder of the local machine
                    ts.RootFolder.RegisterTaskDefinition(taskName, td);
                    result = true;
                }

            }
            catch { }
            return result;
        }

    }
}
