Function New-TeamsMessage { 
    [CmdletBinding()]
    Param( 
        [Parameter(Position = 0, Mandatory = $true)][String]$Message, 
        [Parameter(Position = 1, Mandatory = $true)][String]$Title, 
        [Parameter(Position = 2, Mandatory = $true)][String]$URI
    ) 
    Process { 
        $Params = @{ 
            "URI"         = $URI 
            "Method"      = 'POST' 
            "Body"        = [PSCustomObject][Ordered]@{ 
                "@type"    = 'MessageCard' 
                "@context" = 'http://schema.org/extension' 
                "summary"  = $Title 
                "title"    = $Title 
                "text"     = ($Message | Out-String) 
            } 
            "ContentType" = 'application/json' 
        } 
        Invoke-RestMethod @Params | Out-Null 
    } 
}