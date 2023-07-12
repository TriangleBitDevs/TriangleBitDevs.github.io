---
layout: post
type: socratic
title: "Socratic Seminar 19"
meetup: https://www.meetup.com/triangle-bitdevs/events/294616066/
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
- thank you to our sponsor [Lolli](https://www.lolli.com/)
- introductions

<br><br>

# Bitcoin Core

#### Silent Payments BIP
Bitcoin Core developer [Josie](https://iris.to/npub1uaj9phu5lpxpczm3vaayt46m0yv0pduxzy7z6quwd2uggxue7fmqx9665u) and Bitcoin Sorcerer [Ruben Somsen](https://twitter.com/SomsenRuben) have announced a [proposed BIP](https://github.com/bitcoin/bips/blob/f1c188faa55adb84ea0972dd451f319355c2860c/bip-0000.mediawiki) for Silent Payments, which is a way to privately and securely send bitcoin to a publicly announced address. The proposal offers to solve many of the gaps and privacy footguns inherent in [BIP47](https://en.bitcoin.it/wiki/BIP_0047) Reusable Payment Codes proposal. There's no free lunch, though. The payment recipient must scan every bitcoin transaction to identify incoming payments. This BIP proposal also shipped with a [working implementation](https://github.com/bitcoin/bitcoin/pull/27827) in bitcoin core!

# Lightning

#### Face Melting Eclair Release

[Eclair v0.9.0](https://github.com/ACINQ/eclair/blob/master/docs/release-notes/eclair-v0.9.0.md) shipped with support for [dual-funded channels](https://bitcoinops.org/en/topics/dual-funding/), [splicing](https://bitcoinops.org/en/topics/splicing/), and [bolt12](https://bitcoinops.org/en/topics/offers/). This ACINQ [blog post](https://acinq.co/blog/phoenix-splicing-update) nicely explains how this benefits Phoenix users. It is unclear at this time whether the lightning network will be able to scale enough to accomodate such high levels of unadulterated magnificence. 🫠

# Ecash

#### A Proof of Liabilities Scheme for Ecash Mints
[Calle](https://twitter.com/callebtc/) has released a [Proof of Liabilities](https://gist.github.com/callebtc/ed5228d1d8cbaade0104db5d1cf63939) proposal for ecash mints. It is a trustless way to prove that a mint has not issued more ecash tokens than it has in on-chain bitcoin. The proposal relies on the need for an ecash mint to periodically rotate the private key it uses to create new ecash tokens. Each key rotation period is called an "epoch" and  Calle describes a "periodic bank run" where users of the mint can compare their burned ecash tokens against a list that the mint publishes for all past epochs on a regular schedule.

Calle has [stated on twitter](https://twitter.com/callebtc/status/1655617089590243335) that he intends to develop this protocol for use in [Cashu](https://cashu.space/).


#### Nostr, Cashu, and Nostr Cash
The most popular Android nostr client, [Amethyst](https://github.com/vitorpamplona/amethyst) has added support to [redeem cashu tokens](https://github.com/vitorpamplona/amethyst/pull/471) from within the app. It seems like maybe [ecash season is approaching](https://nostr.build/i/72e5b37b69d3ca848586ee0e825b2b74962503c4df64bf2eb7c207a4c131bcdc.jpg). Meanwhile, [Ben Arc](https://coracle.social/people/npub1c878wu04lfqcl5avfy3p5x83ndpvedaxv0dg7pxthakq3jqdyzcs2n8avm/notes) of [LNBits](https://lnbits.com/) fame has proposed [NIP-88](https://github.com/nostr-protocol/nips/pull/627) a protocol for non-blinded nostr cash tokens. Discussion on this PR has been limited but judging from the emoji responses, this is not a popular proposal.

# Zero Knowledge

#### Zerosync
[ZeroSync](https://zerosync.org/) is a new project that aims to bring zero knowledge proofs to bitcoin. Zerosync promises to enable extremely fast full node syncing with three new state proofs: headers chain, consensus rules (except witness data), and the full consensus rules (including witness data). They also plan to build a developer toolkit to enable a ton of new scaling and privacy improvements to many areas of bitcoin, including lightning. Zerosync has received sponsorship from StarkWare Industries, a software company building Ethereum ZK rollup system StarkNet. Bitcoin stands to benefit a great deal thanks to the cutting edge research performed on Ethereum.

# Privacy

#### Payjoin Dev Kit

[Payjoin Dev Kit](https://payjoindevkit.org/blog/pdk-an-sdk-for-payjoin-transactions/) is a new project by [bitgould](https://iris.to/npub1yevrvtp3xl42sq06usztudhleq8pdfsugw5frgaqg6lvfdewfx9q6zqrkl) to make integrating payjoin a much easier proposition for wallet developers. [Payjoin](https://bitcoinops.org/en/topics/payjoin/) is a technique where a payment sender and recipient collaborate to construct a transaction spending inputs owned by both parties in order to confound chain analysis attempts that rely on the common input hueristic. This privacy technique is superior to coinjoin in many ways due to the lack of an on-chain footprint and reduced fees.


# Miscellaneous
- [\[Lightning-dev\] Resizing Lightning Channels Off-Chain With Hierarchical Channels](https://lists.linuxfoundation.org/pipermail/lightning-dev/2023-March/003886.html)
- [Munstr - An open source Musig privacy based wallet](https://github.com/0xBEEFCAF3/munstr)
- [Mostro - A non custodial lightning network peer-to-peer exchange over nostr](https://github.com/MostroP2P/mostro)
- [Ledger Recover Security implications (a thread)](https://www.nobsbitcoin.com/ledger-to-launch-kyc-cloud-based-recovery-service/)

