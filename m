Return-Path: <linux-next+bounces-8169-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D67B400E7
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 14:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA20917BB51
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 12:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDB4289E30;
	Tue,  2 Sep 2025 12:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Mdr0/V6Y";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="GR/Yf5D/";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="IuMUkM/I";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="3IeBYSv8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F1B28B4FA
	for <linux-next@vger.kernel.org>; Tue,  2 Sep 2025 12:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816779; cv=none; b=PXpfylWAX1uAN1sjMeOQLBI/tZlP4fCskG/2CgQAqoYx3O/xaUCdUVzUnMpvAh1WOVWSiaUpphnde4CBGSwUDM4fGiCraNHEZ0MoDuuvwkxFjYUxfL/1rOEhMqGtg/quL7KfqmpTWSkW1nlOgk71OrHHLJB1lWbXjsPSklPh4oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816779; c=relaxed/simple;
	bh=bLDxRD/thuNR9rJmgmSCKn55R2oPhE6lAAVGJNoSe5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OPMHe9X/2y14c9W00+1o0Fs6zP3+9wtom4t5aKzDkzDx+cxtE2g5SAUa9znbjgDI+g5CIdirXzgrDCffnKV7E3Lx6LgfTsOCmoNAqv+VzV/HkMzph57d4lKGGJn184ZJW4GAd1uQVyt7gB8E0dnkq4Z8s3rTuT0PdV4E2i4h5hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Mdr0/V6Y; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=GR/Yf5D/; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=IuMUkM/I; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=3IeBYSv8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 521B9211D0;
	Tue,  2 Sep 2025 12:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1756816774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=naa/2EaTeluXrePUWWuI8BZDcR9HO/D4pokoGhuTDZI=;
	b=Mdr0/V6Y7dYqXXv4064Qz9OcTNqihj4WVZt3bW7PcoZ8qpXb+qN4gjvljhWjrb8qkiEZsJ
	7Q9w3Y+kO/2UFw5/3bNPqNe0L2AaB1TOkGJlrXkn5n82CAtO/gxHVhHfAV5C/9XKdGBLRD
	CNihfXC9vvl0dXgBweDuwMFioNZhe1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1756816774;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=naa/2EaTeluXrePUWWuI8BZDcR9HO/D4pokoGhuTDZI=;
	b=GR/Yf5D/zpt3z3Meh22Ri3lltkeGgIXzwJroo0Ndj6/WGOLOe7WI4aJyonDt99v7yn8XOq
	8J0Sxr/gko+/ARBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1756816773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=naa/2EaTeluXrePUWWuI8BZDcR9HO/D4pokoGhuTDZI=;
	b=IuMUkM/IkGXxM8628bjCtvQf75PzSEtN3JvrtI46u2wUhxu1OV7FECbqagUCL+SpH9eIlf
	4Bkqvk9x8W4zj4GfDuzzQeulN1d6ZorSUDPUgOTJ/cr8WTu/S/D9B52iFSM8tzSKQtlaM2
	yeCJHuZzUsRYGsN530S3+2dDV472WeA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1756816773;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=naa/2EaTeluXrePUWWuI8BZDcR9HO/D4pokoGhuTDZI=;
	b=3IeBYSv8Pmxa7eVJ75mUcs5PdmeaiNQZuuI6XpKz5uH38IjE+2ZKt8I9K7hXOxdfRdTFSH
	DWfMoebY/Wa2n+AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4060513888;
	Tue,  2 Sep 2025 12:39:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OOtgD4XltmhySwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 02 Sep 2025 12:39:33 +0000
Message-ID: <01e1f74a-d531-4e51-9b40-efbf80f338c0@suse.cz>
Date: Tue, 2 Sep 2025 14:39:32 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next20250901] Boot fail on IBM Power Server
Content-Language: en-US
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Thorsten Leemhuis <linux@leemhuis.info>, Harry Yoo <harry.yoo@oracle.com>
References: <866d7f30-7cde-4c88-87ba-bdad16075433@linux.ibm.com>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 m6M14QORSWTLRg==
In-Reply-To: <866d7f30-7cde-4c88-87ba-bdad16075433@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:email]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -4.30

On 9/2/25 06:55, Venkat Rao Bagalkote wrote:
> Greetings!!!
> 
> 
> IBM CI has reported a boot failure with next-20250901 repo on IBM Power 
> Server.
> 
> 
> Repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> 
> gcc version 11.5.0 20240719
> 
> GNU ld version 2.35.2-54.el9
> 
> 
> Attached is the .config file.
> 
> 
> Traces:
> 
> 
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=32, Nodes=32
> [    0.000000] BUG: Kernel NULL pointer dereference on read at 0x00000040
> [    0.000000] Faulting instruction address: 0xc00000000059eaac
> [    0.000000] Oops: Kernel access of bad area, sig: 7 [#1]
> [    0.000000] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=8192 NUMA pSeries
> [    0.000000] Modules linked in:
> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 
> 6.17.0-rc4-next-20250901 #1 VOLUNTARY
> [    0.000000] Hardware name: IBM,9080-HEX Power11 (architected) 
> 0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
> [    0.000000] NIP:  c00000000059eaac LR: c00000000059eadc CTR: 
> 0000000000000000
> [    0.000000] REGS: c000000002c7faf0 TRAP: 0300   Not tainted 
> (6.17.0-rc4-next-20250901)
> [    0.000000] MSR:  8000000002001033 <SF,VEC,ME,IR,DR,RI,LE>  CR: 
> 44008220  XER: 20040001
> [    0.000000] CFAR: c00000000059eaf8 DAR: 0000000000000040 DSISR: 
> 00080000 IRQMASK: 3
> [    0.000000] GPR00: c00000000059eab8 c000000002c7fd90 c000000001678100 
> c000000004017400
> [    0.000000] GPR04: 0000000000000cc0 0000000000000001 0000000000000000 
> c000000002cea768
> [    0.000000] GPR08: 0000000000000008 0000000000000000 0000000000000000 
> 0000000000008000
> [    0.000000] GPR12: c00000000058f8d0 c000000002ff0000 0000000000000000 
> 0000000000000000
> [    0.000000] GPR16: 0000000000000000 0000000000000000 0000000000000000 
> 0000000000000000
> [    0.000000] GPR20: 0000000000c00000 0000000000000008 0000000000000000 
> c000000002f46870
> [    0.000000] GPR24: 0000000000000100 c000000002f468c8 c000000002f425c0 
> c000000004017400
> [    0.000000] GPR28: c000000001591188 c000000002cfca00 0000000000000001 
> c0000013fd27ebe0
> [    0.000000] NIP [c00000000059eaac] do_kmem_cache_create+0x4d4/0x634
> [    0.000000] LR [c00000000059eadc] do_kmem_cache_create+0x504/0x634
> [    0.000000] Call Trace:
> [    0.000000] [c000000002c7fd90] [c00000000059eab8] 
> do_kmem_cache_create+0x4e0/0x634 (unreliable)
> [    0.000000] [c000000002c7fe40] [c00000000050e518] 
> __kmem_cache_create_args+0x198/0x434
> [    0.000000] [c000000002c7fef0] [c0000000020b3630] 
> maple_tree_init+0x60/0x98
> [    0.000000] [c000000002c7ff40] [c000000002006420] 
> start_kernel+0x288/0x60c
> [    0.000000] [c000000002c7ffe0] [c00000000000ea9c] 
> start_here_common+0x1c/0x20
> [    0.000000] Code: 4e800020 3d220167 38e92668 3d2200c0 39490a84 
> e93b0008 7fe7402a 7d5f52aa 7fe9fa14 392a001c 79291f24 7d3b482a 
> <e9290040> f93f0020 4bff15e5 38be0001
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000]
> [    0.000000] Kernel panic - not syncing: Fatal exception
> [    0.000000] Rebooting in 10 seconds..
> 
> 
> 
> If you happen to fix this please add below tag.
> 
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Could you check if this fixes it please?

From 345b6b43ebf2dacae570a6971ab147be0f724fa1 Mon Sep 17 00:00:00 2001
From: Vlastimil Babka <vbabka@suse.cz>
Date: Tue, 2 Sep 2025 14:36:44 +0200
Subject: [PATCH] slub: don't cache barn pointers in pcs

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/slub.c | 69 +++++++++++++++++++++++++++++++++----------------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index e47032ea38e0..cb0ba1cf0ee4 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -481,7 +481,6 @@ struct slub_percpu_sheaves {
 	struct slab_sheaf *main; /* never NULL when unlocked */
 	struct slab_sheaf *spare; /* empty or full, may be NULL */
 	struct slab_sheaf *rcu_free; /* for batching kfree_rcu() */
-	struct node_barn *barn;
 };
 
 /*
@@ -504,6 +503,12 @@ static inline struct kmem_cache_node *get_node(struct kmem_cache *s, int node)
 	return s->node[node];
 }
 
+/* Get the barn of the current cpu's memory node */
+static inline struct node_barn *get_barn(struct kmem_cache *s)
+{
+	return get_node(s, numa_mem_id())->barn;
+}
+
 /*
  * Iterator over all nodes. The body will be executed for each node that has
  * a kmem_cache_node structure allocated (which is true for all online nodes)
@@ -4722,6 +4727,7 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
 {
 	struct slab_sheaf *empty = NULL;
 	struct slab_sheaf *full;
+	struct node_barn *barn;
 	bool can_alloc;
 
 	lockdep_assert_held(this_cpu_ptr(&s->cpu_sheaves->lock));
@@ -4731,7 +4737,9 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
 		return pcs;
 	}
 
-	full = barn_replace_empty_sheaf(pcs->barn, pcs->main);
+	barn = get_barn(s);
+
+	full = barn_replace_empty_sheaf(barn, pcs->main);
 
 	if (full) {
 		stat(s, BARN_GET);
@@ -4748,7 +4756,7 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
 			empty = pcs->spare;
 			pcs->spare = NULL;
 		} else {
-			empty = barn_get_empty_sheaf(pcs->barn);
+			empty = barn_get_empty_sheaf(barn);
 		}
 	}
 
@@ -4780,6 +4788,7 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
 	 */
 	local_lock(&s->cpu_sheaves->lock);
 	pcs = this_cpu_ptr(s->cpu_sheaves);
+	barn = get_barn(s);
 
 	/*
 	 * If we are returning empty sheaf, we either got it from the
@@ -4790,7 +4799,7 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
 	 */
 
 	if (pcs->main->size == 0) {
-		barn_put_empty_sheaf(pcs->barn, pcs->main);
+		barn_put_empty_sheaf(barn, pcs->main);
 		pcs->main = full;
 		return pcs;
 	}
@@ -4801,12 +4810,12 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
 	}
 
 	if (pcs->spare->size == 0) {
-		barn_put_empty_sheaf(pcs->barn, pcs->spare);
+		barn_put_empty_sheaf(barn, pcs->spare);
 		pcs->spare = full;
 		return pcs;
 	}
 
-	barn_put_full_sheaf(pcs->barn, full);
+	barn_put_full_sheaf(barn, full);
 	stat(s, BARN_PUT);
 
 	return pcs;
@@ -4907,7 +4916,7 @@ unsigned int alloc_from_pcs_bulk(struct kmem_cache *s, size_t size, void **p)
 			goto do_alloc;
 		}
 
-		full = barn_replace_empty_sheaf(pcs->barn, pcs->main);
+		full = barn_replace_empty_sheaf(get_barn(s), pcs->main);
 
 		if (full) {
 			stat(s, BARN_GET);
@@ -5104,7 +5113,7 @@ kmem_cache_prefill_sheaf(struct kmem_cache *s, gfp_t gfp, unsigned int size)
 		stat(s, SHEAF_PREFILL_FAST);
 	} else {
 		stat(s, SHEAF_PREFILL_SLOW);
-		sheaf = barn_get_full_or_empty_sheaf(pcs->barn);
+		sheaf = barn_get_full_or_empty_sheaf(get_barn(s));
 		if (sheaf && sheaf->size)
 			stat(s, BARN_GET);
 		else
@@ -5155,6 +5164,7 @@ void kmem_cache_return_sheaf(struct kmem_cache *s, gfp_t gfp,
 
 	local_lock(&s->cpu_sheaves->lock);
 	pcs = this_cpu_ptr(s->cpu_sheaves);
+	barn = get_barn(s);
 
 	if (!pcs->spare) {
 		pcs->spare = sheaf;
@@ -5169,14 +5179,11 @@ void kmem_cache_return_sheaf(struct kmem_cache *s, gfp_t gfp,
 
 	stat(s, SHEAF_RETURN_SLOW);
 
-	/* Accessing pcs->barn outside local_lock is safe. */
-	barn = pcs->barn;
-
 	/*
 	 * If the barn has too many full sheaves or we fail to refill the sheaf,
 	 * simply flush and free it.
 	 */
-	if (data_race(pcs->barn->nr_full) >= MAX_FULL_SHEAVES ||
+	if (data_race(barn->nr_full) >= MAX_FULL_SHEAVES ||
 	    refill_sheaf(s, sheaf, gfp)) {
 		sheaf_flush_unused(s, sheaf);
 		free_empty_sheaf(s, sheaf);
@@ -5601,6 +5608,8 @@ static void __slab_free(struct kmem_cache *s, struct slab *slab,
 static void __pcs_install_empty_sheaf(struct kmem_cache *s,
 		struct slub_percpu_sheaves *pcs, struct slab_sheaf *empty)
 {
+	struct node_barn *barn;
+
 	lockdep_assert_held(this_cpu_ptr(&s->cpu_sheaves->lock));
 
 	/* This is what we expect to find if nobody interrupted us. */
@@ -5610,19 +5619,21 @@ static void __pcs_install_empty_sheaf(struct kmem_cache *s,
 		return;
 	}
 
+	barn = get_barn(s);
+
 	/*
 	 * Unlikely because if the main sheaf had space, we would have just
 	 * freed to it. Get rid of our empty sheaf.
 	 */
 	if (pcs->main->size < s->sheaf_capacity) {
-		barn_put_empty_sheaf(pcs->barn, empty);
+		barn_put_empty_sheaf(barn, empty);
 		return;
 	}
 
 	/* Also unlikely for the same reason */
 	if (pcs->spare->size < s->sheaf_capacity) {
 		swap(pcs->main, pcs->spare);
-		barn_put_empty_sheaf(pcs->barn, empty);
+		barn_put_empty_sheaf(barn, empty);
 		return;
 	}
 
@@ -5630,7 +5641,7 @@ static void __pcs_install_empty_sheaf(struct kmem_cache *s,
 	 * We probably failed barn_replace_full_sheaf() due to no empty sheaf
 	 * available there, but we allocated one, so finish the job.
 	 */
-	barn_put_full_sheaf(pcs->barn, pcs->main);
+	barn_put_full_sheaf(barn, pcs->main);
 	stat(s, BARN_PUT);
 	pcs->main = empty;
 }
@@ -5647,15 +5658,17 @@ static struct slub_percpu_sheaves *
 __pcs_replace_full_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs)
 {
 	struct slab_sheaf *empty;
+	struct node_barn *barn;
 	bool put_fail;
 
 restart:
 	lockdep_assert_held(this_cpu_ptr(&s->cpu_sheaves->lock));
 
+	barn = get_barn(s);
 	put_fail = false;
 
 	if (!pcs->spare) {
-		empty = barn_get_empty_sheaf(pcs->barn);
+		empty = barn_get_empty_sheaf(barn);
 		if (empty) {
 			pcs->spare = pcs->main;
 			pcs->main = empty;
@@ -5669,7 +5682,7 @@ __pcs_replace_full_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs)
 		return pcs;
 	}
 
-	empty = barn_replace_full_sheaf(pcs->barn, pcs->main);
+	empty = barn_replace_full_sheaf(barn, pcs->main);
 
 	if (!IS_ERR(empty)) {
 		stat(s, BARN_PUT);
@@ -5729,7 +5742,7 @@ __pcs_replace_full_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs)
 
 got_empty:
 	if (!local_trylock(&s->cpu_sheaves->lock)) {
-		barn_put_empty_sheaf(pcs->barn, empty);
+		barn_put_empty_sheaf(barn, empty);
 		return NULL;
 	}
 
@@ -5832,6 +5845,7 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj)
 	if (unlikely(!pcs->rcu_free)) {
 
 		struct slab_sheaf *empty;
+		struct node_barn *barn;
 
 		if (pcs->spare && pcs->spare->size == 0) {
 			pcs->rcu_free = pcs->spare;
@@ -5839,7 +5853,9 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj)
 			goto do_free;
 		}
 
-		empty = barn_get_empty_sheaf(pcs->barn);
+		barn = get_barn(s);
+
+		empty = barn_get_empty_sheaf(barn);
 
 		if (empty) {
 			pcs->rcu_free = empty;
@@ -5854,14 +5870,14 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj)
 			goto fail;
 
 		if (!local_trylock(&s->cpu_sheaves->lock)) {
-			barn_put_empty_sheaf(pcs->barn, empty);
+			barn_put_empty_sheaf(barn, empty);
 			goto fail;
 		}
 
 		pcs = this_cpu_ptr(s->cpu_sheaves);
 
 		if (unlikely(pcs->rcu_free))
-			barn_put_empty_sheaf(pcs->barn, empty);
+			barn_put_empty_sheaf(get_barn(s), empty);
 		else
 			pcs->rcu_free = empty;
 	}
@@ -5906,6 +5922,7 @@ static void free_to_pcs_bulk(struct kmem_cache *s, size_t size, void **p)
 	void *remote_objects[PCS_BATCH_MAX];
 	unsigned int remote_nr = 0;
 	int node = numa_mem_id();
+	struct node_barn *barn;
 
 next_remote_batch:
 	while (i < size) {
@@ -5941,8 +5958,10 @@ static void free_to_pcs_bulk(struct kmem_cache *s, size_t size, void **p)
 	if (likely(pcs->main->size < s->sheaf_capacity))
 		goto do_free;
 
+	barn = get_barn(s);
+
 	if (!pcs->spare) {
-		empty = barn_get_empty_sheaf(pcs->barn);
+		empty = barn_get_empty_sheaf(barn);
 		if (!empty)
 			goto no_empty;
 
@@ -5956,7 +5975,7 @@ static void free_to_pcs_bulk(struct kmem_cache *s, size_t size, void **p)
 		goto do_free;
 	}
 
-	empty = barn_replace_full_sheaf(pcs->barn, pcs->main);
+	empty = barn_replace_full_sheaf(barn, pcs->main);
 	if (IS_ERR(empty)) {
 		stat(s, BARN_PUT_FAIL);
 		goto no_empty;
@@ -7041,15 +7060,11 @@ static int init_percpu_sheaves(struct kmem_cache *s)
 
 	for_each_possible_cpu(cpu) {
 		struct slub_percpu_sheaves *pcs;
-		int nid;
 
 		pcs = per_cpu_ptr(s->cpu_sheaves, cpu);
 
 		local_trylock_init(&pcs->lock);
 
-		nid = cpu_to_mem(cpu);
-
-		pcs->barn = get_node(s, nid)->barn;
 		pcs->main = alloc_empty_sheaf(s, GFP_KERNEL);
 
 		if (!pcs->main)
-- 
2.51.0



