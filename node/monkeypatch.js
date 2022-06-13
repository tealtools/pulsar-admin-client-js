#!/usr/bin/env node

const fs = require("fs");
const path = require("path");

const requestFilePath = path.resolve(__dirname, "./dist/core/request.js");
const requestFile = fs.readFileSync(requestFilePath, "utf8");

function patchRequestFileContent(requestFile) {
  const patch1 = `
	const getRequestBody = (options) => {
		if (options.body) {
			return JSON.stringify(options.body);
		}
	}    
    `;

  const patch2 = `if (false)`;

  const patched1 = requestFile.replace(
    /const getRequestBody[^&\0]*^}/m,
    patch1
  );
  const patched2 = patched1.replace(
    /if \(isString\(options.body\)\)/g,
    patch2
  );
  fs.writeFileSync(requestFilePath, patched2);
}

patchRequestFileContent(requestFile);
