---
layout: post
type: socratic
title: "TABConf Socratic Session: Lightning Protocol Development"
meetup: "https://github.com/orgs/TABConf/projects/4/views/1?pane=issue&itemId=81248842&issue=TABConf%7C6.tabconf.com%7C148"
---

A focused Socratic Seminar on lightning protocol development. Topics will be selected from 
mailing lists, prominent github repos, network graphs, research papers, vulnerability reports 
and other sources.

This event will take place at TABConf in Atlanta.


## Topics

#### vnprc

- Breez SDK adds support for Nodeless: A Liquid Implementation
  - Breez [github](https://github.com/breez)
  - [nodeless sdk docs](https://sdk-doc-liquid.breez.technology/)
  - [native sdk docs](https://sdk-doc-greenlight.breez.technology/)
  - Blockstream [blog announcement](https://blog.liquid.net/breez-releases-nodeless-sdk-implementation-powered-by-liquid/)
  - [StashPay](https://blog.onionmill.com/p/welcome-to-the-stashpay-testflight) is the first wallet to ship with it
- [BOLT12 Offers Merged](https://github.com/lightning/bolts/pull/798)
- [Building Bolt12 Into Strike](https://strike.me/blog/bolt12-offers/)
- [Mutiny Wallet](https://blog.mutinywallet.com/mutiny-wallet-is-shutting-down/) and [10101](https://10101.finance/blog/10101-is-shutting-down/) are both shutting down. 😢

#### nifty
- [LN Summit 2024 Notes & Summary/Commentary](https://delvingbitcoin.org/t/ln-summit-2024-notes-summary-commentary/1198)
- [Lightning Welder](https://github.com/alexlwn123/Lightning-Welder)

#### randy
- [Spec for dual funding merged into BOLTs](https://github.com/lightning/bolts/pull/851)
- [Bitcoin Core 28 wallet integration guide](https://bitcoinops.org/en/bitcoin-core-28-wallet-integration-guide/) discusses the impact of TRUC transactions on anchor outputs and the potential future deprecation of update_fee as well RBF pinning attacks.

### Research
- [Hybrid Jamming Mitigation: Results and Updates](https://delvingbitcoin.org/t/hybrid-jamming-mitigation-results-and-updates/1147)
- [SuperScalar: Laddered Timeout-Tree-Structured Decker-Wattenhofer Factories](https://delvingbitcoin.org/t/superscalar-laddered-timeout-tree-structured-decker-wattenhofer-factories/1143)

### PRs and Releases
- [LND custom channels PR](https://github.com/lightningnetwork/lnd/pull/8960/files#diff-d8ed3157089b4fb9b6e61d523fd956f2adfd223fdc76d000112bb8e2dab96e8e)
- [LDK rust-lightning v0.0.124 release notes](https://github.com/lightningdevkit/rust-lightning/releases/tag/v0.0.124)
- [LND Gossip Messages](https://github.com/lightningnetwork/lnd/pull/8044)
- [Eclair: Allow including routing hints when creating Bolt 11 invoice](https://github.com/ACINQ/eclair/pull/2909)
- [LDK: Support paying static invoices](https://github.com/lightningdevkit/rust-lightning/pull/3140)
- [LDK: Add the core functionality required to resolve Human Readable Names](https://github.com/lightningdevkit/rust-lightning/pull/3179)
