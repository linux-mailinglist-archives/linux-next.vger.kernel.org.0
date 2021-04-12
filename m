Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7671735BA09
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 08:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbhDLGPD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Apr 2021 02:15:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:46958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229461AbhDLGPC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Apr 2021 02:15:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A8B36120F;
        Mon, 12 Apr 2021 06:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618208085;
        bh=E+b7283Wm9/rGSWiBvNRtCwIi/weLnjjRP42+kszteQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DeuR/OWuMp2UNsCKyj7eiTgiBotONVtXrgoDaoMZAnIS/Np/DPBAxFFCkQZ7Gy7j6
         MNg2ZKYWqYSSHKWVY0Q8bxwHtUdu8oMlQ2ybr0orMV1G0su9+me4goOnL0w6EIBIhr
         Y0xAEN9p1lpHIJHzB7Av+/Ap85AKvu62P5DdsMScQ4T8QsU07XUjaDEgy6rqdHV5nD
         6suE/vcRfqBKH7xMNCxq7vJlhrZc1P+NWv9pth5sL29L4zwNdFud8WhDhVNS/3YUfT
         CBl/FZZ19ZMVRaiH1k70s05WSD5Rn6A4tyIGzgT9bIjz3SRH3o06OBv+sR5euAsvYq
         /sUgnQKMWgZmg==
Date:   Mon, 12 Apr 2021 09:14:38 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>
Subject: Re: linux-next: Tree for Apr 9 (x86 boot problem)
Message-ID: <YHPlTifk6jST5auY@kernel.org>
References: <20210409215103.03999588@canb.auug.org.au>
 <f67d3e03-af90-f790-baf4-8d412fe055af@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f67d3e03-af90-f790-baf4-8d412fe055af@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Randy,

On Sun, Apr 11, 2021 at 07:41:37PM -0700, Randy Dunlap wrote:
> On 4/9/21 4:51 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20210408:
> > 
> 
> Hi,
> 
> I cannot boot linux-next 20210408 nor 20210409 on an antique
> x86_64 laptop (Toshiba Portege).
> 
> After many failed tests, I finally resorted to git bisect,
> which led me to:
> 
> # bad: [4c674481dcf9974834b96622fa4b079c176f36f9] x86/setup: Merge several reservations of start of memory
> git bisect bad 4c674481dcf9974834b96622fa4b079c176f36f9
> 
> 
> I reverted both of these patches and the laptop boots successfully:
> 
> commit a799c2bd29d19c565f37fa038b31a0a1d44d0e4d
> Author: Mike Rapoport <rppt@kernel.org>
> Date:   Tue Mar 2 12:04:05 2021 +0200
> 
>     x86/setup: Consolidate early memory reservations
> 
> &&
> 
> commit 4c674481dcf9974834b96622fa4b079c176f36f9
> Author: Mike Rapoport <rppt@kernel.org>
> Date:   Tue Mar 2 12:04:06 2021 +0200
> 
>     x86/setup: Merge several reservations of start of memory
> 
> 
> There is no (zero, nil) console display when I try to boot
> next 0408 or 0409. I connected a USB serial debug cable and
> booted with earlyprintk=dbgp,keep and still got nothing.
> 
> The attached boot log is linux-next 20210409 minus the 2 patches
> listed above.
> 
> Mike- what data would you like to see?

Huh, with no console this would be fun :)
For now the only idea I have is to "bisect" the changes and move
reservations one by one back to their original place until the system boots
again. 

I'd start with trim_snb_memory() since it's surely needed on your laptop
and quite likely it is a NOP on other systems.

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 776fc9b3fafe..dfca9d6b1aa6 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -746,8 +746,6 @@ static void __init early_reserve_memory(void)
 
 	reserve_ibft_region();
 	reserve_bios_regions();
-
-	trim_snb_memory();
 }
 
 /*
@@ -1081,6 +1079,8 @@ void __init setup_arch(char **cmdline_p)
 
 	reserve_real_mode();
 
+	trim_snb_memory();
+
 	init_mem_mapping();
 
 	idt_setup_early_pf();
 
> -- 
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

-- 
Sincerely yours,
Mike.
