+++
title = "Socratic Seminar 50"
date = 2026-03-11
template = "page.html"
aliases = [
  "2026-03-11-socratic-seminar-50",
  "/2026-03-11-socratic-seminar-50/",
  "/2026/03/11/socratic-seminar-50"
]

[extra]
event_type = "socratic"
meetup = "https://www.meetup.com/trianglebitdevs/events/313624233/"
luma = "https://luma.com/9fn4t2l3"
add_to_calendar = true
start = "2026-03-11T22:00:00Z"
end = "2026-03-12T00:00:00Z"
location = "APEX 1, Fidelity Investments, 100 New Millennium Way, Durham, NC 27709"
description = "BitDevs is a place for open discussion of the technical aspects of bitcoin and related protocols. Be advised: discussion will be technical. Please RSVP or email trianglebitdevs at protonmail dot com to confirm your attendance. You will be required to show ID to the security guard to gain admission, but you do not need to RSVP in public."
+++

We will start with introductions, cover some basic ground rules, and then jump into technical discussions. Topics include aspects of the Bitcoin protocol, new research developments, recent news, and software developments.

Please note the meeting location is in room APEX 1 at 100 New Millennium Way, Durham, NC 27709, USA.

# Announcements

- no pictures or recordings
- follow the [chatham house rule](https://en.wikipedia.org/wiki/Chatham_House_Rule)
  - discuss what was said, not who said it
- don't be a jerk
- thank you to our sponsor [Fidelity Investments](https://www.fidelity.com/)
- introductions

# Bitcoin Core

- [P2MR output type discussion](https://github.com/bitcoin/bips/pull/1670)
- [The limitations of cryptographic agility in Bitcoin](https://mirror.b10c.me/lists/bitcoindev/THqOJuI_s5C8B9jkklN73BB_Hzb9SsiLM6BFp4zFP3zWQoRevKoLVspdwjwh8NxxYbXwv4v6ikpStguW-QEvef4WgBZ7AQDz00P0st91FMA=@wuille.net/t/#u)
- [Introducing UltrafastSecp256k1: A Multi-Architecture Exploration of Secp256k1 Optimizations](https://delvingbitcoin.org/t/introducing-ultrafastsecp256k1-a-multi-architecture-exploration-of-secp256k1-optimizations/2280)
- [The future of the Bitcoin Core GUI](https://delvingbitcoin.org/t/the-future-of-the-bitcoin-core-gui/2253)
- [New gui-qml contributor](https://github.com/bitcoin-core/gui-qml/pull/504)
- [Using AI tooling for code review](https://delvingbitcoin.org/t/using-ai-tooling-for-code-review/2277)

# Mining

- [Heatpunk summit talks are up on youtube](https://www.youtube.com/@SpaceDenver)
- [Hashpool is back up](https://proxy.hashpool.dev/)
- [BZM2 in mujina](https://github.com/256foundation/mujina/pull/41)
- [Tether Mining SDK](https://mos.tether.io/mining-sdk/)
- [FIBRE resurrected](https://lclhost.org/blog/fibre-resurrected/)
- [Parasite pool mines their first block](https://nitter.net/ord_io/status/2027873140282380792)
- [[BIP Draft] 24 bits for nVersion nonce space instead of 16](https://groups.google.com/g/bitcoindev/c/fCfbi8hy-AE)

# Covenants

- [Binohash: Transaction Introspection Without Softforks](https://robinlinus.com/binohash.pdf)

# Layer 2

- [Bitcoin PIPEs v2](https://delvingbitcoin.org/t/bitcoin-pipes-v2/2249)

# Misc

- [First block signaling BIP110](https://mempool.space/block/0000000000000000000161b65dc9cf0adfdad107b801cd87f1dcf0cfbb454654?showDetails=true&view=actual#details)
- [Nested MuSig2](https://eprint.iacr.org/2026/223.pdf)
- [Sigbash v2 announced](https://nitter.net/arbedout/status/2020885323778044259)
- Using openclaw to gain super powers

# PRs

- [Allow recovery of MtGox stolen funds (79,956 BTC)](https://github.com/bitcoin/bitcoin/pull/34695)
- [BIP 324, 434: Specify p2p v2 one-byte identifier for FEATURE message](https://github.com/bitcoin/bips/pull/2092)
- [BIP 446: OP_TEMPLATEHASH and BIP Draft: TH+CSFS+IK Bundle](https://github.com/bitcoin/bips/pull/1974)
- [BIP Proposal: Ordinals (closed)](https://github.com/bitcoin/bips/pull/1408)
- [p2p: Allow block downloads from peers without snapshot block after assumeutxo validation](https://github.com/bitcoin/bitcoin/pull/33604)
- [wallet: fix removeprunedfunds bug with conflicting transactions](https://github.com/bitcoin/bitcoin/pull/34358)
- [mining, ipc: omit dummy extraNonce from coinbase](https://github.com/bitcoin/bitcoin/pull/32420)
- [mining: Break compatibility with existing IPC mining clients](https://github.com/bitcoin/bitcoin/pull/34568)
- [mining: add cooldown to createNewBlock() immediately after IBD](https://github.com/bitcoin/bitcoin/pull/34184)
- [Add a "tx output spender" index](https://github.com/bitcoin/bitcoin/pull/24539)
- [rpc,net: Add private broadcast RPC](https://github.com/bitcoin/bitcoin/pull/34329)
- [rpc: add coinbase_tx field to getblock](https://github.com/bitcoin/bitcoin/pull/34512)
- [build: Embedded ASMap [3/3]: Build binary dump header file](https://github.com/bitcoin/bitcoin/pull/28792)
- [BIP54 "Consensus Cleanup" implementation](https://github.com/bitcoin-inquisition/bitcoin/pull/99)
- [btcec/schnorr/musig2: add nested MuSig2 support for recursive cosigner trees](https://github.com/btcsuite/btcd/pull/2481)
- [hashes: add SHA256 ARM hardware acceleration](https://github.com/rust-bitcoin/rust-bitcoin/pull/5493)
