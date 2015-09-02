linux:
	crystal build bin/mdresume.cr
all: linux osx

osx:
	crystal build bin/mdresume.cr --cross-compile 'Darwin x86_64' --target 'x86_64-apple-darwin12.6.0'
