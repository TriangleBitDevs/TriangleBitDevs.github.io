+++
title = "Socratic Seminar 26"
date = 2024-02-14
template = "page.html"
aliases = [
  "2024-02-14-socratic-seminar-26",
  "/2024-02-14-socratic-seminar-26/",
  "/2024/02/14/socratic-seminar-26"
]

[extra]
event_type = "socratic"
meetup = "https://www.meetup.com/triangle-bitdevs/events/299026197/"
+++


We will start with introductions, some basic ground rules, and jump into technical discussions. We will cover aspects of the bitcoin protocol, new research developments, recent news, and software developments.

Please note the meeting location at 4801 Glenwood Ave suite 200 in Raleigh, right above Fifth Third Bank.

# Announcements

- no pictures or recordings
- chatham house rules
- don't be a dick
- Hack Day - unstructured monthly in-person meetup for bitcoin builders
- thank you to our sponsors [Lolli](https://www.lolli.com/) and [Swan Bitcoin](https://www.swanbitcoin.com)
- introductions

# Bitcoin

#### Human Readable Payment Names Via DNS

Noted bitcoin contributor and Spiral grantee [Matt Corallo](https://twitter.com/TheBlueMatt) proposed a [BIP](https://github.com/TheBlueMatt/bips/blob/2024-02-dns-payment-instructions/bip-XXXX.mediawiki) to render human readable names into payment info using only the DNS protocol for improved privacy and simplicity when compared to existing schemes. The proposal has been well received with active discussion continuing on the [pull request](https://github.com/bitcoin/bips/pull/1551).

#### BIP Land

[BIP Land](https://www.quantumcats.xyz/bip-land) is a flippant flow chart of the process of getting a bitcoin soft fork activated. The site examines the activation process from the perspective of the [OP_CAT proposal](https://bitcoinops.org/en/topics/op_cat/). It links to tons of informative and cautionary historical events, with a healthy dose of snark. The site is best experienced in first person.

#### Cluster Mempool

[Cluster Mempool](https://delvingbitcoin.org/t/an-overview-of-the-cluster-mempool-proposal/393/1) is a proposed mempool redesign that aims to solve a few problems with the existing mempool design, including suboptimal transaction eviction, a complicated block construction algorithm, and incentive-incompatible RBF rules. The proposal introduces the concept of a cluster: a group of unconfirmed transactions connected by parent-child links. Clusters are sorted by fee rate in order to easily calculate their chunks, or the portion of a cluster above or below a certain fee rate. This makes block construction and transaction eviction extremely simple (and opposite) calculations. The proposal drops ancestor and descendent limits in favor of a cluster size limit. It also makes the CPFP carve-out infeasible, which, we hope, can be replaced by [v3 transactions](https://bitcoinops.org/en/topics/version-3-transaction-relay/).

# Economics

#### Synthetic Commodity Money

This [paper](https://www.resistance.money/research/synthetic_commodity_money.pdf) by famed economist [George Selgin](https://en.wikipedia.org/wiki/George_Selgin) introduces a new categorization scheme for forms of money. The novel application of this scheme highlights a previously unexamined category of money that Selgin calls a synthetic commodity money. He defines a synthetic commodity as one which has a combination of absolute scarcity and no non-monetary use. Selgin examines the Iraqi Swiss Dinar as a historical example and bitcoin as an 'almost ideal synthetic commodity money'.

# Miscellaneous

- [Fedimint v0.2.1](https://github.com/fedimint/fedimint/releases/tag/v0.2.1) released. This is the first release that will have long term support.
- [Braidpool](https://github.com/braidpool/braidpool/blob/main/docs/braidpool_spec.md)
- [Bitcointalk thread](https://bitcointalk.org/index.php?topic=2162.0) discussing the introduction of 'standardness' rules and the (de)merits of storing data on the blockchain
- [Downsides of Suboptimal Op Code Soft Forks](https://bitcoin.stackexchange.com/questions/106851/what-are-the-downsides-to-enabling-potentially-suboptimal-or-unused-opcodes-in-a/106915) - This Bitcoin Stack Exchange answer from Greg Maxwell discusses the problems that can arise from activating a suboptimal opcode proposal.
