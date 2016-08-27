# docker-php-test-compilation
Run tests or checks in various PHP versions. No matter which testing framework are used.

## Requirements

* [Docker](https://docs.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)

## Install

Do these steps in the relevant project directory

1. Clone the repository

```
$ git clone https://github.com/tommy-muehle/docker-php-test-compilation.git build
```

2. Go to new directory and remove the git stuff

```
$ cd build 
$ rm -rf .git/
```

3. Link the app directory. This directory is mounted through the different PHP containers to run checks, tests or something else.
   In case the "build" directory is a sub-directory in your project structure you can use the following command:

```
$ ln -s ../ app
```

4. Customize. Add needed PHP extensions in Dockerfile's, change versions or add further and update .ini values.

## Usage

Just simple run the following command and type in the command to be executed in the prompt:

```
$ ./run.sh
```

To be faster, you can add the command as argument with the --command option:

```
$ ./run.sh --command="-r phpinfo();"
```

For debugging you can additionally add the --debug option.

```
$ ./run.sh --command="-r phpinfo();" --debug
```
