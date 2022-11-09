# ----- Edit these Variables for your own Use Case ----- #
$COMMON_PASSWORD   = "Password1"
$USERS_LIST = Get-Content .\Users_List.txt
# ------------------------------------------------------ #

$password = ConvertTo-SecureString $COMMON_PASSWORD -AsPlainText -Force  # Convert into secure string
New-ADOrganizationalUnit -Name New_USERS -ProtectedFromAccidentalDeletion $false  # creates New Organizational Unit named: _USERS

foreach ($CURRENT_USER in $USERS_LIST) {
    $first_name = $CURRENT_USER.Split(" ")[0].ToLower()
    $last_name = $CURRENT_USER.Split(" ")[1].ToLower()
    $username = "$($first_name.Substring(0,1))$($last_name)".ToLower()
    Write-Host "Creating user: $($username)" -BackgroundColor Black -ForegroundColor Cyan
    
    New-AdUser -AccountPassword $password `
               -GivenName $first_name `
               -Surname $last_name `
               -DisplayName $username `
               -Name $username `
               -EmployeeID $username `
               -Path "ou=New_USERS,$(([ADSI]`"").distinguishedName)" `
               -ChangePasswordAtLogon $true `
               -Enabled $true  
               
               # -Path = Add the users to _USERS OU 
               # -Enabled = Activate the created user
}