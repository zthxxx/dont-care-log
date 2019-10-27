const params = process.argv.slice(2)

function dropLog(string) {
  return string.replace(/^[\t ]*\/*[\t ]*console\.log\(["']TCL: .*?\n/gm, '')
}

if (params.length === 0) {
  let buff = "";
  process.stdin
    .on('data', data => {
      buff += data
    })
    .on('end', () => {
      process.stdout.write(dropLog(buff))
      process.exit(0)
    })
} else {
  const fs = require('fs')
  const path = require('path')

  function readFile(filename) {
    const filepath = path.join(__dirname, filename)
    const file = fs.readFileSync(filepath).toString('utf-8')
    return file
  }

  const filename = params[0]

  process.stdout.write(dropLog(readFile(filename)))
  process.exit(0)
}


