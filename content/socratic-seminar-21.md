+++
title = "Socratic Seminar 21"
date = 2023-09-19
template = "page.html"
aliases = [
  "2023-09-19-socratic-seminar-21",
  "/2023-09-19-socratic-seminar-21/",
  "/2023/09/19/socratic-seminar-21"
]

[extra]
event_type = "socratic"
meetup = "https://www.meetup.com/triangle-bitdevs/events/296100919/"
+++


We will start with introductions, some basic ground rules, and jump into technical discussions. We will cover aspects of the bitcoin protocol, new research developments, recent news, and software developments.

Please note the meeting location at 4801 Glenwood Ave suite 200 in Raleigh, right above Fifth Third Bank.

# Announcements

- no pictures or recordings
- chatham house rules
- don't be a dick
- Hack Day - unstructured monthly in-person meetup for bitcoin builders
- thank you to our sponsor [Lolli](https://www.lolli.com/)
- introductions

# Bitcoin

#### Package Relay

[Package relay](https://github.com/bitcoin/bitcoin/issues/27463) is a proposed feature to allow bitcoin nodes to evaluate multiple transactions together (a package) for inclusion or rejection from the mempool. This feature is motivated by off-chain protocols such as lightning and [DLCs](https://bitcoinops.org/en/topics/discreet-log-contracts/) with a security model that assumes the ability for a user to get a transaction confirmed using [CPFP](https://bitcoinops.org/en/topics/cpfp/) fee bumping within a specific timeframe. The current mempool design evaluates each transaction individually which makes these protocols inherently vulnerable to [pinning attacks](https://bitcoinops.org/en/topics/transaction-pinning/). The main challenge of development is insuring that the new set of mempool acceptance rules do not open new vectors of DoS attack.

#### V3 Transactions

[Version 3 transaction relay](https://lists.linuxfoundation.org/pipermail/bitcoin-dev/2022-September/020937.html) is a proposal to create an opt-in superset of transaction relay rules that limit all pinning vectors while allowing CPFP fee bumping via package RBF. This proposal builds on package relay to create a new type of transaction that can always be fee bumped even when an adversarial party controls one or more inputs and outputs, i.e. lightning channel force closes.

#### Ephemeral Anchors

[Ephemeral anchors](https://lists.linuxfoundation.org/pipermail/bitcoin-dev/2022-October/021036.html) are yet another proposal that builds on package relay and V3 outputs in order to cover the case of symmetric commitment transactions for protocols such as [LN-symmetry](https://bitcoinops.org/en/topics/eltoo/). An ephemeral output is a 0-sat transaction output that must be spent by another transaction in the same package. Under these rules an ephemeral anchor output cannot be pinned in the mempool and can be fee-bumped by anyone.

# Lightning

#### Securing a $100M Lightning node

In their latest [blog post](https://acinq.co/blog/securing-a-100M-lightning-node) Eclair walks us through the security architecture of the ACINQ node, among the largest and most connected nodes on the network. The article is a well-written and thorough high level examination of the security issues and design space of this fascinating problem.

#### 10101 is building DLCs on Lightning

A new company called [10101](https://10101.finance) (pronounced ten-ten-one) is building DLC capability into lightning. In this [three](https://10101.finance/blog/dlc-to-lightning-part-1/) [part](https://10101.finance/blog/dlc-to-lightning-part-2/) [blog](https://10101.finance/blog/dlc-to-lightning-part-3/) series they explain what DLCs are, how they are enabled on lightning, and how they use virtual channels to accomplish this in practice.

#### How the Voltage LSP Enhances Privacy for Mutiny Wallet Users

In this [blog post](https://blog.mutinywallet.com/enhanced-lightning-privacy-for-mutiny-users/) [Tony Giorgio](https://iris.to/npub1t0nyg64g5vwprva52wlcmt7fkdr07v5dr7s35raq9g0xgc0k4xcsedjgqv) explains how [Mutiny Wallet](https://www.mutinywallet.com/) leverages the [Voltage LSP](https://voltage.cloud/blog/voltage-announcements/introducing-flow-v2/) to enhance the privacy of their wallet users using just-in-time lightning channels to enable a VPN-like architecture for lightning payments.

#### Taproot Assets: Issuing Assets on Bitcoin

The good folks at [Voltage](https://voltage.cloud/) have published this well written and accessible [blog post](https://voltage.cloud/blog/lightning-network-use-cases/taproot-assets-on-bitcoin-and-lightning-network/) discussing [Taproot Assets](https://docs.lightning.engineering/the-lightning-network/taproot-assets)--how they work, how they leverage lightning's network effects, and introduce new liquidity management requirements and business use cases for node runners.

# Ecash

#### Fedimint v0.1.0 release

[Fedimint](https://fedimint.org/) has cut their [first official release](https://github.com/fedimint/fedimint/releases/tag/v0.1.0). Plebs rejoice! Free and open source privacy-preserving bitcoin-backed federated private banking is one step closer to reality. [Fuck yeah!](https://media.tenor.com/LjTVUzKSJfcAAAAC/oh-yeah.gif)

#### Cashu DLEQ proofs

[Cashu](https://cashu.space/) has nearly completed their [implementation](https://github.com/cashubtc/cashu/pull/175) of Discreet Log Equality Proofs (DLEQ). This is a cryptographic protocol that can be used to prove the validity of a mint's signature without knowing the private key used to create the signature. This is an important capability that will unlock offline ecash payments. It also carries improved privacy assurances that the mint is not using distinct private keys to deanonymize users.
