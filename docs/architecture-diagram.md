# Diagramme d'Architecture - RG-Pharmasy

Ce diagramme illustre l'infrastructure RG-Pharmasy avec les serveurs Windows, VMs clientes et les composants réseau Azure.

## Diagramme Mermaid

```mermaid
flowchart LR
 subgraph OnPrem["🖥️ Postes Clients Windows 11"]
  style OnPrem fill:#0d9488,stroke:#14b8a6,stroke-width:2px,color:#fff
  PC01["💻 PC-01\nWindows 11\nClient Terminal"]
  PC02["💻 PC-02\nWindows 11\nClient Terminal"]
 end

 subgraph Azure["☁️ RG-Pharmasy Azure"]
  style Azure fill:#1e3a8a,stroke:#3b82f6,stroke-width:3px,color:#fff

  subgraph ServerRoom["🖥️ Serveurs Windows"]
   style ServerRoom fill:#991b1b,stroke:#dc2626,stroke-width:2px,color:#fff
   DC01["🖳️ DC01\nWindows Server 2022\nAD DS / DNS / DHCP"]
   ADM1["🖳️ SEA-ADM1\nWindows Server 2022\nAdmin / Outils"]
   VM01["🖪️ VM-AZ104-01\nWindows 11\nVM Client"]
  end

  subgraph NetworkLayer["🔗 Couche Réseau & Sécurité"]
   style NetworkLayer fill:#7e22ce,stroke:#a855f7,stroke-width:2px,color:#fff
   VNet["🗀️ VNet1\nRéseau Virtuel"]
   NSG["🛡️ NSGs\nSécurité Réseau"]
   BAST["🏢 VNet1-bastion\nAzure Bastion"]
   PIP["🌍 IP Publiques\nDC01-ip / PublicIP"]
  end

  subgraph StorageLayer["💾 Stockage"]
   style StorageLayer fill:#166534,stroke:#22c55e,stroke-width:2px,color:#fff
   DISK1["📀 DC01_OsDisk"]
   DISK2["📀 SEA-ADM1_OsDisk"]
   DISK3["📀 VM-AZ104-01_OsDisk"]
   SSH["🔑 adminazure2\nClé SSH"]
  end

  subgraph MonitorLayer["📊 Supervision"]
   style MonitorLayer fill:#b45309,stroke:#f59e0b,stroke-width:2px,color:#fff
   ALRT["🚨 actiongroup-az104-cpu\nAlertes CPU"]
  end
 end

 %% Connexions
 PC01 -->|Requêtes DNS / DHCP| DC01
 PC02 -->|Requêtes DNS / DHCP| DC01
 DC01 -->|AD Authentication| VM01
 DC01 -->|Trust / Replication| ADM1
 DC01 -->|Interface| nic1["🔌 dc01458"]
 ADM1 -->|Interface| nic2["🔌 sea-adm1623"]
 VM01 -->|Interface| nic3["🔌 vm-az104-0120"]
 DC01 <-->|VNet Peering| VNet
 VNet --> NSG
 VNet --> BAST
 VNet --> PIP
 BAST -->|Accès Bastion| DC01
 BAST -->|Accès Bastion| ADM1
 BAST -->|Accès Bastion| VM01
 ADM1 -.->|Disque OS| DISK2
 DC01 -.->|Disque OS| DISK1
 VM01 -.->|Disque OS| DISK3
 ALRT -.->|Supervise| DC01
 ALRT -.->|Supervise| VM01

 style DC01 fill:#ef4444,stroke:#b91c1c,stroke-width:2px,color:#fff
 style ADM1 fill:#ef4444,stroke:#b91c1c,stroke-width:2px,color:#fff
 style VM01 fill:#3b82f6,stroke:#1d4ed8,stroke-width:2px,color:#fff
 style PC01 fill:#22c55e,stroke:#15803d,stroke-width:2px,color:#fff
 style PC02 fill:#22c55e,stroke:#15803d,stroke-width:2px,color:#fff
 style VNet fill:#06b6d4,stroke:#0891b2,stroke-width:2px,color:#fff
 style BAST fill:#dc2626,stroke:#7f1d1d,stroke-width:2px,color:#fff
 style nic1 fill:#475569,stroke:#334155,stroke-width:1px,color:#fff
 style nic2 fill:#475569,stroke:#334155,stroke-width:1px,color:#fff
 style nic3 fill:#475569,stroke:#334155,stroke-width:1px,color:#fff
```

## Légende des Couleurs

| Couleur | Composant | Description |
|---------|-----------|-------------|
| 🟢 Rouge | Serveurs Windows | DC01, SEA-ADM1 (AD DS, Admin) |
| 🔵 Bleu | VMs Clients | VM-AZ104-01 (Windows 11) |
| 🟢 Vert | Postes Clients | PC-01, PC-02 (Windows 11) |
| 🟣 Violet | Réseau & Sécurité | VNet, NSGs, Bastion, IP Publiques |
| 🟢 Vert foncé | Stockage | Disques OS, Clé SSH |
| 🟠 Orange | Supervision | Groupe d'alertes CPU |
