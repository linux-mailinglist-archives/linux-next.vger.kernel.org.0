Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02DD8276EC6
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 12:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgIXKbv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 06:31:51 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:59247 "EHLO
        smtpout1.mo529.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727349AbgIXKbv (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Sep 2020 06:31:51 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
        by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 4739E5E60CEB;
        Thu, 24 Sep 2020 12:31:48 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 24 Sep
 2020 12:31:47 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-100R003af8f0d55-b5ab-454e-92da-f116a61c5fdd,
                    53F9BE2CB1B903358CFB5FEE1806106D7C62144A) smtp.auth=clg@kaod.org
Subject: Re: [PATCH v2] powerpc/pci: unmap legacy INTx interrupts when a PHB
 is removed
To:     Alexey Kardashevskiy <aik@ozlabs.ru>, Qian Cai <cai@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>
CC:     Oliver O'Halloran <oohall@gmail.com>,
        <linuxppc-dev@lists.ozlabs.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        <linux-next@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200807101854.844619-1-clg@kaod.org>
 <9c5eca863c63e360662fae7597213e8927c2a885.camel@redhat.com>
 <fce8ffe1-521c-8344-c7ad-53550e408cdc@kaod.org>
 <6716add0-9244-4da1-a578-f7faeb529e77@ozlabs.ru>
From:   =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c5f8c0b3-9ea4-6d7e-3486-aa3e1c73f026@kaod.org>
Date:   Thu, 24 Sep 2020 12:31:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <6716add0-9244-4da1-a578-f7faeb529e77@ozlabs.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 36dec5eb-b4d2-497b-8558-e2fefb7aacbb
X-Ovh-Tracer-Id: 8472396802515700588
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudekgdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffkefffedvgfdtudevhfevgeejvefggfejheeliefhvdeugeekveekuddvheefhfenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegrihhksehoiihlrggsshdrrhhu
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/24/20 7:11 AM, Alexey Kardashevskiy wrote:
> 
> 
> On 23/09/2020 17:06, Cédric Le Goater wrote:
>> On 9/23/20 2:33 AM, Qian Cai wrote:
>>> On Fri, 2020-08-07 at 12:18 +0200, Cédric Le Goater wrote:
>>>> When a passthrough IO adapter is removed from a pseries machine using
>>>> hash MMU and the XIVE interrupt mode, the POWER hypervisor expects the
>>>> guest OS to clear all page table entries related to the adapter. If
>>>> some are still present, the RTAS call which isolates the PCI slot
>>>> returns error 9001 "valid outstanding translations" and the removal of
>>>> the IO adapter fails. This is because when the PHBs are scanned, Linux
>>>> maps automatically the INTx interrupts in the Linux interrupt number
>>>> space but these are never removed.
>>>>
>>>> To solve this problem, we introduce a PPC platform specific
>>>> pcibios_remove_bus() routine which clears all interrupt mappings when
>>>> the bus is removed. This also clears the associated page table entries
>>>> of the ESB pages when using XIVE.
>>>>
>>>> For this purpose, we record the logical interrupt numbers of the
>>>> mapped interrupt under the PHB structure and let pcibios_remove_bus()
>>>> do the clean up.
>>>>
>>>> Since some PCI adapters, like GPUs, use the "interrupt-map" property
>>>> to describe interrupt mappings other than the legacy INTx interrupts,
>>>> we can not restrict the size of the mapping array to PCI_NUM_INTX. The
>>>> number of interrupt mappings is computed from the "interrupt-map"
>>>> property and the mapping array is allocated accordingly.
>>>>
>>>> Cc: "Oliver O'Halloran" <oohall@gmail.com>
>>>> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>
>>> Some syscall fuzzing will trigger this on POWER9 NV where the traces pointed to
>>> this patch.
>>>
>>> .config: https://gitlab.com/cailca/linux-mm/-/blob/master/powerpc.config
>>
>> OK. The patch is missing a NULL assignement after kfree() and that
>> might be the issue. 
>>
>> I did try PHB removal under PowerNV, so I would like to understand 
>> how we managed to remove twice the PCI bus and possibly reproduce. 
>> Any chance we could grab what the syscall fuzzer (syzkaller) did ? 
> 
> 
> 
> My guess would be it is doing this in parallel to provoke races.

Concurrency removal and rescan should be controlled by : 

   pci_stop_and_remove_bus_device_locked()
       pci_lock_rescan_remove() 

And, in the report, the stack traces are on the same CPU and PID. 



What I think is happening is that we did a couple of remove/rescan
of the same PHB. The problem is that ->irq_map is not reallocated
the second time because the PHB is re-scanned differently on the 
PowerNV platform. At the second remove, the ->irq_map being not NULL, 
we try to kfree it again and the allocator warns of a double free :/

This works fine on pseries/KVM because the PHB is never removed and 
on pseries/pHyp, pcibios_scan_phb() is called at PHB hotplug. But on 
PowerNV, pcibios_scan_phb() is only called at probe/boot time and 
not at hotplug time :/

I was a good thing to spot that before merge. But I need to revise 
that patch again.

Thanks,

C.
