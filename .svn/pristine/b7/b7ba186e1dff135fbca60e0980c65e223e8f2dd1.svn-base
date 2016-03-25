CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(20), "email" varchar(40), "password_digest" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "remember_token" varchar(255));
CREATE INDEX "index_users_on_remember_token" ON "users" ("remember_token");
CREATE TABLE "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "content" text(255), "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_posts_on_user_id_and_created_at" ON "posts" ("user_id", "created_at");
INSERT INTO schema_migrations (version) VALUES ('20160318101954');

INSERT INTO schema_migrations (version) VALUES ('20160318101955');

INSERT INTO schema_migrations (version) VALUES ('20160321121304');

INSERT INTO schema_migrations (version) VALUES ('20160323021819');

