# This file should insert the data into the aware_dashboard database for the standard WWBP aware plugins
#
# ***** NOTE: THIS IS A TESTING MODIFIED FILE: ********
# THE PRODUCTION VERSION IS ON aware.wwbp.org/home/douglasvbellew/sensor_plugin_data_table_inserts.sql
#
# Add new sensors (though 26 is already included in the original developer_sensors_settings table)
INSERT INTO developer_sensors VALUES
(26,"Interface restrictions",NULL),
(27,"Significant Motion",NULL);

# Update some field names to match what is in aware-cloud
UPDATE developer_sensors_settings SET setting = "status_communication_events" where id = 11;
UPDATE developer_sensors_settings SET setting = "min_location_gps_accuracy" where id = 28;
UPDATE developer_sensors_settings SET setting = "min_location_network_accuracy" where id = 29;
UPDATE developer_sensors_settings SET setting = "location_expiration_time" where id = 30;

# insert sensor settings for plugin 27.  Also include 28, though there is not actually a 28 listed
INSERT INTO developer_sensors_settings VALUES
( 87,27,"status_significant_motion","Log motion events. Saves battery life, stops motion sensors logs if idle!","boolean","false"),
( 94,28,"interface_locked","Simplifies the interface for participants after joining a study","boolean","false");

# A number of settings seem to have been added after the table was created.  Update the tables to match.
INSERT INTO developer_sensors_settings VALUES
( 63, 24, "webservice_silent", "Don't show sync notifications.", "boolean", ""),
( 64, 24, "fallback_network", "Fallback to 3G synching after x hours trying over WiFi", "integer", "0"),
( 65, 24, "remind_to_charge", "Remind to charge when 15% battery if left", "boolean", ""),
( 66, 20, "status_touch", "Logs clicks, long-clicks and scroll up/down events.", "boolean" ,""),
( 67, 1, "threshold_accelerometer", "E.g., log only if [x,y,z] >= 0.01. 0 = disabled", "integer", "0"),
( 68, 1, "frequency_accelerometer_enforce", "Enforce sampling rate", "boolean", "false"), 
( 69, 3, "threshold_barometer", "e.g., log only if [x,y,z] >= 0.01", "integer", "0"),
( 70, 3, "frequency_barometer_enforce", "Enforce the frequency", "boolean", "false"), 
( 71, 8, "threshold_gravity", "e.g., log only if [x,y,z] >= 0.01", "integer", "0"), 
( 72, 8, "frequency_gravity_enforce", "Enforce the frequency", "boolean", "false"),
( 73, 9, "threshold_gyroscope", "e.g., log only if [x,y,z] >= 0.01", "integer", "0"),
( 74, 9, "frequency_gyroscope_enforce", "Enforce the frequency", "boolean", "false"),
( 75, 13, "status_location_passive", "Don't fetch locations, but use locations if other apps request them.", "boolean", "false"),
( 76, 13, "location_save_all", "Don't use heuristics to only record best locations", "boolean", "false"),
( 77, 11, "threshold_light", "e.g., log only if [x,y,z] >= 0.01", "integer", "0"),
( 78, 11, "frequency_light_enforce", "Enforce the frequency", "boolean", "false"),
( 79, 12, "threshold_linear_accelerometer", "e.g., log only if [x,y,z] >= 0.01", "integer", "0"),
( 80, 12, "frequency_linear_accelerometer_enforce", "Enforce the frequency", "boolean", "false"),
( 81, 14, "threshold_magnetometer", "e.g., log only if [x,y,z] >= 0.01", "integer", "0"),
( 82, 14, "frequency_magnetometer_enforce", "Enforce the frequency", "boolean", "false"),
( 83, 18, "threshold_proximity", "e.g., log only if [x,y,z] >= 0.01", "integer", "0"),
( 84, 18, "frequency_proximity_enforce", "Enforce the frequency", "boolean", "false"),
( 85, 19, "threshold_rotation", "e.g., log only if [x,y,z] >= 0.01", "integer", "0"),
( 86, 19, "frequency_rotation_enforce", "Enforce the frequency", "boolean", "false"),
( 88, 22, "threshold_temperature", "e.g., log only if [x,y,z] >= 0.01", "integer", "0"),
( 89, 22, "frequency_temperature_enforce", "Enforce the frequency", "boolean", "false"),
( 90, 24, "foreground_priority", "RECOMMENDED to keep AWARE running non-stop.", "boolean", "true"),
( 91, 24, "debug_flag", "Show debug messages in logcat", "boolean", "false"),
( 92, 2, "mask_keyboard", "Swaps all alphanumeric characters by A, a, and 1", "boolean", ""),
( 93, 2, "mask_touch_text", "Swaps all alphanumeric characters by A, a, and 1", "boolean", "");

# Plugins that are used are:
#
# Create an entry for each of the plugins that are on aware-cloud
INSERT INTO developer_plugins VALUES
(1,"EMS Google Calendar","", 1552247512, 3, 1552247512, NULL, "", NULL,"com.aware.plugin.esm.scheduler", 1, 0,"com.aware.plugin.esm.scheduler", 0,"https://github.com/denzilferreira/com.aware.plugin.esm.scheduler"),
(234, "AWARE: Google Auth", "This plugin allows researchers and users to personalise their AWARE experience with Google.", 1472989916, 1, 1475745649, NULL, "", NULL, NULL, 1, 0, "com.aware.plugin.google.auth", 1, "https://github.com/denzilferreira/com.aware.plugin.google.auth"),
(238, "AWARE: Device Usage", "This plugin measures how much you use your device: for how long you didn't use; average non-use, average use and daily total amount of use.", 1475673142, 1, 1475744630, NULL, "", NULL, NULL, 1, 0, "com.aware.plugin.device_usage", 1, "https://github.com/denzilferreira/com.aware.plugin.device_usage"),
(239, "AWARE: Ambient Noise", "This plugin measures the ambient noise (Hz, dB) as noisy or silent moments. It adds the daily noise exposure on the stream, showing the average dB and Hz per hour throughout the day.", 1475745850, 1,  1551370539, NULL, "", NULL, NULL, 1, 0, "com.aware.plugin.ambient_noise", 1, "https://github.com/denzilferreira/com.aware.plugin.ambient_noise.git"),
(240, "AWARE: Activity Recognition", "This plugin uses Google Location APIs to capture users mode of transportation: still, walking, running, biking, in vehicle (car, bus).", 1475746693, 1, 1475746693, NULL, "", NULL, NULL, 1, 0, "com.aware.plugin.google.activity_recognition", 1, "https://github.com/denzilferreira/com.aware.plugin.google.activity_recognition"),
(241, "AWARE: Google Fused Location", "This plugin uses Google's Fused Locations API to provide the user's current location in an energy efficient way. It also allows the user to define geo-tagged areas.", 1475747197, 1, 1475747197, NULL, "", NULL, NULL, 1, 0, "com.aware.plugin.google.fused_location", 1, "https://github.com/denzilferreira/com.aware.plugin.google.fused_location"),
(242, "AWARE: OpenWeather", "This plugin uses Google Fused Location in low power mode and OpenWeather API to provide the weather conditions where the user is.", 1475747581, 1, 1475747581, NULL, "", NULL, NULL, 1, 0, "com.aware.plugin.openweather", 1, "https://github.com/denzilferreira/com.aware.plugin.openweather"),
(244, "AWARE: Conversations", "This plugin detects if the user is engaged in a conversation or not. This plugin was developed as a collaboration between Cornell and Dartmouth College.", 1476270416, 1, 1476270416, NULL, "", NULL, NULL, 1, 0, "com.aware.plugin.studentlife.audio_final", 1, "https://github.com/denzilferreira/com.aware.plugin.studentlife.audio_final"),
(264, "AWARE: Fitbit", "This plugin allows researchers to collect the data from a Fitbit device: calories, steps, heart-rate, sleep.", 1486124543, 1, 1515492063, NULL, "", NULL, NULL, 1, 0, "com.aware.plugin.fitbit", 1, "https://github.com/denzilferreira/com.aware.plugin.fitbit"),
(334, "AWARE: Contacts", "This plugin allows researchers to match contacts with calls and sms one-way hash", 1521018397, 1, 1521018397, NULL, "", NULL, NULL, 1, 0, "com.aware.plugin.contacts_list", 1, "https://github.com/denzilferreira/com.aware.plugin.contacts_list"),
(382, "AWARE: ESM Scheduler", "This plugin allows you to schedule ESMs using a shared Google Calendar with your study participants. This plugin reads the events of a shared Google calendar.", 1548416237, 1, 1548416237, NULL, "", NULL, NULL, 1, 0, "com.aware.plugin.esm.scheduler", 1, "https://github.com/denzilferreira/com.aware.plugin.esm.scheduler"),
(383, "iOS Basic Setting v2", "", 1567522630, 2, 1567522814, NULL, "", NULL, NULL, 1, 0,"", 1,""), 
(385, "HealthKit", "", 1568816902, 10, 1568816902, NULL, "", NULL, NULL, 0, 0, "", 0, ""),
(386, "HealthKit-Test", "", 1568816941, 10, 1568816941, NULL, "", NULL, NULL, 0, 0, "", 0, ""),
(387, "Health Kit", "", 1568827293, 2, 1568827293, NULL, "", NULL, NULL, 1, 0, "", 1, ""),
(389, "Pedometer", "", 1568850898, 2, 1568902944, NULL, "", NULL, NULL, 1, 0, "", 1, ""),
(390, "AWARE: Sentiment", "", 1579077030, 1, 1579077030, NULL, "", NULL, NULL, 1, 0, "com.aware.plugin.sentiment", 1, ""),
(391, "iOS ESM", "", 1581369548, 2, 1581370525, NULL, "", NULL, NULL, 1, 0, "", 1, ""),
(400, "AWARE: SMS Message Retrieval", "", 1622734172, 1, 1622734172, NULL, "", NULL, "com.aware.plugin.sms", 1, 0, "com.aware.plugin.sms", 1, "https://github.com/denzilferreira/com.aware.plugin.sms");


# These values are in the aware-cloud table (the default is empty)
# Note: Added row 11 becuase of other testing.
INSERT INTO developer_plugins_broadcasts VALUES
( 1, 1, "", ""),
( 2, 383,"", ""),
( 4, 385, "", ""),
( 5, 386, "", ""),
( 6, 387, "", ""),
( 8, 389, "", ""),
( 9, 390, "", ""),
(10, 391, "", ""),
(11, 2, "", "");

# Add all of the developer plugin settings listed on aware-cloud
# Note: Changed 1-9 to 51-59 due to other testing
INSERT INTO developer_plugins_settings VALUES
( 51, 1, "status_plugin_esm_scheduler", "Activate/Disable", "boolean", NULL), 
( 53, 241, "status_google_fused_location", "(boolean) activate/deactivate plugin", "boolean", NULL), 
( 54, 241, "frequency_google_fused_location", "(integer) How frequently to fetch user's location (in seconds), default 300 seconds", "integer", NULL), 
( 55, 244, "status_plugin_studentlife_audio", "Activate/deactivate plugin", "boolean", NULL), 
( 56, 239, "frequency_plugin_ambient_noise", "(integer) interval between audio data snippets, in minutes. Recommended value is every 5 minutes or higher.", "integer", NULL), 
( 57, 241, "max_frequency_google_fused_location", "(integer) How fast are you willing to get the latest location (in seconds), default 60 seconds", "integer", NULL), 
( 58, 240, "frequency_plugin_google_activity_recognition", "(integer) - how frequently to detect users' activity, in seconds. By default, every 60 seconds.", "integer", NULL), 
( 59, 240, "status_plugin_google_activity_recognition", "Activate/deactivate plugin", "boolean", NULL), 
(10, 242, "units_plugin_openweather", "(string) imperial or metric, default metric", "text", NULL), 
(11, 242, "api_key_plugin_openweather", "(string) OpenWeather API key. Get your free API key from openweathermap.org", "text", NULL), 
(12, 239, "status_plugin_ambient_noise", "(boolean) activate/deactivate plugin", "boolean", NULL),
(13, 238, "status_plugin_device_usage", "(boolean) true or false to activate or deactivate plugin.", "boolean", NULL),
(14, 241, "accuracy_google_fused_location", "(integer) One of the following: * 100 (high power): uses GPS only - works best outdoors, highest accuracy * 102 (balanced): uses GPS, Network and Wifi - works both indoors and outdoors, good accuracy (default) * 104 (low power): uses only Network and WiFi - poorest accuracy, medium accuracy * 105 (no power) - scavenges location requests from other apps", "integer", NULL),
(15, 239, "plugin_ambient_noise_silence_threshold", "(integer) How many dB is a noisy environment?", "integer", NULL), 
(16, 239, "plugin_ambient_noise_sample_size", "(integer) For how long we collect data, in seconds", "integer", NULL), 
(17, 242, "status_plugin_openweather", "(boolean) activate/deactivate plugin", "boolean", NULL), 
(18, 242, "plugin_openweather_frequency", "(integer) How frequently to fetch weather information (in minutes), default 60 minutes", "integer", NULL), 
(19, 234, "status_plugin_google_login", "Activate/deactivate plugin", "boolean", NULL), 
(20, 241, "fallback_location_timeout", "(integer) wait X seconds for GPS satellite fix to timeout, default 20 seconds", "integer", NULL), 
(21, 241, "location_sensitivity", "(integer) move more than X meter(s) to request another location fix, default 5 meters", "integer", NULL), 
(22, 264, "status_plugin_fitbit", "activate/deactivate plugin", "boolean", NULL), 
(23, 264, "units_plugin_fitbit", "one of metric/imperial", "text", NULL), 
(24, 264, "plugin_fitbit_frequency", "interval in which to check for new data on Fitbit. Fitbit has a hard-limit of 150 data checks, per hour, per device.","integer",NULL),
(25, 264, "fitbit_granularity", "intraday granularity. One of 1d/15min/1min for daily summary, 15 minutes and 1 minute, respectively.", "text", NULL), 
(26, 264, "fitbit_hr_granularity", "intraday granularity. One of 1min/1sec for 1 minute, and 5 second interval respectively (setting is 1sec but returns every 5sec).", "text", NULL),
(27, 264, "api_key_plugin_fitbit", "Fitbit Client Key", "text", NULL),
(28, 264, "api_secret_plugin_fitbit", "Fitbit Client Secret", "text", NULL), 
(29, 334, "status_plugin_contacts", "Capture snapshot of contacts list", "boolean", NULL), 
(30, 334, "frequency_plugin_contacts", "Update every X days", "integer", 1), 
(31, 382, "status_plugin_esm_scheduler", "(boolean) activate/deactivate plugin", "boolean", NULL),
(32, 239, "plugin_ambient_noise_no_raw", "(boolean) Only store the signal analysis", "boolean", NULL),
(33, 383, "status_plugin_basic_settings", "", "boolean", NULL),
(34, 383, "ui_mode", "0=normal, 1=hide all, 2=hide settings", "integer", NULL),
(37, 385, "status_health_kit", "", "boolean", NULL),
(38, 386, "status_health_kit", "", "boolean", NULL),
(39, 387, "status_health_kit", "On/Off", "boolean", NULL),
(40, 387, "frequency_health_kit", "1800", "integer", NULL),
(43, 389, "status_plugin_ios_pedometer", "On/Off", "boolean", NULL),
(44, 389, "frequency_ios_pedometer", "1800", "integer", NULL),
(45, 390, "status_plugin_sentiment", "Enable Sentiment Analysis", "boolean", NULL),
(46, 390, "plugin_sentiment_packages", "Package names of apps separated by comma", "text", NULL),
(47, 391, "status_plugin_ios_esm", 'boolean (default value is “false”)', "boolean", NULL),
(48, 391, "plugin_ios_esm_config_url", 'text (default value is “”)', "text", NULL),
(49, 391, "plugin_ios_esm_table_name", "Enter the table name", "text", NULL);

