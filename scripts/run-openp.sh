#!/bin/bash

docker run -it -p 8080:80 \
      -e OPENPROJECT_SECRET_KEY_BASE=2JWo1M00ErRGGLhGQaFXd7vygMkRz3XC \
  -e OPENPROJECT_HOST__NAME=localhost:8080 \
  -e OPENPROJECT_HTTPS=false \
  -e OPENPROJECT_DEFAULT__LANGUAGE=en \
  openproject/openproject:14
