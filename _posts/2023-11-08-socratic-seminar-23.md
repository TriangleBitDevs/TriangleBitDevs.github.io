---
layout: post
type: socratic
title: "Socratic Seminar 23"
meetup: https://www.meetup.com/triangle-bitdevs/events/297114906/
---

We will start with introductions, some basic ground rules, and jump into technical discussions. We will cover aspects of the bitcoin protocol, new research developments, recent news, and software developments.

Please note the meeting location at 4801 Glenwood Ave suite 200 in Raleigh, right above Fifth Third Bank.

# Announcements

- no pictures or recordings
- chatham house rules
- don't be a dick
- Hack Day - unstructured monthly in-person meetup for bitcoin builders
- thank you to our sponsor [Lolli](https://www.lolli.com/)
- introductions

# Bitcoin

#### Mastering Bitcoin 3rd Edition

Mastering Bitcoin is the quintessential guide for understanding bitcoin at a technical level. In the [3rd Edition](https://dtrt.org/posts/mb3e-announcement/), coauthored by [David Harding](https://njump.me/npub1syluunzwwmc70d85d9alzqc2jrc6pdur7xrax2vqpfxas6tljavsa46ksu), it receives a much needed update to include missing topics both old and new. All technologies that went into taproot are described, as well as a rewritten address section, fee management, compact blocks, soft fork activation methods, client-side validation protocols, and too many other awesome things to list them all. You should stop reading this and go put it in your shopping cart already.

#### bitcoin-dev Mailing List is Moving

In this bitcoin-dev [mailing list post](https://lists.linuxfoundation.org/pipermail/bitcoin-dev/2023-November/022134.html), [Bryan Bishop](https://twitter.com/kanzure) discusses why the mailing list needs to move and the possible future home for this community. The mailing list has moved before from Sourceforge.net to the Linux Foundation. Bishop discusses the importance of decentralized archiving using a service called "Public Inbox" which can be hosted by anyone and invites the community to offer feedback and propose solutions.

#### Bitcoin Core's Development Priorities in 2023

In this [article](https://yakihonne.com/article/naddr1qq24zd24x9xhqkpnt98rxdr4ge8ns533xcer2q3q6vzjeglr653mrmyqvu0trwaq29az753wr9th3hyrm5p63kz2zu8qxpqqqp65wzxcszp) Triangle BitDevs host [vnprc](https://njump.me/npub16vzjeglr653mrmyqvu0trwaq29az753wr9th3hyrm5p63kz2zu8qzumhgd) writes about a new strategy initiative for Bitcoin Core in 2023. A group of core developers have agreed to prioritize a short list of "big rock" projects that are both highly impactful and difficult to get merged. With two of the four big rocks merged into master in the last month it seems like this initiative has been very successful!

# Lightning

#### Timeout Trees

Mailing list contributor John Law [proposes](https://lists.linuxfoundation.org/pipermail/lightning-dev/2023-September/004092.html) a new way to batch open lightning channels using a simple covenant ([CTV](https://bitcoinops.org/en/topics/op_checktemplateverify/) or [APO](https://bitcoinops.org/en/topics/sighash_anyprevout/)) from a lightning service provider with a timeout expiration. This design allows the LSP to open a large number of channels for their users in a single on-chain transaction. Near the end of the channel's life the users can simply drain their channel balance into a new channel opened with a timeout tree. Bitcoin Magazine contributor [Shinobi](https://bitcoinmagazine.com/authors/shinobi) published a more accessible treatment of the topic [here](https://bitcoinmagazine.com/technical/timeout-trees-a-solution-to-scaling-lightning-network-lsps).

#### Replacement Cycling Attack

A new LN attack dropped to pwn your channel peers
https://lists.linuxfoundation.org/pipermail/bitcoin-dev/2023-October/021999.html
https://medium.com/@satsbridge/lightning-replacement-cycling-attack-explained-45636e41bc6f

#### Privacy

PR to add payjoin receive to Mutiny Wallet
https://github.com/MutinyWallet/mutiny-node/pull/820

#### Miscellaneous

Durabit: A Bitcoin-native Incentive Mechanism for Data Distribution
https://github.com/4de67a207019fd4d855ef0a188b4519c/Durabit/blob/main/Durabit%20-%20A%20Bitcoin-native%20Incentive%20Mechanism%20for%20Data%20Distribution.pdf
