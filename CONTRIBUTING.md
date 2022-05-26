# Updating

Well. It's a manual process for now. 🙂

- Go to: <https://pulsar.apache.org/admin-rest-api/> and press "Download" OpenAPI specification.
- Go to <https://editor.swagger.io/>, paste the OpenAPI file content to the editor. 
- Press "Generate client -> typescript-fetch" and uncompress the downloaded archive.
- Put the content of generated client file to <./index.ts>.
- Bump version in <./package.json>.
- Run `npm publish`.
