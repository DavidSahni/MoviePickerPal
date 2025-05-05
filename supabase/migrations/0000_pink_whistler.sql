CREATE TABLE "MovieList" (
	"id" serial PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"userId" integer
);
--> statement-breakpoint
CREATE TABLE "Movies" (
	"id" serial PRIMARY KEY NOT NULL,
	"title" text NOT NULL,
	"listId" integer
);
--> statement-breakpoint
CREATE TABLE "users" (
	"id" serial PRIMARY KEY NOT NULL
);
--> statement-breakpoint
ALTER TABLE "MovieList" ADD CONSTRAINT "MovieList_userId_users_id_fk" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "Movies" ADD CONSTRAINT "Movies_listId_MovieList_id_fk" FOREIGN KEY ("listId") REFERENCES "public"."MovieList"("id") ON DELETE cascade ON UPDATE no action;