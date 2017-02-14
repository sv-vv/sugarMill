--
-- Sample post-install SQL script that populates the `cs_countries` table with dummy data useful for unit testing.
--

-- USA has a special value for SPIDER_ID (the real value)
INSERT INTO CS_COUNTRIES (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID, REGION_ID, REGION_NAME) VALUES ('usa', 'USA', null, null, '1', '1', null, 0, '1', null, null);
INSERT INTO CS_COUNTRIES (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID, REGION_ID, REGION_NAME) VALUES ('canada', 'Canada', null, null, '1', '1', null, 0, 'spd-canada', null, null);
INSERT INTO CS_COUNTRIES (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID, REGION_ID, REGION_NAME) VALUES ('argentina', 'Argentina', null, null, '1', '1', null, 0, 'spd-argentina', null, null);
INSERT INTO CS_COUNTRIES (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID, REGION_ID, REGION_NAME) VALUES ('china', 'China', null, null, '1', '1', null, 0, 'spd-china', null, null);
INSERT INTO CS_COUNTRIES (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID, REGION_ID, REGION_NAME) VALUES ('south-africa', 'South Africa', null, null, '1', '1', null, 0, 'spd-south-africa', null, null);
INSERT INTO CS_COUNTRIES (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID, REGION_ID, REGION_NAME) VALUES ('australia', 'Australia', null, null, '1', '1', null, 0, 'spd-australia', null, null);
INSERT INTO CS_COUNTRIES (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID, REGION_ID, REGION_NAME) VALUES ('paraguay', 'Paraguay', null, null, '1', '1', null, 0, 'spd-australia', null, null);
INSERT INTO CS_COUNTRIES (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID, REGION_ID, REGION_NAME) VALUES ('czech-republic', 'Czech Republic', null, null, '1', '1', null, 0, 'spd-australia', null, null);

-- That's all, folks!
