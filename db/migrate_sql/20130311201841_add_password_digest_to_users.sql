ALTER TABLE "users" ADD "password_digest" varchar(255);
INSERT INTO schema_migrations (version) VALUES (20130311201841);
