Return-Path: <linux-next+bounces-8173-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04103B41346
	for <lists+linux-next@lfdr.de>; Wed,  3 Sep 2025 05:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AABBC487AA4
	for <lists+linux-next@lfdr.de>; Wed,  3 Sep 2025 03:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A451B2D0637;
	Wed,  3 Sep 2025 03:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pdSP70Gg"
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841392D0618;
	Wed,  3 Sep 2025 03:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756871756; cv=none; b=F4oqCEZF917+UTLpdGcBF6AfR59DGut4eboDzJHq2Ub8fYGiV9pNSFzj4WheaBiOPA0TiODhpAJAyXNSj9sItz9Im+JsZRTw7oPzDV2ouL/DSqOiBjn89mDkHJqAdazqgar2tUq+wmFsiz0eu6Tre83Exlh/01i4HKa8UscIIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756871756; c=relaxed/simple;
	bh=s9PpxDEnNEPe0q30HCVhmGsr8/OajyjTmh8R2Gt6rLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Uo3jQiUI2sQ1PUMpZczZVvVk2hXytw6vIOYKT9LcERyBBWEk2NhAoCjOxC7mmeHMtRdcoJ05bm5+TIp7Mkc2whYKTRgX6KvufK9buuXmjzgjKAVcI1ArY+IvgORXNQoY41A/JFlSdQKmvWmIsNwnaR8Zp+Dhs9Ri6sLzXh2WIcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pdSP70Gg; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582Gi9u4004664;
	Wed, 3 Sep 2025 03:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ItMNfX
	uYp8q1+x2E3nORbeWMR6IuM/afA22ZY9q8abo=; b=pdSP70Ggg5+jfd5fDPQa+w
	de8sWZe07+sgCz1ypLjvfOdeGXRZYEKBEno78w5tpfoxFKNQUmvGplin6PcGwqJ+
	Zwxs0POYWVBwNru+AEkWXodXShXvJOfHJX065eEPSJPhVrgG9KazXThGsyofRr5r
	WG3d7MTDqHZfX82BBap8dF6JsfXKYvc4sOn+uCzea7TuivbqhrW38VVE+8j7M+e+
	iKlspjMlmEQU+8v8Vb6hHaUw5c1GctSCbLvc96fKnieHJa0V9JGGp+zFtfXg45NG
	uyhpYJ/z1INacsLOq9lLY+oxwr18J7FEkGxOOag8e+9GmMkcyw5xSoLdsuGLnQLw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usua1maf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 03:45:30 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5830R2sq017206;
	Wed, 3 Sep 2025 03:45:30 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vc10nrdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 03:45:30 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5833jTnm27984550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Sep 2025 03:45:29 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6573358055;
	Wed,  3 Sep 2025 03:45:29 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7BF5858043;
	Wed,  3 Sep 2025 03:45:26 +0000 (GMT)
Received: from [9.61.242.189] (unknown [9.61.242.189])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  3 Sep 2025 03:45:26 +0000 (GMT)
Message-ID: <583eacf5-c971-451a-9f76-fed0e341b815@linux.ibm.com>
Date: Wed, 3 Sep 2025 09:15:24 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next20250901] Boot fail on IBM Power Server
To: Vlastimil Babka <vbabka@suse.cz>, LKML <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Harry Yoo <harry.yoo@oracle.com>
References: <866d7f30-7cde-4c88-87ba-bdad16075433@linux.ibm.com>
 <01e1f74a-d531-4e51-9b40-efbf80f338c0@suse.cz>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <01e1f74a-d531-4e51-9b40-efbf80f338c0@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mOi8AM_Jkn46AkcFLvtVxH2-SILsezuX
X-Authority-Analysis: v=2.4 cv=U6uSDfru c=1 sm=1 tr=0 ts=68b7b9da cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=ThYCS5pGZ77Hoj4vDk8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX2lIdgkr7ilC+
 PaaiAr3QZLDTZwfUIwJPwaE6FzL61GNhaEVXd6HAwFECpwgPKZMm/eG3vpqRFqoAZSdtHZsVQgz
 kI9skJ31Fd+A80MooiOSmfYBTwxEBR8cXtrvAiK6ngx/EsokZRJJnZ13sMoqYBMMqkZPFxX3vQh
 b9hYWQtUMsKj0391GyPNi2r+sk/XBclr5m7s6p0DSrUFFbhoWckgYK+rJDXWT8VE3pf4YPxNEjp
 WRc2odgD55sljKqMQtrpPiU8H79GwSMpYl9n7bDcWBdqxK4uS+hyIwO6hYUS+ARR/wjkB7X63fI
 kDdp8yQYq7G62s+fuVkYKo/qe+pzDSzcZMzv4s19YSFr7fI7fJV4C8So+yRT8x7pH9SHuUFYf7E
 EDO9cDyd
X-Proofpoint-ORIG-GUID: mOi8AM_Jkn46AkcFLvtVxH2-SILsezuX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300034


On 02/09/25 6:09 pm, Vlastimil Babka wrote:
> On 9/2/25 06:55, Venkat Rao Bagalkote wrote:
>> Greetings!!!
>>
>>
>> IBM CI has reported a boot failure with next-20250901 repo on IBM Power
>> Server.
>>
>>
>> Repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>
>> gcc version 11.5.0 20240719
>>
>> GNU ld version 2.35.2-54.el9
>>
>>
>> Attached is the .config file.
>>
>>
>> Traces:
>>
>>
>> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
>> [    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=32, Nodes=32
>> [    0.000000] BUG: Kernel NULL pointer dereference on read at 0x00000040
>> [    0.000000] Faulting instruction address: 0xc00000000059eaac
>> [    0.000000] Oops: Kernel access of bad area, sig: 7 [#1]
>> [    0.000000] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=8192 NUMA pSeries
>> [    0.000000] Modules linked in:
>> [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted
>> 6.17.0-rc4-next-20250901 #1 VOLUNTARY
>> [    0.000000] Hardware name: IBM,9080-HEX Power11 (architected)
>> 0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
>> [    0.000000] NIP:  c00000000059eaac LR: c00000000059eadc CTR:
>> 0000000000000000
>> [    0.000000] REGS: c000000002c7faf0 TRAP: 0300   Not tainted
>> (6.17.0-rc4-next-20250901)
>> [    0.000000] MSR:  8000000002001033 <SF,VEC,ME,IR,DR,RI,LE>  CR:
>> 44008220  XER: 20040001
>> [    0.000000] CFAR: c00000000059eaf8 DAR: 0000000000000040 DSISR:
>> 00080000 IRQMASK: 3
>> [    0.000000] GPR00: c00000000059eab8 c000000002c7fd90 c000000001678100
>> c000000004017400
>> [    0.000000] GPR04: 0000000000000cc0 0000000000000001 0000000000000000
>> c000000002cea768
>> [    0.000000] GPR08: 0000000000000008 0000000000000000 0000000000000000
>> 0000000000008000
>> [    0.000000] GPR12: c00000000058f8d0 c000000002ff0000 0000000000000000
>> 0000000000000000
>> [    0.000000] GPR16: 0000000000000000 0000000000000000 0000000000000000
>> 0000000000000000
>> [    0.000000] GPR20: 0000000000c00000 0000000000000008 0000000000000000
>> c000000002f46870
>> [    0.000000] GPR24: 0000000000000100 c000000002f468c8 c000000002f425c0
>> c000000004017400
>> [    0.000000] GPR28: c000000001591188 c000000002cfca00 0000000000000001
>> c0000013fd27ebe0
>> [    0.000000] NIP [c00000000059eaac] do_kmem_cache_create+0x4d4/0x634
>> [    0.000000] LR [c00000000059eadc] do_kmem_cache_create+0x504/0x634
>> [    0.000000] Call Trace:
>> [    0.000000] [c000000002c7fd90] [c00000000059eab8]
>> do_kmem_cache_create+0x4e0/0x634 (unreliable)
>> [    0.000000] [c000000002c7fe40] [c00000000050e518]
>> __kmem_cache_create_args+0x198/0x434
>> [    0.000000] [c000000002c7fef0] [c0000000020b3630]
>> maple_tree_init+0x60/0x98
>> [    0.000000] [c000000002c7ff40] [c000000002006420]
>> start_kernel+0x288/0x60c
>> [    0.000000] [c000000002c7ffe0] [c00000000000ea9c]
>> start_here_common+0x1c/0x20
>> [    0.000000] Code: 4e800020 3d220167 38e92668 3d2200c0 39490a84
>> e93b0008 7fe7402a 7d5f52aa 7fe9fa14 392a001c 79291f24 7d3b482a
>> <e9290040> f93f0020 4bff15e5 38be0001
>> [    0.000000] ---[ end trace 0000000000000000 ]---
>> [    0.000000]
>> [    0.000000] Kernel panic - not syncing: Fatal exception
>> [    0.000000] Rebooting in 10 seconds..
>>
>>
>>
>> If you happen to fix this please add below tag.
>>
>>
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Could you check if this fixes it please?
>
>  From 345b6b43ebf2dacae570a6971ab147be0f724fa1 Mon Sep 17 00:00:00 2001
> From: Vlastimil Babka <vbabka@suse.cz>
> Date: Tue, 2 Sep 2025 14:36:44 +0200
> Subject: [PATCH] slub: don't cache barn pointers in pcs
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>   mm/slub.c | 69 +++++++++++++++++++++++++++++++++----------------------
>   1 file changed, 42 insertions(+), 27 deletions(-)
>
> diff --git a/mm/slub.c b/mm/slub.c
> index e47032ea38e0..cb0ba1cf0ee4 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -481,7 +481,6 @@ struct slub_percpu_sheaves {
>   	struct slab_sheaf *main; /* never NULL when unlocked */
>   	struct slab_sheaf *spare; /* empty or full, may be NULL */
>   	struct slab_sheaf *rcu_free; /* for batching kfree_rcu() */
> -	struct node_barn *barn;
>   };
>   
>   /*
> @@ -504,6 +503,12 @@ static inline struct kmem_cache_node *get_node(struct kmem_cache *s, int node)
>   	return s->node[node];
>   }
>   
> +/* Get the barn of the current cpu's memory node */
> +static inline struct node_barn *get_barn(struct kmem_cache *s)
> +{
> +	return get_node(s, numa_mem_id())->barn;
> +}
> +
>   /*
>    * Iterator over all nodes. The body will be executed for each node that has
>    * a kmem_cache_node structure allocated (which is true for all online nodes)
> @@ -4722,6 +4727,7 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
>   {
>   	struct slab_sheaf *empty = NULL;
>   	struct slab_sheaf *full;
> +	struct node_barn *barn;
>   	bool can_alloc;
>   
>   	lockdep_assert_held(this_cpu_ptr(&s->cpu_sheaves->lock));
> @@ -4731,7 +4737,9 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
>   		return pcs;
>   	}
>   
> -	full = barn_replace_empty_sheaf(pcs->barn, pcs->main);
> +	barn = get_barn(s);
> +
> +	full = barn_replace_empty_sheaf(barn, pcs->main);
>   
>   	if (full) {
>   		stat(s, BARN_GET);
> @@ -4748,7 +4756,7 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
>   			empty = pcs->spare;
>   			pcs->spare = NULL;
>   		} else {
> -			empty = barn_get_empty_sheaf(pcs->barn);
> +			empty = barn_get_empty_sheaf(barn);
>   		}
>   	}
>   
> @@ -4780,6 +4788,7 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
>   	 */
>   	local_lock(&s->cpu_sheaves->lock);
>   	pcs = this_cpu_ptr(s->cpu_sheaves);
> +	barn = get_barn(s);
>   
>   	/*
>   	 * If we are returning empty sheaf, we either got it from the
> @@ -4790,7 +4799,7 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
>   	 */
>   
>   	if (pcs->main->size == 0) {
> -		barn_put_empty_sheaf(pcs->barn, pcs->main);
> +		barn_put_empty_sheaf(barn, pcs->main);
>   		pcs->main = full;
>   		return pcs;
>   	}
> @@ -4801,12 +4810,12 @@ __pcs_replace_empty_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs,
>   	}
>   
>   	if (pcs->spare->size == 0) {
> -		barn_put_empty_sheaf(pcs->barn, pcs->spare);
> +		barn_put_empty_sheaf(barn, pcs->spare);
>   		pcs->spare = full;
>   		return pcs;
>   	}
>   
> -	barn_put_full_sheaf(pcs->barn, full);
> +	barn_put_full_sheaf(barn, full);
>   	stat(s, BARN_PUT);
>   
>   	return pcs;
> @@ -4907,7 +4916,7 @@ unsigned int alloc_from_pcs_bulk(struct kmem_cache *s, size_t size, void **p)
>   			goto do_alloc;
>   		}
>   
> -		full = barn_replace_empty_sheaf(pcs->barn, pcs->main);
> +		full = barn_replace_empty_sheaf(get_barn(s), pcs->main);
>   
>   		if (full) {
>   			stat(s, BARN_GET);
> @@ -5104,7 +5113,7 @@ kmem_cache_prefill_sheaf(struct kmem_cache *s, gfp_t gfp, unsigned int size)
>   		stat(s, SHEAF_PREFILL_FAST);
>   	} else {
>   		stat(s, SHEAF_PREFILL_SLOW);
> -		sheaf = barn_get_full_or_empty_sheaf(pcs->barn);
> +		sheaf = barn_get_full_or_empty_sheaf(get_barn(s));
>   		if (sheaf && sheaf->size)
>   			stat(s, BARN_GET);
>   		else
> @@ -5155,6 +5164,7 @@ void kmem_cache_return_sheaf(struct kmem_cache *s, gfp_t gfp,
>   
>   	local_lock(&s->cpu_sheaves->lock);
>   	pcs = this_cpu_ptr(s->cpu_sheaves);
> +	barn = get_barn(s);
>   
>   	if (!pcs->spare) {
>   		pcs->spare = sheaf;
> @@ -5169,14 +5179,11 @@ void kmem_cache_return_sheaf(struct kmem_cache *s, gfp_t gfp,
>   
>   	stat(s, SHEAF_RETURN_SLOW);
>   
> -	/* Accessing pcs->barn outside local_lock is safe. */
> -	barn = pcs->barn;
> -
>   	/*
>   	 * If the barn has too many full sheaves or we fail to refill the sheaf,
>   	 * simply flush and free it.
>   	 */
> -	if (data_race(pcs->barn->nr_full) >= MAX_FULL_SHEAVES ||
> +	if (data_race(barn->nr_full) >= MAX_FULL_SHEAVES ||
>   	    refill_sheaf(s, sheaf, gfp)) {
>   		sheaf_flush_unused(s, sheaf);
>   		free_empty_sheaf(s, sheaf);
> @@ -5601,6 +5608,8 @@ static void __slab_free(struct kmem_cache *s, struct slab *slab,
>   static void __pcs_install_empty_sheaf(struct kmem_cache *s,
>   		struct slub_percpu_sheaves *pcs, struct slab_sheaf *empty)
>   {
> +	struct node_barn *barn;
> +
>   	lockdep_assert_held(this_cpu_ptr(&s->cpu_sheaves->lock));
>   
>   	/* This is what we expect to find if nobody interrupted us. */
> @@ -5610,19 +5619,21 @@ static void __pcs_install_empty_sheaf(struct kmem_cache *s,
>   		return;
>   	}
>   
> +	barn = get_barn(s);
> +
>   	/*
>   	 * Unlikely because if the main sheaf had space, we would have just
>   	 * freed to it. Get rid of our empty sheaf.
>   	 */
>   	if (pcs->main->size < s->sheaf_capacity) {
> -		barn_put_empty_sheaf(pcs->barn, empty);
> +		barn_put_empty_sheaf(barn, empty);
>   		return;
>   	}
>   
>   	/* Also unlikely for the same reason */
>   	if (pcs->spare->size < s->sheaf_capacity) {
>   		swap(pcs->main, pcs->spare);
> -		barn_put_empty_sheaf(pcs->barn, empty);
> +		barn_put_empty_sheaf(barn, empty);
>   		return;
>   	}
>   
> @@ -5630,7 +5641,7 @@ static void __pcs_install_empty_sheaf(struct kmem_cache *s,
>   	 * We probably failed barn_replace_full_sheaf() due to no empty sheaf
>   	 * available there, but we allocated one, so finish the job.
>   	 */
> -	barn_put_full_sheaf(pcs->barn, pcs->main);
> +	barn_put_full_sheaf(barn, pcs->main);
>   	stat(s, BARN_PUT);
>   	pcs->main = empty;
>   }
> @@ -5647,15 +5658,17 @@ static struct slub_percpu_sheaves *
>   __pcs_replace_full_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs)
>   {
>   	struct slab_sheaf *empty;
> +	struct node_barn *barn;
>   	bool put_fail;
>   
>   restart:
>   	lockdep_assert_held(this_cpu_ptr(&s->cpu_sheaves->lock));
>   
> +	barn = get_barn(s);
>   	put_fail = false;
>   
>   	if (!pcs->spare) {
> -		empty = barn_get_empty_sheaf(pcs->barn);
> +		empty = barn_get_empty_sheaf(barn);
>   		if (empty) {
>   			pcs->spare = pcs->main;
>   			pcs->main = empty;
> @@ -5669,7 +5682,7 @@ __pcs_replace_full_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs)
>   		return pcs;
>   	}
>   
> -	empty = barn_replace_full_sheaf(pcs->barn, pcs->main);
> +	empty = barn_replace_full_sheaf(barn, pcs->main);
>   
>   	if (!IS_ERR(empty)) {
>   		stat(s, BARN_PUT);
> @@ -5729,7 +5742,7 @@ __pcs_replace_full_main(struct kmem_cache *s, struct slub_percpu_sheaves *pcs)
>   
>   got_empty:
>   	if (!local_trylock(&s->cpu_sheaves->lock)) {
> -		barn_put_empty_sheaf(pcs->barn, empty);
> +		barn_put_empty_sheaf(barn, empty);
>   		return NULL;
>   	}
>   
> @@ -5832,6 +5845,7 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj)
>   	if (unlikely(!pcs->rcu_free)) {
>   
>   		struct slab_sheaf *empty;
> +		struct node_barn *barn;
>   
>   		if (pcs->spare && pcs->spare->size == 0) {
>   			pcs->rcu_free = pcs->spare;
> @@ -5839,7 +5853,9 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj)
>   			goto do_free;
>   		}
>   
> -		empty = barn_get_empty_sheaf(pcs->barn);
> +		barn = get_barn(s);
> +
> +		empty = barn_get_empty_sheaf(barn);
>   
>   		if (empty) {
>   			pcs->rcu_free = empty;
> @@ -5854,14 +5870,14 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj)
>   			goto fail;
>   
>   		if (!local_trylock(&s->cpu_sheaves->lock)) {
> -			barn_put_empty_sheaf(pcs->barn, empty);
> +			barn_put_empty_sheaf(barn, empty);
>   			goto fail;
>   		}
>   
>   		pcs = this_cpu_ptr(s->cpu_sheaves);
>   
>   		if (unlikely(pcs->rcu_free))
> -			barn_put_empty_sheaf(pcs->barn, empty);
> +			barn_put_empty_sheaf(get_barn(s), empty);
>   		else
>   			pcs->rcu_free = empty;
>   	}
> @@ -5906,6 +5922,7 @@ static void free_to_pcs_bulk(struct kmem_cache *s, size_t size, void **p)
>   	void *remote_objects[PCS_BATCH_MAX];
>   	unsigned int remote_nr = 0;
>   	int node = numa_mem_id();
> +	struct node_barn *barn;
>   
>   next_remote_batch:
>   	while (i < size) {
> @@ -5941,8 +5958,10 @@ static void free_to_pcs_bulk(struct kmem_cache *s, size_t size, void **p)
>   	if (likely(pcs->main->size < s->sheaf_capacity))
>   		goto do_free;
>   
> +	barn = get_barn(s);
> +
>   	if (!pcs->spare) {
> -		empty = barn_get_empty_sheaf(pcs->barn);
> +		empty = barn_get_empty_sheaf(barn);
>   		if (!empty)
>   			goto no_empty;
>   
> @@ -5956,7 +5975,7 @@ static void free_to_pcs_bulk(struct kmem_cache *s, size_t size, void **p)
>   		goto do_free;
>   	}
>   
> -	empty = barn_replace_full_sheaf(pcs->barn, pcs->main);
> +	empty = barn_replace_full_sheaf(barn, pcs->main);
>   	if (IS_ERR(empty)) {
>   		stat(s, BARN_PUT_FAIL);
>   		goto no_empty;
> @@ -7041,15 +7060,11 @@ static int init_percpu_sheaves(struct kmem_cache *s)
>   
>   	for_each_possible_cpu(cpu) {
>   		struct slub_percpu_sheaves *pcs;
> -		int nid;
>   
>   		pcs = per_cpu_ptr(s->cpu_sheaves, cpu);
>   
>   		local_trylock_init(&pcs->lock);
>   
> -		nid = cpu_to_mem(cpu);
> -
> -		pcs->barn = get_node(s, nid)->barn;
>   		pcs->main = alloc_empty_sheaf(s, GFP_KERNEL);
>   
>   		if (!pcs->main)


Thanks for the patch. I have applied your patch on top of next-20250902 
and issue is resolved. I am able to boot to kernel without issues.


Please add below tag.


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.



