## You don't need to care log code

-- Debug and locally logging

---

<style>
  .content code[class*="language-"] {
    font-size: 1.5em;
  }
</style>

## what we do in debug

```js
const var = 'foo'

...

showTitle(var) 
// WTF! --> output: 'bar' 
```

guess what happened in \`**...**\`

---

- console.log / debugger
  - out of the box
- breakpoint
- logging lib (auto / manual)
  - for more info

---

signale.js (more info, more color)

![signale](https://github.com/klaussinani/signale/blob/master/media/header.png?raw=true)

---

## Breakpoint / debugger

- not data persistence
- break code workflow
- lost self in nested call

---

<style>
  .content code[class*="language-"] {
    font-size: 1.5em;
  }
</style>

```js
const var = 'foo'
...

console.log(var)
```

❌ lint-stage

❌ git commit

---

<style>
  .content code[class*="language-"] {
    font-size: 1.5em;
  }
</style>


```js
const var = xxx

...

console.log(var)
console.log(foo)
console.log(bar)
console.log(name)
```

lose your self in output

---

<style>
  .content code[class*="language-"] {
    font-size: 1.5em;
  }
</style>

```js
console.log(11, var)
console.log(222, var)

// or

console.log('MarkdownEditor onChange name', name)
```

---

## What do I expect

- auto insert logging code
  - name of class, method, variable
  - click / hotkey
- ignore in git
  - not show in diff
  - not effect to lint

---

### [Turbo Console Log](https://marketplace.visualstudio.com/items?itemName=ChakrounAnas.turbo-console-log)

<iframe 
  src="https://marketplace.visualstudio.com/items?itemName=ChakrounAnas.turbo-console-log" 
  frameborder="no" 
  allowtransparency="true"
  allowfullscreen="true"
  style="width: 1200px; height: 700px"
/>

---


## [Turbo Console Log](https://scotch.io/bar-talk/consolelog-faster-with-turbo-console-log)

![turbo](https://scotch-res.cloudinary.com/image/upload/w_800,q_auto:good,f_auto/v1552330596/qgy7pcsrescj8g9fv7tk.mp4)

---

## But how ignore in git?

---

<style>
  .content code[class*="language-"] {
    font-size: 2em;
  }
</style>

## Hi, [dont care log](https://www.npmjs.com/package/dont-care-log)


```bash
$ npm i -D dont-care-log
```

---

<style>
.slide .content > .diff-code {
  display: flex;
  flex-direction: row;
}
.content > .diff-code > pre {
  padding: 40px 0;
  border-right: 1px solid #bbb;
}
.content > .diff-code > pre:last-of-type {
  border-right: none;
}
.content > .diff-code code.language-diff {
  color: #66b91a;
}
</style>

<div class="diff-code">

```js
import path from 'path'

const getFile = () => {
  const name = 'foo'
  const file = path.join(__dirname, name)
  console.log('TCL: getFile() -> name:', file)
  return file
}
```

```diff
+ import path from 'path'
+ 
+ const getFile = () => {
+   const name = 'foo'
+   const file = path.join(__dirname, name)
+   return file
+ }
```

</div>

**New file** as left, `git add/diff` as right

No line of `console.log('TCL: ...)` in diff

---


**staging** <--- [ filters ] --> **workspace**

↓

- [`.git/info/.gitattributes`](https://git-scm.com/book/en/v2/Customizing-Git-Git-Attributes#_keyword_expansion)

- [`.git/config`](https://git-scm.com/docs/git-config/1.8.2#git-config-filterltdrivergtclean)

---

<style>
.content p {
  margin: 0;
}
</style>

![filter-clean](./images/filter-clean.png)

![filter-smudge](./images/filter-smudge.png)

---

```
# .git/info/.gitattributes

*.[jt]s filter=ignoreLogStage
*.[jt]sx filter=ignoreLogStage


# .git/config

[filter "ignoreLogStage"]
  clean = perl -ne \"print unless /^[\\t ]*\\/* ?console\\.log\\(.TCL: /\"
  smudge = cat
```

---

## Roadmap

- [ ] multiline for per log functions
- [ ] configurable
- [ ] static parse current line to find out all variables
- [ ] log plugin of webstorm
