TEST TASK
Every push into GitHUB must  run trigger Travis CI which must run compilation of the docker image  and push it into the DockerHub.

1. Create new GitHub repository.
     Go to github.
     Log in to your account.
     Click the new repository button in the top-right. You’ll have an option there to initialize the repository with a README file, but I don’t.
     Click the “Create repository” button.
2. Go into the directory containing the project and add it to GitHub repository. 
     Type git init.
     Type 'git add .' to add all of the relevant files.
     You’ll probably want to create a .gitignore file right away, to indicate all of the files you don’t want to track. Use git add .gitignore, too.
     Type 'git commit -m "First commit"'.
     Now, follow the second set of instructions, “Push an existing repository…”
       $ git remote add origin https://github.com/username/new_repo
       $ git push -u origin master
3. Go to travis-ci.org and log in with a github account (Sign in Github). Authorize the application through OAuth. 
     Click Authorize-CI and wait for sinhronization with github account.
4. In our project create file .travis.yml with content:
    
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
5. Create file Makefile with content:
          IMAGE := user_name/git_zabbix_docker
          VERSION:= latest
          test:
            	   true
          image:
	         docker build -t ${IMAGE}:${VERSION} .
          push-image:
	         docker push ${IMAGE}
          .PHONY: image push-image test

6. Add .travis.yml and Makefile into Git repository.
7. Add Environment Variables into Travis CI project.
8. Create new DockerHub repository.
8. After each next commit new Docker image will be add into DockerHub repository.

