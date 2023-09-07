---
layout: post
type: socratic
title: "TABConf Socratic Session: Lightning Protocol Development"
meetup: https://2023.tabconf.com/
---

A focused Socratic Seminar on lightning protocol development. Topics will be selected from mailing lists, prominent github repos, network graphs, research papers, vulnerability reports and other sources.

This event will take place at TABConf in Atlanta.

As a reminder, the ground rules of BitDevs are as follow:

1. No photos, videos, or recordings.
2. [Chatham House Rule](https://en.wikipedia.org/wiki/Chatham_House_Rule): you may
   reiterate the contents of the meeting *without* attribution.

<br>
These rules exist so that BitDevs participants can speak freely within the event.

### Splicing merged into CLN
Dusty Daemon's [year long PR](https://github.com/ElementsProject/lightning/pull/5675) to enable [channel splicing](https://bitcoinops.org/en/topics/splicing/) in CLN has finally been merged into master! Hopefully this means users will soon be able to resize lightning channels with no channel downtime or disruption in payment flows. Holla! 🙌

### 10101 is building DLCs on Lightning
A new company called [10101](https://10101.finance) (pronounced ten-ten-one) is building DLC capability into lightning. In this [three](https://10101.finance/blog/dlc-to-lightning-part-1/) [part](https://10101.finance/blog/dlc-to-lightning-part-2/) [blog](https://10101.finance/blog/dlc-to-lightning-part-3/) series they explain what DLCs are, how they are enabled on lightning, and how they use virtual channels to accomplish this in practice.

### Blockstream Greenlight enters Closed Beta

Greenlight, a new non-custodial lightning hosting infrastructure project, has [entered closed beta](https://blog.blockstream.com/greenlight-by-blockstream-scalable-non-custodial-lightning-infrastructure-now-open-to-developers/)! Greenlight is [differentiated](https://blog.blockstream.com/en-greenlight-by-blockstream-lightning-made-easy/) from other cloud lightning solutions thanks to the very low resource footprint of CLN, enabling multiple front ends to share access to a node, simplified recovery, an an off-boarding flow to export your node to a different hosting provider.

### Binance Launches Lightning Support

[Binance](https://www.binance.com), probably the largest cryptocurrency exchange in the world, now [supports the lightning network](https://www.binance.com/en/support/announcement/binance-completes-integration-of-bitcoin-btc-on-lightning-network-opens-deposits-and-withdrawals-eefbfae2c0ae472d9e1e36f1a30bf340)! To our knowledge, [Coinbase](https://www.coinbase.com/) has not released a statement on this developing story.

### How the Voltage LSP Enhances Privacy for Mutiny Wallet Users

In this blog post [Tony Giorgio](https://iris.to/npub1t0nyg64g5vwprva52wlcmt7fkdr07v5dr7s35raq9g0xgc0k4xcsedjgqv) explains how [Mutiny Wallet](https://www.mutinywallet.com/) leverages the [Voltage LSP](https://voltage.cloud/blog/voltage-announcements/introducing-flow-v2/) to enhance the privacy of their wallet users using just-in-time lightning channels to enable a VPN-like architecture for lightning payments.

### [Lightning-dev] Practical PTLCs, a little more concretely

Greg Sanders, aka [@theinstagibbs](https://twitter.com/theinstagibbs) posted to the mailing list with an initial proposal for a [PTLC](https://bitcoinops.org/en/topics/ptlc/) implementation. In the gist he considers many potential use cases: single-sig adaptors vs MuSig2, async updates vs sync aka "simplified updates", amount of message re-ordering, and futuristic updates to mempool/consensus (including [APO](https://bitcoinops.org/en/topics/sighash_anyprevout/)).
