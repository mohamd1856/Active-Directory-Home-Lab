# Active Directory Home Lab 
> ### *with added PowerShell Script to eliminate Administrative workload.*
**Deployed an Active Directory Home Lab, and instantly _created 900+ users using a PowerShell Script_, to simulate an enterprise network. This includes :**
 - **Domain Controller Service:** To manage the shared systems and resources.
 - **DHCP Service:** To distribute IP address and other network information.
 - **RAS/NAT Service:** To enable Windows server to act as a router and forward the traffic (to internet).
 - **PowerShell Script:** To instantly create 1000+ domain users.
 - **Windows11 VM:** To test the Domain Controller (as a client).

## Snippets
https://user-images.githubusercontent.com/117259069/200873701-12fa2d6f-a1fd-469e-9dbc-b481a81f4406.mp4

https://user-images.githubusercontent.com/117259069/200873671-5327a7df-90a4-4b64-b3e4-33db24b51508.mp4
> The Error displayed is about the redundancy of usernames present in the Users_List.txt

### Script execution:
```
Open Powershell as Administrator
Change directory to ActiveDir-Script
PS C:\Users\username\Desktop\ActiveDir-Script> .\Auto_Create_Users.ps1
```

## Setup Breakdown
1. **OS Installation :**
    1. Win Server 2019 VM 
    2. Client - Windows VM 
    
    
2. **Install Server 2019 Virtual Machine :**
    1. Include 2 Virtual NICs [ External and Internal network ] 
      A. To allow clients to access the internet through DC.
    2. Install VMware Tools —from VM Tools drive.
    3. Configure Server Network Connections and WinServer OS Name.
        1. Manually assign static IP to internal [ Host Only ] Network.
        
    
3. **Setup Active Directory Domain Controller :**
    1. Install AD Domain Services. 
        1. Add roles and feature → + AD Domain 
        2. Promote DC —Post-Deploy the Server config.
    2. Create an Admin account dedicated to the Domain.
        1. Admin User and Features application.
        
    
4. **Create RAS/ NAT for internal networking :**
    1. Add roles and feature → + Remote access → + routing.
    2. Configure and enable routing and remote access from tools tab → + [config] NAT→ + WAN network interface.
    
    
5. **Install DHCP on DC :**
    1. Add roles and feature → + DHCP server → + Host Only Static IP.
    2. Authorize Domain DHCP.
    3. Add a scope of IP addresses to assingn to clients.
    
    
6. **Add Users to AD Domain :**
    1. [MANUALLY] -- Admin User and Features application → + New “Organizational Unit” → + New “User”
    2. [AUTO] PowerShell Create-Users Script.
    
    
7. **Boot Client Windows Machine :**
    1. Config it to be the member of the Domain.
    2. Login as a Domain User.
    
    
8. **Check the AD DC ‘leases; and ‘computers’ connected** 
    1. **Leases** - DHCP configuration → Scope → Leases
    2. **Computers** - User and Features application → Computers
    




