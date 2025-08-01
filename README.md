# Playlist Management System
## Overview
This project is a simple, Dockerized REST API for managing playlists and songs. It uses a MySQL database to store the data and a Node.js Express application to serve the API endpoints. The entire environment is orchestrated using Docker Compose, making it easy to set up and run.

## Project Structure
docker-compose.yml: Defines the services for the MySQL database (db) and the Node.js API (api), including their build configurations, port mappings, and dependencies.

'my-api/': This directory contains the Node.js application.

'dockerfile.api': The Dockerfile for the API service.

'index.js': The main Express application file that handles database connection and defines API routes.

'package.json': Manages the Node.js project's metadata and dependencies (express, mysql2).

'db/': This directory would typically contain the Dockerfile and initial SQL scripts for the database.

'dockerfile.db': The Dockerfile for the MySQL database service.

'sql_commands.sql' (inferred from provided code): A file containing SQL commands to set up the database schema and insert initial data.

Technologies Used
Node.js: The runtime environment for the API.

Express: A web framework for Node.js used to build the API.

MySQL: The relational database management system for storing data.

Docker & Docker Compose: Used to containerize the application and manage the services.


'songs' table
'''
CREATE TABLE songs (
  

