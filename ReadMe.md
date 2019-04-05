# bower-npm-resolver-inside-docker

[![Build Status](https://travis-ci.org/GabLeRoux/bower-npm-resolver-inside-docker.svg?branch=master)](https://travis-ci.org/GabLeRoux/bower-npm-resolver-inside-docker) [![Greenkeeper badge](https://badges.greenkeeper.io/GabLeRoux/bower-npm-resolver-inside-docker.svg)](https://greenkeeper.io/)

Refer to the following issue where it was fixed upstream:  
https://github.com/mjeanroy/bower-npm-resolver/issues/10

I created this because I was getting the following error when running inside docker

## TypeError: Path must be a string. Received undefined

```bash
> bower "install" "--allow-root"
```
```
bower ngInfiniteScroll#1.3.0       not-cached npm:ng-infinite-scroll#1.3.0
bower ngInfiniteScroll#1.3.0          resolve npm:ng-infinite-scroll#1.3.0
bower lodash#^4.17.10              not-cached https://github.com/lodash/lodash.git#^4.17.10
bower lodash#^4.17.10                 resolve https://github.com/lodash/lodash.git#^4.17.10
bower lodash#^4.17.10                download https://github.com/lodash/lodash/archive/4.17.10.tar.gz
bower lodash#^4.17.10                 extract archive.tar.gz
bower lodash#^4.17.10                resolved https://github.com/lodash/lodash.git#4.17.10
bower ngInfiniteScroll#1.3.0            error Path must be a string. Received undefined

Stack trace:
TypeError: Path must be a string. Received undefined
    at assertPath (path.js:28:11)
    at Object.join (path.js:1236:7)
    at ResolveCache._readPkgMeta (/usr/src/app/node_modules/bower/lib/core/ResolveCache.js:337:25)
    at ResolveCache.store (/usr/src/app/node_modules/bower/lib/core/ResolveCache.js:108:51)
    at /usr/src/app/node_modules/bower/lib/core/PackageRepository.js:190:35
    at _fulfilled (/usr/src/app/node_modules/bower/lib/node_modules/q/q.js:834:54)
    at self.promiseDispatch.done (/usr/src/app/node_modules/bower/lib/node_modules/q/q.js:863:30)
    at Promise.promise.promiseDispatch (/usr/src/app/node_modules/bower/lib/node_modules/q/q.js:796:13)
    at /usr/src/app/node_modules/bower/lib/node_modules/q/q.js:604:44
    at runSingle (/usr/src/app/node_modules/bower/lib/node_modules/q/q.js:137:13)
    at flush (/usr/src/app/node_modules/bower/lib/node_modules/q/q.js:125:13)
    at _combinedTickCallback (internal/process/next_tick.js:131:7)
    at process._tickCallback (internal/process/next_tick.js:180:9)

Console trace:
Error
    at StandardRenderer.error (/usr/src/app/node_modules/bower/lib/renderers/StandardRenderer.js:81:37)
    at Logger.<anonymous> (/usr/src/app/node_modules/bower/lib/bin/bower.js:110:26)
    at emitOne (events.js:116:13)
    at Logger.emit (events.js:211:7)
    at Logger.emit (/usr/src/app/node_modules/bower/lib/node_modules/bower-logger/lib/Logger.js:29:39)
    at /usr/src/app/node_modules/bower/lib/commands/index.js:48:20
    at _rejected (/usr/src/app/node_modules/bower/lib/node_modules/q/q.js:844:24)
    at /usr/src/app/node_modules/bower/lib/node_modules/q/q.js:870:30
    at Promise.when (/usr/src/app/node_modules/bower/lib/node_modules/q/q.js:1122:31)
    at Promise.promise.promiseDispatch (/usr/src/app/node_modules/bower/lib/node_modules/q/q.js:788:41)
    at /usr/src/app/node_modules/bower/lib/node_modules/q/q.js:604:44
    at runSingle (/usr/src/app/node_modules/bower/lib/node_modules/q/q.js:137:13)
  1 {
    at flush (/usr/src/app/node_modules/bower/lib/node_modules/q/q.js:125:13)
    at _combinedTickCallback (internal/process/next_tick.js:131:7)
    at process._tickCallback (internal/process/next_tick.js:180:9)
System info:
Bower version: 1.8.2
Node version: 8.11.1
OS: Linux 4.9.87-linuxkit-aufs x64
npm ERR! code ELIFECYCLE
npm ERR! errno 1
npm ERR! bower-npm-resolver-inside-docker@1.0.0 bower: `bower "install" "--allow-root"`
npm ERR! Exit status 1
npm ERR!
npm ERR! Failed at the bower-npm-resolver-inside-docker@1.0.0 bower script.
npm ERR! This is probably not a problem with npm. There is likely additional logging output above.

npm ERR! A complete log of this run can be found in:
npm ERR!     /root/.npm/_logs/2018-05-08T18_58_20_819Z-debug.log
The command '/bin/sh -c npm run bower -- install --allow-root' returned a non-zero code: 1
```

It turned out that the following version was causing the error:

```javascript
"devDependencies": {
  "bower-npm-resolver": "^0.4.0"
},
```

The fix was to use "0.9.1" 
```javascript
"devDependencies": {
  "bower-npm-resolver": "0.9.1"
},
```

🎉

# LICENSE

[MIT](LICENSE.md) © [Gabriel Le Breton](https://gableroux.com)

