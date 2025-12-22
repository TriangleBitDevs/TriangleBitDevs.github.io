+++
title = "Socratic Seminar 34"
date = 2024-11-13
template = "page.html"
aliases = [
  "2024-11-13-socratic-seminar-34",
  "/2024-11-13-socratic-seminar-34/",
  "/2024/11/13/socratic-seminar-34"
]

[extra]
event_type = "socratic"
meetup = "https://www.meetup.com/triangle-bitdevs/events/304378293/?action=rsvp&eventOrigin=onboarding"
nostr = "https://njump.me/naddr1qqyryctzv9nxxdrxqydhwumn8ghj7mn0wd68ytnnwa5hxuedv4hxjemdvyhxx6qzyqu2k0euqcpj4um9xkt8e94ugnkhffrw6a39t85mgk382p9qwc53sqcyqqq8evca2y5x4"
+++


We will start with introductions, some basic ground rules, and jump into technical discussions. We will cover aspects of the bitcoin protocol, new research developments, recent news, and software developments.

Please note the meeting location at Mad Science of the Triangle in Cary.

# Announcements

- no pictures or recordings
- chatham house rules
- don't be a dick
- thank you to our sponsor [Lolli](https://www.lolli.com/)
- introductions

# Bitcoin
- [2023 Brink Annual Report](https://brink.dev/blog/2024/09/25/2023-annual-report/)
  - covers the contributions of the 6 bitcoin core contributors that Brink funds
  - focuses primarily on code review and testing rather than headline-grabbing projects
- MuSig2 module [merged](https://github.com/bitcoin-core/secp256k1/pull/1479) into libsecp256k1!
  - Jonas Nick wrote a great [tweet](https://x.com/n1ckler/status/1843311745860849940) with links to docs and example code.
- [Hash-Based Signature Schemes for Post-Quantum Bitcoin](https://conduition.io/cryptography/quantum-hbs/)
- [Analyzing Bitcoin Consensus: Risks in Protocol Upgrades](https://github.com/bitcoin-cap/bcap)
- Greg Sanders [tweet](https://x.com/theinstagibbs/status/1856511178261868616) celebrating the merging of the [Ephemeral Dust](https://github.com/bitcoin/bitcoin/pull/30239) PR

# Lightning
- [Spark.info](https://www.spark.info/) is Lightspark's new stablecoin wallet
  - youtube video [overview](https://www.youtube.com/watch?v=4LesNBQwKxw)
- BOLT12 offers [merged](https://github.com/lightning/bolts/pull/798) after 4 long years! 🎉
- [DePix](https://bitcoinnews.com/press-release/joltz-eulen-stablecoin-on-lightning-depix/) is the first natively issued stablecoin on Lightning
  - Built using [Taproot Assets](https://github.com/lightninglabs/taproot-assets)

# Covenants
- OG Wei Dai on twitter [discusses](https://x.com/_weidai/status/1843526255045685253) the PIPES paper and the possibility of bitcoin covenants powered by functional encryption
- [ColliderScript: Covenants in Bitcoin via 160-bit hash collisions](https://colliderscript.co/colliderscript.pdf)
- another Jonas Nick banger about his [GSR script tool](https://x.com/n1ckler/status/1854552545084977320)

# Ark
- Ark Labs: [Unlocking Liquidity Before Shared Output Expiration](https://arkdev.info/blog/unlock-liquidity-before-shared-output-expiration/)
- Second: [Package relay: One free adult with each child](https://blog.second.tech/bitcoin-package-relay-and-ark-protocol/)

# Mining
- [DATUM](https://ocean.xyz/docs/datum) is a new block template selection protocol launched by Ocean Mining
  - [released on Umbrel](https://apps.umbrel.com/app/datum)

# Miscellaneous
- [BTCPay Server 2.0 release](https://blog.btcpayserver.org/btcpay-server-2-0/)
- Bitkey: [Building in the open: a novel design for smartphone-based bitcoin wallets](https://bitkey.build/building-in-the-open/)
- Saving Satoshi [bitcoin script playground](https://script.savingsatoshi.com/)
- [Libbitcoin for Core People](https://delvingbitcoin.org/t/libbitcoin-for-core-people/1222?u=antoinep)
