Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F48B16252B
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2020 12:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgBRLCD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Feb 2020 06:02:03 -0500
Received: from relay.sw.ru ([185.231.240.75]:45020 "EHLO relay.sw.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726298AbgBRLCD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Feb 2020 06:02:03 -0500
Received: from dhcp-172-16-24-104.sw.ru ([172.16.24.104])
        by relay.sw.ru with esmtp (Exim 4.92.3)
        (envelope-from <ktkhai@virtuozzo.com>)
        id 1j40dQ-0003i5-1d; Tue, 18 Feb 2020 14:01:48 +0300
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
From:   Kirill Tkhai <ktkhai@virtuozzo.com>
To:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     linuxppc-dev@lists.ozlabs.org, Michal Hocko <mhocko@suse.com>
References: <3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com>
 <cf6be5f5-4bbc-0d34-fb64-33fd37bc48d9@virtuozzo.com>
Message-ID: <0ba2a3c6-6593-2cee-1cef-983cd75f920f@virtuozzo.com>
Date:   Tue, 18 Feb 2020 14:01:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <cf6be5f5-4bbc-0d34-fb64-33fd37bc48d9@virtuozzo.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 18.02.2020 13:50, Kirill Tkhai wrote:
> Hi, Sachin,
> 
> On 18.02.2020 13:45, Sachin Sant wrote:
>> Todays next fails to boot on a POWER9 PowerVM logical partition
>> with following trace:
>>
>> [    8.767660] random: systemd: uninitialized urandom read (16 bytes read)
>> [    8.768629] BUG: Kernel NULL pointer dereference on read at 0x000073b0
>> [    8.768635] Faulting instruction address: 0xc0000000003d55f4
>> [    8.768641] Oops: Kernel access of bad area, sig: 11 [#1]
>> [    8.768645] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>> [    8.768650] Modules linked in:
>> [    8.768655] CPU: 19 PID: 1 Comm: systemd Not tainted 5.6.0-rc2-next-20200218-autotest #1
>> [    8.768660] NIP:  c0000000003d55f4 LR: c0000000003d5b94 CTR: 0000000000000000
>> [    8.768666] REGS: c0000008b37836d0 TRAP: 0300   Not tainted  (5.6.0-rc2-next-20200218-autotest)
>> [    8.768671] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 24004844  XER: 00000000
>> [    8.768679] CFAR: c00000000000dec4 DAR: 00000000000073b0 DSISR: 40000000 IRQMASK: 1
>> [    8.768679] GPR00: c0000000003d5b94 c0000008b3783960 c00000000155d400 c0000008b301f500
>> [    8.768679] GPR04: 0000000000000dc0 0000000000000002 c0000000003443d8 c0000008bb398620
>> [    8.768679] GPR08: 00000008ba2f0000 0000000000000001 0000000000000000 0000000000000000
>> [    8.768679] GPR12: 0000000024004844 c00000001ec52a00 0000000000000000 0000000000000000
>> [    8.768679] GPR16: c0000008a1b20048 c000000001595898 c000000001750c18 0000000000000002
>> [    8.768679] GPR20: c000000001750c28 c000000001624470 0000000fffffffe0 5deadbeef0000122
>> [    8.768679] GPR24: 0000000000000001 0000000000000dc0 0000000000000002 c0000000003443d8
>> [    8.768679] GPR28: c0000008b301f500 c0000008bb398620 0000000000000000 c00c000002287180
>> [    8.768727] NIP [c0000000003d55f4] ___slab_alloc+0x1f4/0x760
>> [    8.768732] LR [c0000000003d5b94] __slab_alloc+0x34/0x60
>> [    8.768735] Call Trace:
>> [    8.768739] [c0000008b3783960] [c0000000003d5734] ___slab_alloc+0x334/0x760 (unreliable)
>> [    8.768745] [c0000008b3783a40] [c0000000003d5b94] __slab_alloc+0x34/0x60
>> [    8.768751] [c0000008b3783a70] [c0000000003d6fa0] __kmalloc_node+0x110/0x490
>> [    8.768757] [c0000008b3783af0] [c0000000003443d8] kvmalloc_node+0x58/0x110
>> [    8.768763] [c0000008b3783b30] [c0000000003fee38] mem_cgroup_css_online+0x108/0x270
>> [    8.768769] [c0000008b3783b90] [c000000000235aa8] online_css+0x48/0xd0
>> [    8.768775] [c0000008b3783bc0] [c00000000023eaec] cgroup_apply_control_enable+0x2ec/0x4d0
>> [    8.768781] [c0000008b3783ca0] [c000000000242318] cgroup_mkdir+0x228/0x5f0
>> [    8.768786] [c0000008b3783d10] [c00000000051e170] kernfs_iop_mkdir+0x90/0xf0
>> [    8.768792] [c0000008b3783d50] [c00000000043dc00] vfs_mkdir+0x110/0x230
>> [    8.768797] [c0000008b3783da0] [c000000000441c90] do_mkdirat+0xb0/0x1a0
>> [    8.768804] [c0000008b3783e20] [c00000000000b278] system_call+0x5c/0x68
>> [    8.768808] Instruction dump:
>> [    8.768811] 7c421378 e95f0000 714a0001 4082fff0 4bffff64 60000000 60000000 faa10088
>> [    8.768818] 3ea2000c 3ab57070 7b4a1f24 7d55502a <e94a73b0> 2faa0000 409e0394 3d02002a
>> [    8.768826] ---[ end trace 631af2cb73507891 ]---
>> [    8.770876]
>> [    9.770887] Kernel panic - not syncing: Fatal exception
>>
>> Bisect reveals the problem was introduced in next-20200217 by following commit 
>>
>> commit a75056fc1e7c 
>> mm/memcontrol.c: allocate shrinker_map on appropriate NUMA node
>>
>> I can boot the kernel successfully if the patch is reverted. 
> 
> 
> could you please test your boot with original patch from here:
> 
> https://patchwork.kernel.org/patch/11360007/

After you tried the above patch instead of the problem patch,
do one more test and apply the below on current linux-next.
Please, say which of the patches makes your kernel bootable again.

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 63bb6a2aab81..7b9b48dcbc60 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -334,7 +334,7 @@ static int memcg_expand_one_shrinker_map(struct mem_cgroup *memcg,
 		if (!old)
 			return 0;
 
-		new = kvmalloc_node(sizeof(*new) + size, GFP_KERNEL, nid);
+		new = kmalloc_node(sizeof(*new) + size, GFP_KERNEL, nid);
 		if (!new)
 			return -ENOMEM;
 
@@ -378,7 +378,7 @@ static int memcg_alloc_shrinker_maps(struct mem_cgroup *memcg)
 	mutex_lock(&memcg_shrinker_map_mutex);
 	size = memcg_shrinker_map_size;
 	for_each_node(nid) {
-		map = kvzalloc_node(sizeof(*map) + size, GFP_KERNEL, nid);
+		map = kzalloc_node(sizeof(*map) + size, GFP_KERNEL, nid);
 		if (!map) {
 			memcg_free_shrinker_maps(memcg);
 			ret = -ENOMEM;


