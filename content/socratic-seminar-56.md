+++
title = "Socratic Seminar 56"
date = 2026-09-09
template = "page.html"
aliases = [
  "2026-09-09-socratic-seminar-56",
  "/2026-09-09-socratic-seminar-56/",
  "/2026/09/09/socratic-seminar-56"
]

[extra]
event_type = "socratic"
add_to_calendar = true
start = "2026-09-09T22:00:00Z"
end = "2026-09-10T00:00:00Z"
location = "Fidelity Investments, 100 New Millennium Way, Durham, NC 27709"
description = "BitDevs is a place for open discussion of the technical aspects of bitcoin and related protocols. Be advised: discussion will be technical. Please RSVP or email trianglebitdevs at protonmail dot com to confirm your attendance. You will be required to show ID to the security guard to gain admission, but you do not need to RSVP in public."
+++

We will start with introductions, cover some basic ground rules, and then jump into technical discussions.

Please note the meeting location is at 100 New Millennium Way, Durham, NC 27709, USA.

# Announcements

- no pictures or recordings
- follow the [chatham house rule](https://en.wikipedia.org/wiki/Chatham_House_Rule)
  - discuss what was said, not who said it
- don't be a jerk
- thank you to our sponsor [Fidelity Investments](https://www.fidelity.com/)
- introductions

# The Liquid Hack

Special focus this month. The biggest story in bitcoin since the last seminar.

- [Mempool: Liquid got got — 4000 BTC unauthorized withdrawal](https://x.com/mempool/status/2096689540488683952)
- [on-chain: the 4,000 BTC withdrawal](https://blockstream.info/liquid/tx/ce4caece413cd9d444ce7ed9f54e5b328b3da5e4af301aff59a3571f76e988f2)
- [mempool.space: related consolidation transaction](https://mempool.space/tx/c103de95817b43f2df635ec6f35ff126ca26a7c6d20570c4b01866b2b3e69a19)
- [LLFOURN: Liquid Incident Brief](https://liquid-incident-brief-llf-20260906.fly.dev/)
- discussion:
  - roughly 4,000 BTC in an unauthorized withdrawal, reported down to zero — whose balance is drained, and what is the blast radius for Liquid users?
  - Liquid is a federation of functionaries. who holds these keys, how were they compromised, and what does an "unauthorized withdrawal" mean for the federation model?
  - does this hurt the case for sidechains and federated layers, or is it just another exchange/wallet custody failure?
  - what, if anything, can bitcoin users actually verify about peg-in and pegged-out balances?

# Bitcoin Core

- [Bitcoin Core HWI repo wind down](https://github.com/bitcoin-core/HWI/issues/850)
- [static-pie release binaries available for testing](https://groups.google.com/g/bitcoindev/c/UgGHs-_YGvw)
- [Bitcoin Core 30.3 released](https://groups.google.com/g/bitcoindev/c/lbP-2Qug8bY)
- [Bitcoin Core 29.4 released](https://groups.google.com/g/bitcoindev/c/7C1_GwgAg0Q)
- [libsecp256k1 v0.8.0 released](https://groups.google.com/g/bitcoindev/c/VJOI7D0Jsjs)
- [txindex: hash keys and pack positions to reduce disk usage](https://github.com/bitcoin/bitcoin/pull/35531)

# Soft Forks and New BIPs

- [BIP452: P2P UTXO Set Sharing](https://github.com/bitcoin/bips/pull/2137)
- [BIP458: Half-Aggregation of BIP 340 Signatures](https://github.com/bitcoin/bips/pull/2205)
- [BIP459: DahLIAS fully aggregated signatures for secp256k1](https://github.com/bitcoin/bips/pull/2210)
- [BIP460: CISA for Taproot Key Path Spends](https://github.com/bitcoin/bips/pull/2212)
- [BIP461: Deterministic ECDSA Signatures](https://github.com/bitcoin/bips/pull/2224)

# The BIP 110 Chain Split

- [BIP-110 monitoring stream: mandatory signaling start](https://b10c.me/projects/028-bip110-monitoring-livestream/)
- [BIP110 Late-Upgrade Chainstate Validation Gap](https://blockslop.dev/)
- [OCEAN accused of hashrate hijacking over BIP110](https://xcancel.com/ocean_mining/status/2086623170883399921)
- [Inside OCEAN Mining during the BIP110 chain split — Bob Burnett interview](https://youtu.be/RGexQJfDh5Y)
- [motion to remove Luke Dashjr from BIP Editors](https://groups.google.com/g/bitcoindev/c/knbv3MFwlvU)
- [PR: Remove Luke from BIP Editors](https://github.com/bitcoin/bips/pull/2248)
- [joint statement: Luke Dashjr has separated from OCEAN](https://www.prnewswire.com/news-releases/joint-statement-of-ocean-and-luke-dashjr-302864347.html)
- [RIP-110: every Bitcoin transaction is a JPEG](https://x.com/lifofifo/status/2081456509825810794)
- discussion:
  - mandatory signaling has started — which nodes actually enforce it, and how deep does the split run?
  - what does the OCEAN hashrate-allegation controversy say about miner coordination around soft forks?
  - RIP-110 has everyone stuffing JPEGs into OP_RETURN; spam or a live stress test of the network?

# Post-Quantum and Cryptography

- [SHRINCS draft BIP](https://github.com/SHRINCS/shrincs-bip/blob/main/SHRINCS.md)
- [using formal verification tools on libshrincs](https://x.com/n1ckler/status/2087562757079982429)
- [DropKick: a minimal commit/reveal PQ rescue protocol](https://groups.google.com/g/bitcoindev/c/6SqWPfBf-p0)
  - [conduition: Dropkick writeup](https://conduition.io/bitcoin/dropkick/)
- [Lattice-based Signature Schemes for Bitcoin](https://eprint.iacr.org/2026/1628.pdf)

# Lightning Network

- [Boltz: swap services "disabled until further notice"](https://x.com/Boltzhq/status/2084311537502630319)
  - [Boltz says it was just an oversight](https://x.com/Boltzhq/status/2084980509642281288)
  - [update on the future of Boltz](https://x.com/Boltzhq/status/2087636521746674168)
  - [Boltz and ZeusLSP temporarily shut down swap services](https://stacker.news/items/1539276)
  - [canary expires](https://stacker.news/items/1540499)
- [Threshold multisig lightning channels](https://eprint.iacr.org/2026/1757)
- [Disclosure: LND doesn't wait for enough confirmations when closing channels](https://delvingbitcoin.org/t/disclosure-lnd-doesnt-wait-for-enough-confirmations-when-closing-channels)
- [Disclosure: crashing CLN with a flood of pings](https://delvingbitcoin.org/t/disclosure-crashing-cln-with-a-flood-of-pings/2846)
  - [CLN v26.06.7 point release](https://x.com/Snyke/status/2092989040098181170)
- discussion: if a swap service's hot wallet can be drained or disabled, what does that mean for swap-based self-custody UX?

# Ark

- [Elle Mouton: Ark, vTXOs, and trees — a full primer](https://www.ellemouton.com/posts/ark-vtxos-and-trees/)
- [Minerva Mint: Ark-backed Cashu ecash](https://minervamnt.xyz/)
- [bark new releases](https://second.tech/docs/changelog#25-august-2026)

# Payjoin and Privacy

- [Announcing Payjoin 1.0 — Payjoin Dev Kit](https://payjoin.org/blog/2026/08/12/announcing-payjoin-1-0/)
  - [payjoin-1.0.0 release](https://github.com/payjoin/rust-payjoin/releases/tag/payjoin-1.0.0)
- [Silent Payments Sender: BIP352 plugin for Electrum](https://delvingbitcoin.org/t/silent-payments-sender-bip352-plugin-for-electrum/2743)

# Signing Devices and Self Custody

- [The DIY Signing Device Revolution is Just Beginning](https://github.com/kdmukai/article-diy-signing-device-summit/blob/main/article.md)
- [MARA: 9K bitcoin rescued out of Coldcard multisigs via Slipstream](https://foundation.mara.com/articles/9k-bitcoin-rescued-out-of-coldcard-multisigs)
- [Tracing the attacker's steps through 1,082 BTC Coldcard drain](https://praveenperera.com/blog/coldcard-mk3-weak-rng-wave1/)
- [live dashboard mapping the ongoing Coldcard attack](https://cktripwire.com/)
- [Trezor: recent customer data exposed in shipping provider incident](https://trezor.io/blog/news/recent-customer-data-exposed-in-shipping-provider-incident)

# Wallets and Apps

- [higherMark desktop/web app demo](https://www.highermark.xyz/)
  - [4thSol: hm-app](https://www.4thsol.online/hm-app)
- [BTCPay Server security incident: our response and next steps](https://x.com/BtcpayServer/status/2086875402572562755)
  - [critical vulnerability being actively exploited](https://x.com/BtcpayServer/status/2085755643659522240)
  - [BTCPay Server v2.4.2 released](https://github.com/btcpayserver/btcpayserver/releases/tag/v2.4.2)
- [Sparrow 2.5.4](https://github.com/sparrowwallet/sparrow/releases/tag/2.5.4)
- [Peach is at a crossroads](https://peachbitcoin.com/blog/peach-at-a-crossroads/)
- [Glow: a bitcoin app for everyone, built on the Breez SDK](https://breez.technology/glow)

# Mining

- [SpiderPool mines two blocks at same height 963853](https://bnoc.xyz/t/spiderpool-mines-two-blocks-at-same-height-963853/166)
- [Miner leaves full subsidy unclaimed](https://x.com/0xB10C/status/2091876396683452736)
- [RY3T NOVA: the first product built on Mujina](https://www.256foundation.org/newsroom/ry3t-nova)

# Miscellaneous

- [new OP_RETURN message(s) surfacing](https://x.com/mononautical/status/2096805707245081017)
- [OpenSats announces priority support for Bitcoin Red Team](https://opensats.org/blog/code-red-supporting-first-responders)
