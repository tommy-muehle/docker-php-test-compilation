# docker-php-test-compilation

Run any checks in various PHP versions.

## Requirements

* [Docker](https://docs.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)

## Install and usage

Do these steps in the relevant project directory.

1. Clone the repository

    ```
    $ git clone https://github.com/tommy-muehle/docker-php-test-compilation.git .docker
    ```

2. Go to new directory and remove the git stuff

    ```
    $ cd .docker 
    $ rm -rf .git/
    ```

3. Customize. 
   Add needed PHP extensions in Dockerfile's, change versions or add further and update .ini values.
   And the most important, add tasks [here](run.sh#L56).
   
## Demo

To see an example in action, take a look in this [project](https://github.com/tommy-muehle/tooly-composer-script/tree/bcb447ac161770ee3251f0b3616d66847d16c130/.docker).
And at tasks [here](https://github.com/tommy-muehle/tooly-composer-script/blob/bcb447ac161770ee3251f0b3616d66847d16c130/.docker/run.sh#L50-L69).
