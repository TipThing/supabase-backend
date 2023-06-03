# supebase-backend

## Setup your environment
You will need Deno to run the functions.
https://deno.com/manual@v1.34.1/getting_started/setup_your_environment

## Run the project

### Start `docker compose up`
This will spin up all the necessary components and services to start using the project.

### Start with logging `docker compose -f docker-compose.yml -f docker-compose-logging.yml up`
This will spin up all the necessary components and services to start using the project and will also start the logging services.

### Start with helpers `docker compose -f docker-compose.yml -f ./dev/docker-compose.dev.yml up`
This will spin up all the services along with additional services that will aid in the development process. Some of this includes
- Mail test application
- Test Studio Dashboard
- Test Auth
- Test DB
- Test Storage

### Start with helpers and logging `docker compose -f docker-compose.yml -f ./dev/docker-compose.dev.yml -f docker-compose-logging.yml up`
This will spin up all the services along with additional services that will aid in the development process. Some of this includes
- Mail test application
- Test Studio Dashboard
- Test Auth
- Test DB
- Test Storage
- Logging services
- Logging UI
- Logging DB
- and others...

### Stop `docker compose down`
This will stop all the services and components that were started.

### Remove all traces `docker compose -f docker-compose.yml -f ./dev/docker-compose.dev.yml down -v --remove-orphans`
This will stop all the services and components that were started and remove all the volumes and orphaned containers.

### Remove all traces with logging `docker compose -f docker-compose.yml -f ./dev/docker-compose.dev.yml -f docker-compose-logging.yml down -v --remove-orphans`
This will stop all the services and components that were started and remove all the volumes and orphaned containers. This will also remove all the logging services and components.