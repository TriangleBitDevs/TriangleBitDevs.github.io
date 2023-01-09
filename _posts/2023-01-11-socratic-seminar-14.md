---
layout: post
type: socratic
title: "Socratic Seminar 14"
meetup: https://www.meetup.com/triangle-bitdevs/events/290721619

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

**Alternative P2P Networks**

The bitcoin network spans across many different network architectures. The goal of this design is twofold: it offers improved privacy and censorship resistance to node runners as well as increasing the bitcoin network's resilience overall. For years bitcoin ran exclusively on IPv4. This changed when release [v0.7.0](https://bitcoin.org/en/release/v0.7.0) added IPv6 and tor support. I2P support was added in [v22.0](https://bitcoincore.org/en/releases/22.0/) and CJDNS in [v23.0](https://bitcoincore.org/en/releases/23.0/). In this [blog post](https://jonatack.github.io/articles/using-alternative-p2p-networks-with-bitcoin-core), core developer Jon Atack discusses the design of these networks, security and privacy tradeoffs, how to connect your node to these networks, and monitoring tools.


# Lightning

#### Privacy

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
- [SHA256 algorithm](https://sha256algorithm.com/) - Watch the SHA256 algorithm execute with a super slick visualization
- [Block Hardware Wallet Security Model](https://wallet.build/losing-your-keys-without-losing-your-coins/)
- [\[bitcoin-dev\] BIP Proposal: Wallet Labels Export Format](https://lists.linuxfoundation.org/pipermail/bitcoin-dev/2022-August/020887.html)
- [Border Wallets](https://www.borderwallets.com/) - quickly and easily memorize Bitcoin seed phrases
- [Bitcoin Treasuries](https://bitcointreasuries.net) - aggregated list of companies, funds, and countries that hold bitcoin.
- [Binary Watch](https://binarywatch.org/) - monitor checksums of various bitcoin binary releases

# Podcasts


#### Chaincode
Pieter Wuille and Tim Ruffing - This is a two part podcast featuring [Pieter Wuille](https://twitter.com/pwuille) and [Tim Ruffing](https://twitter.com/real_or_random). In [part 1](https://podcast.chaincode.com/2022/12/15/pieter-wuille-tim-ruffing-schnorr-musig-part1.html) they discuss Schnorr sigs, multisig, MuSig, and FROST. In [part 2](https://podcast.chaincode.com/2022/12/27/pieter-wuille-tim-ruffing-roast-aggregation-adaptor-sigs.html) they continue their discussion, touching on nesting, ROAST, signature half-aggregation, and adaptor sigs. In this dev's humble opinion Chaincode offers the highest signal bitcoin podcast out there; I never miss an episode and you shouldn't either. 😉
