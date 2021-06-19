import std/[parseopt, tables, strutils]
import lcs/utils




proc runMain() =
  ## main function runner
  
  # get all license
  var licenses = getLicenses() 

  var
    # variables that will be replaced to the license file
    licenseType: string
    author: string = getGitUsername() # [fullname]
    year: string = $getSystemYear() # [year]
    projectName: string             # [project]
    projectUrl: string              # [projecturl]

  # parse cmd params
  for kind, key, val in getopt():
    case kind
    of cmdArgument: continue
    of cmdEnd: break
    of cmdLongOption, cmdShortOption:
      case key:
      of "type", "t": licenseType = val.toLower()
      of "author", "a": author = val
      of "year", "y": year = val
      of "project", "p": projectName = val
      of "url", "u": projectUrl = val
      of "show", "":
        echo "\nList of Available Licenses:"
        for key, _ in licenses:
          echo "   - ", key

        quit(0)

  if licenseType == "":
    # exit cli if type is not set
    echo "License type flag required! (--type, -t)"
    quit(1)

  

  # Get license contents
  var license = licenses.getOrDefault(licenseType, "")
  # If there's no such license
  if license == "":
    echo "Unknown license type: ", licenseType
    quit(1)


  # replace license var contents
  license = license.multiReplace({
    "[fullname]": author,
    "[year]": year,
    "[project]": projectName,
    "[projecturl]": projectUrl
  })


  # `LICENSE` file exists already in dir
  if licenseExists():
    echo "`LICENSE` file already exists in project dir!"
    quit(1)


  # create LICENSE file
  writeFile("LICENSE", license)


when isMainModule:
  runMain()
