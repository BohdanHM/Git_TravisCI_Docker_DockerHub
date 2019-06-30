TEST TASK

Every push into GitHUB must  run trigger Travis CI which must run compilation of the docker image  and push it into the DockerHub.

1. Create new GitHub repository.
2. Go into the directory containing the project and add it to GitHub repository. 
3. Go to travis-ci.org and log in with a GitHub account (Sign in Github). Authorize the application through OAuth. Click Authorize-CI and wait for sinhronization with github account.
4. In our project create file .travis.yml and Makefile.
5. Add .travis.yml and Makefile into Git repository.
6. Add Environment Variables into Travis CI project.
7. Create new DockerHub repository.
8. After each next commit new Docker image will be add into DockerHub repository.

