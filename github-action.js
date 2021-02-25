
/**
 * @file File that GitHub runs as the GitHub Action.
 * @summary GitHub Action
 */

"use strict";

//-----------------------------------------------------------------------------
// Requirements
//-----------------------------------------------------------------------------

/*
 * Important! This file must NOT require anything other than core Node.js
 * modules. This file will be executed directly from GitHub without `npm i`
 * being run and therefore must be completely self-contained.
 */
const cp = require("child_process");
const fs = require("fs");
const path = require("path");

//-----------------------------------------------------------------------------
// Main
//-----------------------------------------------------------------------------

// get package version from package.json
const pkgFilename = path.resolve(__dirname, "../hardhat/packages/hardhat-shorthand/package.json");
const pkg = JSON.parse(fs.readFileSync(pkgFilename));

try {

    // in dev mode, run locally
    if (process.env.SHARK_TEST) {
        cp.execSync("node wrapper/bin.js");
    } else {
        cp.execSync(`npx ${pkg.name}@${pkg.version}`);
    }
} catch (ex) {
    process.exitCode = 1;
    console.log(ex.output.toString());
}