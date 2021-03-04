# lcs
Simple utility cli app for adding LICENSE to projects

This project just adds a **LICENSE** file to your dir, nothing fancy.

### Credits:
All licenses are taken from **https://choosealicense.com**

## Install 
```
nimble install https://github.com/TheBoringDude/lcs.git
```

## Usage:
```
lcs -t:{licenseType} -a:{author} -y:{year} -p:{project-name} -u:{project-url}
```

### Flags:
- **--type, -t** - the type of license [required]
- **--author, -a** - your name, author *[only applicable to specific licenses]*
- **--year, -y** - license year *[only applicable to specific licenses]*
- **-project, -p** - project name *[only applicable to specific licenses]*
- **-url, -u** - project url *[only applicable to specific licenses]*


### &copy; TheBoringDude