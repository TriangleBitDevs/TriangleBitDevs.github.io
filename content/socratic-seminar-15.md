+++
title = "Socratic Seminar 15"
date = 2023-02-08
template = "page.html"
aliases = [
  "2023-02-08-socratic-seminar-15",
  "/2023-02-08-socratic-seminar-15/",
  "/2023/02/08/socratic-seminar-15"
]

[extra]
event_type = "socratic"
meetup = "https://www.meetup.com/triangle-bitdevs/events/291339872/"
+++


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

#### Version Handshake
Bitcoin core developer Bruno Garcia has published an [excellent technical dive](https://github.com/brunoerg/bitcoin-core-notes/blob/main/general-notes/net_processing_version_handshake.md) into the version handshake. Sometimes referred to as "the dance", this is the process by which a bitcoin node introduces itself to another node to begin sharing p2p data.


# Lightning

#### Route Blinding
Vanilla lightning payments have great privacy properties for the sender of a payment, but quite bad privacy for the recipient. [Route blinding](https://github.com/lightning/bolts/blob/route-blinding/proposals/route-blinding.md) is a proposal to fix this gap. It works by having the payment recipient conceal the last few hops of the payment route using cryptographic blinding. And after 2.5 long years it's [almost ready](https://twitter.com/realtbast/status/1603053124356390914) for use in the real world!

#### Opening and announcing a pre-taproot LN channel
Elle Mouton drops another [🔥 blog post](https://ellemouton.com/posts/open_channel_pre_taproot/) chock full of diagrams all about the steps required to open a lightning channel today (pre-taproot).

# Signing Device
#### Secure Elements & Blind Oracles
Many hardware wallets such Ledger and ColdCard (but notably not Trezor) use a secure element, which is a tiny piece of hardware inside the device that is specially designed to keep your private keys safe from attackers with access to the hardware. The Blockstream Jade wallet takes a completely different approach, using a dedicated server operated by Blockstream in place of a secure element. Triangle BitDevs host Jesse will compare and contrast these two approaches to hardware device security.


# Chaumian Ecash
#### Cashabi
[Cashabi](https://lontivero.github.io/Wiki/html/cashabi.html) is a new proposal that issues eCash tokens backed by WabiSabi coinjoin credentials that can be redeemed for post-coinjoin UTXOs. What could be better than combining the fantastic privacy benefits of eCash with the fantastic privacy benefits of CoinJoin? How about doing all the E2E encrypted messaging using disposable nostr identities? 🥸

# Miscellaneous
- [Bitcoin technical search](https://bitcoinsearch.xyz/)
- [Mempool block audit view](https://mempool.space/docs/faq#what-is-block-health)
- **Ordinal Inscriptions: NFTs on bitcoin.** [ordinals.com](https://ordinals.com) is a site to browse ordinal inscriptions, a new NFT scheme built on bitcoin by SF BitDevs host [@rodarmor](https://twitter.com/rodarmor). Ordinal theory is a scheme to number and track every satoshi based on its issuance date. Inscriptions are a scheme to associate on-chain metadata to a single satoshi ordinal. The data is stored in the tx witness script, leading to heated debates about whether inscriptions are a good or bad thing. The debate is sure to heat up after this [absolute unit](https://ordinals.com/inscription/0301e0480b374b32851a9462db29dc19fe830a7f7d7a88b81612b9d42099c0aei0) of an inscription took up [almost an entire bitcoin block](https://mempool.space/block/0000000000000000000515e202c8ae73c8155fc472422d7593af87aa74f2cf3d).
