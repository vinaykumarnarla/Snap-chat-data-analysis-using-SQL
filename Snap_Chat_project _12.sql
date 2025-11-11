# STORY ANALYTICS (25-30)

# 25.Find the most viewed story.
SELECT s.story_id, u.username, s.view_count
FROM stories s
JOIN users u ON s.user_id = u.user_id
ORDER BY s.view_count DESC
LIMIT 1;

# 26.Get total story views per user.
SELECT u.username, SUM(story_views.view_id IS NOT NULL) AS total_views
FROM users u
LEFT JOIN stories s ON u.user_id = s.user_id
LEFT JOIN story_views ON s.story_id = story_views.story_id
GROUP BY u.username;

# 27.Find average views per story.
SELECT AVG(view_count) AS avg_views_per_story FROM stories;

# 28.Show stories that expired today.
SELECT * FROM stories WHERE DATE(expiry_time) = CURDATE();

# 29.Find which user viewed the most stories.
SELECT u.username, COUNT(sv.view_id) AS stories_viewed
FROM story_views sv
JOIN users u ON sv.viewer_id = u.user_id
GROUP BY u.username
ORDER BY stories_viewed DESC
LIMIT 1;

# 30.Find how many unique users viewed each story.
SELECT s.story_id, COUNT(DISTINCT sv.viewer_id) AS unique_viewers
FROM stories s
JOIN story_views sv ON s.story_id = sv.story_id
GROUP BY s.story_id;

# CHAT ANALYTICS (30–34)

# 31.Count total chat messages exchanged between two users.
SELECT COUNT(*) AS total_messages
FROM chats
WHERE (sender_id = 1 AND receiver_id = 2) OR (sender_id = 2 AND receiver_id = 1);

# 32.Find top 5 users by chat activity.
SELECT u.username, COUNT(c.chat_id) AS total_chats
FROM chats c
JOIN users u ON c.sender_id = u.user_id
GROUP BY u.username
ORDER BY total_chats DESC
LIMIT 5;

# 33. List unread messages.
SELECT * FROM chats WHERE is_read = 0;

# 34.Find average messages sent per user.
SELECT u.username, COUNT(c.chat_id) / COUNT(DISTINCT u.user_id) AS avg_chats
FROM users u
LEFT JOIN chats c ON u.user_id = c.sender_id
GROUP BY u.username;

# FILTER ANALYTICS (35–37)

# 35.List all filters ever used in snaps.
SELECT DISTINCT f.filter_name
FROM filters f
JOIN snap_filters sf ON f.filter_id = sf.filter_id;

# 36.Find the most popular filter.
SELECT f.filter_name, COUNT(sf.snap_id) AS times_used
FROM filters f
JOIN snap_filters sf ON f.filter_id = sf.filter_id
GROUP BY f.filter_name
ORDER BY times_used DESC
LIMIT 1;

# 37.Show how many filters each user has used.
SELECT u.username, COUNT(DISTINCT sf.filter_id) AS filters_used
FROM users u
JOIN snaps s ON u.user_id = s.sender_id
JOIN snap_filters sf ON s.snap_id = sf.snap_id
GROUP BY u.username;

#DEVICE / PERFORMANCE ANALYTICS (38–40)

# 38.Find which device model is most used.
SELECT device_model, COUNT(*) AS usage_count
FROM devices
GROUP BY device_model
ORDER BY usage_count DESC
LIMIT 1;

# 39.Track login activity by OS version.
SELECT os_version, COUNT(*) AS total_logins
FROM devices
GROUP BY os_version
ORDER BY total_logins DESC;

# 40. Find the last active device for each user.
SELECT u.username, d.device_model, MAX(d.last_used) AS last_used
FROM users u
JOIN devices d ON u.user_id = d.user_id
GROUP BY u.username, d.device_model;
