CREATE TABLE "relationships" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "follower_id" integer, "followed_id" integer, "created_at" datetime, "updated_at" datetime) ;
INSERT INTO schema_migrations (version) VALUES (20130315230445);
