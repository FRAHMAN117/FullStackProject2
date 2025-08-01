# Playlist Management System
## Overview
This project is a simple, Dockerized REST API for managing playlists and songs. It uses a MySQL database to store the data and a Node.js Express application to serve the API endpoints. The entire environment is orchestrated using Docker Compose, making it easy to set up and run.

## Project Structure
docker-compose.yml: Defines the services for the MySQL database (db) and the Node.js API (api), including their build configurations, port mappings, and dependencies.

my-api/: This directory contains the Node.js application.

dockerfile.api: The Dockerfile for the API service.

index.js: The main Express application file that handles database connection and defines API routes.

package.json: Manages the Node.js project's metadata and dependencies (express, mysql2).

db/: This directory would typically contain the Dockerfile and initial SQL scripts for the database.

dockerfile.db: The Dockerfile for the MySQL database service.

sql_commands.sql (inferred from provided code): A file containing SQL commands to set up the database schema and insert initial data.

Technologies Used
Node.js: The runtime environment for the API.

Express: A web framework for Node.js used to build the API.

MySQL: The relational database management system for storing data.

Docker & Docker Compose: Used to containerize the application and manage the services.

Database Schema
The project uses a simple schema with two tables: playlists and songs.

playlists table
CREATE TABLE playlists (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

songs table
CREATE TABLE songs (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    artist VARCHAR(255) NOT NULL,
    year INT,
    playlists_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (playlists_id) REFERENCES playlists(id)
);

## Setup and Installation
Prerequisites
Docker

Docker Compose

Steps
Place the provided files (docker-compose.yml, my-api directory with its contents) into a single project folder.

Open a terminal and navigate to the project root directory.

Run the following command to build and start the services:

docker-compose up --build

The --build flag ensures that the Docker images for the services are built from the provided Dockerfiles.

Once the services are running and the database is healthy, the API will be available.

API Endpoints
The API runs on port 3000 and provides the following endpoints:

GET /playlists
This endpoint returns a JSON array of all playlists in the database.

Example Response:

[
  {
    "id": 1,
    "name": "Celtic Women"
  },
  {
    "id": 2,
    "name": "Study Playlist"
  },
  {
    "id": 3,
    "name": "Workout Playlist"
  },
  {
    "id": 4,
    "name": "Sleeping Music"
  }
]

GET /songs
This endpoint returns a JSON array of all songs in the database.

Example Response:

[
  {
    "id": 1,
    "name": "Mo Ghilear Mear",
    "artist": "Celtic Women",
    "year": 2007,
    "playlists_id": 1
  },
  {
    "id": 2,
    "name": "The Dollhouse",
    "artist": "Cécile Corbel",
    "year": 2010,
    "playlists_id": 2
  },
  {
    "id": 3,
    "name": "Pump it",
    "artist": "Meet bros",
    "year": 2016,
    "playlists_id": 3
  }
]
