import std/[os, tables, strutils, osproc, times]


proc getPackagePath(): string = 
  ## get the package folder dir
  try:
    var (output, _) = execCmdEx("nimble path lcs")
    result = output.strip()
  except CatchableError:
    discard


proc getLicenses*(): Table[string, string] = 
  for kind, path in walkDir(getPackagePath() / "lcs" / "licenses"):
    if kind == pcFile and path.endsWith(".txt"):
      let fname = path.splitFile().name
      result[fname] = readFile(path)


proc getGitUsername*(): string =
  ## get github username
  try:
    var (output, _) = execCmdEx("git config user.name")
    result = output.strip()
  except CatchableError:
    discard



proc getSystemYear*(): int = now().year
  ## get system year


proc licenseExists*(): bool = fileExists("LICENSE")