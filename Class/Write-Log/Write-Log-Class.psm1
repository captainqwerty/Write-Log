class WriteLog {
    [string]$LogLocation = "$PSScriptRoot\log.log"

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

        $timeStamp = Get-date -Format "dd/MM/yyyy HH:mm:ss"
        $Output = "$timeStamp - [$($severity)] $($Message)"
        Add-Content $this.logLocation -value $Output
        Write-Host "$Output"
    }
}