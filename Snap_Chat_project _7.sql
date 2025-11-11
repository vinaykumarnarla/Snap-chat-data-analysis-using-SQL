-- SNAP LOCATIONS
CREATE TABLE snap_locations (
    location_id VARCHAR(10) PRIMARY KEY,
    snap_id VARCHAR(10),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6),
    city VARCHAR(100),
    country VARCHAR(100),
    FOREIGN KEY (snap_id) REFERENCES snaps(snap_id)
);

INSERT INTO snap_locations VALUES
('L001','S001',28.6139,77.2090,'Delhi','India'),
('L002','S002',19.0760,72.8777,'Mumbai','India'),
('L003','S003',12.9716,77.5946,'Bangalore','India'),
('L004','S004',22.5726,88.3639,'Kolkata','India'),
('L005','S005',13.0827,80.2707,'Chennai','India'),
('L006','S006',17.3850,78.4867,'Hyderabad','India'),
('L007','S007',26.9124,75.7873,'Jaipur','India'),
('L008','S008',23.0225,72.5714,'Ahmedabad','India'),
('L009','S009',21.1702,72.8311,'Surat','India'),
('L010','S010',28.4089,77.3178,'Gurgaon','India'),
('L011','S011',19.2183,73.0880,'Pune','India'),
('L012','S012',22.3072,73.1812,'Vadodara','India'),
('L013','S013',25.4358,81.8463,'Prayagraj','India'),
('L014','S014',24.5854,73.7125,'Udaipur','India'),
('L015','S015',11.0168,76.9558,'Coimbatore','India'),
('L016','S016',22.7196,75.8577,'Indore','India'),
('L017','S017',26.4499,80.3319,'Lucknow','India'),
('L018','S018',25.4670,81.3267,'Varanasi','India'),
('L019','S019',22.9734,78.6569,'Nagpur','India'),
('L020','S020',30.7333,76.7794,'Chandigarh','India');


select * from snap_locations;