#!/bin/sh

java -jar ./build/quotes.jar &;
java -jar ./build/newsfeed.jar &;
java -jar ./build/front-end.jar &;