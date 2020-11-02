Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14FDF2A2EB3
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 16:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgKBPyy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 10:54:54 -0500
Received: from 4.mo52.mail-out.ovh.net ([178.33.43.201]:41823 "EHLO
        4.mo52.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbgKBPyy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 10:54:54 -0500
X-Greylist: delayed 4198 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Nov 2020 10:54:53 EST
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.149])
        by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 4C11D202E3A;
        Mon,  2 Nov 2020 15:39:30 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 2 Nov 2020
 15:39:28 +0100
Authentication-Results: garm.ovh; auth=pass (GARM-104R0056532ddeb-85b3-4075-ace5-1479fb1b9dae,
                    8DD5A59BB4BDDF13F63AE8D0997EBD433013A0F2) smtp.auth=clg@kaod.org
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
 <89726af2-00ca-9d47-f417-4bea8d5b8b1f@ozlabs.ru>
From:   =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3497b725-9108-9f63-9cc2-ac7b1dd06c09@kaod.org>
Date:   Mon, 2 Nov 2020 15:39:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <89726af2-00ca-9d47-f417-4bea8d5b8b1f@ozlabs.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 572cb46b-2a68-40ca-8586-e75424dab774
X-Ovh-Tracer-Id: 1882504645398334316
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddgieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffekffefvdfgtdduvefhveegjeevgffgjeehleeihfdvueegkeevkeduvdehfefhnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheprghikhesohiilhgrsghsrdhruh
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/14/20 4:55 AM, Alexey Kardashevskiy wrote:
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
> How do you remove PHBs exactly? There is no such thing in the powernv platform, I thought someone added this and you are fixing it but no. PHBs on powernv are created at the boot time and there is no way to remove them, you can only try removing all the bridges.

yes. I noticed that later when proposing the fix for the double 
free.

> So what exactly are you doing?

What you just said above, with the commands : 

  echo 1 >  /sys/devices/pci0031\:00/0031\:00\:00.0/remove
  echo 1 >  /sys/devices/pci0031\:00/pci_bus/0031\:00/rescan


C. 

