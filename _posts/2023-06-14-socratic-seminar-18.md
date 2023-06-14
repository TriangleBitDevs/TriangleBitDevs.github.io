---
layout: post
type: socratic
title: "Socratic Seminar 18"
meetup: https://www.meetup.com/triangle-bitdevs/events/293826265/
---

We will start with introductions, some basic ground rules, and jump into technical discussions. We will cover aspects of the bitcoin protocol, new research developments, recent news, and
software developments.

Please note the meeting location at 4801 Glenwood Ave suite 200 in Raleigh, right above Fifth Third Bank.

# Announcements

- no pictures or recordings
- chatham house rules
- don't be a dick
- Rust for Bitcoiners - biweekly online meetup
- Hack Day - unstructured monthly in-person meetup for bitcoin builders
- thank you to our sponsor [Lolli](https://preview.page.link/link.lolli.com/3T8iPrE5gPKVDc5i7)
- introductions

<br><br>

# Bitcoin Core

#### SegWit
Join us for the first part of our three-part series on SegWit, also known as segregated witness. To gain a clear understanding of Taproot, it's essential to comprehend the fundamentals of SegWit.

In this first part, we'll delve into the necessary background material that led to SegWit. The following two parts will focus more on the technical aspects of SegWit version 1 and version 2. Don't miss out on this opportunity to enhance your knowledge of Bitcoin's underlying technologies!


#### OP_VAULT
[Very exciting](https://i.imgur.com/y1cnodp.gif) news for covenant fans! [James O'Beirne](https://github.com/jamesob) has released a new update to his `OP_VAULT` proposal that incorporates techniques from [TLUV](https://lists.linuxfoundation.org/pipermail/bitcoin-dev/2021-September/019419.html), making the protocol more flexible and simpler to use. Additionally, O'Beirne proposes including [OP_CTV](https://bitcoinops.org/en/topics/op_checktemplateverify/) as a first-class citizen in this proposal.

If you're interested in the technical details, you can read the full [BIP](https://github.com/jamesob/bips/blob/jamesob-23-02-opvault/bip-0345.mediawiki) on O'Beirne's Github page. Alternatively, check out this fantastic [Twitter thread](https://twitter.com/jamesob/status/1639019107432513537) by O'Beirne for a quick summary. Don't miss out on the latest developments in Bitcoin's covenants!

#### Silent Payments BIP
Bitcoin Core developer [Josie](https://iris.to/npub1uaj9phu5lpxpczm3vaayt46m0yv0pduxzy7z6quwd2uggxue7fmqx9665u) and Bitcoin Sorcerer [Ruben Somsen](https://twitter.com/SomsenRuben) have announced a [proposed BIP](https://github.com/bitcoin/bips/blob/f1c188faa55adb84ea0972dd451f319355c2860c/bip-0000.mediawiki) for Silent Payments, which is a way to privately and securely send bitcoin to a publicly announced address. The proposal offers to solve many of the gaps and privacy footguns inherent in [BIP47](https://en.bitcoin.it/wiki/BIP_0047) Reusable Payment Codes proposal. There's no free lunch, though. The payment recipient must scan every bitcoin transaction to identify incoming payments. This BIP proposal also shipped with a [working implementation](https://github.com/bitcoin/bitcoin/pull/27827) in bitcoin core!

# Ecash

#### A Proof of Liabilities Scheme for Ecash Mints
[Calle](https://twitter.com/callebtc/) has released a [Proof of Liabilities](https://gist.github.com/callebtc/ed5228d1d8cbaade0104db5d1cf63939) proposal for ecash mints. It is a trustless way to prove that a mint has not issued more ecash tokens than it has in on-chain bitcoin. The proposal relies on the need for an ecash mint to periodically rotate the private key it uses to create new ecash tokens. Each key rotation period is called an "epoch" and  Calle describes a "periodic bank run" where users of the mint can compare their burned ecash tokens against a list that the mint publishes for all past epochs on a regular schedule.

Calle has [stated on twitter](https://twitter.com/callebtc/status/1655617089590243335) that he intends to develop this protocol for use in [Cashu](https://cashu.space/).


# Zero Knowledge

#### Zerosync
[ZeroSync](https://zerosync.org/) is a new project that aims to bring zero knowledge proofs to bitcoin. Zerosync promises to enable extremely fast full node syncing with three new state proofs: headers chain, consensus rules (except witness data), and the full consensus rules (including witness data). They also plan to build a developer toolkit to enable a ton of new scaling and privacy improvements to many areas of bitcoin, including lightning. Zerosync has received sponsorship from StarkWare Industries, a software company building Ethereum ZK rollup system StarkNet. Bitcoin stands to benefit a great deal thanks to the cutting edge research performed on Ethereum.


# Miscellaneous
- [ord indexer bug lead to 1200 "missed" inscriptions](https://github.com/casey/ord/issues/2000)
- [RGB Announcement](https://lists.linuxfoundation.org/pipermail/bitcoin-dev/2023-April/021554.html)
- [\[Lightning-dev\] Resizing Lightning Channels Off-Chain With Hierarchical Channels](https://lists.linuxfoundation.org/pipermail/lightning-dev/2023-March/003886.html)
- [Munstr - An open source Musig privacy based wallet](https://github.com/0xBEEFCAF3/munstr)
- [Mostro - A non custodial lightning network peer-to-peer exchange over nostr](https://github.com/MostroP2P/mostro)
- [Ledger Recover Security implications (a thread)](https://www.nobsbitcoin.com/ledger-to-launch-kyc-cloud-based-recovery-service/)
