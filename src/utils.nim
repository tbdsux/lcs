import tables, strutils, strformat

const allLicenses = ["lgpl-2.1.txt", "gpl-3.0.txt", "mit-0.txt",
    "bsd-4-clause.txt", "cc0-1.0.txt", "ms-pl.txt", "gpl-2.0.txt",
    "odbl-1.0.txt", "ofl-1.1.txt", "bsd-2-clause.txt", "cc-by-sa-4.0.txt",
    "agpl-3.0.txt", "upl-1.0.txt", "ncsa.txt", "zlib.txt", "cecill-2.1.txt",
    "mit.txt", "postgresql.txt", "isc.txt", "epl-2.0.txt", "unlicense.txt",
    "lgpl-3.0.txt", "epl-1.0.txt", "bsd-3-clause-clear.txt", "bsd-3-clause.txt",
    "ecl-2.0.txt", "wtfpl.txt", "0bsd.txt", "apache-2.0.txt", "osl-3.0.txt",
    "ms-rl.txt", "vim.txt", "bsl-1.0.txt", "lppl-1.3c.txt", "eupl-1.1.txt",
    "afl-3.0.txt", "mpl-2.0.txt", "artistic-2.0.txt", "eupl-1.2.txt", "cc-by-4.0.txt"]


proc iterateLicenses(): Table[string, string] =
  result = initTable[string, string]()
  for i in allLicenses:
    result[i.replace(".txt", "")] = staticRead(&"licenses/{i}")

const licenses* = iterateLicenses()

