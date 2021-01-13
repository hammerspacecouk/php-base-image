# php-base-image
A base image for PHP with all the required extensions

To build locally:

```bash
docker build -t php-base:latest .
docker run --rm php-base:latest php --version
```
