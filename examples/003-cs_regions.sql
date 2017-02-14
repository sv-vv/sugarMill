--
-- Sample post-install SQL script that populates the `cs_regions` table with dummy data useful for unit testing.
--

INSERT INTO CS_REGIONS (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID) VALUES ('asia', 'Asia', null, null, null, null, null, 0, 'spd-asia');
INSERT INTO CS_REGIONS (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID) VALUES ('europe', 'Europe', null, null, null, null, null, 0, 'spd-europe');
INSERT INTO CS_REGIONS (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID) VALUES ('north-america', 'North America', null, null, null, null, null, 0, 'spd-north-america');
INSERT INTO CS_REGIONS (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID) VALUES ('south-america', 'South America', null, null, null, null, null, 0, 'spd-south-america');
INSERT INTO CS_REGIONS (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID) VALUES ('africa', 'Africa', null, null, null, null, null, 0, 'spd-africa');
INSERT INTO CS_REGIONS (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID) VALUES ('pacific', 'Pacific', null, null, null, null, null, 0, 'spd-pacific');

-- That's all, folks!
