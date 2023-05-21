# forgejo-host

A combination of Forgejo, Action runner and Docker registry

# Code status
**Note!** This project should be considered pre Alpha, probably even pre proof of concept. Security hasn't been considered, nor have any other important aspects such as backups. In short, I wouldn't even advise running this on a pocket calculator right now, never mind anything that you actually care about!

# Instructions
## Prerequisites
Clone the repository.

## Set up Forgejo
`cd forgejo-1.19.3`

`docker-compose build`

`docker-compose up -d`

Use a web browser to navigate to `https://<myserverip>:3000` and finish the setup process. For DB type, ensure that SQLite is selected.

Once the setup process has finished and you are able to login...

Edit gitea/custom/conf/app.ini to add the following to the end of the file:
```
[actions]
ENABLED = true
```
Then restart the Forgejo container `docker-compose down && docker-compose up`

## Build the base runner container

This is the container that your workflows will run in. You can edit the `Dockerfile` to add additional applications etc. that your workflows need.

`cd ../runner-container`

`./build.sh`

## Build act
`cd ../act`

<<Edit ip/hostname in docker-compose to point at your forgejo instance>>

<<Grab token from forgejo admin/runners and add to  docker-compose file>>

`docker-compose build`

`docker-compose up -d`

# Additional actions

Each repository has to have actions enabled separately, it's not currently a default option.

More info is available here: https://blog.gitea.io/2023/03/hacking-on-gitea-actions/

# Test
You should now be ready to create a repository, and test actions as you would with Github.com

# FAQ
1. *Everything was running fine, I killed the act container and now it wont run.*

The tokens issued by Forgejo are currently single use only, once a runner has registered the token it can't be used again. There is currently no mechanism to store the .runner file created by Act, so you will have to generate a new token and update the docker-compose file.

2. *Whenever I try to run a workflow or use a container from the registry I get `http: server gave HTTP response to HTTPS client`*

Currently the docker registry is running without a TLS (https) certificate, as such docker treats it as an insecure registry. To fix this, add the following to `/etc/docker/daemon.json`
```
{
  "insecure-registries" : ["http://myregistrydomain.com:5000"]
}
```
Then restart docker e.g. `sudo service docker restart`

Where `myregistrydomain.com` is the name or more likely IP address of the machine running the registry.

Note. You will have to do this for every machine that is going to access the registry, including the one running the ACT runner.
