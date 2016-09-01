all: build
	
build:
	elm-make Uno.elm --output=public/main.js
