# USER ANALYTICS (1–12)

# 1.How many total users are registered?
SELECT COUNT(*) AS total_users FROM users;

# 2.Find the top 5 most active users (based on snaps sent).
SELECT u.username, COUNT(s.snap_id) AS snaps_sent
FROM users u
JOIN snaps s ON u.user_id = s.sender_id
GROUP BY u.username
ORDER BY snaps_sent DESC
LIMIT 5;

# 3.Users with no friends
SELECT u.username 
FROM users u
LEFT JOIN friends f ON u.user_id = f.user_id OR u.user_id = f.friend_id
WHERE f.friend_id IS NULL;

# 4.Count snaps sent by each user
SELECT u.username, COUNT(s.snap_id) AS snaps_sent
FROM users u
JOIN snaps s ON u.user_id = s.sender_id
GROUP BY u.username;

# 5.Average snap duration
SELECT AVG(duration_seconds) AS avg_duration FROM snaps;

# 6.Longest snap
SELECT s.snap_id, u.username, s.duration_seconds
FROM snaps s
JOIN users u ON s.sender_id = u.user_id
ORDER BY s.duration_seconds DESC
LIMIT 1;

# 7.Opened vs unopened snaps
SELECT SUM(is_opened=1) AS opened, SUM(is_opened=0) AS unopened FROM snaps;

# 8.Opened vs unopened snaps
SELECT SUM(is_opened=1) AS opened, SUM(is_opened=0) AS unopened FROM snaps;

# 9.Snaps sent today
SELECT * FROM snaps WHERE DATE(timestamp_sent) = CURDATE();

# 10.Snaps per day
SELECT DATE(timestamp_sent) AS snap_date, COUNT(*) AS snaps_count
FROM snaps
GROUP BY snap_date;

# 11.Display users with their latest login device and time.
SELECT u.username, d.device_model, MAX(d.last_used) AS last_login
FROM users u
JOIN devices d ON u.user_id = d.user_id
GROUP BY u.username, d.device_model;

# 12. Find the top 5 most active users (based on snaps sent).
SELECT u.username, COUNT(s.snap_id) AS snaps_sent
FROM users u
JOIN snaps s ON u.user_id = s.sender_id
GROUP BY u.username
ORDER BY snaps_sent DESC
LIMIT 5;

# SNAP ANALYTICS (13–20)

# 13.Total number of snaps sent and received per user.
SELECT u.username,
       COUNT(DISTINCT s1.snap_id) AS snaps_sent,
       COUNT(DISTINCT s2.snap_id) AS snaps_received
FROM users u
LEFT JOIN snaps s1 ON u.user_id = s1.sender_id
LEFT JOIN snaps s2 ON u.user_id = s2.receiver_id
GROUP BY u.username;

# 14. Find the average duration of snaps sent.
SELECT AVG(duration_seconds) AS avg_snap_duration FROM snaps;

# 15.Which user sent the longest snap?
SELECT u.username, s.duration_seconds
FROM snaps s
JOIN users u ON s.sender_id = u.user_id
ORDER BY s.duration_seconds DESC
LIMIT 1;

# 16.Count how many snaps were opened vs. unopened.
SELECT 
    SUM(CASE WHEN is_opened = 1 THEN 1 ELSE 0 END) AS opened,
    SUM(CASE WHEN is_opened = 0 THEN 1 ELSE 0 END) AS unopened
FROM snaps;

# 17.Show number of snaps per day.
SELECT DATE(timestamp_sent) AS date, COUNT(*) AS total_snaps
FROM snaps
GROUP BY DATE(timestamp_sent)
ORDER BY date;

# 18.Find the most active hour of the day for sending snaps.
SELECT HOUR(timestamp_sent) AS hour, COUNT(*) AS total
FROM snaps
GROUP BY hour
ORDER BY total DESC
LIMIT 1;

# 19.Average snap duration
SELECT AVG(duration_seconds) AS avg_duration FROM snaps;

# 20.Users who received more than 10 snaps
SELECT u.username, COUNT(s.snap_id) AS snaps_received
FROM users u
JOIN snaps s ON u.user_id = s.receiver_id
GROUP BY u.username
HAVING snaps_received > 10;

# LOCATION ANALYTICS (21-25)

# 21.Find which city has the most snaps.
SELECT city, COUNT(*) AS total_snaps
FROM snap_locations
GROUP BY city
ORDER BY total_snaps DESC
LIMIT 1;

# 22.List all snaps taken in a specific country (e.g., 'India').
SELECT s.snap_id, u.username, l.city
FROM snap_locations l
JOIN snaps s ON l.snap_id = s.snap_id
JOIN users u ON s.sender_id = u.user_id
WHERE l.country = 'India';

# 23.Find average snaps per city.
SELECT city, COUNT(snap_id)/COUNT(DISTINCT city) AS avg_snaps
FROM snap_locations
GROUP BY city;

# 24.Users sending snaps from multiple countries
SELECT s.sender_id, u.username, COUNT(DISTINCT l.country) AS countries
FROM snaps s
JOIN snap_locations l ON s.snap_id = l.snap_id
JOIN users u ON s.sender_id = u.user_id
GROUP BY s.sender_id
HAVING countries > 1;

#25.Snaps without location
SELECT * FROM snaps s
LEFT JOIN snap_locations l ON s.snap_id = l.snap_id
WHERE l.snap_id IS NULL;


