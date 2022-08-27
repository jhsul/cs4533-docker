## About
This is a docker image that might be useful if you're in CS 4533. Right now, it just gives you a ready-to-use antlr shared library, as well as cmake, llvm, and other basic tools. However, it could be extended to incorporate more parts of the toolchain as the course progresses. 

## Usage

This takes a long time but you only need to do it once:

```sh
docker pull jackhsullivan/cs4533-docker
```

Run with:

```sh
docker run -it -v ~/<your_class_folder>:/home/shared jackhsullivan/cs4533-docker
```

## Calculator Example

On your *host* machine, clone the course repository 

```sh
git clone https://bitbucket.org/gfp-public-course-materials/compiler-projects-all/src/master/ ~/cs4533
```


Run the docker image with the shared folder

```sh
docker run -it -v ~/cs4533/1-calculator-starter:/home/shared jackhsullivan/cs4533-docker
```

Now, in the docker container

```sh
cp ~/libantlr4-runtime.a ~/shared/antlr/lib/
cd ~/shared

cmake -S . -B build
cmake --build build
cmake --install build
install/calculator
```

You should get:
```
OUTPUT
(<EOF><EOF> <EOF> <EOF>)
```