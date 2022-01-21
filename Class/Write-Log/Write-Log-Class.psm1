class WriteLog {
    [string]$LogLocation = "$PSScriptRoot\log.log"
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

    WriteLog([string]$LogLocation) {
        $this.LogLocation = $LogLocation
    }

    hidden AddEntry([string]$Message,[string]$severity) {
        if(!(test-path $this.LogLocation)) {
            new-item $this.LogLocation -Force
        }

        if($null -eq $this.DateFormat) {
            $this.DateFormat = "dd/MM/yyyy HH:mm:ss"
        }
        
        $timeStamp = Get-date -Format $this.DateFormat
        $Output = "$timeStamp - [$($severity)] $($Message)"
        Add-Content $this.logLocation -value $Output
        Write-Host "$Output"
    }
}