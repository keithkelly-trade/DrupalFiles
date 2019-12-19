# Puppet Developers Tooling Setup

This document will outline the process to install and configure the default tooling to start developing puppet code.  These tools are to meant to ease the development with IDE feature like syntax highlighting and mouse-over documentation to the resources and classes available.

## Instructions to setup VSC, PDK, and pe_puppet_client-_tools.

Download and install Puppet Developers Kit:

[PDK](https://puppet.com/download-puppet-development-kit)

Download and install Git

[Git Download](https://git-scm.com/downloads)

Download and install Visual Studio Code:

[Visual Studio Code](https://code.visualstudio.com/)

## Setup Applications 

### PE Client Tools

Download, install and configure 

[pe_client_tools](https://puppet.com/docs/pe/2019.1/installing_pe_client_tools.html)

- Create directory `C:\ProgramData\PuppetLabs\puppet\ssl\certs`

   - Example in Powershell:

     ```
     New-Item C:\ProgramData\PuppetLabs\puppet\ssl\certs  -ItemType Directory
     ```

- Download PuppetMaster ca.pem from \<PuppetMaster Host\> in /opt/puppetlabs/puppet/ssl/certs/ca.pem
  This may require assistance from the team or someone on the team should have this file.

- Copy ca.pem to C:\ProgramData\PuppetLabs\puppet\ssl\certs

- On the workstation, make sure the file permissions are set to read-only for `C:\ProgramData\PuppetLabs\puppet\ssl\certs\ca.pem`

    -  Example in Powershell:
    ```
    Set-ItemProperty -Path C:\ProgramData\PuppetLabs\puppet\ssl\certs\ca.pem -Name IsReadOnly -Value $true
    ```

- Configure pe-client-tools:

- Create File ~\.puppetlabs\client-tools\puppet-access.conf with the content:
```
{
  "service-url": "https://\<PuppetMaster Host\>:4433/rbac-api",
  "cacert": "C:\\ProgramData\\PuppetLabs\\puppet\\ssl\\certs\\ca.pem"
}
```

- Create file ~\.puppetlabs\client-tools\puppet-code.conf with the content:
```
{
  "cacert": "C:\\ProgramData\\PuppetLabs\\puppet\\ssl\\certs\\ca.pem",
  "service-url": "https://\<PuppetMaster Host\>:8170/code-manager"
}
```

In an Admin Powershell:
```
puppet-access login --lifetime 90d
###  provide user and password for Puppet Enterprise Console
puppet-code print-config
### Test deploying the code
#puppet-code deploy <environment> --wait
puppet-code deploy production --wait
```

It should look something like:
```
service-url: "https://\<PuppetMaster Host\>:8170/code-manager"
cacert: "C:\ProgramData\PuppetLabs\puppet\ssl\certs\ca.pem"
token-file: "C:\Users\troklein\.puppetlabs\token"
token: "AOerU........REDACTED"
```
### Git

- Download and install https://git-scm.com/downloads

### Visual Studio Code (VSC)

- Install Puppet plugin located under extensions icon on the left.
  Click on Cog on lower left -> settings
  add the following to the user settings section on the right pane:

```
{
// The fully qualified path to the Puppet agent install directory. For example: 'C:\Program Files\Puppet Labs\Puppet' or '/opt/puppetlabs/puppet'
  "puppet.puppetAgentDir": 'C:\\Program Files\\Puppet Labs\\DevelopmentKit\\share\\cache\\ruby\\2.4.0\\bin'
  "hiera-eyaml": {
      "publicKeyPath": "C:\\Users\\tklein\\Projects\\Consulting\\HEEQ\\puppet-control-repo\\keys\\public_key.pkcs7.pem",
      "eyamlPath": "C:\\Path\\To\\The\\eyaml\\exe",
  },
  "puppet.installDirectory": "C:\\Program Files\\Puppet Labs\\DevelopmentKit\\",
}
```

  - Press `f1` to open Command Palette, and type puppet select Puppet: Restart Current Session to restart the puppet languageserver.

  - In the bottom left of the VSC pane you should see `Starting Puppet...` if you have a `.pp` file open in a active edit window.

  - When it is complete you should see a Puppet version.

### Notes for PowerShell Environment

Add the following to 'C:\Users\<USERNAME>\Documents\WindowsPowerShell\profile.ps1'

```
$env:Path += "C:\Program Files\Puppet Labs\Client\bin;C:\Program Files\Puppet Labs\DevelopmentKit\bin"
```

