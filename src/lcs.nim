import os, parseopt, tables, os, strutils, utils

proc runMain() =
  ## main function runner

  var
    # variables that will be replaced to the license file
    licenseType: string
    author: string = if getGitUsername() != "": getGitUsername() else: "" # [fullname]
    year: string = $getSystemYear() # [year]
    projectName: string             # [project]
    projectUrl: string              # [projecturl]
                                    # license contents
    license: string

  # parse cmd params
  for kind, key, val in getopt(commandLineParams()):
    case kind
    of cmdArgument: continue
    of cmdEnd: break
    of cmdLongOption, cmdShortOption:
      case key:
      of "type", "t": licenseType = val
      of "author", "a": author = val
      of "year", "y": year = val
      of "project", "p": projectName = val
      of "url", "u": projectUrl = val

  if licenseType == "":
    # exit cli if type is not set
    echo "License type flag required! (--type, -t)"
    quit(0)

  try:
    license = licenses[licenseType]
  except IndexDefect:
    echo "Unknown license type: ", licenseType
    quit(0)


  # replace license var contents
  license = license.replace("[fullname]", author).replace("[year]",
      year).replace("[project]", projectName).replace("[projecturl]", projectUrl)


  # create LICENSE file
  writeFile("LICENSE", license)


when isMainModule:
  runMain()
