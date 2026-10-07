+++
title = "Socratic Seminar 57"
date = 2026-10-07
template = "page.html"
aliases = [
  "2026-10-07-socratic-seminar-57",
  "/2026-10-07-socratic-seminar-57/",
  "/2026/10/07/socratic-seminar-57"
]

[extra]
event_type = "socratic"
luma = "https://luma.com/3c2wy3ia"
add_to_calendar = true
start = "2026-10-07T22:00:00Z"
end = "2026-10-08T00:00:00Z"
location = "Fidelity Investments, 100 New Millennium Way, Durham, NC 27709"
description = "BitDevs is a place for open discussion of the technical aspects of bitcoin and related protocols. Be advised: discussion will be technical. Please RSVP or email trianglebitdevs at protonmail dot com to confirm your attendance. You will be required to show ID to the security guard to gain admission, but you do not need to RSVP in public."
+++

We will start with introductions, cover some basic ground rules, and then jump into technical discussions.

Please note the meeting location is at 100 New Millennium Way, Durham, NC 27709, USA.

# Announcements

- no pictures or recordings
- follow the [chatham house rule](https://en.wikipedia.org/wiki/Chatham_House_Rule)
  - discuss what was said, not who said it
- don't be a jerk
- thank you to our sponsor [Fidelity Investments](https://www.fidelity.com/)
- introductions

# AI Security Auditing

- [Ten AI models vs embargoed Core Lightning: a case study of AI for security auditing](https://juraj.bednar.io/en/blog-en/2026/09/18/ten-ai-models-vs-embargoed-core-lightning-a-case-study-of-ai-for-auditing/)
  - ten models, the public source and a five-sentence prompt, run while a batch of CLN vulnerabilities was still embargoed
  - nine real defects surfaced: four from reading source, five only by diffing strings out of the patched release binaries
  - cheap models held their own against expensive ones; "reading is reliable, reasoning is not"

  {% primer() %}
  The run happened inside the window when CLN operators had been told to shut the node down or run it with `--offline` and nothing was yet available to install, and the release then shipped as object code with the source withheld two weeks longer. Bednár's argument is that the embargo hid the patch but not the mechanism: CLN ships unstripped binaries, so a string like "Fee %s became larger than our max fee %s" names both the subsystem and the bug, and of the two theft bugs in the release the one that got found was the one upstream wrote a FUNDS LOSS log line for.

  He concludes the embargo model is finished and should be replaced with a signed kill switch — maintainers publish a signed note naming the affected versions as a nostr event or a bitcoin OP_RETURN, nodes verify it against a key baked into the build and drop into a safe state that refuses new channels and HTLCs while staying online for cooperative closes. He requires that the operator can always turn the node back on, which is what he says separates this from a backdoor, and argues that once exposed nodes are already stopped the source can be published immediately rather than sat on.
  {% end %}

- discussion:
  - if a model can find an embargoed bug from public source, what is an embargo actually buying?
  - does cheap automated auditing favor the defender or the attacker?

# The Alert System

- [Bitcoin's remote kill switch, retired in 2017](https://bitcoin.org/en/alert/2016-11-01-alert-retirement#reasons-for-retirement)
  - removed from Core in 0.12.1; final "Alert Key Compromised" alert broadcast January 19 2017 and hardcoded into 0.14
  - the key itself and the system's vulnerabilities were published July 3 2018

  {% primer() %}
  Created by Satoshi, the alert system let whoever held a single network-wide Alert Key broadcast a signed message that every node would display, and it had been used for things like warning users about accidental chain forks. The page's stated reason for retiring it is centralization: the key was handed to each new developer and could never be taken back from one who left, there is no way to identify who sent a given alert, and a holder turned malicious could use it to disrupt the network.

  It adds that the mechanism was primarily Bitcoin Core specific yet every other wallet had to handle it because it was network-wide, and that it had lost its usefulness since users can learn about problematic network events from any major news outlet.
  {% end %}

- discussion:
  - why did satoshi remove the bitcoin alert system?
  - what are the risks of a centralized alarm system?
  - how could it be exploited to harm node operators or aid in an attack?

# Bitcoin Core

- [sipa: bounds on chain length with BIP-54 timewarp fixes](https://delvingbitcoin.org/t/bounds-on-chain-length-with-bip-54-timewarp-fixes/2899)
  - both rules together bound the long-term rate to about one block per 9m56s, capping a chain at ~1,012,794 blocks for current time and work
  - this is what the headers presync DoS defense rests on

  {% primer() %}
  sipa asks whether BIP-54's two timestamp rules are enough to bound how long a valid chain can be, and derives a closed-form upper bound on block count from a time budget and a work budget, proven in Lean for all work up to 2^208. Each rule alone buys almost nothing: remove either and the limit stays above 3.34 billion blocks.

  The formula is deliberately conservative, since median-time-past and the interior timestamps of each period are dropped to make it closed-form, yet the longest chain actually constructed for those inputs comes within about half a percent of it. The presync limit in use today is sized from the six-blocks-per-second ceiling that MTP alone implies, against an attacker whose work is capped by minchainwork.
  {% end %}

- [miner: enforce the Murch-Zawy rule (BIP54)](https://github.com/bitcoin/bitcoin/pull/35949) — merged for 32.0
  - a node whose clock sits behind the first block of a difficulty period reports a mintime under the consensus floor, so it cannot build a valid template for the last block of the period and stops mining until the clock catches up
  - validation side is #35793

  {% primer() %}
  The fix clamps the template's minimum time upward when the block being built is the last of a difficulty period, raising it to that period's first block timestamp so mintime and curtime are both above the consensus floor. The clamp applies on all networks, and the functional test holds timestamps back across a whole period and then mines its final block to confirm a template still works.

  fjahr calls the mainnet case mostly theoretical because it takes a large clock misconfiguration, more plausible on test networks with volatile hashrate, and argues the miner should produce a valid template in any situation. It was split out of the validation PR at darosior's request.
  {% end %}

- [BIP332: Stale Tip Relay](https://github.com/bitcoin/bips/pull/2241) — number assigned, status Draft
  - an optional `staletip` message announcing recent stale branches and whether you will serve the blocks
  - aj, w0xlt and Ram; requires BIP434
  - the pitch is telemetry: stale rate tracks how fast blocks reach miners, so an elevated rate means congested propagation, a partition, or selfish mining

  {% primer() %}
  A stale block here is a valid block that did not end up on the active chain. The message carries a fork point the receiver already knows plus the branch above it as 48-byte compressed headers, each previous-block hash omitted and reconstructed from position.

  The design is announcement-only rather than request-response, which avoids per-peer query state, and recommended caps limit branch length, how far behind the tip a branch may be, and how many already-known tips a node volunteers to a fresh peer. Consensus is untouched, a peer that does not negotiate never sees the message, and the BIP tells miners running private transaction pools to leave it off, since announcing a block that lost the race hands their pool contents to competitors.
  {% end %}

- [Silent payments light clients: measurements and index commitments](https://groups.google.com/g/bitcoindev/c/qqDYHnnoM7k)
  - measured over 255,434 blocks: v2 oracle (txid + tweak + output prefixes) ~15.08 GB with no false positives, filters ~7.1 GB but a match costs a full block fetch
  - proposes per-block commitments over the sorted tweak set, checkpointed on nostr

  {% primer() %}
  Silent payments leave the receiver no fixed script to watch for: each output is derived from the spending transaction's input public keys, so a client needs a per-transaction tweak and an ECDH step before it knows what to match, and it has nothing it can test against a filter by itself. Rob Segers ran a BlindBit Oracle v2 across the full post-taproot range, published per-block numbers for each serving option, and filed the drift he found against both light-client spec repos, including that v2 ships no filter endpoints and uses unsalted x-only pubkey prefixes where the spec says salted outpoint hashes.

  The commitment is a sha256 chain over each block's canonical tweak set, which makes an omission attributable after the fact rather than preventing it, and lets two servers publishing the same digests be checked against each other. A server can still lie to one targeted client, so the advice remains to fetch the full block on a match.
  {% end %}

# Covenants and Script

- Robin Linus - [BitVM-448: covenant-based BitVM3 bridges](https://robinlinus.com/bitvm448.pdf)
  - OP_TEMPLATEHASH for both the deposit and assertion covenants; CSFS only for the deleted-key recursive variant
  - native template covenants replace per-deposit presigned transactions, taking the cosigner set out of bridge safety and making deposits non-interactive
  - the per-attempt bond moves into the asserted UTXO, so a false assertion returns the reserve to the bridge and burns the bond

  {% primer() %}
  Today's BitVM3 bridges authorize each deposit with a set of presigned transactions from an n-of-n committee, which puts that committee inside the bridge's safety argument. Linus commits the reserve output to a taproot covenant taptree carrying one leaf per live operator, each leaf allowing only a template-committed kickoff. A deposit then lands in a prepared slot with no signing round and no committee to trust.

  The second change is where the operator's bond lives. OP_TEMPLATEHASH omits input prevouts, amounts and scripts, so it cannot demand a specific bond input the way a sibling-input covenant would; the graph instead pulls reserve and bond into one asserted output worth D plus B, making the bond enforceable by output value rather than by a separately registered stake. Each operator also carries a single global slashing secret reused across every attempt, so an operator who lies once publishes it and is permanently barred from touching bridge funds.
  {% end %}

- [bip448.cash: rebindable transactions running on Mutinynet](https://bip448.cash/)
  - Mercury Layer statechains in the browser: a newer state spends an older output by replacing only the input's previous outpoint

  {% primer() %}
  A research prototype by stutxo running against Mutinynet signet, where the BIP 448 opcodes are available; the rebindable-signature work it builds on is credited to localhost and w0xlt. Each accepted state stores a presigned update and settlement pair, and a unilateral exit means broadcasting the update, waiting out a 144-block delay, then settling.

  That delay is also the only defense: if a previous owner publishes an old state, someone has 144 blocks to broadcast the newer one, and the prototype ships no automatic watcher, with the seed phrase alone not enough to restore the saved exit transactions. Mercury's signing share lives in an AWS Nitro enclave, and the wallet exposes a check of the attestation and pinned PCRs so a user can test the claim that the old share was deleted.
  {% end %}

- [Comparing bitcoin covenant proposals for vaults](https://delvingbitcoin.org/t/comparing-bitcoin-covenant-proposals-for-vaults/2877)
  - presigned transactions, CTV, APO/APOAS, TXHASH, CCV and the CAT-based Purrfect Vault, scored on partial withdrawals, address-commitment timing, fee management and on-chain cost
  - CTV for simple vaults with precomputed outputs; CCV for partial withdrawals or trigger-time address selection; TXHASH buys flexibility and spends it on designer responsibility

  {% primer() %}
  Lillian Wang's report came out of a fall 2025 project mentored by Michael Maurer and Neha Narula, consolidating material spread across BIPs, implementations and forum threads for a general technical reader rather than covenant specialists. The report itself is a PDF linked from the post.

  The thread sharpens one finding: APOAS commits to neither the input count nor the input index, so a single transaction with two inputs from the same vault address and one fixed output verifies at both inputs and hands the difference to the miner, 200k sats in and 99k out in the worked example. BIP 119 gives that index commitment as the reason CTV avoids half-spend, which makes never reusing a vault address a requirement rather than advice.
  {% end %}

- [The Covenants Use-Case Atlas](https://getcofund.com/research/covenants-use-case-atlas)
  - 26 use cases mapped to proposals, each tagged built-in-repo, working-code or cataloged-sketch

  {% primer() %}
  Cofund's atlas, written by Jesus Najera and published in August 2026; each tile flips on hover and animates the mechanism it describes. Most entries sit at the speculative end, with sixteen cataloged sketches against eight working code and two built in repo. Some tiles carry a prerequisite tag such as needs CSFS or needs TRUC, separating what a construction additionally wants from what one consensus change delivers on its own. Entries run from spacechains and Sapio to coordination-free mining pools, pathcoin and a rate-limited MCCV vault.
  {% end %}

- [covenants.diy: a visual node editor for covenant scripts](https://covenants.diy/)
  - build taproot outputs and tapscripts and simulate execution in the browser against signet and regtest

  {% primer() %}
  Built by askii21m and MIT licensed. Past assembling the output, the editor computes the sighash and single-steps the tapscript, so a broken construction surfaces as the opcode that failed rather than as a transaction that does not verify.

  The opcode set reaches past the usual candidates to OP_VAULT, OP_PAIRCOMMIT and OP_INTERNALKEY, and the worked examples include a congestion-control tree, an Ark any owner can exit alone, an oracle payout, and the same state channel built once with BIP 448 and once with ANYPREVOUT. Each graph gets its own URL, so a construction can be handed to someone else as a link instead of a description.
  {% end %}

# Ecash

- [Federated Cashu: a 4-of-5 threshold mint on a new blind BLS signature scheme](https://tangentsdaily.substack.com/p/friday-oct02)
  - announced by calle at bitcoin++ Berlin, Oct 1
  - "you don't need to trust the operator with your privacy, but you do need to trust the operator with your security"

  {% primer() %}
  The design splits the mint's signing key across five operators so that any four can keep issuing and redeeming, using a blind BLS signature scheme that lets a quorum sign blinded messages without any single party holding the key.

  Tokens remain claims against that particular mint, so the work of evaluating who controls redemption does not disappear, it spreads across five parties instead of one. The writeup reports no audit results and no production timeline, framing the federation as an early attempt to make the mint's security assumptions explicit and reviewable.
  {% end %}

- [Fedimint runs three independent codebases in one live federation](https://www.tftc.io/fedimint-three-implementations-federated-cashu-berlin-2026)
  - Ecash Hackday Berlin, Sep 30; one of the three built by Cashu's thesimplekid

  {% primer() %}
  The other two codebases were one elsirion wrote independently and the Fedimint core team's own. Until this demonstration every guardian anywhere ran the same software, so one consensus-critical bug put every federation at risk simultaneously; three codebases in a single federation shows guardians can differ in implementation and still agree on state. The article treats this as the first public multi-implementation Fedimint and names wallet diversity, hardware diversity, operator independence and jurisdictional spread as the layers still to come.
  {% end %}

- payjoin boards: on-chain deposits that land straight inside Ark and a Cashu mint
  - [Board Ark with payjoins](https://second.tech/blog/payjoin-boards-board-psbt/) — Matthew Vuk, Sep 10
  - [cdk-payment-processors, the bark crate](https://github.com/cashubtc/cdk-payment-processors/tree/main/crates/bark)
  - [bitgould's commentary](https://x.com/bitgould/status/2098065920224866490)

  {% primer() %}
  Boarding is how on-chain bitcoin gets into Ark, and it used to take two transactions: one paying a Bark wallet, then a second boarding those coins in. A payjoin board collapses that into one, with the sender paying the Bark wallet over payjoin v2 while Bark swaps in the board output and cosigns it. Dan Gould calls that the first production deployment of transaction cut-through. The new `board_psbt` method is what generalizes it: it accepts any PSBT paying the board address and cosigns the board against it, replacing the deprecated `board_tx`.

  The CDK side is a standalone gRPC service wiring a Cashu mint to a Bark wallet, covering BOLT11, on-chain and Ark-native arkoor payments through one backend, with payment intents and reconciliation state persisted across restarts and a regtest integration suite. Together they let a mint accept an on-chain deposit that arrives as a VTXO directly, with no separate boarding transaction and no channels to manage.
  {% end %}

- discussion: Cashu is adding a federation and Fedimint is adding implementation diversity. are these converging on the same design, and which failure does each one actually fix?

# Self Custody and Seed Generation

- [Depots: theft-proof, self-custodial bitcoin for billions of users](https://delvingbitcoin.org/t/depots-theft-proof-self-custodial-bitcoin-for-billions-of-users/2892)
  - off-chain holding and transfer through channels run by one operator, with griefer penalization: either side can make the other lose funds only by losing a proportional amount of their own
  - needs CTV (BIP-119) and CSFS (BIP-348); PairCommit, OP_MUL and OP_MOD buy efficiency
  - open objection in the thread: the user who loses a device and misses the expiry deadline

  {% primer() %}
  The mechanism behind the scaling claim is probabilistic. A user buys a channel carrying a 1-in-P chance of being a hit, where P is a large prime, and a hit pays P times what the user paid for it, so a single taproot funding output can back channels for far more users than could ever settle on-chain.

  JohnLaw puts numbers on that: ten channels each for ten billion users and sustained throughput above 900,000 payments per second, with the further claim that the design admits people who cannot afford the fee for even one on-chain transaction. Depots are time-limited, so users must drain a depot before expiry by spending over Lightning or moving to another one.
  {% end %}

- [codex32 Lean implementation](https://github.com/stutxo/codex32_lean)
  - BIP93 Shamir sharing with a hand-verifiable checksum, reimplemented in Lean so the operations carry machine-checked proofs rather than only passing the official vectors

  {% primer() %}
  The proved statements include the error-detection bound itself, that two equal-length valid strings within a checksum period differing in at most eight symbols are the same string, along with burst-erasure windows of 13 and 15 symbols, encode-decode round trips, and perfect secrecy for share sets below the threshold. None of it leans on a sorry, a custom axiom, or native_decide, and it builds against Lean 4.34 with only the bundled Std, no Mathlib or external crypto library.

  Error correction is absent; an invalid checksum is rejected rather than repaired. The README states plainly that this is experimental research software and should not be used with real wallet seeds.
  {% end %}

- [Penlock: a paper computer to generate BIP32 seedphrases](https://v1.penlock.io/en/)
  - a printed wheel and pencil arithmetic producing a 2-of-3 split, no computer touching the secret

  {% primer() %}
  Penlock takes its inspiration from codex32 but is not an implementation of it; the site describes its own paper-optimized splitting algorithm as a twist on the one-time pad, with error correction that also runs on paper.

  Three guides cover splitting an existing 12-word phrase, recovering a phrase from two shares, and generating a new one from real-world physical randomness, running 50 to 100 minutes between them. It claims to be wallet-agnostic and quantum-proof, and the page concedes that multisig is generally more secure for anyone with the expertise to operate it.
  {% end %}

# Post-Quantum

- Lopp - [The quantum issue: to freeze coins or not](https://bitcoinmagazine.com/print/the-quantum-issue-to-freeze-coins-or-not)
  - a freeze (BIP-361 is one such proposal) would disable spending from vulnerable outputs once quantum-safe alternatives exist, putting an estimated 2.6M+ dormant coins out of an attacker's reach
  - he lands on staged preparation — recovery proofs, opt-in quantum-safe scripts, objective rules — not freezing now

  {% primer() %}
  Lopp lays out both cases at length and concludes the debate is not binary; the question he poses is which rule set minimizes property-rights violations once ECC can no longer authenticate rightful ownership. He surveys the middle options — temporary locks with a re-enable height, Hourglass-style rate limiting on old P2PK spends, commit-delay-reveal, and zk-STARK proofs that a taproot output key came from a BIP-32 seed path, which in their optimized form still run about 200 KB — and argues Bitcoin has already invalidated rule-valid coins once, in the 2010 value overflow soft fork.

  Writing as BIP-361's lead author, he says activation is not a near-term proposal and that he would not expect anyone to seriously push it unless a cryptographically relevant quantum computer looked less than ten years out. He also wants the warning criteria defined in advance, since a public demonstration against secp256k1 would already be too late for some attack classes.
  {% end %}

- [PQLN: post-quantum security for the Lightning Network's off-chain surfaces](https://delvingbitcoin.org/t/pqln-post-quantum-security-for-the-bitcoin-lightning-networks-off-chain-surfaces/2893)
  - ML-KEM and ML-DSA over gossip, transport, invoices, offers and routing; on-chain settlement stays classical because funding and commitment keys cannot move without a consensus change
  - roughly 10x gossip bandwidth and an initial graph sync from 26 MB to 270 MB
  - objections: whether the side-list onion keeps unlinkability versus a redesign like KEM Sphinx, QR reliability at max invoice density, and whether vanilla nodes relay oversized messages

  {% primer() %}
  Ahmet Kurt presents PQLN as a working rust-lightning fork, roughly 11,000 lines behind a `post-quantum` cargo feature, with an arXiv paper and measurements taken on regtest networks of real nodes. It deliberately works inside today's spec: PQ keys ride in gossip and are pinned trust-on-first-use, the hybrid Noise handshake runs on its own port so no negotiation message can be rewritten to force a downgrade, and a vanilla peer on the path silently drops a payment back to classical unless the node sets require-PQ and fails closed. `channel_announcement` stays classical because two of its four signatures are rooted in Bitcoin, which is where most of the bandwidth saving comes from.

  Roasbeef pushes back through the thread and Kurt concedes real gaps, including that nothing MACs the later hops' ciphertexts in the side list, and says he would rather move them inside the onion layers than patch it.
  {% end %}

# Mining

- [US, Russia and China held 65.4% of hashrate in Q3](https://www.tokenpost.com/news/technology/27122)
  - US 335 EH/s (35.6%), Russia 170 EH/s (18.1%), China 110 EH/s (11.7%)

  {% primer() %}
  TokenPost summarizes a country-level hashrate estimate published October 5, with global network hashrate averaging about 941 EH/s, essentially flat against the prior comparison.

  The article is explicit that these estimates track mining activity by geography and say nothing about who owns the equipment, who controls the pools, or who selects the transactions in a block. It also notes the figures ship without an uncertainty range, so the decline in the three countries' combined share is not established as a real shift rather than noise.
  {% end %}

- [Bitcoin difficulty, live](https://www.coinwarz.com/bitcoin-difficulty)
  - difficulty has fallen more often than it has risen across 2026 and is net lower on the year
  - network hashrate has stayed under 1 ZH/s all year, with published estimates varying by several percent depending on the smoothing window

  {% primer() %}
  Difficulty is the only read on miner economics that nobody has to publish for you: hashrate leaves, the next retarget records it, and the series is public. The 2026 pattern is a sawtooth with a downward bias rather than a collapse, which is consistent with marginal fleets switching off at low hashprice and returning on any sustained recovery.

  Worth knowing that hashrate itself is an estimate derived from block timing, so any single figure depends on the averaging window chosen, and different trackers disagree by more than the moves being reported.
  {% end %}

- [fork.observer: who is mining what, per pool](https://fork.observer/?network=mainnet)

  {% primer() %}
  fork.observer polls a few dozen mainnet nodes — Core, Knots builds including BIP-110 variants, btcd, mempool.space instances, Electrum servers — and draws the block tree each one sees, coloring every tip active, valid-fork, valid-headers, headers-only or invalid, with each block labeled by the pool named in its coinbase. It is the quickest way to watch a stale block or short reorg while it is live and see which pool and which node software sat on each side.
  {% end %}

# Policy

- [FinCEN withdraws the CVC mixing rule and the unhosted-wallet reporting proposal](https://www.theblock.co/news/regulation/2026-10-05-fincen-drops-crypto-mixing-rule-self-hosted-wallet-proposal-417690)
  - [FinCEN kills two proposed surveillance rules targeting self-custody and mixers](https://www.tftc.io/fincen-withdraws-unhosted-wallet-mixer-surveillance-rules-2026)
  - the 2023 §311 finding that international CVC mixing was "a class of transactions of primary money laundering concern" is gone, along with the rule that would have had banks reporting wallet addresses, txids and IPs
  - FinCEN cited the "chilling effect on legitimate activity" and the 2025 working group finding that lawful users mix for privacy

  {% primer() %}
  The 2023 mixing proposal was the first use of section 311 against a class of transactions rather than a named institution, jurisdiction, or account type, every prior special measure having had a specific target. The self-custody reporting proposal dated to December 2020 and would have required recordkeeping at $3,000 and reports at $10,000 on transfers involving unhosted wallets, including for people who were not customers of the filing institution.

  Withdrawal closes the docket without repealing anything: FinCEN said it will keep monitoring mixers and may take a different approach, so the authority is intact and a replacement can be proposed under a new RIN.
  {% end %}

# Economics

- Bordo and Wilkins - [Money and Power: historical lessons for stablecoins and U.S. dollar dominance](https://www.nber.org/papers/w35768) (NBER 35768, Sept 2026)
  - reads the free-banking eras of the UK, US, Canada, Sweden and Switzerland for the conditions private money needs to work at scale: credible convertibility, transparent backing, a uniform regulatory perimeter, par clearing, and a loss-allocation story
  - scores today's stablecoins against the GENIUS Act and finds crisis management and international coordination the weakest links
  - discussion: bitcoin has no issuer to run a crisis-management regime. do the five conditions describe what ecash mints and federations are groping toward, or is this the wrong frame for bearer money?

  {% primer() %}
  Bordo and Wilkins' core historical finding is that par circulation held where institutional arrangements supported it, not where the payment technology was best. They credit stablecoins with real gains in settlement speed, programmability, and cross-border access, and argue those gains do not remove any of the five requirements.

  Their conclusion on dollar dominance is modest: dollar stablecoins can widen the reach of dollar settlement, but whether the dollar stays dominant turns on fiscal capacity, monetary credibility, and rule of law rather than on which rail payments move over.
  {% end %}

# Miscellaneous

- Nic Carter - [A second and final eulogy for bitcoin maximalism](https://murmurationstwo.substack.com/p/a-second-and-final-eulogy-for-bitcoin)

  {% primer() %}
  Carter separates bitcoin the asset, which he says succeeded, from maximalism as an ideology, which he argues failed as a description of the world: fiat replacement, altcoin collapse, nation-state legal-tender adoption, and the halving-cycle price models all went the other way, with Ethereum at roughly $220 billion and bitcoin's price, by his account, flat since November 2021. He cites Lightning moving on the order of $10 billion a year against roughly $15 trillion in stablecoin volume on other chains, nostr plateauing near ten thousand weekly active users, and the Coldcard entropy flaw that exposed 1,816 BTC held by people following maximalist self-custody advice. He reads the failed BIP-110 filters push as evidence that the movement's radical wing has spent itself.

  His recurring comparison is the Millerites, who reinterpreted doctrine after 1844 rather than abandoning it, and he treats maximalism's own migrations the same way, from payments to store-of-value, from anti-Wall-Street to institutional adoption, and from separating money and state to lobbying for a government reserve.
  {% end %}

- [Visualize Bitcoin: the protocol as a 3D machine](https://visualizebitcoin.org/)

  {% primer() %}
  Visualize Bitcoin is a browser-based 3D environment where the protocol's parts — wallets, mining, blocks, Lightning — appear as machinery you walk around and operate, fed by live network data. It also carries structured lessons, a couple of multiplayer games, and VR support.
  {% end %}
