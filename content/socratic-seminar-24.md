+++
title = "Socratic Seminar 24"
date = 2023-12-12
template = "page.html"
aliases = [
  "2023-12-12-socratic-seminar-24",
  "/2023-12-12-socratic-seminar-24/",
  "/2023/12/12/socratic-seminar-24"
]

[extra]
event_type = "socratic"
meetup = "https://www.meetup.com/triangle-bitdevs/events/297804391/"
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

#### Bitcoin Core 26.0

[Bitcoin Core 26.0](https://bitcoincore.org/en/releases/26.0/) was released! This is the first release to enable [BIP324](https://bitcoinops.org/en/topics/v2-p2p-transport/) opportunistic encrypted peer-to-peer messaging. It is off by default so be sure to set v2transport=1 in your bitcoin.conf file to get up with the new hotness. Side loading the UTXO set is also available using the new loadtxoutset RPC, along with a slew of other changes. Don't forget to verify those binaries!

# Covenants

#### OP_CAT BIP

[Ethan Heilman](https://github.com/EthanHeilman) and [Armin Sabouri](https://github.com/0xBEEFCAF3) have written a [BIP to reenable OP_CAT](https://github.com/bitcoin/bips/pull/1525), a deviously simple opcode that enables covenants and lots of other unexpected behavior. This opcode enables the bitcoin script interpreter to concatenate, or join together, two values from the stack into a single value that is pushed back onto the stack. OP_CAT was disabled by Satoshi along with a number of other dangerous opcodes before he disappeared forever. Read the BIP [here](https://github.com/EthanHeilman/op_cat_draft/blob/main/cat.mediawiki). Andrew Poelstra shared more context in this [mailing list post](https://lists.linuxfoundation.org/pipermail/bitcoin-dev/2023-October/022055.html).

#### Draft BIP for OP_TXHASH and OP_CHECKTXHASHVERIFY

[Steven Roose](https://github.com/stevenroose) has been working on a [proposal for OP_TXHASH](https://delvingbitcoin.org/t/draft-bip-for-op-txhash-and-op-checktxhashverify/121), a generalization of OP_CHECK_TEMPLATE_VERIFY that allows the user to specify which fields of the transaction are committed to. It uses the same amount of bytes as OP_CTV but provides much greater flexibility.

# Mining

#### F2Pool tests the waters of censorship

Bitcoin developer [0xB10C](https://b10c.me/) posted a highly detailed [blog post](https://b10c.me/observations/08-missing-sanctioned-transactions/) showing that F2Pool excluded four transactions spending to an OFAC sanctioned address. F2Pool cofounder Chun Wang acknowledged the censorship and later backed down in a series of now-deleted tweets.

#### DEMAND launches new Stratumv2 solo pool

[DEMAND](https://bitcoinmagazine.com/business/demand-launches-worlds-first-stratum-v2-bitcoin-mining-pool) announced they were launching a new solo mining pool that will support [Stratum v2](https://stratumprotocol.org/) at launch. If they are successful, this will mark the second mining pool to support Stratum v2 after [Braiins Pool](https://braiins.com/pool).

#### OCEAN makes a splash

Long time Bitcoin Core developer [Luke DashJr](https://github.com/luke-jr) also threw his hat into the ring with the relaunch of his defunct mining pool, Eligius, renamed [OCEAN](https://ocean.xyz). Ocean offers account-free non-KYC mining, a slightly tweaked PPLNS payout scheme they call TIDES, [public block templates](https://ocean.xyz/blocktemplate), and coinbase payouts for any miner who hashes above a payout threshold. They have received a lot of criticism for choosing to use [different mempool policies](https://ocean.xyz/docs/nodepolicy) from bitcoin core. To date, Ocean has been pretty lucky, mining two blocks already. So far, neither of the new pools has commented on the decision to stylize their name with all caps.

# Miscellaneous

#### The Sophon

A mempool sniper bot named [The Sophon](https://decrypt.co/205377/a-bitcoin-devs-bot-bucked-brc-20s-now-he-might-share-the-sophon-with-the-world) has been front running new BRC-20 tokens by stealing their namespace, likely leading to a ~85% decline in mempool fees in 24 hours. As of this writing, it appears that the sophon is no longer running.

#### BitStream

Robin Linus dropped [BitStream](https://robinlinus.com/bitstream.pdf), a proposal for decentralized file hosting built on bitcoin. This one uses HTLCs, verifiable encryption, and a bond/slashing mechanism to punish cheating. Unlike [Durabit](https://github.com/4de67a207019fd4d855ef0a188b4519c/Durabit/blob/main/Durabit%20-%20A%20Bitcoin-native%20Incentive%20Mechanism%20for%20Data%20Distribution.pdf), which we covered last month, it doesn't require (but does support) ecash. BitStream does require OP_CAT, however.

- [Bitcoin Core Onboarding](https://bitcoincore.academy/overview.html)
- [Warnet Simulations](https://delvingbitcoin.org/t/warnet-simulations/232)
- [Libre Relay](https://twitter.com/lightcoin/status/1732634764899701053)
- [BitKey opens for preorder](https://bitkey.world/en-US)
- [BitKey security tradeoffs](https://twitter.com/sethforprivacy/status/1732808302164111446)
- [Ark Developer Hub](https://arkdev.info/)
- [payjoin-cli](https://crates.io/crates/payjoin-cli/0.0.1-alpha)
- [Peerswaps](https://strike.me/blog/peerswaps/)
- [BIP21 Payment URIs](https://bitcoinqr.dev/)
- [Chaincode Bitcoin FOSS Career Accelerator](https://learning.chaincode.com/#FOSS)
