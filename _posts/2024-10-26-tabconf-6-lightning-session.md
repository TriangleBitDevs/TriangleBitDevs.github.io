---
layout: post
type: socratic
title: "TABConf Socratic Session: Lightning Protocol Development"
meetup: "https://github.com/orgs/TABConf/projects/4/views/1?pane=issue&itemId=81248842&issue=TABConf%7C6.tabconf.com%7C148"
---

A focused Socratic Seminar on lightning protocol development. Topics will be selected from 
mailing lists, prominent github repos, network graphs, research papers, vulnerability reports 
and other sources.

This event will take place at TABConf in Atlanta.


### Breez SDK adds support for Nodeless (Liquid) and Native (Greenlight) Implementations

The boys at Breez have done it again! The latest SDK refresh adds a 'nodeless' implementation that stores your balance on the Liquid sidechain. It uses a swap service to send and receive bitcoin or lightning, a model pioneered by Aqua Wallet. In addition, the Breez SDK offers a native lightning implementation built using the lightweight self-custodial Greenlight service for a pure lightning architecture that makes no compromises on the trust assumptions of bitcoin and lightning.

Check out the Blockstream [blog announcement](https://blog.liquid.net/breez-releases-nodeless-sdk-implementation-powered-by-liquid/), Breez [github](https://github.com/breez), [nodeless sdk docs](https://sdk-doc-liquid.breez.technology/), or [native sdk docs](https://sdk-doc-greenlight.breez.technology/) for more information.


### BOLT12 Offers Merged

After four long years the BOLT12 Offers spec has been [merged](https://github.com/lightning/bolts/pull/798) into the BOLTs repo. Oh happy day! \o/

BOLT12 offers enable a static lightning invoice that works by communicating invoice parameters through the lightning network using onion messages to anonymously retrieve a BOLT11 invoice. It also uses blinded paths to conceal the endpoint of the lightning route, enabling private and trustless lightning payments. The static address represents a massive usability improvement over ephemeral and interactive BOLT11 invoices. Routing messages through the lightning network removes the need to incorporate a different network stack and thus the need to run a web server, which is approach taken by the LNURL protocol to achieve the same goals.


### Miscellaneous

