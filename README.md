# AZ-800-Windows-Server-Hybrid-Core-Lab
Hands-on lab project focused on Windows Server hybrid core infrastructure administration, based on AZ-800 domains such as Active Directory, DNS, DHCP, Windows Server management, storage, virtualization, and hybrid administration.

## Objective

The goal of this lab is to demonstrate practical administration of a small Windows Server hybrid environment that simulates a real-world enterprise foundation. This project focuses on identity services, core infrastructure, server administration, and documentation of repeatable administrative tasks [web:192][web:193][web:196].

## Lab Scope

This lab includes:

- 1 Domain Controller
- 1 Member Server
- Active Directory Domain Services (AD DS)
- DNS configuration
- DHCP configuration
- Organizational Units (OUs), users, and groups
- Group Policy Object (GPO) basic configuration
- Shared folder and NTFS permissions
- Basic administrative validation and screenshots

## Architecture

- **Server 1:** Domain Controller  
  Roles: AD DS, DNS, DHCP

- **Server 2:** Member Server  
  Roles: file sharing, domain join validation, admin testing

- **Client/Admin Access:** RDP or console access for configuration and validation

## Project Goals

- Deploy and manage AD DS in a small lab
- Configure name resolution with DNS
- Configure IP address allocation with DHCP
- Join a server to the domain
- Create and manage users, groups, and OUs
- Apply at least one GPO
- Configure file sharing and basic permissions
- Document the environment clearly for recruiters and hiring managers

## Technologies Used

- Windows Server
- Active Directory Domain Services
- DNS
- DHCP
- Group Policy
- NTFS permissions
- Hyper-V, VMware, or local virtualization lab
- Optional: Windows Admin Center / PowerShell

## Lab Steps

### 1. Prepare the environment
- Deploy two Windows Server VMs
- Assign static IP to the domain controller
- Rename servers properly
- Validate connectivity between servers

### 2. Configure Active Directory
- Install AD DS role
- Promote the first server to domain controller
- Create the domain
- Verify domain services health

### 3. Configure DNS and DHCP
- Validate DNS zone creation
- Create DHCP scope
- Configure exclusions/reservations if needed
- Test IP leasing from a joined host

### 4. Join the member server to the domain
- Join Server 2 to the domain
- Restart and validate successful domain authentication
- Confirm DNS resolution and domain reachability

### 5. Create identity structure
- Create OUs
- Create test users
- Create security groups
- Delegate or document group membership logic

### 6. Apply baseline administration
- Create a shared folder
- Configure share and NTFS permissions
- Apply one sample GPO
- Validate access and policy application

## Validation Checklist

- [ ] Domain controller deployed
- [ ] AD DS installed and domain created
- [ ] DNS working correctly
- [ ] DHCP scope configured and tested
- [ ] Member server joined to domain
- [ ] Users, groups, and OUs created
- [ ] GPO applied successfully
- [ ] Shared folder permissions tested
- [ ] Screenshots captured
- [ ] README completed

## Screenshots to Include

Add screenshots in a `/screenshots` folder and reference them here:

- Server Manager roles overview
- AD Users and Computers with OUs/users/groups
- DNS Manager
- DHCP scope
- Domain join confirmation
- GPO Management
- Shared folder permissions
- Command output (`gpresult`, `ipconfig`, `nslookup`, etc.)

## Repository Structure

```text
.
├── README.md
├── screenshots/
├── docs/
│   ├── network-diagram.png
│   └── implementation-notes.md
└── scripts/
    └── optional-powershell/
```

## What I Learned

- How to build and manage a core Windows Server hybrid environment
- How AD DS, DNS, and DHCP work together in daily administration
- How group structure and GPOs support enterprise administration
- How to document a lab as a portfolio-ready project

## Improvements for Next Version

- Add Windows Admin Center
- Add PowerShell automation for user/group creation
- Add backup or recovery testing
- Add Azure hybrid extension in a later version

## Notes

This is a lab and portfolio project built for learning and demonstration purposes. It is designed to reflect practical administrative skills aligned with AZ-800 exam objectives [web:192][web:193].
