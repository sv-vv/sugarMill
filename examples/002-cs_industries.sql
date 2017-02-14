--
-- Sample post-install SQL script that populates the `cs_industries` table with dummy data useful for unit testing.
--

INSERT INTO CS_INDUSTRIES (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID, INDUSTRIES_TYPE) VALUES ('it', 'IT', null, null, null, null, null, 0, 'spd-it', null);
INSERT INTO CS_INDUSTRIES (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID, INDUSTRIES_TYPE) VALUES ('architecture', 'Architecture', null, null, null, null, null, 0, 'spd-architecture', null);
INSERT INTO CS_INDUSTRIES (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID, INDUSTRIES_TYPE) VALUES ('agriculture', 'Agriculture', null, null, null, null, null, 0, 'spd-agriculture', null);
INSERT INTO CS_INDUSTRIES (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID, INDUSTRIES_TYPE) VALUES ('manufacturing', 'Manufacturing', null, null, null, null, null, 0, 'spd-manufacturing', null);
INSERT INTO CS_INDUSTRIES (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID, INDUSTRIES_TYPE) VALUES ('services', 'Services', null, null, null, null, null, 0, 'spd-services', null);
INSERT INTO CS_INDUSTRIES (ID, NAME, DATE_ENTERED, DATE_MODIFIED, MODIFIED_USER_ID, CREATED_BY, DESCRIPTION, DELETED, SPIDER_ID, INDUSTRIES_TYPE) VALUES ('tourism', 'Tourism', null, null, null, null, null, 0, 'spd-tourism', null);

-- That's all, folks!
