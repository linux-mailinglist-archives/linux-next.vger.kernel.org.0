Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C382FB369
	for <lists+linux-next@lfdr.de>; Tue, 19 Jan 2021 08:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730812AbhASHmC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Jan 2021 02:42:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730784AbhASHlA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Jan 2021 02:41:00 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7595C061574
        for <linux-next@vger.kernel.org>; Mon, 18 Jan 2021 23:40:19 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id p5so20258395oif.7
        for <linux-next@vger.kernel.org>; Mon, 18 Jan 2021 23:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rWiAIVx/cfnS+Kuhe2BmmURCvyOlEBvFwxCefRsqkJI=;
        b=endm4JwIJyes4YS+ZYUM4Rl2772tT/bCmyAOmHbzu9bimAdluEy7qSidBvLkZZHMX3
         D5YknaW03JsLN8eaYa7110mEPwP97tRYCUXQuSLHHOPmKDk4oOkhip4E3luPhGuQRbaR
         nBh81B1TdlV5nGa6MKnp/ZZF1N/41vgusNyWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rWiAIVx/cfnS+Kuhe2BmmURCvyOlEBvFwxCefRsqkJI=;
        b=ZjuxJ8QFJoyLUuNc9TABbRa0MclYaJy89R1BnSApUx3zBdQiKqr/rOpFszxtEt53sL
         uGxCkoOb56VIYN1xOb3+zKmNYI1MScYvaz+I4jwtIbSJLvjuZL6tjfgIUIoiuC7u/rmF
         AojD8sipD9PRSx8DAEiXKgQuKBXhRDUeVL4f14t13RCFGEHIS7uIwqFX/MOfjsPvxMLG
         HZLsThmuytjj/OA7pGArn2flX649atT1J3b1t3eQOqWuLK9wByBejVmwDuxpGdyn3Q/g
         FqLtQ+uJFw/LwBHpRHNV+XDHmgU3oXXQ31jCFnfNeoRQ6YC4+bu8+b3WbxcWahp9dmjf
         Y4kA==
X-Gm-Message-State: AOAM530/ccjlVopz3X3wHKkVyJXzgGaYcb6/Yn5N3tZqh/O84sEXYYgA
        xLgyeWZVXnplGZQq4dK5N/2vtfwrGoaHuWyRwiXlNQ==
X-Google-Smtp-Source: ABdhPJz39meTF2PkvT6db0HYrGN9ZbO9Pk9DwmCKOtfqZAlqFSJrBK4+hXvLRlG6aHm+58rrK8hCXbyp+oOkIKBxD6Y=
X-Received: by 2002:aca:ad92:: with SMTP id w140mr1762109oie.128.1611042019031;
 Mon, 18 Jan 2021 23:40:19 -0800 (PST)
MIME-Version: 1.0
References: <20210113162948.45b0fbfd@canb.auug.org.au> <20210119162619.6782c5d2@canb.auug.org.au>
In-Reply-To: <20210119162619.6782c5d2@canb.auug.org.au>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 19 Jan 2021 08:40:08 +0100
Message-ID: <CAKMK7uGiVnEaD029hCLhuHLXuTeMSuEQoe25oLXDm_GuOhzDrw@mail.gmail.com>
Subject: Re: linux-next: boot failure after merge of the iomem-mmap-vs-gup tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jan 19, 2021 at 6:26 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Wed, 13 Jan 2021 16:29:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the iomem-mmap-vs-gup tree, today's linux-next boot test
> > (powerpc pseries_le_defconfig) failed like this:
> >
> >     EEH: pSeries platform initialized
> >     PCI: Probing PCI hardware
> >     BUG: Kernel NULL pointer dereference on write at 0x00000030
> >     Faulting instruction address: 0xc00000000013bf4c
> >     Oops: Kernel access of bad area, sig: 11 [#1]
> >     LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> >     Modules linked in:
> >     CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc3 #2
> >     NIP:  c00000000013bf4c LR: c0000000007a9ee8 CTR: 0000000000000000
> >     REGS: c0000000063a3610 TRAP: 0380   Not tainted  (5.11.0-rc3)
> >     MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 84002440  XER: 00000000
> >     CFAR: c0000000007a9ee4 IRQMASK: 0
> >     GPR00: c0000000007a9ee8 c0000000063a38b0 c0000000013d8100 c000000006061300
> >     GPR04: 0000000000000000 0000000000000b20 c000000000f11738 000000000000ffff
> >     GPR08: c0000000007a7ab0 0000000000000000 c0000000007a7a40 2d6770696f730000
> >     GPR12: 0000000000000000 c0000000015b0000 c000000000013120 0000000000000000
> >     GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> >     GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> >     GPR24: c000000006210de8 c000000006167120 c000000006620b20 0000000000000000
> >     GPR28: c000000006167120 0000000000000180 c000000006061300 c000000006167000
> >     NIP [c00000000013bf4c] iomem_get_mapping+0x1c/0x30
> >     LR [c0000000007a9ee8] pci_create_legacy_files+0xa8/0x1c0
> >     Call Trace:
> >     [c0000000063a38b0] [c0000000007a9e84] pci_create_legacy_files+0x44/0x1c0 (unreliable)
> >     [c0000000063a3930] [c000000000795198] pci_register_host_bridge+0x288/0x510
> >     [c0000000063a3a60] [c000000000795514] pci_create_root_bus+0xf4/0x150
> >     [c0000000063a3ac0] [c00000000006d424] pcibios_scan_phb+0xe4/0x270
> >     [c0000000063a3b70] [c000000001010b40] pcibios_init+0x8c/0x128
> >     [c0000000063a3bf0] [c000000000012b70] do_one_initcall+0x60/0x2c0
> >     [c0000000063a3cc0] [c0000000010046b4] kernel_init_freeable+0x2e8/0x380
> >     [c0000000063a3da0] [c000000000013144] kernel_init+0x2c/0x168
> >     [c0000000063a3e10] [c00000000000dff0] ret_from_kernel_thread+0x5c/0x6c
> >     Instruction dump:
> >     7c634850 4e800020 60000000 60000000 60420000 3c4c012a 3842c1d0 7c0802a6
> >     60000000 3d22000d e929caf8 7c2004ac <e8690030> 4e800020 60000000 60000000
> >     ---[ end trace 77f55ece72f02708 ]---
> >
> >     Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> >
> > Caused by commit
> >
> >   85482fbab59e ("PCI: Revoke mappings like devmem")
> >
> > Reverting that commit fixes the boot, so I have done that for today.
>
> I am still reverting this commit.

Thanks for the reminder, I missed your earlier report. I don't have a
machine here with HAVE_PCI_LEGACY, but I think I understand what's
going on here. I'll drop the last two patches from the branch for now
(since both need to be changed to address this somehow).
-Daniel





--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
