ALTER TABLE "users" ADD "remember_token" varchar(255);
CREATE  INDEX "index_users_on_remember_token" ON "users" ("remember_token");
INSERT INTO schema_migrations (version) VALUES (20130314184954);
