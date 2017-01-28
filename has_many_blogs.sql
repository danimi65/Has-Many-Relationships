\c danikaharada

DROP USER IF EXISTS "has_many_user";
CREATE USER "has_many_user";
DROP DATABASE IF EXISTS "has_many_blogs";
CREATE DATABASE "has_many_blogs" WITH OWNER "has_many_user";

\c has_many_blogs;

--creating username table
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
  id serial PRIMARY KEY NOT NULL, 
  username varchar(90) NOT NULL, 
  first_name varchar(90) DEFAULT NULL, 
  last_name varchar(90) DEFAULT NULL,
  created_at timestamp WITH TIME ZONE DEFAULT now() NOT NULL,
  updated_at timestamp WITH TIME ZONE DEFAULT now() NOT NULL);

--creating post table
DROP TABLE IF EXISTS "posts";
CREATE TABLE "posts" (
  id serial PRIMARY KEY NOT NULL, 
  title varchar(180) DEFAULT NULL,
  url varchar(510) DEFAULT NULL,
  content text DEFAULT NULL, 
  created_at timestamp WITH TIME ZONE DEFAULT now() NOT NULL,
  updated_at timestamp WITH TIME ZONE DEFAULT now() NOT NULL,
  users_id INTEGER REFERENCES users(id) NOT NULL);


--creating comments table
DROP TABLE IF EXISTS "comments";
CREATE TABLE "comments" (
  id serial PRIMARY KEY NOT NULL,
  body varchar(510) DEFAULT NULL,
  created_at timestamp WITH TIME ZONE DEFAULT now() NOT NULL,
  updated_at timestamp WITH TIME ZONE DEFAULT now() NOT NULL,
  posts_id INTEGER REFERENCES users(id) NOT NULL,
  users_id INTEGER REFERENCES users(id) NOT NULL);

\i scripts/blog_data.sql;
