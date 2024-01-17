---
layout: post
type: socratic
title: "Socratic Seminar 25"
meetup: https://www.meetup.com/triangle-bitdevs/events/298399343/
---

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

#### The Witness Discount: Why Some Bytes Are Cheaper Than Others

Brandon Black aka [reardencode](https://twitter.com/reardencode) published a [historical review](https://bitcoinmagazine.com/technical/the-witness-discount-why-some-bytes-are-cheaper-than-others) of changes to bitcoin's carefully balanced incentive model. He explains the witness discount, how it works, and why a weighted combined byte limit was chosen. Black also addresses a common talking points by pointing out that the taproot upgrade was not an incentive change, did not unlock inscriptions, and how inscription data has an extremely low computational cost for node runners. He concludes that the solution to high fees is not to undo changes to the incentive model but instead to increase the economic density of bitcoin transactions with technologies like lightning, off-chain signature aggregation, ark, and DLCs.

# Lightning

#### Rethinking Lightning

[Ben Carman](https://stacker.news/benthecarman) wrote a thorough and realistic [stacker news post](https://stacker.news/items/379225) examining the shortcomings of the lightning network. He points his finger squarely at offline receiving and channel liquidity as the biggest hurdles to mass adoption but also dives deep on the proposed solutions to these problems and the problems with the solutions. Are you still with me? Great, because at the end of the article it gets really good. Carman explains that the fundamental scaling problem with lightning is that it only scales payments but not UTXO ownership. We can work around the edges of this problem with various federated solutions like fedimint or Liquid but in order to scale self-sovereign bitcoin access to the masses of humanity we will need better tools for shared UTXO ownership. Those tools are broadly categorized as covenants.

# Covenants

#### LNHANCE a new CTV activation proposal

Brandon Black opened a [draft PR](https://github.com/bitcoin/bitcoin/pull/29198) to the bitcoin repository proposing a collection of three BIPs that Black is calling LNHANCE. The three BIPs were chosen to enable output restricting [covenants](https://bitcoinops.org/en/topics/covenants/) and [LN-symmetry](https://bitcoinops.org/en/topics/eltoo/). The proposal has garnered a lot of discussion on the pull request as well as on the [Delving Bitcoin post](https://delvingbitcoin.org/t/lnhance-bips-and-implementation/376). Perhaps the best concise explanation was from this [twitter thread](https://twitter.com/reardencode/status/1744394209334038796), copied below:

OP_CHECKTEMPLATEVERIFY (CTV, BIP119) lets a recipient of bitcoin restrict the next outputs that bitcoin can be sent to (possibly combined with a time lock or other restriction). This can be use to build a some types of vaults, also Timeout Trees and Ark.
 
OP_CHECKSIGFROMSTACK(VERIFY) (CSFS) allows for owners of bitcoin to delegate control to another key, or make specific parts of their locking script signature-dynamic (e.g. a lock time which can be changed by signature). When combined with CTV, enables LN-Symmetry and simplified PTLCs.
 
OP_INTERNALKEY (IKEY) makes certain Tapscript constructions more efficient, and allows users of Taproot key paths to enable additional ways of signing with their root key. This can be used in lightning and other protocols to reduce on chain costs.

# Inscriptions

#### Precursive Inscriptions: A Bitcoin-native Private Publishing Mechanism

Some guy does it again! Another [inscription whitepaper drop](https://www.ord.io/54024385) describing a [novel technique](https://github.com/4de67a207019fd4d855ef0a188b4519c/Precursive-Inscriptions/blob/main/Precursive%20Inscriptions%20-%20A%20Bitcoin-native%20Private%20Publishing%20Mechanism.pdf) to upload encrypted files to the bitcoin blockchain using recursive inscriptions. The file can be broken up into multiple chunks spread across multiple bitcoin blocks and decrypted once the corresponding private key is revealed in a later transaction. This technique can be used in combination with a timelock to create a dead man's switch. It's good to see cypherpunks leveraging bitcoin's native file storage protocol to do cypherpunk things. Rock on! 🤘

#### Quantum Cats

In a totally unrelated development [some other guy](https://twitter.com/rot13maxi/status/1745983083608789345) details the technical design enabling a collection of evolving inscriptions called Quantum Cats.

# Miscellaneous

- [Fedimint v0.2.1](https://github.com/fedimint/fedimint/releases/tag/v0.2.1) released. This is the first release that will have long term support.
- [Someone sent ~27 BTC to Satoshi's first pubkey](https://twitter.com/mononautical/status/1743391496827473925)
- [BIP Land](https://www.quantumcats.xyz/bip-land) is a flippant examination of the process of getting a bitcoin consensus change activated on the network.
- [Overview of Cluster Mempool](https://delvingbitcoin.org/t/an-overview-of-the-cluster-mempool-proposal/393/1)
- [Braidpool](https://github.com/braidpool/braidpool/blob/main/docs/braidpool_spec.md)
- [covenants.info](https://covenants.info/) cool site comparing the many covenant proposals. There seem to be some [open](https://twitter.com/Polyd_/status/1746575634170613824) [questions](https://twitter.com/brian_trollz/status/1746573443393273950) about the veracity of the information contained therein.
- [Bitcointalk thread](https://bitcointalk.org/index.php?topic=2162.0) discussing the introduction of 'standardness' rules and the (de)merits of storing data on the blockchain
