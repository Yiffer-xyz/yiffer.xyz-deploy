# Yiffer.xyz-deploy

**Developer/setup guide can be found in the `Description` folder!**

This repo is where the magic of the old API and services (Vue) comes together✨

`Dockerfile`: For setting up the nginx reverse proxy as a service

`docker-compose.yml`: For organizing the swarm.

`docker-compose-test.yml`: For organizing the swarm but on the test server.

`nginx.conf`: Config for this service, copy to `/etc/yifferconfig/`

`nginx-test.conf`: Config for this service but on the test server, copy to `/etc/yifferconfig/`

`cfg.yml`: Config for the API service, copy to `/etc/yifferconfig/`

`cfg-new.yml`: Config for the new TS API service, copy to `/etc/yifferconfig/`
