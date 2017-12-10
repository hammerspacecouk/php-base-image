# php-base-image
A base image for PHP with all the required extensions

```
Invoke-Expression -Command (aws ecr get-login --no-include-email --region eu-west-2)
docker build -t planet-cargo-base-php .
docker tag planet-cargo-base-php:latest 323441517494.dkr.ecr.eu-west-2.amazonaws.com/planet-cargo-base-php:latest
docker push 323441517494.dkr.ecr.eu-west-2.amazonaws.com/planet-cargo-base-php:latest
```