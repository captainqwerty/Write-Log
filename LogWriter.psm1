class Log {
    hidden [string]$LogLocation
    [string]$DateFormat

    AddError([string]$Message) {
        $this.AddEntry($message,"Error")
    }

    AddWarning([string]$Message) {
        $this.AddEntry($message,"Warning")
    }

    AddInfo([string]$Message) {
        $this.AddEntry($message,"Info")
    }

    CreateLog([string]$LogLocation) {
        $this.LogLocation = $LogLocation
        if(!($this.ValidateLogFile($this.LogLocation))) { throw "Invalid log file extension. Please use .log or .txt" }
    }

    hidden [bool]ValidateLogFile([string]$logFIle) {
        $extension = [System.IO.Path]::GetExtension($logFIle)
        if(($extension -eq ".log") -or ($extension -eq ".txt")) {
            return $true
        } else {
            return $false
        }
    }

    hidden AddEntry([string]$Message,[string]$severity) {
        if(!(test-path $this.LogLocation)) {
            new-item $this.LogLocation -Force
        }

        if($null -eq $this.DateFormat) {
            [DateTime]$Date = Get-Date
            $timeStamp = $date.ToShortDateString() + " " + $date.ToLongTimeString()
        } else {
            $timeStamp = Get-date -Format $this.DateFormat
        }
        
        $Output = "$timeStamp - [$($severity)] $($Message)"
        Add-Content $this.logLocation -value $Output
        Write-Host "$Output"
    }
}

Function New-Log {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $LogLocation
    )

    $Log = [Log]::New()
    $Log.CreateLog($LogLocation)

    return $Log
}

Export-ModuleMember -Function New-Log