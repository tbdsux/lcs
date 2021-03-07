import std/[os, tables, strutils, osproc, times]

proc getLicenses: Table[string, string] = 
  for kind, path in walkDir("src" / "licenses"):
    if kind == pcFile and path.endsWith(".txt"):
      let fname = path.splitFile().name
      result[fname] = readFile(path)

const licenses* = getLicenses()

proc getGitUsername*(): string =
  ## get github username
  try:
    var (output, _) = execCmdEx("git config user.name")
    result = output.strip()
  except:
    discard


proc getSystemYear*(): int = now().year
  ## get system year


proc licenseExists*(): bool = fileExists("LICENSE")