+++
title = "Socratic Seminar 23"
date = 2023-11-08
template = "page.html"
aliases = [
  "2023-11-08-socratic-seminar-23",
  "/2023-11-08-socratic-seminar-23/",
  "/2023/11/08/socratic-seminar-23"
]

[extra]
event_type = "socratic"
meetup = "https://www.meetup.com/triangle-bitdevs/events/297114906/"
+++


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

Bitcoin and Lightning protocol researcher [Antoine Riard](https://github.com/ariard) dropped a [new lightning attack](https://lists.linuxfoundation.org/pipermail/bitcoin-dev/2023-October/021999.html) on the mailing list. The attack requires two malicious LN nodes on either side of a routing node to withhold the HTLC preimage from the victim node and continually replace the victim's channel close transaction in the mempool until the timelock expires. Every LN node implementation has implemented fixes to mitigate the attack, but there is currently no way to completely eliminate the risk. [SatsBridge](https://twitter.com/satsbridge) has published an [article](https://medium.com/@satsbridge/lightning-replacement-cycling-attack-explained-45636e41bc6f) explaining the attack with lots of helpful diagrams.

# Privacy

#### Payjoin Receive in Mutiny Wallet

[Dan Gould](https://bitgould.com/) has opened a draft PR to [add payjoin receive](https://github.com/MutinyWallet/mutiny-node/pull/820) to Mutiny Wallet. This exciting development has the potential to improve the best [lightning privacy wallet](https://www.mutinywallet.com/) with [payjoin](https://bitcoinops.org/en/topics/payjoin/), an opportunistic privacy technique that obfuscates the on-chain transaction graph with every payment.

# Miscellaneous

#### Durabit: A Bitcoin-native Incentive Mechanism for Data Distribution

[Some guy](mailto:someguy@durabit.org) released a white paper describing [Durabit](https://github.com/4de67a207019fd4d855ef0a188b4519c/Durabit/blob/main/Durabit%20-%20A%20Bitcoin-native%20Incentive%20Mechanism%20for%20Data%20Distribution.pdf), an incentive-compatible decentralized solution to the data availability problem. It uses a bitcoin bond to reward participants for seeding a bittorrent file. The protocol relies on two distinct parties to accomplish this: the bond issuer creates a series of presigned [CSV](https://bitcoin.stackexchange.com/questions/38845/what-does-op-checksequenceverify-op-csv-do) timelocked bitcoin transactions payable to a [chaumian ecash mint](https://thebitcoinmanual.com/articles/chaumian-ecash-bitcoin/), which is in charge of compensating torrent seeders using the bond funds. The bond issuer encodes the bittorrent magnet link into an [OP_RETURN](https://opcodeexplained.com/opcodes/OP_RETURN.html) output and is capable of revoking the bond by double spending the next presigned transaction. Not only is the author an anonymous nym, but they dropped the whitepaper via an [ordinal inscription](https://ordinals.com/content/1e64e8a28ffec452661fa9a864454931806d35fec302ba2dcd42a900b6ca46c9i0). Cypherpunk af. 🤘

#### Opcode Explained

[Opcode Explained](https://opcodeexplained.com/) is a new site by [BDK](https://bitcoindevkit.org/) contributor [Thunderbiscuit](https://github.com/thunderbiscuit) that explains every opcode. Or aims to, it is [80% complete](https://njump.me/nevent1qqsqky6c2wlhcqvffkzdxxgleecpajtkhcuzgw88g3t0q3f442rmt3spzpmhxue69uhkumewwd68ytnrwghszxthwden5te0wfjkccte9eekummjwsh8xmmrd9skctcpz4mhxue69uhhyetvv9ujuerpd46hxtnfduhsz8thwden5te0dehhxarj9e3xjarrda5kuetj9eek7cmfv9kz7qg4waehxw309aex2mrp0yhxummnw3ezucn89uq32amnwvaz7tmwdaehgu3wdau8gu3wv3jhvtcpremhxue69uhkummnw3ez6ur4vgh8wetvd3hhyer9wghxuet59uq3qamnwvaz7tmwdaehgu3wd4hk6tcppemhxue69uhkummn9ekx7mp0qyv8wumn8ghj7mn0wd68ytnxd46zuamf0ghxy6t69u0n72hj). You can expect to see many more links to this site from ours in the future!
