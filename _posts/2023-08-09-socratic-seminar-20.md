---
layout: post
type: socratic
title: "Socratic Seminar 20"
meetup: https://www.meetup.com/triangle-bitdevs/events/295207969/
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

<br>

# Bitcoin

#### HTLCs

[Hash timelocked contracts (HTLCs)](https://bitcoinops.org/en/topics/htlc/) are a class of smart contract that enable atomic payments between two participants. HTLCs use a hash preimage as a bit of secret knowledge that enables one party to claim the funds secured by the contract. If the preimage is not revealed to the correct party the funds can be claimed by the contract counterparty after a timeout. HTLCs are integral to the lightning network, atomic swaps, and other contract protocols.

#### Proposal for a new mempool design

Bitcoin core developers [Suhas Daftuar](https://github.com/sdaftuar) and [Pieter Wuille](https://github.com/sipa) have proposed a [new mempool design](https://github.com/bitcoin/bitcoin/issues/27677) that aims to solve eviction and RBF problems with the current mempool. The new design introduces concepts of transaction clusters, linearizations, and chunks that may allow for a more incentive compatible mempool that maximizes miner profits when evicting transactions due to memory limits and RBF. 

#### Covenants in Bitcoin: A Useful Review Taxonomy

CLN lead developer [Rusty Russell](https://github.com/RustyRussell) dropped a thoughtful [blog post](https://rusty.ozlabs.org/2023/07/09/covenant-taxonomy.html) reviewing a few covenant proposals. He lays out a spectrum of simplest to most complete covenants and describes a theoretical new taproot covenant design that could start out very restrictive and be extended with more powerful capabilities in future soft forks. He concludes by shilling LN-symmetry, exactly as one would expect from a lightning developer opining on L1 soft forks.

# Lightning

#### Securing a $100M Lightning node

In their latest [blog post](https://acinq.co/blog/securing-a-100M-lightning-node) Eclair walks us through the security architecture of the ACINQ node, among the largest and most connected nodes on the network. The article is a well-written and thorough high level examination of the security issues and design space of this fascinating problem.

# Security

#### Milk Sad Disclosure
Security researchers have uncovered a [critical vulnerability](https://milksad.info/) in the Libbitcoin Explorer wallet tool, bx. 3.x versions of the library use an insufficient source of entropy to generate new wallet private keys. The vulnerability was discovered following a string of mysterious wallet thefts. This tool was recommended for use in generating a new wallet in [Appendix A](https://github.com/bitcoinbook/bitcoinbook/blob/develop/appdx-bx.asciidoc#examples-of-bx-command-use) of Mastering Bitcoin.


# Miscellaneous
- [\[Lightning-dev\] Resizing Lightning Channels Off-Chain With Hierarchical Channels](https://lists.linuxfoundation.org/pipermail/lightning-dev/2023-March/003886.html)
- [Munstr - An open source Musig privacy based wallet](https://github.com/0xBEEFCAF3/munstr)
- [Mostro - A non custodial lightning network peer-to-peer exchange over nostr](https://github.com/MostroP2P/mostro)
- [ChatBTC - A LLM chat bot trained on technical bitcoin resources](https://chat.bitcoinsearch.xyz/)
- [Bitcoin Tx Color Coder - Visualize bitcoin transactions byte-by-byte](https://dariusparvin.github.io/bitcoin-tx-color-coder/)
- [Bitcoin Mailing List - Peruse the mailing list from your fave nostr client](https://primal.net/p/npub15g7m7mrveqlpfnpa7njke3ccghmpryyqsn87vg8g8eqvqmxd60gqmx08lk)
