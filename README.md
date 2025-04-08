# Decentralized Commercial Building Certification System

A blockchain-based system for certifying commercial buildings using Clarity smart contracts. This system enables transparent, verifiable, and tamper-proof certification of commercial buildings based on their energy performance and sustainability metrics.

## System Architecture

The system consists of four main smart contracts:

1. **Property Registration Contract**: Records details of commercial structures
2. **Energy Performance Contract**: Tracks efficiency metrics and consumption
3. **Sustainability Verification Contract**: Validates green building practices
4. **Certification Contract**: Issues verifiable building standard credentials

## Contracts Overview

### Property Registration Contract
- Registers commercial buildings with details like location, size, type, and construction year
- Manages property ownership and updates
- Provides verification functions for property ownership

### Energy Performance Contract
- Records energy efficiency ratings and consumption metrics
- Tracks carbon footprint data
- Implements an authorization system for energy auditors

### Sustainability Verification Contract
- Records water efficiency, waste management, renewable energy usage
- Tracks sustainable materials usage and green space metrics
- Calculates overall sustainability scores

### Certification Contract
- Issues building certifications at different levels (Basic, Silver, Gold, Platinum)
- Determines certification level based on energy and sustainability scores
- Manages certification validity and expiration

## Certification Levels

Buildings can achieve the following certification levels:

- **Platinum**: Combined score ≥ 90
- **Gold**: Combined score ≥ 75
- **Silver**: Combined score ≥ 60
- **Basic**: Combined score < 60

The combined score is calculated as the average of energy and sustainability scores.

## Authorization System

Each contract implements an authorization system to ensure only qualified parties can perform specific actions:

- **Energy Auditors**: Authorized to record energy performance metrics
- **Sustainability Verifiers**: Authorized to validate green building practices
- **Certifiers**: Authorized to issue building certifications

## Getting Started

### Prerequisites
- A Clarity-compatible blockchain environment
- Basic knowledge of Clarity smart contracts

### Deployment
1. Deploy the Property Registration contract
2. Deploy the Energy Performance contract
3. Deploy the Sustainability Verification contract
4. Deploy the Certification contract
5. Set contract references in the Certification contract

### Usage Flow
1. Register a property using the Property Registration contract
2. Record energy metrics using the Energy Performance contract
3. Record sustainability metrics using the Sustainability Verification contract
4. Issue a certification using the Certification contract

## Testing

Run the tests using Vitest:

\`\`\`bash
npm test
\`\`\`

## License

This project is licensed under the MIT License - see the LICENSE file for details.
