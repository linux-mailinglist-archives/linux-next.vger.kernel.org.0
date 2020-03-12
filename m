Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCBF318300D
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 13:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgCLMSy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 08:18:54 -0400
Received: from ozlabs.org ([203.11.71.1]:56761 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgCLMSy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 08:18:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48dSY504TYz9sP7;
        Thu, 12 Mar 2020 23:18:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1584015530;
        bh=uzPQHcKFUKJMHkfBDqG3/L/YcmfDrTWlBQVsywQ7YR0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=NJk9WkVNueZQ8JdTLd9cdYNpSN2l6FT4LixC6H90elMVVUziqXUwM3RZoMTQAiKml
         0XILov+55gYBGdg8UkJjOdPWCJeY7LTUyBuOoYDF4L/lyfe4Ed7uQpd6XvohxIZ2Fu
         hTIQkj/+zL2Oi9JUlzURBepA/uzEBhlnZGodbw5XVMSaXrodPbv2Fe3/3M/mBL5K+s
         WNI5yQJAJtWKbH31lUb4g/3lVpIZOXhi5fiHqOGBebL2V2V/DXWIGZ4X7Qsxddzi4K
         kRsBDzdH9twBbOzDAKozBKyUeMLfPTe0zpgk7dWPLH8zgbViB75ySHi9KhHuu+NxK9
         9pJJQwPX+9vEA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Michal Hocko <mhocko@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>
Cc:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Pekka Enberg <penberg@kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        David Rientjes <rientjes@google.com>,
        Christopher Lameter <cl@linux.com>,
        linuxppc-dev@lists.ozlabs.org,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
In-Reply-To: <20200310150114.GO8447@dhcp22.suse.cz>
References: <alpine.DEB.2.21.2002220337030.2000@www.lameter.com> <20200224085812.GB22443@dhcp22.suse.cz> <alpine.DEB.2.21.2002261823270.8012@www.lameter.com> <20200226184152.GQ3771@dhcp22.suse.cz> <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz> <dd450314-d428-6776-af07-f92c04c7b967@suse.cz> <20200227121214.GE3771@dhcp22.suse.cz> <52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com> <9a86f865-50b5-7483-9257-dbb08fecd62b@suse.cz> <20200227182650.GG3771@dhcp22.suse.cz> <20200310150114.GO8447@dhcp22.suse.cz>
Date:   Thu, 12 Mar 2020 23:18:42 +1100
Message-ID: <87a74lix5p.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Michal Hocko <mhocko@kernel.org> writes:
> On Thu 27-02-20 19:26:54, Michal Hocko wrote:
>> [Cc ppc maintainers]
> [...]
>> Please have a look at http://lkml.kernel.org/r/52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com
>> for the boot log with the debugging patch which tracks set_numa_mem.
>> This seems to lead to a crash in the slab allocator bebcause
>> node_to_mem_node(0) for memory less node resolves to the memory less
>> node http://lkml.kernel.org/r/dd450314-d428-6776-af07-f92c04c7b967@suse.cz.
>> The original report is http://lkml.kernel.org/r/3381CD91-AB3D-4773-BA04-E7A072A63968@linux.vnet.ibm.com
>
> ping 

The obvious fix is:

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 37c12e3bab9e..33b1fca0b258 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -892,6 +892,7 @@ void smp_prepare_boot_cpu(void)
 	paca_ptrs[boot_cpuid]->__current = current;
 #endif
 	set_numa_node(numa_cpu_lookup_table[boot_cpuid]);
+	set_numa_mem(local_memory_node(numa_cpu_lookup_table[boot_cpuid]));
 	current_set[boot_cpuid] = current;
 }


But that doesn't work because smp_prepare_boot_cpu() is called too
early:

asmlinkage __visible void __init start_kernel(void)
{
	...
	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
	boot_cpu_hotplug_init();

	build_all_zonelists(NULL);


And local_memory_node() uses first_zones_zonelist() which doesn't work
prior to build_all_zonelists() being called.


The patch below might work. Sachin can you test this? I tried faking up
a system with a memoryless node zero but couldn't get it to even start
booting.

cheers


diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 9b4f5fb719e0..d1f11437f6c4 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -282,6 +282,9 @@ void __init mem_init(void)
 	 */
 	BUILD_BUG_ON(MMU_PAGE_COUNT > 16);
 
+	BUG_ON(smp_processor_id() != boot_cpuid);
+	set_numa_mem(local_memory_node(numa_cpu_lookup_table[boot_cpuid]));
+
 #ifdef CONFIG_SWIOTLB
 	/*
 	 * Some platforms (e.g. 85xx) limit DMA-able memory way below
