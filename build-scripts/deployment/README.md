# Deployment

The manual about how to provision and run Fineract CN services.

### Steps

1. Preparing (requirements)
2. Building (compile the project with services)
3. Provision (create schemas in database and install service like schema details)
4. Orchestrate and Deploy services to infrastructure (EXCLAIMER: NOT PART THIS MANUAL)
5. Running (configure and start services)


#### Preparing (ensure that your machine):

- ActiveMQ instance is running
- Cassandra instance is running
- MariaDB instance is running and user could login

#### Build and deploy steps:

1. Build full project with `buildAll.sh` in project root.
2. go back to `deployment` directory.
3. copy `env.sample.sh` file to `env.sh`.
4. check `env.sh` values and change them if necessary. (only provision use this)
5. run `deploy.sh`.

The process due from 10 minutes to a hour. This depends on your machine and number of installable services.

The compiled jars copied to `jars` directory.
The deploy start the jars and do provision on the selected environment.

You have to ensure copy the jar files from `jars` directory to the target instance and you have to start somehow.


#### Start Services

Running based on Eureka and Spring Cloud Config. There is a sample in `fineract-cn-config-sample` directory.

1. go to deployment directory.
2. duplicate `fineract-cn-config-sample` directory and rename to `fineract-cn-config`.
3. check values. (database schema, login credentials, etc.)
4. (optional) run `startServices.sh`.
5. (optional) if you start with `startServices.sh` then you can stop with `stopServices.sh`.
6. for development you have to start UI manually. Follow UI Section.

##### Manual Service Start:

- follow previous steps until number 3.
- first let start `eureka` service with provided config path:


    java -Xmx512m -Dspring.cloud.config.server.native.searchLocations=file://`pwd`/fineract-cn-config -jar jars/eureka-service/service-0.1.0-BUILD-SNAPSHOT-boot.jar
    
-  start required services: 
 
 
    java -Xmx768m -jar jars/service-name/service-0.1.0-BUILD-SNAPSHOT-boot.jar


##### Controlling Services Memory consumptions.

Optional provided `-Xmx` parameter you could control JVM memory usage.
For the developer machine enough 512 - 768 Mb memory. This is the default values in start script.
    
-
### Starting with UI

#### For development

1. go `ui/fineract-cn-fims-web-app`
2. install nodejs version 8.
3. install dependencies: `npm i`
4. start development server: `npm run dev`

#### For Production

1. build production code for nginx with `ui/buildAllUi.sh`.
2. configure nginx server based on `deployment/ui/fineract-cn-fims-web-app/scripts/nginx`.
3. copy source code from `deployment/ui/fineract-cn-fims-web-app/dist` to nginx.
4. start or reload nginx server.

    
 -
#### Config Samples

Application config samples stored in `fineract-cn-config-sample` directory.

Each service has a config file with following pattern: `servicename-default.yml`.

Service name example: `identity-v1` and the name is `identity-v1-default.yml`.

You have to change the config file with your connection data.

#### Sample for Production Cassandra Config

    cassandra:
      cluster:
        user: cassandra
        pwd: cassandra
      clustername: datacenter1
      contactPoints: 34.245.27.70:9142,54.194.36.158:9142
      keyspace: tenant
      cl:
        read: LOCAL_QUORUM
        write: LOCAL_QUORUM
        delete: LOCAL_QUORUM

