-- SNAP FILTERS
CREATE TABLE snap_filters (
    snap_id VARCHAR(10),
    filter_id VARCHAR(10),
    PRIMARY KEY (snap_id, filter_id),
    FOREIGN KEY (snap_id) REFERENCES snaps(snap_id),
    FOREIGN KEY (filter_id) REFERENCES filters(filter_id)
);
INSERT INTO snap_filters VALUES
('S001','FILT01'),
('S002','FILT03'),
('S003','FILT02'),
('S004','FILT04'),
('S005','FILT05'),
('S006','FILT06'),
('S007','FILT07'),
('S008','FILT08'),
('S009','FILT09'),
('S010','FILT10'),
('S011','FILT11'),
('S012','FILT12'),
('S013','FILT13'),
('S014','FILT14'),
('S015','FILT15'),
('S016','FILT16'),
('S017','FILT17'),
('S018','FILT18'),
('S019','FILT19'),
('S020','FILT20');

select * from snap_filters;