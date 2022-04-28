# DevOps Assessment

This project contains three services:

* `quotes` which serves a random quote from `quotes/resources/quotes.json`
* `newsfeed` which aggregates several RSS feeds together
* `front-end` which calls the two previous services and displays the results.

## Prerequisites

* Java
* [Leiningen](http://leiningen.org/) (can be installed using `brew install leiningen`)

## Running tests

You can run the tests of all apps by using `make test`

## Building

First you need to ensure that the common libraries are installed: run `make libs` to install them to your local `~/.m2` repository. This will allow you to build the JARs.

To build all the JARs and generate the static tarball, run the `make clean all` command from this directory. The JARs and tarball will appear in the `build/` directory.

### Static assets

`cd` to `front-end/public` and run `./serve.py` (you need Python3 installed). This will serve the assets on port 8000.

## Running

All the apps take environment variables to configure them and expose the URL `/ping` which will just return a 200 response that you can use with e.g. a load balancer to check if the app is running.

### Front-end app

`java -jar front-end.jar`

*Environment variables*:

* `APP_PORT`: The port on which to run the app
* `STATIC_URL`: The URL on which to find the static assets
* `QUOTE_SERVICE_URL`: The URL on which to find the quote service
* `NEWSFEED_SERVICE_URL`: The URL on which to find the newsfeed service
* `NEWSFEED_SERVICE_TOKEN`: The authentication token that allows the app to talk to the newsfeed service. This should be treated as an application secret. The value should be: `T1&eWbYXNWG1w1^YGKDPxAWJ@^et^&kX`

### Quote service

`java -jar quotes.jar`

*Environment variables*

* `APP_PORT`: The port on which to run the app

### Newsfeed service

`java -jar newsfeed.jar`

*Environment variables*

* `APP_PORT`: The port on which to run the app




</br>
</br>
</br>

# Thank You!
For more visit my profiles:
<a href="https://github.com/criticalmiind/"><i>GitHub</i></a>,
<a href="https://www.youtube.com/c/shawalahmadmohmandofficail"><i>Youtube</i></a>,
<a href="https://www.google.com/search?q=shawal+Ahmad+Mohmand"><i>Google</i></a>,
<a href="https://web.facebook.com/ShawalAhmadOfficialPage/"><i>Facebook</i></a>,
<a href="https://pk.linkedin.com/in/shawalahmad"><i>LinkedIn</i></a>,
<a href="https://stackoverflow.com/users/13789062/shawal-ahmad-khan"><i>Stackoverflow</i></a>,
<a href="https://www.fiverr.com/users/kamaljankamal4/"><i>Fiverr</i></a>.