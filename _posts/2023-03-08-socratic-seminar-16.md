---
layout: post
type: socratic
title: "Socratic Seminar 16"
meetup: https://www.meetup.com/triangle-bitdevs/events/291982677/
---

We will start with introductions, some basic ground rules, and jump into technical discussions. We will cover aspects of the bitcoin protocol, new research developments, recent news, and
software developments.

This month we're in for a treat! Triangle BitDevs cohost [Rob Hamilton](https://twitter.com/Rob1Ham) will deliver the first alpha demo of Trident Wallet, a miniscript-enabled wallet bringing self-custody to the next level!

Please note the meeting location at 4801 Glenwood Ave suite 200 in Raleigh, right above Fifth Third Bank. They have no idea we're [plotting their demise](https://upload.wikimedia.org/wikipedia/en/1/11/Disaster_Girl.jpg).

# Announcements

- no pictures or recordings
- chatham house rules
- don't be a dick
- Rust for Bitcoiners - biweekly online meetup
- Hack Day - unstructured monthly in-person meetup for bitcoin builders
- thank you to our sponsor [Lolli](https://preview.page.link/link.lolli.com/3T8iPrE5gPKVDc5i7)
- introductions


# Bitcoin Core

#### Assume UTXO
[Assume UTXO](https://github.com/jamesob/assumeutxo-docs/tree/2019-04-proposal/proposal) is a proposal by [James O'Beirne](https://twitter.com/jamesob) that would enable bootstrapping nodes to download the entire UTXO set before the blockchain, allowing these nodes to send and receive bitcoin before completing [IBD](https://river.com/learn/terms/i/initial-block-download-ibd/). These nodes would download and validate the entire blockchain after importing the UTXO set. This model is the spiritual successor to assumevalid, which is enabled by default today. AssumeUTXO dramatically reduces the amount of time and compute resources required to begin using a new node without significantly compromising the bitcoin security model.

#### Ephemeral Anchors
[Ephemeral Anchors](https://github.com/instagibbs/bips/blob/ephemeral_anchor/bip-ephemeralanchors.mediawiki) is a proposal by [Greg Sanders](https://twitter.com/theinstagibbs) to enable 0-value UTXOs to propagate through the mempool as long as they are part of a package containing another transaction that spends the output. This mempool policy carve-out would enable LN and other protocols to fee bump transactions in a robust manner with no known pinning vectors. It builds upon the [package relay](https://bitcoinops.org/en/topics/package-relay/) proposal and the [V3 transaction relay](https://bitcoinops.org/en/topics/version-3-transaction-relay/) proposal that we will definitely cover one of these months after I finally understand it.

#### Ordinal Inscriptions: NFTs on bitcoin.
[ordinals.com](https://ordinals.com) is a site to browse ordinal inscriptions, a new NFT scheme built on bitcoin by [SF BitDevs](https://sfbitcoindevs.org/) host [Casey Rodarmor](https://twitter.com/rodarmor). Ordinal theory is a scheme to number and track every satoshi based on its issuance date. Inscriptions are a scheme to associate on-chain metadata to a single satoshi ordinal. The data is [stored in the tx witness script](https://docs.ordinals.com/inscriptions.html) of a taproot output using a two-phase commit/reveal procedure. Debate grew to fever pitch after this [absolute unit](https://ordinals.com/inscription/0301e0480b374b32851a9462db29dc19fe830a7f7d7a88b81612b9d42099c0aei0) of an inscription took up [almost an entire bitcoin block](https://mempool.space/block/0000000000000000000515e202c8ae73c8155fc472422d7593af87aa74f2cf3d).

# Self-Hosted Node Software

#### BTCPayServer
[BTCPayServer](https://btcpayserver.org/) is an open-source payment processor that allows businesses, merchants, and individuals to receive payments in Bitcoin without relying on third-party payment processors. It is a self-hosted payment server that provides a secure, decentralized, and censorship-resistant payment infrastructure.


# Miscellaneous
- [Mempool block audit view](https://mempool.space/docs/faq#what-is-block-health)
- [How does one become a DNS seed for Bitcoin Core?](https://bitcoin.stackexchange.com/questions/116931/how-does-one-become-a-dns-seed-for-bitcoin-core)
- [Bitcoin node patch to filter out "ord" spam](https://gist.github.com/luke-jr/4c022839584020444915c84bdd825831)
- [Genesis tweet of BTCPayServer](https://twitter.com/NicolasDorier/status/898378514256207872)

# Podcasts

### The Chaincode Podcast
[James O'Beirne](https://podcast.chaincode.com/2020/02/12/james-obeirne-4.html) - In this classic episode from the pre-lockdown era James O'Beirne discusses the Chaincode Residency, AssumeUTXO, and how to make an impact working on Bitcoin Core.

[Greg Sanders - SIGHASH_ANYPREVOUT, ephemeral anchors and LN symmetry (ELTOO)](https://podcast.chaincode.com/2023/02/15/greg-sanders.html) - In the latest episode Greg Sanders talks [APO](https://bitcoinops.org/en/topics/sighash_anyprevout/), [eltoo](https://bitcoinops.org/en/topics/eltoo/), and Ephemeral Anchors.

