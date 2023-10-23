USE aware_dashboard;

DELETE FROM developer_plugins where id = 400;
INSERT INTO developer_plugins VALUES
(400,"AWARE: SMS Message Retrieval","", 1622734172, 1, 1622734172, NULL, "", NULL,"com.aware.plugin.sms", 1, 0,"com.aware.plugin.sms", 1,"https://github.com/denzilferreira/com.aware.plugin.sms");

DELETE FROM developer_plugins_settings where plugin_id = 400;
INSERT INTO developer_plugins_settings VALUES
(501, 400, "status_retrieve_sent_messages","Checking box retrieves sent messages","boolean",NULL),
(502, 400, "status_retrieve_received_messages", "Checking box retrieves received messages", "boolean", NULL),
(503, 400, "status_sentiment_analysis_received_messages", "Checking box runs sentiment analysis over received messages", "boolean", NULL),
(504, 400, "status_sentiment_analysis_sent_messages", "Checking box runs sentiment analysis over sent messages", "boolean", NULL),
(505, 400, "plugin_sms_send_full_data", "Fetch date for the full date range (T) or just ongoing data (F) - automatically changes to F after a full pull", "boolean", NULL),
(506, 400, "plugin_sms_start_date", "If left empty, it will pull all sms data on the phone from before the end date. If Both start and end dates are left empty, it will pull all data from the phone.", "text", NULL),
(507, 400, "plugin_sms_end_date", "If left empty, it will pull all sms data on the phone after the start date. If Both start and end dates are left empty, it will pull all data from the phone.", "text", NULL),
(508, 400, "plugin_sms_last_sync_date", "yyyy-MM-ddTHH:MM:ss.SSS ... The timestamp (w/ ms) of the limit for data replication on the phone.", "text", NULL),
(509, 400, "plugin_sms_sync_frequency", "How many minutes between each local data check. (Default 1)", "text", NULL), 
(510, 400, "plugin_sms_message_batch_limit", "For Large Batch Pulls: How many messages to sync with db at a time to not lag phone (Default 0 - No Limit)", "text", NULL),
(511, 400, "plugin_sms_message_single_upload_limit", "For Large Batch Pulls: How many messages to POST to server at a time to not overflow buffer (Default 200)", "text", NULL),
(512, 400, "plugin_sms_current_offset", "Current Message Batch Upload Progress (if required). (Default 0)", "text", NULL),
(513, 400, "plugin_sms_last_server_sync_timestamp", "Timestamp of latest SMS Data Sync to Server. (Default 0)", "text", NULL),
(514, 400, "plugin_sms_server_sync_frequency", "How many minutes between each server sync. (Default 6, Min 6, Exact sync has minimum +/- 5 minute flex for scheduling)", "text", NULL),
(515, 400, "plugin_sms_study_eligibility_message_count", "Minimum number of text messages required to join study. (Default 500)", "text", NULL),
(516, 400, "plugin_sms_study_eligibility_word_count", "Minimum number of words required to join a study. (Default 500)", "text", NULL);
