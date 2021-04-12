Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A83DF35CF1C
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 19:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244073AbhDLRC4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Apr 2021 13:02:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:36496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243837AbhDLRBz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Apr 2021 13:01:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88A2C6023C;
        Mon, 12 Apr 2021 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618246896;
        bh=L7lgyqyvg1+L9KTgBVH3CL8x/DUoIk1DVMM1H5/nB8c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BVqSnmVAMbG2bW7gk+WVxxXUYAy2m2B6GH/6d6wpqxJvTSs3xQcRs8tiEQ8JwsxYf
         IME5aUNiKijB4EImzSfH+a9fH+VrkTp2i2nk9/rA+ralEvDmp2F+Zc1T7xCOru5zmF
         r0AYAzQSIJxY9ZFVZflAKq7sDS0bp66hQpRAj98oBwhKd08alaJajWbAGU/TNP1j2O
         RT3uQV5x1pSlFkXkoaSNkg7q8toZ0tWs5vCvLQ3BB6rCcEfDjMd6iT5z2nJBgY4JVg
         jLnDa0oxwPk/aU9iyL/brSIT/PtTOMwKK00Cf+JR2Cv6L3kp87PMgQ6gc4+D59DdZY
         BRw4spZQPy/fQ==
Date:   Mon, 12 Apr 2021 20:01:29 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>
Subject: Re: linux-next: Tree for Apr 9 (x86 boot problem)
Message-ID: <YHR86T15BzETVHhk@kernel.org>
References: <20210409215103.03999588@canb.auug.org.au>
 <f67d3e03-af90-f790-baf4-8d412fe055af@infradead.org>
 <YHPlTifk6jST5auY@kernel.org>
 <aa83b81e-a03d-b835-6b45-01efc7e08dce@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa83b81e-a03d-b835-6b45-01efc7e08dce@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 12, 2021 at 08:49:49AM -0700, Randy Dunlap wrote:
> On 4/11/21 11:14 PM, Mike Rapoport wrote:
> > Hi Randy,
> > 
> > On Sun, Apr 11, 2021 at 07:41:37PM -0700, Randy Dunlap wrote:
> >> On 4/9/21 4:51 AM, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20210408:
> >>>
> >>
> >> Hi,
> >>
> >> I cannot boot linux-next 20210408 nor 20210409 on an antique
> >> x86_64 laptop (Toshiba Portege).
> >>
> >> After many failed tests, I finally resorted to git bisect,
> >> which led me to:
> >>
> >> # bad: [4c674481dcf9974834b96622fa4b079c176f36f9] x86/setup: Merge several reservations of start of memory
> >> git bisect bad 4c674481dcf9974834b96622fa4b079c176f36f9
> >>
> >>
> >> I reverted both of these patches and the laptop boots successfully:
> >>
> >> commit a799c2bd29d19c565f37fa038b31a0a1d44d0e4d
> >> Author: Mike Rapoport <rppt@kernel.org>
> >> Date:   Tue Mar 2 12:04:05 2021 +0200
> >>
> >>     x86/setup: Consolidate early memory reservations
> >>
> >> &&
> >>
> >> commit 4c674481dcf9974834b96622fa4b079c176f36f9
> >> Author: Mike Rapoport <rppt@kernel.org>
> >> Date:   Tue Mar 2 12:04:06 2021 +0200
> >>
> >>     x86/setup: Merge several reservations of start of memory
> >>
> >>
> >> There is no (zero, nil) console display when I try to boot
> >> next 0408 or 0409. I connected a USB serial debug cable and
> >> booted with earlyprintk=dbgp,keep and still got nothing.
> >>
> >> The attached boot log is linux-next 20210409 minus the 2 patches
> >> listed above.
> >>
> >> Mike- what data would you like to see?
> > 
> > Huh, with no console this would be fun :)
> > For now the only idea I have is to "bisect" the changes and move
> > reservations one by one back to their original place until the system boots
> > again. 
> > 
> > I'd start with trim_snb_memory() since it's surely needed on your laptop
> > and quite likely it is a NOP on other systems.
> > 
> > diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> > index 776fc9b3fafe..dfca9d6b1aa6 100644
> > --- a/arch/x86/kernel/setup.c
> > +++ b/arch/x86/kernel/setup.c
> > @@ -746,8 +746,6 @@ static void __init early_reserve_memory(void)
> >  
> >  	reserve_ibft_region();
> >  	reserve_bios_regions();
> > -
> > -	trim_snb_memory();
> >  }
> >  
> >  /*
> > @@ -1081,6 +1079,8 @@ void __init setup_arch(char **cmdline_p)
> >  
> >  	reserve_real_mode();
> >  
> > +	trim_snb_memory();
> > +
> >  	init_mem_mapping();
> >  
> >  	idt_setup_early_pf();
> >  
> >> -- 

Hi Randy,
 
> Hi Mike,
> That works fine.
> Can you provide another/next step?
 
I thought about adding some prints to see what's causing the hang, the
reservations or their absence. Can you replace the debug patch with this
one:

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 776fc9b3fafe..a10ac252dbcc 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -600,10 +600,13 @@ static bool __init snb_gfx_workaround_needed(void)
 		return false;
 
 	vendor = read_pci_config_16(0, 2, 0, PCI_VENDOR_ID);
+	devid = read_pci_config_16(0, 2, 0, PCI_DEVICE_ID);
+
+	pr_info("%s: vendor: %x, device: %x\n", __func__, vendor, device);
+
 	if (vendor != 0x8086)
 		return false;
 
-	devid = read_pci_config_16(0, 2, 0, PCI_DEVICE_ID);
 	for (i = 0; i < ARRAY_SIZE(snb_ids); i++)
 		if (devid == snb_ids[i])
 			return true;
@@ -747,7 +750,7 @@ static void __init early_reserve_memory(void)
 	reserve_ibft_region();
 	reserve_bios_regions();
 
-	trim_snb_memory();
+	pr_info("%s: snb_gfx: %d\n", __func__, snb_gfx_workaround_needed());
 }
 
 /*
@@ -1081,6 +1084,8 @@ void __init setup_arch(char **cmdline_p)
 
 	reserve_real_mode();
 
+	trim_snb_memory();
+
 	init_mem_mapping();
 
 	idt_setup_early_pf();

> If not, I'll try a few things.

Sure :)
 
> thanks.
> -- 
> ~Randy
> 

-- 
Sincerely yours,
Mike.
