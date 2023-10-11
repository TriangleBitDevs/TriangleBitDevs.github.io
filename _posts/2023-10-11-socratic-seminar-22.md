---
layout: post
type: socratic
title: "Socratic Seminar 22"
meetup: https://www.meetup.com/triangle-bitdevs/events/296625943/
---

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

#### BitVM

[BitVM](https://bitvm.org/bitvm.pdf) is a new paper from [Robin Linus](https://twitter.com/robin_linus) detailing a way to express turing-complete bitcoin contracts. BitVM is based on a challenge-response protocol using fraud proofs and it can be built on bitcoin as it is today without any change to bitcoin consensus rules. [Super Testnet](https://github.com/supertestnet), of course, has a proof of concept [implementation](https://github.com/supertestnet/tapleaf-circuits/tree/main). For those of us who don't already know what "arbitrary computation using only NAND gate circuits" means, [Shinobi](https://bitcoinmagazine.com/authors/shinobi) has published has a nice high-level [explainer](https://bitcoinmagazine.com/technical/the-big-deal-with-bitvm-arbitrary-computation-now-possible-on-bitcoin-without-a-fork) in Bitcoin Magazine.

#### Wallet Fingerprints: Detection & Analysis

Bitcoin Core contributor [Ishaana Misra](https://twitter.com/ishaanamisra) dropped a [report](https://ishaana.com/blog/wallet_fingerprinting/) detailing her efforts to automate wallet fingerprinting. The report details ways to identify bitcoin wallets only from their on-chain footprint. Ishaana defines four categories of fingerprints, a methodology for identifying them, and describes the results of her attempt to automate wallet detection. This seems like an excellent foundation for future wallet privacy research.

#### AssumeUTXO and BIP 324 merged 🚀

After 4 long years [AssumeUTXO](https://bitcoinops.org/en/topics/assumeutxo/) has been [merged]( https://github.com/bitcoin/bitcoin/pull/27596#event-10530618233) into the Bitcoin Core main repo. If that wasn't exciting enough, [BIP 324](https://bitcoinops.org/en/topics/v2-p2p-transport/), encrypted P2P transport, was [merged]( https://github.com/bitcoin/bitcoin/pull/28331#event-10535599397) one day later. The sound of nerds rejoicing was reportedly heard reverberating for days throughout the secret citadel of the Bitcoin Core cabal.

#### Musig2 Descriptor and PSBT BIPs

[Andrew Chow](https://github.com/achow101) proposed two BIPs to add [Musig2](https://bitcoinops.org/en/topics/musig/#musig2) support to wallet [descriptors](https://bitcoinops.org/en/topics/output-script-descriptors/) and [PSBTs](https://bitcoinops.org/en/topics/psbt/). The [Musig2 PSBT BIP](https://github.com/achow101/bips/blob/musig2-psbt/bip-musig2-psbt.mediawiki) proposes new fields and has a brief description of the new concepts and additional rounds of communication entailed with Musig2. The [MuSig2 descriptor BIP](https://github.com/achow101/bips/blob/musig2-descriptors/bip-musig2-descriptors.mediawiki) adds a new key expression `musig()` usable only inside of a `tr()` expression.

# Lightning

#### SimLN

[SimLN](https://simln.dev/) is a new project to simulate a realistic ligntning network on any test network. It creates random activity based on the network topology. Additionally, developers can specify specific payment patterns to test. SimLN supports LND and CLN. Work is ongoing to add Eclair and LDK-node support.

#### The Lightning Network Grew by 1212% in 2 Years

[Sam Wouters](https://blog.river.com/author/sam/) dropped another [Lightning Research Report](https://blog.river.com/the-lightning-network-in-2023/) showing the impressive growth of the network in terms of users, transactions, and volume despite flat numbers for node count, channels, and capacity. The report is chock full of graphs and statistics compiled from River and other companies who elected to share their data. These nodes represent 29% of network capacity and 10% of channels. It's safe to say that River remains bullish on lightning.
