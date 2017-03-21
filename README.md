# Ruby Docker images from Avvo

These Dockerfiles are used to build docker images we use for various Ruby containers at Avvo.

## Development

1. Clone this repo
2. Edit the Dockerfile you want to update
3. Build the image (for instance the `rails-mysql` image): `docker build -t avvo/avvo-rails-mysql:latest .`
4. Push the image: `docker push avvo/avvo-rails-mysql:latest`

Two notes:

a. You need permissions to write the images on dockerhub. If you're not an Avvo person, you probably don't have access. You can push it up to your own namespace.
b. Test out your changes on a tag before committing and pushing to latest.

## License

MIT Licence. Do what you want, this is just configuration, nothing special.
