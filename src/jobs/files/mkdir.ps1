function mkdir (){

<# 
.FORWARDHELPTARGETNAME New-Item
.FORWARDHELPCATEGORY Cmdlet 
#>

[CmdletBinding(DefaultParameterSetName='pathSet',
    SupportsShouldProcess=$true,
    SupportsTransactions=$true,
    ConfirmImpact='Medium')]
    [OutputType([System.IO.DirectoryInfo])]
param(
    [Parameter(ParameterSetName='nameSet', Position=0, ValueFromPipelineByPropertyName=$true)]
    [Parameter(ParameterSetName='pathSet', Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
    [System.String[]]
    ${Path},

    [Parameter(ParameterSetName='nameSet', Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [AllowNull()]
    [AllowEmptyString()]
    [System.String]
    ${Name},

    [Parameter(ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
    [System.Object]
    ${Value},

    [Switch]
    ${Force},

    [Parameter(ValueFromPipelineByPropertyName=$true)]
    [System.Management.Automation.PSCredential]
    ${Credential}
)

begin {

    try {
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand('New-Item', [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd -Type Directory @PSBoundParameters }
        $steppablePipeline = $scriptCmd.GetSteppablePipeline()
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }

}

process {

    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }

}

end {

    try {
        $steppablePipeline.End()
    } catch {
        throw
    }

}


}
