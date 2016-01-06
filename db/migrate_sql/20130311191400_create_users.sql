CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "email" varchar(255), "created_at" datetime, "updated_at" datetime) ;
INSERT INTO schema_migrations (version) VALUES (20130311191400);
