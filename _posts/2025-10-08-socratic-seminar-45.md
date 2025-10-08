---
layout: post
type: socratic
title: "Socratic Seminar 45"
meetup: https://lu.ma/s92b16kt
add_to_calendar: true
start: 2025-10-08T22:00:00Z
end: 2025-10-09T00:00:00Z
location: "FCAT Demo Room, Fidelity Investments, 100 New Millennium Way, Durham, NC 27709"
description: "BitDevs is a place for open discussion of the technical aspects of bitcoin and related protocols. Be advised: discussion will be technical. Please RSVP or email trianglebitdevs at protonmail dot com to confirm your attendance. You will be required to show ID to the security guard to gain admission, but you do not need to RSVP in public."
---

We will start with introductions, cover some basic ground rules, and then jump into technical discussions. Topics include aspects of the Bitcoin protocol, new research developments, recent news, and software developments.

Please note the meeting location in FCAT Demo Room at 100 New Millennium Way, Durham, NC 27709, USA.

# Announcements

- no pictures or recordings
- follow the [chatham house rule](https://en.wikipedia.org/wiki/Chatham_House_Rule)
  - discuss what was said, not who said it
- don't be a jerk
- thank you to our sponsor [Fidelity Investments](https://www.fidelity.com/)
- introductions

# Bitcoin Core

- [Proposal](https://github.com/bitcoin/bips/pull/1985) to define scripts for mempool policy
- [PortlandHODL](https://github.com/portlandhodl) dropped a [soft fork proposal](https://groups.google.com/g/bitcoindev/c/YO8ZwnG_ISs/m/nU25_cBCAgAJ) teaser
  - attempts to limit spam by limiting scriptPubKey outpoint size to 520 bytes in legacy script
- Bitcoin 30rc3 [Testing Guide](https://github.com/bitcoin-core/bitcoin-devwiki/wiki/30.0-Release-Candidate-Testing-Guide)
- Great Script Restoration [BIP proposals](https://groups.google.com/g/bitcoindev/c/GisTcPb8Jco/m/8znWcWwKAQAJ)

# Wallets

- Sparrow Wallet [v2.3.0](https://github.com/sparrowwallet/sparrow/releases/tag/2.3.0)
  - supports sending to silent payment addresses and BIP353 DNS addresses! \o/
- Payjoin Dev Kit [1.0.0-rc.0](https://github.com/payjoin/rust-payjoin/releases/tag/payjoin-1.0.0-rc.0)

# Mining

- SRI 1.5.0 [release notes](https://github.com/stratum-mining/stratum/releases/tag/v1.5.0)
- Hashpool deployment on testnet4!
  - [Pool Website](https://pool.hashpool.dev)
  - [Proxy Website](https://proxy.hashpool.dev)

# Miscellaneous

- [Tropic Square](https://tropicsquare.com/) secure element TROPIC01 dropped
  - more open secure element
  - developer support with no NDA
- Pieter Wuille recently [responded](https://delvingbitcoin.org/t/response-to-pieter-wuilles-stackexchange-answer-re-nuking-the-opreturn-filter/1991/11) to questions and criticisms around his perspectives about spam and OP_RETURN
