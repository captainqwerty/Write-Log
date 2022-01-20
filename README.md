
<div id="top"></div>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![LinkedIn][linkedin-shield]][linkedin-url]

<div align="center">

<h1 align="center"><b>Write-Log</b></h1>

  <p align="center">
    A simple project to easily add a log to your projects
    <br />
    <a href="https://github.com/captainqwerty/Write-Log/releases">Releases</a> -
    <a href="https://github.com/captainqwerty/Write-Log/issues">Report Bug</a>
  </p>
</div>

<!-- ABOUT THE PROJECT -->
## About The Project

This project was to just offer people a easy way to quickly add the ability to output a nice, simple log within their own projects. There are two versions in this project known as the *Class Version* and the *Module Version*.

### Class Version

The class Version is the preffered version however this version is limited to PowerShell Version 5.0 and greater and utilises the *Using* statement.

### Module Version

The Module Version is available for those prefering to use *Import-Module* and those using older versions of PowerShell as the Class version will not work on PowerShell versions prior to 5.0.

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* PowerShell version 2.0 or greater - Module Version.
* PowerShell version 5.0 or greater - Either version.

### Installation of Class Version

1. Download the <a href="https://github.com/captainqwerty/Write-Log/release">latest release</a>.
2. Extract the zipped folder.
3. Place the "Write-Log" folder in your project's folder or in a location the script can access under the context it will be ran.
4. Add the Using satement pointing to the Write-Log-Class.psm1 file, please note using statements must be the very first lines of your script.  In this example the Write-Log folder containing the file is in the root folder with the script calling it.
```ps1
using module ".\Write-Log\Write-Log-Class.psm1"
```
4. See <a href="#usage-of-the-class-version">Class Version Usage</a> section for examples on how to configure the log location and add enteries.

### Installation of Module Version

1. Download the <a href="https://github.com/captainqwerty/Write-Log/releases">latest release</a>.
2. Extra the zipped folder.
3. Ensure the Write-log.psm1 remains in a folder called "Write-Log" and place the Write-Log folder in your project's folder or in a location the script can access under the context it will be ran.
4. Import the Module. In this example the Write-Log folder is in the root of the project folder. 
```ps1
$module = "$psscriptroot\Write-Log"
if(!(test-path $module)){
    write-host "$module not found" -ForegroundColor Red
    exit
}
Import-Module $module
```
4. See <a href="#usage-of-the-module-version">Module Version Usage</a> section for examples on how to configure the log location and add enteries.
5. Add the Remove-Module line to the bottom of your script.
```ps1
Remove-Module Write-Log
```

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->
## Usage of the Class Version
```ps1
using module ".\Class\Write-Log\Write-Log-Class.psm1"

$Log = [WriteLog]::New("C:\Example\mylog.log")

$Log.AddInfo("Something occured that was wroth making an info log about")
$Log.AddError("There was a huge error!")
$Log.AddWarning("Oh dear I should really warn you about this!")
$Log.AddEntry("Testing","Test Severity") #This method is hidden but can be used for custom severities
```
The below example shows having mutliple Write-Log objects to store different types or log enteries in different logs.

```ps1
using module ".\Class\Write-Log\Write-Log-Class.psm1"

$InfoLog = [WriteLog]::New("C:\Example\Info.log")
$ErrorLog = [WriteLog]::New("C:\Example\Errors.log")
$WarningLog = [WriteLog]::New("C:\Example\Warning.log")

$InfoLog.AddInfo("Something occured that was wroth making an info log about")
$ErrorLog.AddError("There was a huge error!")
$WarningLog.AddWarning("Oh dear I should really warn you about this!")
```

## Usage of the Module version
```ps1
$module = "$psscriptroot\Module\Write-Log"
if(!(test-path $module)){
    write-host "$module not found" -ForegroundColor Red
    exit
}
Import-Module $module

$logLocation = "C:\Example\Log.log"

write-log "This is an example Info" -logLocation $logLocation
write-log "This is an example Error" -severity "Error" -logLocation $logLocation
write-log "This is an example Warning" -severity "Warning" -logLocation $logLocation

Remove-Module Write-Log
```
Below is an example of having seperate logs for Info, Error and Warning enteries.
```ps1
$module = "$psscriptroot\Module\Write-Log"
if(!(test-path $module)){
    write-host "$module not found" -ForegroundColor Red
    exit
}
Import-Module $module

$InfoLog = "C:\Example\Log.log"
$ErrorLog = "C:\Example\Errors.log"
$WarningLog = "C:\Example\Warning.log"

write-log "This is an example Info" -logLocation $InfoLog
write-log "This is an example Error" -severity "Error" -logLocation $ErrorLog
write-log "This is an example Warning" -severity "Warning" -logLocation $WarningLog

Remove-Module Write-Log
```
<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Othneildrew's Best-README-Template](https://github.com/othneildrew/Best-README-Template)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/captainqwerty/Write-Log.svg?style=for-the-badge
[contributors-url]: https://github.com/captainqwerty/Write-Log/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/captainqwerty/Write-Log.svg?style=for-the-badge
[forks-url]: https://github.com/captainqwerty/Write-Log/network/members
[stars-shield]: https://img.shields.io/github/stars/captainqwerty/Write-Log.svg?style=for-the-badge
[stars-url]: https://github.com/captainqwerty/Write-Log/stargazers
[issues-shield]: https://img.shields.io/github/issues/captainqwerty/Write-Log.svg?style=for-the-badge
[issues-url]: https://github.com/captainqwerty/Write-Log/issues
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/antonybragg/