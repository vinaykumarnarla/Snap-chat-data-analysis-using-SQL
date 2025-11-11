-- FILTERS
CREATE TABLE filters (
    filter_id VARCHAR(10) PRIMARY KEY,
    filter_name VARCHAR(100),
    category VARCHAR(50),
    date_added DATE
);
INSERT INTO filters VALUES
('FILT01','Vintage','photo','2025-01-01'),
('FILT02','BlackWhite','photo','2025-01-05'),
('FILT03','Funny','video','2025-01-10'),
('FILT04','Sparkle','photo','2025-01-15'),
('FILT05','Cartoon','video','2025-01-20'),
('FILT06','Retro','photo','2025-01-25'),
('FILT07','Glow','photo','2025-02-01'),
('FILT08','Neon','video','2025-02-05'),
('FILT09','Blur','photo','2025-02-10'),
('FILT10','Warm','photo','2025-02-15'),
('FILT11','Cool','video','2025-02-20'),
('FILT12','Summer','photo','2025-02-25'),
('FILT13','Winter','photo','2025-03-01'),
('FILT14','Rain','video','2025-03-05'),
('FILT15','Sunset','photo','2025-03-10'),
('FILT16','Sunrise','photo','2025-03-15'),
('FILT17','Cityscape','video','2025-03-20'),
('FILT18','Nature','photo','2025-03-25'),
('FILT19','RetroVibe','video','2025-04-01'),
('FILT20','Cinematic','photo','2025-04-05');


select * from filters;
