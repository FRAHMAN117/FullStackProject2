# Music Playlist API

---

## Overview

This repository contains a simple, containerized API for managing a music playlist database. The project uses Docker Compose to orchestrate a MySQL database service and a Node.js Express API service. The API provides endpoints to retrieve data from the database, demonstrating a basic microservices architecture.

## Project Goal

The primary objective is to create a functional and easily deployable web API that interacts with a relational database to serve playlist and song information. This setup is ideal for local development and showcases how to link application code to a database using Docker.

## Database Schema and Data

The database schema is defined in SQL, creating two tables: `playlists` and `songs`. These tables are related via a foreign key, with each song belonging to a specific playlist.

### Tables

* **`playlists`**: Stores information about playlists.
    * `id`: `INT`, `PRIMARY KEY`, `AUTO_INCREMENT`
    * `name`: `VARCHAR(255)`
* **`songs`**: Stores information about individual songs.
    * `id`: `INT`, `PRIMARY KEY`, `AUTO_INCREMENT`
    * `name`: `VARCHAR(255)`
    * `artist`: `VARCHAR(255)`
    * `year`: `INT`
    * `playlists_id`: `INT`, `FOREIGN KEY` references `playlists(id)`

### Sample Data

The project includes SQL commands to populate the database with a few sample playlists and songs.

## API Endpoints

The Node.js Express API provides two basic endpoints to retrieve data from the database.

* `GET /playlists`: Retrieves all playlists from the `playlists` table.
* `GET /songs`: Retrieves all songs from the `songs` table.

## Project Structure

The project is structured to be run with Docker Compose:

* **`docker-compose.yml`**: Defines the `db` and `api` services. The `api` service is configured to wait for the `db` service to be healthy before starting.
* **`db` service**: A MySQL container configured to use the `test_db` database.
* **`api` service**: A Node.js container that runs the Express server. It connects to the MySQL container using the hostname `db` as defined in `docker-compose.yml`.
* **`my-api/index.js`**: The main Node.js application file that sets up the Express server and connects to the database.
* **`my-api/package.json`**: Lists the project's dependencies, including `express` and `mysql2`.

## Setup and Usage

### Prerequisites

* Docker and Docker Compose installed on your machine.

### Installation

1.  Make sure you have all the files in the correct directory structure as described above. The `my-api` directory should contain the `index.js` and `package.json` files.
2.  The Dockerfiles (`dockerfile.db` and `dockerfile.api`) would be needed in their respective locations for the `build` commands to work.

### Running the Project

1.  Open a terminal in the root directory of the project (where `docker-compose.yml` is located).
2.  Build and start the services using the following command:
    ```bash
    docker-compose up --build
    ```
3.  The database and API containers will start. The `api` service will be accessible at `http://localhost:3000`.

### Testing the API

Once the services are running, you can test the endpoints using a tool like `curl` or a web browser:

* **Get all playlists:**
    ```bash
    curl http://localhost:3000/playlists
    ```
* **Get all songs:**
    ```bash
    curl http://localhost:3000/songs
    ```
