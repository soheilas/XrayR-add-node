#!/bin/bash

# Display "By Soheil STAR" with letters appearing one by one from the right side
echo -n "By Soheil STAR"
sleep 5

# Read the node number from the user
read -p "Please enter the node number: " NODE_ID

# Create a new configuration file with the entered node number
cat > config.yaml <<EOF
Log:
    Level: warning
    AccessPath: /etc/XrayR/access.log
    ErrorPath: /etc/XrayR/error.log
    Handshake: 6
    ConnIdle: 300
    UplinkOnly: 4
    DownlinkOnly: 5
    BufferSize: 64

Nodes:
    - PanelType: "NewV2board"
      ApiConfig:
          ApiHost: "https://cp.folfoping.cloud"
          ApiKey: "ddc22674-f2ce-4e68-b85b-e307c8f6b499"
          NodeID: $NODE_ID
          NodeType: V2ray
          Timeout: 30
          EnableVless: false
          SpeedLimit: 0
          DeviceLimit: 0
      ControllerConfig:
          ListenIP: 0.0.0.0
          SendIP: 0.0.0.0
          UpdatePeriodic: 60
          EnableDNS: false
          DNSType: AsIs
EOF

echo "New configuration file created successfully."

# Restart xrayr and display the output
echo "Restarting xrayr..."
xrayr restart
