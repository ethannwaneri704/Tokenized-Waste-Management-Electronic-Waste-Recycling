# Tokenized Waste Management - Electronic Waste Recycling

A comprehensive blockchain-based system for managing electronic waste recycling using Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a complete solution for tracking electronic devices through the recycling process, from initial registration to final material recovery and data destruction certification. It ensures transparency, accountability, and compliance in the e-waste recycling industry.

## Features

### 🏭 Facility Verification
- Register recycling facilities with detailed information
- Verify facilities through authorized processes
- Track facility status and compliance
- Manage facility capacity and capabilities

### 📱 Device Tracking
- Register electronic devices for recycling
- Track device status throughout the recycling process
- Maintain complete audit trail of device handling
- Support multiple device types (smartphones, laptops, tablets, etc.)

### ♻️ Material Recovery
- Record materials recovered from electronic devices
- Track quantities of precious metals, rare earth elements, and other materials
- Generate recovery reports and analytics
- Ensure proper material accounting

### 🔒 Data Destruction
- Ensure secure data destruction from electronic devices
- Support multiple destruction methods (physical, degaussing, cryptographic)
- Generate destruction certificates
- Verify destruction completion

### 📜 Certification Management
- Issue and manage recycling certifications
- Support industry standards (ISO14001, R2, e-Stewards, WEEE)
- Track certification validity and expiration
- Enable certification revocation when necessary

## Smart Contracts

### 1. Facility Verification Contract (\`facility-verification.clar\`)
Manages the registration and verification of recycling facilities.

**Key Functions:**
- \`register-facility\`: Register a new recycling facility
- \`verify-facility\`: Verify a facility (admin only)
- \`get-facility\`: Retrieve facility information
- \`is-facility-verified\`: Check facility verification status

### 2. Device Tracking Contract (\`device-tracking.clar\`)
Tracks electronic devices through the recycling process.

**Key Functions:**
- \`register-device\`: Register a device for recycling
- \`update-device-status\`: Update device status in the recycling process
- \`get-device\`: Retrieve device information
- \`get-device-history\`: Get device status history

### 3. Material Recovery Contract (\`material-recovery.clar\`)
Manages the recovery of materials from electronic devices.

**Key Functions:**
- \`record-recovery\`: Record materials recovered from a device
- \`get-recovery\`: Retrieve recovery record
- \`get-total-material-recovered\`: Calculate total materials recovered

### 4. Data Destruction Contract (\`data-destruction.clar\`)
Ensures secure data destruction from electronic devices.

**Key Functions:**
- \`record-destruction\`: Record data destruction process
- \`verify-destruction\`: Verify destruction completion
- \`get-destruction\`: Retrieve destruction record
- \`is-data-destroyed\`: Check if device data is destroyed

### 5. Certification Management Contract (\`certification-management.clar\`)
Manages recycling certifications and compliance.

**Key Functions:**
- \`issue-certification\`: Issue a new certification
- \`revoke-certification\`: Revoke an existing certification
- \`get-certification\`: Retrieve certification information
- \`has-valid-certification\`: Check facility certification status

## Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd tokenized-waste-management
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

## Usage

### Registering a Facility

\`\`\`clarity
(contract-call? .facility-verification register-facility
"EcoRecycle Inc"
"123 Green Street, EcoCity"
"LIC-2024-001"
u5000)
\`\`\`

### Registering a Device

\`\`\`clarity
(contract-call? .device-tracking register-device
"DEVICE001"
u0  ;; smartphone
"Apple"
"iPhone 12"
"ABC123456789")
\`\`\`

### Recording Material Recovery

\`\`\`clarity
(contract-call? .material-recovery record-recovery
"DEVICE001"
u1  ;; facility-id
(list
{ material-type: u0, quantity: u5, unit: "grams" }   ;; gold
{ material-type: u2, quantity: u100, unit: "grams" } ;; copper
))
\`\`\`

## Testing

The project includes comprehensive tests using Vitest. Tests cover all major contract functions and edge cases.

Run tests with:
\`\`\`bash
npm test
\`\`\`

## Contract Constants

### Device Types
- \`TYPE_SMARTPHONE\` (0)
- \`TYPE_LAPTOP\` (1)
- \`TYPE_TABLET\` (2)
- \`TYPE_DESKTOP\` (3)
- \`TYPE_OTHER\` (4)

### Material Types
- \`MATERIAL_GOLD\` (0)
- \`MATERIAL_SILVER\` (1)
- \`MATERIAL_COPPER\` (2)
- \`MATERIAL_ALUMINUM\` (3)
- \`MATERIAL_PLASTIC\` (4)
- \`MATERIAL_RARE_EARTH\` (5)

### Destruction Methods
- \`METHOD_PHYSICAL_DESTRUCTION\` (0)
- \`METHOD_DEGAUSSING\` (1)
- \`METHOD_CRYPTOGRAPHIC_ERASURE\` (2)
- \`METHOD_OVERWRITING\` (3)

### Certification Types
- \`CERT_ISO14001\` (0)
- \`CERT_R2\` (1)
- \`CERT_E_STEWARDS\` (2)
- \`CERT_WEEE\` (3)

## Security Considerations

- All contracts include proper authorization checks
- Facility verification is required for critical operations
- Data destruction records are immutable once created
- Certification management includes issuer verification

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions or support, please open an issue in the repository or contact the development team.

