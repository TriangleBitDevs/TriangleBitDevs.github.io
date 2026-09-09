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

Special focus this month. The biggest story in bitcoin since the last seminar — and still live.

- [Mempool: Liquid got got — 4000 BTC unauthorized withdrawal](https://x.com/mempool/status/2096689540488683952)
- [on-chain: the ~4,000 BTC peg-out via SideSwap](https://blockstream.info/liquid/tx/ce4caece413cd9d444ce7ed9f54e5b328b3da5e4af301aff59a3571f76e988f2)
- [Liquid's official incident report: range-proof cache flaw in Elements, no keys compromised, reserve ~4,205 BTC → 197 BTC](https://x.com/Liquid_BTC/status/2097404704028545175)
- [LLFOURN: Liquid Incident Brief — independent chain tracking](https://liquid-incident-brief-llf-20260906.fly.dev/)
- the on-chain negotiation, in the operator's own OP_RETURNs:
  - [message tx: "we are whitehats. contact us on chain"](https://mempool.space/tx/c103de95817b43f2df635ec6f35ff126ca26a7c6d20570c4b01866b2b3e69a19)
  - [Mononaut: new OP_RETURN message(s) surfacing](https://x.com/mononautical/status/2096805707245081017)
  - ["sending most back to bc1qdlld6…, is that ok" — 1,000-sat ping](https://mempool.space/tx/3a3eac4a26395b8c2563aaf1eb8b1b77798c81c7d6337f51321827a244a480aa)
  - [3,400 BTC returned to the federation peg wallet](https://mempool.space/tx/a6d697a25266ce3c78774fd1d75f896b7af522ada209b0f6228ea497bc49a46d)
  - PGP-encrypted payloads in between — not reproduced by anyone
  - [Sep 9: authenticated OP_RETURN demands a 10% bounty; ~598.5 BTC consolidated back to the operator, not returned](https://mempool.space/tx/f7055f6c8dd00f404e48c12483ae740180f658db206733505bb27b015e579588)
- [Elements v23.3.4 emergency release: harden range proof cache keys, add -norangeproofcache](https://github.com/ElementsProject/elements/releases/tag/elements-23.3.4)
  - [PR #1600: sigcache hardening](https://github.com/ElementsProject/elements/pull/1600)
- [Guillemet: "if this was ever a negotiated reward … it looks more like extortion than white-hat hacking"](https://x.com/P3b7_/status/2096998672206647806)
- discussion:
  - the "is that ok" message, an 85% return before any payment, and then a plaintext 10% bounty demand — is that extortion, ransom-style bargaining, or theft with a claim of right? where's the threat?
  - the 15% holdback is authenticated to the operator key, but the PGP payloads are unreproduced. what evidence would actually settle the white-hat vs. extortion framing?
  - no federation keys compromised — the failure was a range-proof cache key collision at the transaction layer. what does that say about federated sidechain custody vs. self-custody on L1?
  - the network is still offline and the invalid peg-out has not been rejected. who bears the shortfall risk while ~598.5 BTC stays with the operator?

# Bitcoin Core

- [Bitcoin Core HWI repo wind down](https://github.com/bitcoin-core/HWI/issues/850)
- [static-pie release binaries available for testing](https://groups.google.com/g/bitcoindev/c/UgGHs-_YGvw)
- [Bitcoin Core 30.3 released](https://groups.google.com/g/bitcoindev/c/lbP-2Qug8bY)
- [Bitcoin Core 29.4 released](https://groups.google.com/g/bitcoindev/c/7C1_GwgAg0Q)
- [libsecp256k1 v0.8.0 released](https://groups.google.com/g/bitcoindev/c/VJOI7D0Jsjs)
- [txindex: hash keys and pack positions to reduce disk usage](https://github.com/bitcoin/bitcoin/pull/35531)

# Soft Forks and New BIPs

- [BIP458: Half-Aggregation of BIP 340 Signatures](https://github.com/bitcoin/bips/pull/2205)
- [BIP459: DahLIAS fully aggregated signatures for secp256k1](https://github.com/bitcoin/bips/pull/2210)
- [BIP460: CISA for Taproot Key Path Spends](https://github.com/bitcoin/bips/pull/2212)
- [BIP461: Deterministic ECDSA Signatures](https://github.com/bitcoin/bips/pull/2224)

# Post-Quantum and Cryptography

- [SHRINCS draft BIP](https://github.com/SHRINCS/shrincs-bip/blob/main/SHRINCS.md)
- [using formal verification tools on libshrincs](https://x.com/n1ckler/status/2087562757079982429)
- [DropKick: a minimal commit/reveal PQ rescue protocol](https://groups.google.com/g/bitcoindev/c/6SqWPfBf-p0)
  - [conduition: Dropkick writeup](https://conduition.io/bitcoin/dropkick/)

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

- [OpenSats announces priority support for Bitcoin Red Team](https://opensats.org/blog/code-red-supporting-first-responders)
