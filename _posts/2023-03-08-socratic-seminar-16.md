---
layout: post
type: socratic
title: "Socratic Seminar 16"
meetup: https://www.meetup.com/triangle-bitdevs/events/291982677/
---

We will start with introductions, some basic ground rules, and jump into technical discussions. 
We will cover aspects of the bitcoin protocol, new research developments, recent news, and
software developments.

Please note the meeting location at 4801 Glenwood Ave suite 200 in Raleigh. It's the huge Fifth Third Bank building.

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
[Assume UTXO](https://github.com/jamesob/assumeutxo-docs/tree/2019-04-proposal/proposal) is a proposal by [James O'Beirne](https://twitter.com/jamesob) that would enable bootstrapping nodes to download the entire UTXO set before the blockchain, allowing these nodes to send and receive bitcoin before completing initial block download (IBD). These nodes would download and validate the entire blockchain after importing the UTXO set. This model is the spiritual successor to assumevalid, which is enabled by default today. AssumeUTXO dramatically reduces the amount of time and compute resources required to begin using a new node without significantly compromising the bitcoin security model.

#### Ephemeral Anchors
[Ephemeral Anchors](https://github.com/instagibbs/bips/blob/ephemeral_anchor/bip-ephemeralanchors.mediawiki) is a proposal by [Greg Sanders](https://twitter.com/theinstagibbs) to enable 0-value UTXOs to propagate through the mempool as long as they are part of a package containing another transaction that spends the output. This mempool policy carve-out would enable LN and other protocols to fee bump transactions in a robust manner with no known pinning vectors. It builds upon the [V3 Transaction Relay proposal](https://bitcoinops.org/en/topics/version-3-transaction-relay/) that we will definitely cover one of these months after I finally understand it.

#### Ordinal Inscriptions: NFTs on bitcoin.
[ordinals.com](https://ordinals.com) is a site to browse ordinal inscriptions, a new NFT scheme built on bitcoin by SF BitDevs host [@rodarmor](https://twitter.com/rodarmor). Ordinal theory is a scheme to number and track every satoshi based on its issuance date. Inscriptions are a scheme to associate on-chain metadata to a single satoshi ordinal. The data is [stored in the tx witness script](https://docs.ordinals.com/inscriptions.html) of a taproot output using a two-phase commit/reveal procedure. Debate grew to fever pitch after this [absolute unit](https://ordinals.com/inscription/0301e0480b374b32851a9462db29dc19fe830a7f7d7a88b81612b9d42099c0aei0) of an inscription took up [almost an entire bitcoin block](https://mempool.space/block/0000000000000000000515e202c8ae73c8155fc472422d7593af87aa74f2cf3d).

# Self-Hosted Node Software

#### BTCPayServer
[BTCPayServer](https://btcpayserver.org/) is an open-source payment processor that allows businesses, merchants, and individuals to receive payments in Bitcoin without relying on third-party payment processors. It is a self-hosted payment server that provides a secure, decentralized, and censorship-resistant payment infrastructure.


# Miscellaneous
- [Mempool block audit view](https://mempool.space/docs/faq#what-is-block-health)
- [How does one become a DNS seed for Bitcoin Core?](https://bitcoin.stackexchange.com/questions/116931/how-does-one-become-a-dns-seed-for-bitcoin-core)
- [Bitcoin node patch to filter out "ord" spam](https://gist.github.com/luke-jr/4c022839584020444915c84bdd825831)
- [Genesis tweet of BTCPayServer](https://twitter.com/NicolasDorier/status/898378514256207872)
