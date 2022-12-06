---
layout: post
type: socratic
title: "Socratic Seminar 13"
meetup: https://www.meetup.com/triangle-bitdevs/events/290178149

---

We will start with introductions, some basic ground rules, and jump into technical discussions. 
We will cover aspects of the bitcoin protocol, new research developments, recent news, and
software developments.

Please note the meeting location at 4801 Glenwood Ave suite 200 in Raleigh. It's the huge Fifth Third Bank building.

# Announcements

- no pictures or recordings
- chatham house rules
- don't be a dick
- Hack Day - biweekly unstructured meetup for bitcoin builders
- Rust Meetup - stay tuned
- thank you to our sponsor [Lolli](https://preview.page.link/link.lolli.com/3T8iPrE5gPKVDc5i7)
- introductions


# Bitcoin Core

**BIP 351**

[BIP351](https://privatepayments.org) is a stealth address protocol that makes it possible for two parties to transact using addresses that only they can calculate. It's an improvement over [BIP47](https://github.com/bitcoin/bips/blob/master/bip-0047.mediawiki) because it takes measures to conceal the initial notification transaction. However, it still suffers from some of the same drawbacks: the sender must exercise coin control and it requires an on-chain transaction before any payments can be made.


# Lightning

#### Releases

- [CLN v22.11 "Alameda Yield Generator"](https://blog.blockstream.com/core-lightning-v22-11-alameda-yield-generator/) - new plugin manager, autoclean improvements, new filter API, new versioning scheme
- [eclair-v0.8.0](https://github.com/ACINQ/eclair/blob/master/docs/release-notes/eclair-v0.8.0.md) - 0-conf support, channel aliases, experimental dual-funding, bolt12 prep
- [LND v0.15.5-beta](https://github.com/lightningnetwork/lnd/releases/tag/v0.15.5-beta) - minor release with bug fixes

#### Privacy

- [ln-vortex](https://github.com/ln-vortex/ln-vortex) - Coinjoin lightning channel opens - [first mainnet coinjoin](https://mempool.space/tx/5027541d328c2bab61e12c0db6df87f8a9f16dc10084042e4f4c962bdcbeb6fa).
- [Lightning Privacy Research](https://lightningprivacy.com/en/introduction)

#### DLCs

- Crypto Garage has created the first [mainnet lightning channel DLC](https://medium.com/crypto-garage/dlc-on-lightning-cb5d191f6e64)

#### Miscellaneous

- [Onion Messages Demystified](https://lightningdevkit.org/blog/onion-messages-demystified/) - onion messages, offers, blinded routes, and async payments
- [BOLT proposal: Reputation Credentials](https://github.com/lightning/bolts/blob/80214c83190836c4f7699af9e8920769607f1a00/www-reputation-credentials-protocol.md) - solve channel jamming with reputation tokens
- [CLN vs. LND, what's the diff?](https://voltage.cloud/blog/news/what-are-the-differences-between-lnd-and-cln/) - nice blog post that answers a very common question

# Chaumian Ecash

- [Anonsats](https://hackmd.io/@anonsats/SJDzzRR4i) - ecash system built on bitcoin, lightning, and [cashu](https://github.com/cashubtc/cashu).


# Privacy

- [Payjoin](https://en.bitcoin.it/wiki/PayJoin) - make coinjoin payments!
- [Void](https://github.com/brilliancebitcoin/void) - WIP bitcoin wallet that only sends and receives coinjoins.


# Scaling

- [coinpool.dev](https://coinpool.dev/) - new site to track R&D progress


# Miscellaneous

- [Clark Moody Bitcoin Dashboard](https://bitcoin.clarkmoody.com/dashboard/)
- [Block Hardware Wallet Security Model](https://wallet.build/losing-your-keys-without-losing-your-coins/)
- [\[bitcoin-dev\] BIP Proposal: Wallet Labels Export Format](https://lists.linuxfoundation.org/pipermail/bitcoin-dev/2022-August/020887.html)
- [Border Wallets](https://www.borderwallets.com/) - quickly and easily memorize Bitcoin seed phrases
- [Bitcoin Treasuries](https://bitcointreasuries.net) - aggregated list of companies, funds, and countries that hold bitcoin.
- [Binary Watch](https://binarywatch.org/) - monitor checksums of various bitcoin binary releases

# Podcasts

#### Coin Stories
[Why Bitcoin is Better Money](https://youtu.be/-JsHZPTDeXE) - Knut Svanholm has an engaging conversation with Natalie Brunell talking about the most important discovery of our time. Big picture thinking on Bitcoin. ∞ / 21mil

#### Bitcoin Explained
[The Tornado Cash Trial](https://www.youtube.com/watch?v=xyHTUsHVv7s) - A good introduction to tornado cash and the arrest of Alexy Pertsev. Aaron and Sjors provide a high-level description of what was going on, it’s relevance to bitcoin, and even mention Wasabi Wallet at one point. A key point is that it is still unclear exactly which angle the prosecution is going to argue. They postponed the trial for another three months, at which time the prosecutor will have to provide a more detailed description of the charges.
