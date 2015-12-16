CREATE TABLE "microposts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" varchar(255), "user_id" integer, "created_at" datetime, "updated_at" datetime) ;
CREATE  INDEX "index_microposts_on_user_id_and_created_at" ON "microposts" ("user_id", "created_at");
INSERT INTO schema_migrations (version) VALUES (20130315175534);
