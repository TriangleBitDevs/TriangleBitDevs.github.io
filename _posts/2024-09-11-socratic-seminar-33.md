---
layout: post
type: socratic
title: "Socratic Seminar 33"
meetup: https://www.meetup.com/triangle-bitdevs/events/302928157/
nostr: https://njump.me/naddr1qqyxycn98q6nxvesqy8hwumn8ghj7mn0wd68ytnddaksygpc4vlncpsr9tek2dvk0jttc38dwjjxa4mz2k0fk3dzw5z2qa3frqpsgqqq0jes7yrx58
---

We will start with introductions, some basic ground rules, and jump into technical discussions. We will cover aspects of the bitcoin protocol, new research developments, recent news, and software developments.

Please note the meeting location at Mad Science of the Triangle in Cary.

# Announcements

- no pictures or recordings
- chatham house rules
- don't be a dick
- thank you to our sponsor [Lolli](https://www.lolli.com/)
- introductions

# Bitcoin
- Bitcoin Core 28.0 [Release Notes (Draft)](https://github.com/bitcoin-core/bitcoin-devwiki/wiki/28.0-Release-Notes-Draft)
- Bitcoin Core 28.0 Release Candidate [Testing Guide](https://github.com/bitcoin-core/bitcoin-devwiki/wiki/28.0-Release-Candidate-Testing-Guide)
- Bitcoin Core's migration to the [CMake buildsystem](https://groups.google.com/g/bitcoindev/c/hgKkfQWzrTo)
- Bitcoin Core maintainer glozow shared this [TRUC example transaction](https://x.com/glozow/status/1829100551067365608) on testnet4

# Lightning
- [Building BOLT 12 into Strike](https://strike.me/blog/bolt12-offers/)
- [Breez SDK](https://github.com/breez)

# Ark
- [ARK v0.2](https://arkdev.info/blog/ark-release-v0.2/) Covenant-less, Offline Payments, Client SDKs, and MutinyNet Support... [Oh My!](https://media.tenor.com/svFFJHFmLccAAAAC/oh-my-george-takei.gif)

# Ecash
- [NIP-60](https://github.com/nostr-protocol/nips/pull/1369/files#diff-18ad4ae4811a1656d824320ea36e62689115e3d9c8cdc094facd39a41b55edb5) is a nostr protocol proposal to store cashu ecash tokens in nostr relays. Callebtc, creator of cashu, [says](https://njump.me/nevent1qqst7d9ugdfmgcl4zhqxhj2p6n0alqtdqnl6qnkq0uzex0zxw6yglpcpp4mhxue69uhkummn9ekx7mqpz3mhxue69uhhyetvv9ujuerpd46hxtnfdupzq5xeflpdskqvdq4swxj59793uvdzqzc9pzatjk3nhmcg2h0js8tr8syt5r) it is implemented in 6 wallets and it solves a major wallet challenge he anticipated for cashu. [Noice!](https://c.tenor.com/zRbvwdWpy3UAAAAC/tenor.gif)
- Cashu Dev Kit (CDK) is a low level rust toolkit intended to help developers create new cashu wallets and services with ease. The latest release [v0.3.0](https://github.com/cashubtc/cdk/releases/tag/v0.3.0) includes support for LNBits, Strike API, and LND lightning backends along with many other fixes and refactors. Check out those new contributors tho! 👀

# Security
- [Threat Models and Dark Skippy](https://x.com/reardencode/status/1829192124266639793)

# Mining
- [Bitcoin Mining Development Mailing List](https://groups.google.com/u/0/g/bitcoinminingdev/c/97fkfVmHWYU)
- [PPLNS with Job Declaration](https://delvingbitcoin.org/t/pplns-with-job-declaration/1099)
- Stratum v2 [Auditor Role](https://github.com/stratum-mining/stratum/discussions/1052)

# Miscellaneous
- [Floresta v0.6.0](https://github.com/vinteumorg/Floresta/releases/tag/0.6.0)
- [Soft-Fork/Covenant Dependent Layer 2 Review](https://petertodd.org/2024/covenant-dependent-layer-2-review)
- [DLC dev kit](https://github.com/bennyhodl/dlcdevkit) funded by OpenSats! [Twitter announcement](https://x.com/bennyhodl/status/1831720708042260618)
- [BIP353 Resolver](https://satsto.me/)
- [Mempool v3.0.0](https://github.com/mempool/mempool/releases/tag/v3.0.0)
