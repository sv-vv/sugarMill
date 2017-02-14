--
-- Sample post-install SQL script that marks all notifications as read
--
-- The install script generates a notification about the SMTP server not being set
-- The cron job generates another notification we don't care of during development.
--

UPDATE NOTIFICATIONS SET IS_READ = 1;

-- That's all, folks!
