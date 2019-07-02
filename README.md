### TEST TASK

Every push into GitHUB must  run trigger Travis CI which must run compilation of the docker image (zabbix server) and push it into the DockerHub.

**How to do:**

1. Create new GitHub repository.
2. Go into the directory containing the project and add it to GitHub repository. 
3. Go to travis-ci.org and log in with a GitHub account (Sign in Github). Authorize the application through OAuth. Click Authorize-CI and wait for sinhronization with github account.
4. In our project create file .travis.yml and Makefile.
5. Add .travis.yml and Makefile into Git repository.
   
   **.travis.yml**
```   
sudo: 'required'
services:
  - 'docker'

script:
  - 'make test'
  - 'make image'

# To have `DOCKER_USERNAME` and `DOCKER_PASSWORD`
# use `travis env set DOCKER_USERNAME ...`
# use `travis env set DOCKER_PASSWORD ...`
after_success:
  - if [[ "$TRAVIS_BRANCH" == "master" ]]; then
      docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD ;
      make push-image ;
    fi
```

   **Makefile**

```
IMAGE := bohdanhm/git_zabbix_docker
VERSION:= latest

test:
        true

image:
        docker build -t ${IMAGE}:${VERSION} .

push-image:
        docker push ${IMAGE}


.PHONY: image push-image test

```

6. Create new DockerHub repository.
7. Add Environment Variables (DOCKER_USERNAME and DOCKER_PASSWORD) into Travis CI project.
8. After each next commit new Docker image will be add into DockerHub repository.

