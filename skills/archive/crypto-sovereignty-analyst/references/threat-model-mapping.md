# Threat Model → Protocol Mapping

Detailed assessment of how institutional failure modes map to crypto solutions.

## Account Freezing/Seizure

**Historical Pattern:** Bank accounts frozen by government order, often with no due process (Japanese internment, Cyprus bail-in, Russian sanctions)

| Solution | Protocols | Maturity | Limitations |
|----------|-----------|----------|-------------|
| Self-custody | Hardware wallets (Ledger, Trezor, Coldcard, Foundation), software wallets (Sparrow, Electrum, Rabby) | High | Key management complexity, physical security, inheritance |
| Multisig | Gnosis Safe, Unchained, Casa, native Bitcoin multisig | High | Coordination overhead, key distribution trust |
| Social recovery | Safe{Wallet} modules, Argent (deprecated model) | Medium | Guardian selection trust, recovery attack vectors |
| Time-locked recovery | Bitcoin timelocks, Safe modules | Medium | Inflexibility during emergencies |

**Gap:** Self-custody shifts risk from institutional seizure to operational security. $5 wrench attacks, SIM swaps, phishing remain vectors. No free lunch.

**User Actions:**
- Establish hardware wallet with secure seed backup before you need it
- Geographic distribution of seed backup locations
- Consider multisig for significant holdings (2-of-3 minimum)
- Test recovery procedures annually

---

## Capital Controls

**Historical Pattern:** Restrictions on moving money across borders, limits on withdrawals, forced repatriation (Argentina corralito, Venezuela, Turkey liraization)

| Solution | Protocols | Maturity | Limitations |
|----------|-----------|----------|-------------|
| DEXs | Uniswap, Curve, Raydium, Orca, Jupiter, dYdX, Hyperliquid | High | Liquidity for large amounts, slippage, MEV |
| P2P trading | Bisq, Robosats, HodlHodl, Peach | Medium | Liquidity constraints, counterparty risk, slower |
| Privacy layers | Monero, Zcash shielded, Railgun, Aztec (when live) | Medium-Low | Regulatory pressure, exchange delistings, liquidity |
| Cross-border stablecoins | USDC, USDT, DAI, LUSD | High | Issuer risk, blacklist capability (USDC/USDT) |
| Bitcoin Lightning | Phoenix, Mutiny, Zeus, LND | Medium | Channel liquidity, LSP centralization |

**Gap:** Fiat on/off ramps remain centralized chokepoints. Even with perfect on-chain sovereignty, entering/exiting requires touching regulated entities in most jurisdictions.

**User Actions:**
- Establish multiple CEX accounts in different jurisdictions while possible
- Build P2P trading relationships before you need them
- Maintain positions in non-blacklistable assets (BTC, ETH, XMR)
- Understand which stablecoins have which jurisdictional exposures

---

## Currency Debasement

**Historical Pattern:** Inflation, devaluation, redenomination destroying purchasing power (Venezuela removing zeros, Turkey lira collapse, Argentina peso)

| Solution | Protocols | Maturity | Limitations |
|----------|-----------|----------|-------------|
| Bitcoin | BTC | High | Volatility, not stable unit of account |
| Stablecoins | USDC, USDT, DAI, FRAX, LUSD, sDAI | High | Counterparty risk, depeg events, regulatory capture |
| RWAs | Tokenized treasuries (Ondo, Backed, Matrixdock), gold (PAXG, tGOLD) | Medium | Custodian trust, redemption risk |
| Yield-bearing stables | sDAI, sUSDe, various LPs | Medium | Smart contract risk, yield source sustainability |

**Gap:** True "hard money" (BTC) is volatile. Stable purchasing power requires trusting some counterparty. Pick your poison.

**User Actions:**
- Core holdings in BTC for long-term purchasing power preservation
- Operating capital in diversified stablecoins (not 100% in any single issuer)
- Understand the specific risks of each stablecoin (USDC = Circle + US banking, USDT = Tether + offshore, DAI = over-collateralized + governance)

---

## Forced Asset Conversion

**Historical Pattern:** Government forcing conversion at unfavorable rates (Argentina pesification, Cyprus deposit haircut applied in euros)

| Solution | Protocols | Maturity | Limitations |
|----------|-----------|----------|-------------|
| Non-custodial holdings | All self-custody solutions | High | Can't force conversion of keys you control |
| Censorship-resistant chains | Bitcoin, Ethereum (post-Merge censorship metrics matter) | High | Base layer censorship resistance ≠ application layer |
| Governance-minimized protocols | Liquity, RAI (deprecated), immutable contracts | Medium-Low | Less flexibility, harder to upgrade |

**Gap:** On-chain assets can't be forcibly converted, but your ability to use them depends on frontend access, RPC access, and eventually legal consequences of non-compliance.

**User Actions:**
- Run your own node (Bitcoin Core, Geth/Reth) for censorship-resistant chain access
- Bookmark direct contract interactions, know how to use Etherscan/block explorers for transactions
- Understand which protocols have admin keys vs. immutable deployment

---

## Geographic Seizure

**Historical Pattern:** Physical confiscation of assets based on location (Nazi property seizure, Japanese internment asset loss)

| Solution | Protocols | Maturity | Limitations |
|----------|-----------|----------|-------------|
| Seed phrase memorization | BIP39 | High | Human memory limits, coercion |
| Distributed custody | Multisig with keys in multiple jurisdictions | High | Coordination complexity |
| Plausible deniability | Passphrase wallets, decoy wallets | Medium | Complexity, coercion still possible |
| Mental steel | 12/24 word memorization + geographic movement | Medium | Stress-tested only by extreme cases |

**Gap:** Crypto enables "wealth in your head" but doesn't protect against physical coercion, legal consequences, or family/social pressure.

**User Actions:**
- At minimum, memorize your seed phrase (even if you also have physical backups)
- Consider passphrase (25th word) for plausible deniability setup
- Distribute signing capability if using multisig across jurisdictions
- Know your legal exposure in your jurisdiction for non-disclosure

---

## Surveillance/Tracking

**Historical Pattern:** Transaction monitoring enabling targeting (modern chain analysis, historical banking surveillance)

| Solution | Protocols | Maturity | Limitations |
|----------|-----------|----------|-------------|
| Privacy coins | Monero (ring sigs + stealth addresses + RingCT), Zcash shielded | Medium | Exchange delistings, liquidity constraints |
| Privacy layers | Railgun, Aztec (pending), Tornado Cash (sanctioned) | Low-Medium | Regulatory pressure, frontend access |
| CoinJoin | Wasabi, JoinMarket, Whirlpool (deprecated) | Medium | Taint analysis improving, coordinator risks |
| Lightning | Payment channels | Medium | Channel opens/closes visible, LSP privacy varies |
| Coin control | Careful UTXO management | High (technique) | User error, complexity |

**Gap:** On-chain privacy is in tension with regulatory compliance. Best privacy tools face constant pressure. Network-level privacy (Tor, VPN) is necessary complement.

**User Actions:**
- Use Tor/VPN for all crypto activity
- Maintain separation between KYC'd and non-KYC'd holdings
- Practice coin control (don't merge outputs from different sources)
- Understand timing analysis and avoid patterns
- Consider Monero for privacy-critical transactions

---

## Institutional Capture

**Historical Pattern:** Supposedly neutral institutions becoming tools of political power (central banks, courts, regulatory agencies)

| Solution | Protocols | Maturity | Limitations |
|----------|-----------|----------|-------------|
| Credibly neutral protocols | Bitcoin, immutable DeFi | Varies | Governance = capture vector |
| Governance minimization | Liquity (no governance), Reflexer RAI approach | Low | Hard to compete with governed protocols |
| Decentralized governance | Token voting, optimistic governance | Medium | Plutocracy, voter apathy, governance attacks |
| Protocol forks | Exit to new chain/protocol | High (as option) | Network effects, liquidity fragmentation |

**Gap:** Most DeFi has governance. Governance can be captured. The protocols that can't be captured often can't adapt. This is a fundamental tension.

**User Actions:**
- Prefer governance-minimized protocols for critical functions
- Understand the governance structure of protocols you use
- Monitor governance proposals for concerning changes
- Have exit plans (which alternatives exist?)

---

## Legal/Regulatory Pressure

**Historical Pattern:** Laws changed to criminalize previously legal activity (Nazi laws, emergency decrees, retroactive regulations)

| Solution | Protocols | Maturity | Limitations |
|----------|-----------|----------|-------------|
| Censorship-resistant access | Direct RPC, own node, alternative frontends | High | UX friction |
| Jurisdictional arbitrage | Multi-jurisdiction presence | Medium | Complexity, cost, not accessible to all |
| Legal structures | Trusts, foundations, corporate entities | Varies | Requires professional advice, can be unwound |
| Privacy preservation | Limits enforcement ability | Medium | Legal consequences if discovered |

**Gap:** Crypto provides technical censorship resistance but not legal immunity. You can transact, but you bear the legal consequences in your jurisdiction.

**User Actions:**
- Understand your jurisdiction's current and likely future regulatory posture
- Maintain ability to access protocols without centralized frontends
- Consider legal structures for significant holdings
- Don't assume "code is law" protects you from actual law
