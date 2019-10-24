# dont-care-log

[![Build Status](https://travis-ci.org/zthxxx/dont-care-log.svg)](https://travis-ci.org/zthxxx/dont-care-log)
[![NPM Version](https://badgen.net/npm/v/dont-care-log)](https://www.npmjs.com/package/dont-care-log)
[![NPM Downloads](https://badgen.net/npm/dt/dont-care-log)](https://www.npmjs.com/package/dont-care-log)
[![Node.js](https://badgen.net/npm/node/dont-care-log)](https://nodejs.org)
[![License](https://badgen.net/github/license/zthxxx/dont-care-log)](https://github.com/zthxxx/dont-care-log/blob/master/LICENSE)


make git stage/diff ignore the specific log code line

so your log code always wont be commit automatically, and also wont show in `git status`


## Install

```bash
npm i -D dont-care-log
```


## How it works

Well, here defined a **`filter.clean`** pipe to drop the specific line,

and some `preinstall` hook to setup `.gitconfig` and `.gitattributes`.

More details of `git add/staging` workflow see: [> git-scm staging](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#_keyword_expansion)


In simple terms, `filter.clean` for **staging**, `filter.smudge` **for checkout**


![filter-clean](./images/filter-clean.png)

![filter-smudge](./images/filter-smudge.png)


## License

[MIT LICENSE](./LICENSE)
