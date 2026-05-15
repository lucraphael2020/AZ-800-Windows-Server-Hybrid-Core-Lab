# Implementation Notes

## Overview

This lab simulates a hybrid Windows Server environment designed to demonstrate practical administration skills related to identity, networking, infrastructure services, client management, centralized administration, and virtualization. The environment includes a primary forest, a secondary forest with bidirectional trust, Windows 11 client machines, IP address management, Windows Server administration tools, and clustered infrastructure components [cite:195][cite:276].

## Lab Objectives

The main objectives of this lab are:

- Build and manage a primary Active Directory environment
- Implement DNS and DHCP services
- Create a second forest and configure bidirectional trust
- Validate domain services with Windows 11 client machines
- Centralize administration using Windows Admin Center
- Explore hybrid capabilities with Entra Connect and Azure Arc
- Implement deployment and infrastructure services such as WDS, MDT, and ADK
- Document a clustered infrastructure with QB-SRV1 and SRV-VSPHERE

## Environment Summary

| Component | Role |
|---------|------|
| DC01 | Primary domain controller, DNS, DHCP |
| DC02 | Secondary forest for bidirectional trust |
| PC01-PC04 | Windows 11 client machines |
| SRV-IPAM | IP address management |
| NT-Server01 | Central administration server |
| QB-SRV1 | Cluster-related server |
| SRV-VSPHERE | Virtualization / cluster counterpart |

## Detailed Roles

### DC01

DC01 is the main domain controller in the primary forest. It hosts Active Directory Domain Services, DNS, and DHCP, making it the core identity and network services server for the lab [cite:195].

### DC02

DC02 represents a second forest created to simulate and validate a bidirectional forest trust. This allows testing cross-forest identity and trust scenarios in a more advanced administrative setup.

### PC01 to PC04

These machines are Windows 11 client endpoints used for domain join validation, policy testing, authentication testing, and user experience validation in the lab.

### SRV-IPAM

SRV-IPAM is dedicated to IP address management and supports visibility and control over the addressing plan of the lab.

### NT-Server01

NT-Server01 is the central administration server of the environment. It hosts Windows Admin Center, Entra Connect, Azure Arc, WDS, MDT, ADK, DHCP2, and file services. This server supports server administration, identity synchronization, hybrid management, deployment workflows, and operational services [cite:269][cite:276].

### QB-SRV1 and SRV-VSPHERE

QB-SRV1 and SRV-VSPHERE are used to represent cluster and virtualization-related components in the lab. This part of the environment extends the infrastructure beyond basic domain services and adds an advanced administration dimension.

## Implementation Steps

### 1. Core domain services
- Deployed DC01
- Configured Active Directory Domain Services
- Configured DNS
- Configured DHCP
- Validated internal naming and addressing

### 2. Secondary forest
- Deployed DC02
- Created a separate forest
- Configured bidirectional trust between forests
- Validated trust functionality

### 3. Client integration
- Prepared Windows 11 clients
- Joined clients to the domain as needed
- Tested user authentication and policy application

### 4. IP management
- Configured SRV-IPAM
- Reviewed address planning and allocation visibility

### 5. Administration and hybrid services
- Configured NT-Server01
- Installed Windows Admin Center
- Installed Entra Connect
- Installed Azure Arc components
- Added WDS, MDT, ADK, DHCP2, and file services

### 6. Cluster / virtualization
- Configured QB-SRV1
- Integrated cluster-related functionality with SRV-VSPHERE
- Documented cluster purpose and connectivity

## Validation Performed

- Domain controller deployed and functional
- DNS resolution operational
- DHCP services operational
- Secondary forest created
- Bidirectional trust validated
- Windows 11 clients available for testing
- Administrative services centralized on NT-Server01
- Cluster/virtualization components documented

## Key Technical Areas Demonstrated

- Active Directory administration
- DNS and DHCP services
- Cross-forest trust
- Client integration
- IP address management
- Hybrid administration
- Windows deployment tooling
- Centralized infrastructure management
- Virtualization / cluster concepts

## Issues Encountered

Document here any technical issues found during implementation. Examples:

- Forest trust validation problems
- DNS forwarding or name resolution issues
- DHCP conflicts between servers
- Windows Admin Center connectivity issues
- Entra Connect synchronization configuration challenges
- Cluster validation or communication issues

## Lessons Learned

This lab shows that hybrid administration is not limited to a single domain controller or a basic test domain. It also involves trust relationships, client validation, centralized management, deployment tooling, and infrastructure services working together in a coherent design [cite:269][cite:276].

The environment also demonstrates the importance of documentation. Without structured notes and diagrams, a complex lab quickly becomes hard to explain to recruiters, hiring managers, or technical interviewers [cite:271][cite:274].

## Next Improvements

- Add a more detailed network segmentation diagram
- Document IP ranges and VLAN logic
- Add backup and recovery procedures
- Add monitoring and logging documentation

---

## Procédure de nettoyage (Cleanup Procedure)

### Introduction
Cette section décrit la procédure systématique de nettoyage du groupe de ressources **RG-Pharmasy** dans Azure. Elle vise à supprimer toutes les ressources créées durant le lab, dans le bon ordre, afin d'éviter les dépendances non résolues et les erreurs.

> **Important :** La suppression des ressources doit être effectuée dans l'ordre suivant pour éviter les blocages liés aux dépendances. Commencez par les éléments les plus haut niveau (VMs, disques) avant de supprimer les éléments réseau et de gestion.

### Étape 1 — Arrêter et désallouer les machines virtuelles

Avant toute suppression, il est recommandé d'arrêter et de désallouer les VMs pour libérer les ressources de calcul facturées.

1. Dans le **Portail Azure**, naviguez vers **RG-Pharmasy**.
2. Sélectionnez chaque machine virtuelle (DC01, SEA-ADM1, VM-AZ104-01).
3. Cliquez sur **Arrêter** (Stop) puis attendez que le statut passe à **Arrêté (désalloué)**.

### Étape 2 — Supprimer les Disques OS et Données

Les disques ne sont supprimés automatiquement que si la VM est supprimée avec l'option "Supprimer les disques associés". Sinon, ils doivent être supprimés manuellement.

| Nom du disque | Taille estimée |
|---------------|----------------|
| DC01_OsDisk | ~127 Go |
| SEA-ADM1_OsDisk | ~127 Go |
| VM-AZ104-01_OsDisk | ~127 Go |

1. Naviguez vers **Disques** dans RG-Pharmasy.
2. Sélectionnez chaque disque OS et cliquez sur **Supprimer**.

### Étape 3 — Supprimer les Machines Virtuelles

Après la désallocation et la suppression des disques :

1. Sélectionnez chaque VM (DC01, SEA-ADM1, VM-AZ104-01).
2. Cliquez sur **Supprimer**.
3. Confirmez la suppression.

### Étape 4 — Supprimer les組件 réseau

| Ressource | Description |
|-----------|-------------|
| VNet1 | Réseau virtuel principal |
| NSGs | Groupes de sécurité réseau |
| VNet1-bastion | Hôte Azure Bastion |
| IPs Publiques | DC01-ip, PublicIP |
| Interfaces réseau | dc01458, sea-adm1623, vm-az104-0120 |

1. Supprimez d'abord les **IPs Publiques**.
2. Supprimez les **Interfaces réseau**.
3. Supprimez l'hôte **Bastion**.
4. Supprimez les **NSGs**.
5. Supprimez le **VNet** en dernier (il dépend des autres ressources réseau).

> **Note :** Le VNet ne peut pas être supprimé tant que des sous-réseaux, interfaces ou passerelles y sont encore attachés.

### Étape 5 — Supprimer les ressources de stockage et supervision

| Ressource | Description |
|-----------|-------------|
| adminazure2 | Clé SSH stockée |
| actiongroup-az104-cpu | Groupe d'alertes CPU |

1. Naviguez vers **Clés SSH** et supprimez la clé.
2. Naviguez vers **Groupes d'alertes** (sous Azure Monitor) et supprimez le groupe d'alerte.

### Étape 6 — Supprimer le Groupe de Ressources complet

En dernier recours, si des ressources subsistent, vous pouvez supprimer l'ensemble du groupe de ressources :

1. Naviguez vers **Groupes de ressources**.
2. Sélectionnez **RG-Pharmasy**.
3. Cliquez sur **Supprimer le groupe de ressources**.
4. Tapez le nom **RG-Pharmasy** pour confirmer.
5. Cliquez sur **Supprimer**.

### Résumé de l'ordre de suppression

```
1. Arrêter les VMs
2. Supprimer les Disques
3. Supprimer les VMs
4. Supprimer les IPs Publiques
5. Supprimer les Interfaces réseau
6. Supprimer Bastion
7. Supprimer les NSGs
8. Supprimer le VNet
9. Supprimer les ressources Stockage/Supervision
10. Supprimer le Groupe de Ressources (optionnel)
```

### Vérification post-nettoyage

Après la procédure de nettoyage, vérifiez que :
- Le groupe **RG-Pharmasy** n'apparaît plus dans votre abonnement.
- Aucun coût résiduel n'est associé aux ressources supprimées.
- Les quotas Azure sont bien libérés.
- Add PowerShell automation scripts
- Extend Azure integration scenarios
