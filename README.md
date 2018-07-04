# Ruby on Rails Tutorial: sample application

**This repository is not current or maintained. See [www.railstutorial.org/help](https://www.railstutorial.org/help) for the current version of the sample app.**

This is the sample application for
[*Ruby on Rails Tutorial: Learn Web Development with Rails*](http://railstutorial.org/)
by [Michael Hartl](http://michaelhartl.com/). You can use this reference implementation to help track down errors if you end up having trouble with code in the tutorial. In particular, as a first debugging check I suggest getting the test suite to pass on your local machine:

    cd /tmp
    git clone https://github.com/railstutorial/sample_app_rails_4.git
    cd sample_app_rails_4
    cp config/database.yml.example config/database.yml
    bundle install --without production
    bundle exec rake db:migrate
    bundle exec rake db:test:prepare
    bundle exec rspec spec/

If the tests don't pass, it means there may be something wrong with your system. If they do pass, then you can debug your code by comparing it with the reference implementation.

## Understanding the Docker build process

This sample application has the following key points

 * It already has its own [Dockerfile](Dockerfile) in the root of the repository
 * It is a web application that runs on port 3000
 * The docker image is self-contained. The database is integrated in the application itself (with Sqlite).

 To build the application locally perform the following steps in your terminal/shell:

``` 
git clone https://github.com/kkapelon/sample_app_rails_4 
cd sample_app_rails_4
docker build . -t sample-rails
```

 Once the build completes you will have a Docker image named *sample-rails*. You can see the image in your local Docker installation by running `docker images`

 To run the docker image and launch the application execute:

 ```
 docker run -p 3000:3000 codefresh/sample-rails
 ``` 
 and wait until all log messages stop. This starts the Docker image and makes sure that port 3000 is binded on your local workstation (that port should be free before running this command). Visit with your browser the page at [http://localhost:3000/](http://localhost:3000/) to see the application running.


The application has some other pages that you can visit if you click on the various links. Once you are done exploring press `Ctrl-C` on your terminal to stop the Docker container.
