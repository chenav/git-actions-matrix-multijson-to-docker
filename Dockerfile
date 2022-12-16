    #IMAGE BUILD 
    FROM nodered/node-red:latest
  
    USER root
    WORKDIR /data

    ARG CONFIG

    #SETTING THE NODE-RED PACKAGE + PLUGINS THAT WE NEED
    COPY package.json /data/package.json
    #SETTING THE NODE-RED SERVER PARAMETERS (FILESTORAGE, TIMEOUT,...)
    COPY settings.js /data/settings.js 
    #IMPORTING THE R2B2 FLOWS
    COPY flows.json /data/flows.json
    #INJECT THE SPECIFIC AIRBNB CONFIG IN THE FLOWS.JSON
    COPY inject-config.js /data/inject-config.js
    RUN echo $CONFIG
    RUN node inject-config /data/flows.json $CONFIG
    
    RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production 
  
    #CLEAN THE NON-NECESSARY FILES IN THE RUNNING CONTAINER
    RUN rm inject-config.js
              
    #START THE NODE-RED SERVER
    USER node-red
    CMD node-red-start