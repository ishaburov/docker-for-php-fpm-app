# Docker for php-fpm application


## Introduction
  
 Images for php application with needing extensions

## Instruction

You can use image from docker hub <br>
https://hub.docker.com/repository/docker/ishaburov/php-fpm<br><br>

Or copy dockerfile and build it making this command:<br><br>
docker build -f ./<b>PATH_TO_FILE</b>/php:7.4.9-fpm-alpine.dockerfile . <br><br>
Check docker images : <br><br>
docker images <br><br>
And run using <b>IMAGE ID</b> <br><br>
docker run -it <b>IMAGE ID</b> sh <br><br>
## License
Docker for php-fpm application is open-sourced software licensed under the [MIT license](LICENSE).
