+++
title = "Socratic Seminar 55"
date = 2026-08-12
template = "page.html"
aliases = [
  "2026-08-12-socratic-seminar-55",
  "/2026-08-12-socratic-seminar-55/",
  "/2026/08/12/socratic-seminar-55"
]

[extra]
event_type = "socratic"
luma = "https://luma.com/to12kxpl"
add_to_calendar = true
start = "2026-08-12T22:00:00Z"
end = "2026-08-13T00:00:00Z"
location = "Fidelity Investments, 100 New Millennium Way, Durham, NC 27709"
description = "BitDevs is a place for open discussion of the technical aspects of bitcoin and related protocols. Be advised: discussion will be technical. Please RSVP or email trianglebitdevs at protonmail dot com to confirm your attendance. You will be required to show ID to the security guard to gain admission, but you do not need to RSVP in public."
+++

We will start with introductions, cover some basic ground rules, and then jump into technical discussions.

Please note the meeting location is in room APEX 1 at 100 New Millennium Way, Durham, NC 27709, USA.

# Announcements

- no pictures or recordings
- follow the [chatham house rule](https://en.wikipedia.org/wiki/Chatham_House_Rule)
  - discuss what was said, not who said it
- don't be a jerk
- thank you to our sponsor [Fidelity Investments](https://www.fidelity.com/)
- introductions

# Discussion Topics

# Self Custody

Special focus this month.

- [Coinkite security advisory: Coldcard Mk3 seed generation warning](https://blog.coinkite.com/coldcard-mk3-seed-generation-warning/)
- [Block: predictable RNG fallback and 32-bit reseed in Coldcard firmware](https://engineering.block.xyz/blog/predictable-rng-fallback-and-32-bit-reseed-in-coldcard-firmware)
- [btc++ insider: when randombytes runs but doesn't](https://insider.btcpp.dev/p/when-randombytes-runs-but-doesnt)
- [the reddit post that started it](https://www.reddit.com/r/Bitcoin/comments/1vatgl4/full_panic_one_of_my_wallets_was_drained/)
- [CoinDesk: 594 BTC swept in 25 minutes](https://www.coindesk.com/tech/2026/07/31/major-bitcoin-wallet-flaw-drains-594-btc-in-25-minute-sweep)
- [Kevin Loaec's analysis](https://x.com/KLoaec/status/2082926304995762209)
- [Rob Hamilton's analysis](https://x.com/Rob1Ham/status/2082896614218203616)
- move funds off Coldcard single sig and Coldcard-only multisig ASAP
- discussion:
  - the firmware checked whether the hardware RNG setting *existed*, not whether it was *on*, and shipped that way from March 2021. how does that survive five years of review?
  - the affected seeds came from a pool of roughly a trillion candidates. could anyone have detected that from outside the device?
  - does multisig help when every signer is the same vendor and the same firmware?
  - what can a user actually verify about entropy on a sealed device?

# Seed Generation and Entropy

- [How to safely roll dice for your bitcoin seed](https://mblack.io/posts/how-to-safely-roll-dice-for-your-bitcoin-seed/)
- [button mashing entropy for Coldcard](https://x.com/roasbeef/status/2083265977048059988)
- [SeedPicker: draw your seed words out of a hat](https://seedpicker.net/guide/GUIDE.html)
- [Seed Picker Solitaire: seed generation from a deck of cards](https://jimbojw.github.io/seed-picker-solitaire/seed-picker-solitaire.pdf)
- [printable BIP-39 wordlist for dice and coin flips](https://github.com/hatgit/BIP39-wordlist-printable-en)
- discussion: how do you compute the checksum word without trusting a device or a website?

# BIP-110 and Chain Splits

Mandatory signaling is projected to begin at block 961,632, somewhere between August 7 and August 15 - likely the same week as this seminar.

- [bip110.org signaling monitor](https://bip110.org/monitor)
- [BIP-110 monitor and simulator](https://delvingbitcoin.org/t/bip110-monitor-simulator/2746)
- [CoinDesk: fork deadline nears with miner support at zero](https://www.coindesk.com/tech/2026/07/12/bitcoin-s-bip-110-fork-deadline-nears-with-miner-support-at-zero)
- [Jason Hughes: BIP-110, my notes to miners](https://x.com/wk057/status/2077444826232955365)
- [Bitcoin Magazine: the soft fork that tried to police "junk data", and why it's already failing](https://bitcoinmagazine.com/technical/the-bitcoin-softfork-that-tried-to-police-junk-data-and-why-its-already-failing)
- [Murch: on the lack of replay protection](https://murch.one/posts/replay-protection/)
- [calle: two forks are coming, here's how to stay safe](https://x.com/callebtc/status/2076245203568988533)
- [Paul Sztorc's "eCash" BIP300/301 hard fork also targets August](https://ecash.com/)
- discussion:
  - what does a chain split do to a UTXO you already hold?
  - is mandatory signaling a soft fork with teeth, or a hard fork wearing a hat?
  - what, if anything, should a self-custody user do before block 961,632?

# Bitcoin Core

- [validation: fetch block input prevouts in parallel during ConnectBlock](https://github.com/bitcoin/bitcoin/pull/35295)
- [Stale Tip P2P message BIP draft](https://github.com/pseudoramdom/bips/blob/staletip-bip-draft/bip-staletip.md)
  - [bitcoin-dev thread](https://groups.google.com/g/bitcoindev/c/AwOPNxF15mU)
- [Bitcoin Core 31.1 released](https://bitcoincore.org/en/releases/31.1/)
- [doc: add an AI contribution policy](https://github.com/bitcoin/bitcoin/pull/35386)
- [Private Broadcast may reveal sender IP address](https://bitcoincore.org/en/2026/06/06/privatebroadcast-ip-leak/)
- [silentpayments module implementing BIP352 merged into libsecp256k1](https://github.com/bitcoin-core/secp256k1/pull/1765)
- maintainer turnover: [sipa deletes his DNS seed](https://github.com/bitcoin/bitcoin/pull/35691) and [removes himself as a security contact](https://github.com/bitcoin/bitcoin/pull/35695), [jonasnick steps down from secp256k1](https://github.com/bitcoin-core/secp256k1/pull/1884), [theStack takes over](https://github.com/bitcoin-core/secp256k1/pull/1887)

# Covenants

- [Ark + OP_TEMPLATEHASH: a covenant-enabled bark wallet on signet](https://templatehash.com/)
  - [BIP 446: OP_TEMPLATEHASH](https://github.com/bitcoin/bips/blob/master/bip-0446.md)
  - [bark](https://gitlab.com/ark-bitcoin/bark)
- [Bitcoin Inquisition 29.4 activated OP_TEMPLATEHASH on signet at block 314,928](https://delvingbitcoin.org/t/bitcoin-inquisition-29-4/2739)
- [BIP 448: Taproot-native (re)bindable transactions](https://github.com/bitcoin/bips/blob/master/bip-0448.md)
  - [collected BIP-448 tooling and proof-of-concept repos](https://github.com/bip448)
- [input-triggered transaction expiry](https://delvingbitcoin.org/t/input-triggered-transaction-expiry/2667)

# Mining

- [a clockless vardiff strands a slowing miner](https://delvingbitcoin.org/t/research-a-clockless-vardiff-strands-a-slowing-miner/2718)
- [SRI interoperability test library](https://github.com/stratum-mining/interoperability-tests-sv2/issues/1)
- [Bitcoin after block rewards: preventing miner deviation as the subsidy approaches zero](https://arxiv.org/abs/2606.05503)
  - [Delving discussion](https://delvingbitcoin.org/t/research-bitcoin-after-block-rewards-preventing-miners-deviation-when-the-bitcoin-rewards-is-zero/2626)
- [F2Pool mines two blocks at height 956,337](https://bnoc.xyz/t/f2pool-mines-two-blocks-at-height-956337/147)
- [Merge Mining Monitor](https://mmm.deadmanoz.xyz)
- [the Mined in America Act](https://www.therage.co/mined-in-america-act-bitcoin-at-risk/)
- [reverse engineering the Canaan Avalon Nano3S](https://github.com/CryptoIceMLH/Nano3S)

# Ecash

- [CDK: mint quote lookup by public key](https://github.com/cashubtc/cdk/pull/1834)
  - [NUT-XX: get quotes by pubkeys](https://github.com/cashubtc/nuts/pull/341)
- [NUT-06: require signed mint info](https://github.com/cashubtc/nuts/pull/416)
- [NUT-XX: efficient wallet recovery](https://github.com/cashubtc/nuts/pull/342)
- [NUT-CTF-settle: multi-party atomic settlement](https://github.com/cashubtc/nuts/pull/412)

# Privacy

- [silent payments harvest-now-decrypt-later attack](https://conduition.io/cryptography/hndl-silent-payments/)
- [Sparrow 2.5.0 adds silent payment receives](https://github.com/sparrowwallet/sparrow/releases/tag/2.5.0)
- [Babilonia: probabilistic coinjoin and covert betting](https://delvingbitcoin.org/t/babilonia-probabilistic-coinjoin-and-covert-betting/2704)

# Miscellaneous

- [notice of ICANN .bitcoin TLD community application](https://x.com/wiz/status/2085029140453830725)
- [Bitcoin Security Consortium announced](https://x.com/BTCconsortium/status/2080262540047585543)
- [BitMEX shuts down](https://www.bitmex.com/blog/bitmex-closure)
