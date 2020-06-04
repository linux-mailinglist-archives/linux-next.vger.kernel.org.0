Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746701EE02D
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 10:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgFDIzS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 04:55:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727874AbgFDIzQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 04:55:16 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AAFC03E96E
        for <linux-next@vger.kernel.org>; Thu,  4 Jun 2020 01:55:16 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x22so3099638lfd.4
        for <linux-next@vger.kernel.org>; Thu, 04 Jun 2020 01:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wX/HMY1MRP8U/gjc3VbRQHcLWsJVELT9dkOTjKxMtVY=;
        b=dnFzQRrbfXxSpYDcYeOBjWm1ZuPcoD6NU73Rn0+PwaRw6755xtm/+yOZcIflRwncuV
         BaBtWr8t+jEsn4YTdhr0KxQOeqIWcxIHaeZVS8Xoc7P/0xdaCxHN+/Bz1fYikyy8XfDd
         u6RYfyzcDnN672UN0j/5mq74CzwrVmXAB53V3HyjsXVK1iQrhCSxMTVnxOS34ivIAJqa
         aQhMnvdRdXsQhAtQ3oKd0B7WGtvpk2l8Xcwt1SInOh8uy+nPsL8DE/BWzPMCZBWJeZOH
         ENERiodaMRIzGWPdxAKHxlgNVMBaz3yGRycaR05/cvaDVzIfJYMDO6p0zoHAWNr5PxwB
         JnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wX/HMY1MRP8U/gjc3VbRQHcLWsJVELT9dkOTjKxMtVY=;
        b=MaiaanDhOUWxA11VDMBywyzFWuBXXZUMBUYn3+ws6SMi6FKY727AOCmalfuFuuieh9
         kZS/nXXnxJ2f7/eZWqRx3JfZBn4BOCQ5QIjm3JRyXBNYppiKDKrhwYrk8N6hG7njM3X8
         4KoWjmJ4ykfZmYkFEHVm6AkKSfFpmbstg7wujbtOSgJqF1TcXiUgcjeisTRUzqGY619w
         +8+tmbKldPeV9uhiKScm71IeN+WV0S/z/4IOtxjfnoP9AIKTtbsj1KSGq79pK5NftsZ7
         0clszVOrvX4q9c9JxXs0YHywXmKGraKNbhbhNPBxNoYzpokgtZeenWFfgEnFrHA/qpsh
         2jig==
X-Gm-Message-State: AOAM53106Bg+DhXDW1NqKOgaCk1FbfHulGU291kkQB7+kMJb5yYhIEPn
        UksTXhE+J1oz+hSOU+hkzdQINCLLV+aJkUjjcQLIDQ==
X-Google-Smtp-Source: ABdhPJz0o1EJ6dFFghkS8xup1wk1Y0lP19vT/WOEvgMVQo42NPE3njAeNbTwIyu0Yg9XGPmSgubrKg0JstC1Q1jZn5o=
X-Received: by 2002:a19:5013:: with SMTP id e19mr1920798lfb.95.1591260914773;
 Thu, 04 Jun 2020 01:55:14 -0700 (PDT)
MIME-Version: 1.0
References: <1591181457.9020.13.camel@abdul> <20200603133257.GL6857@suse.de>
In-Reply-To: <20200603133257.GL6857@suse.de>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 4 Jun 2020 14:25:03 +0530
Message-ID: <CA+G9fYu+NWDzg4ZiZQBqqViDhgMBTd=2vjYW-HG4i4phqNUDbQ@mail.gmail.com>
Subject: Re: [mainline][Oops][bisected 2ba3e6 ] 5.7.0 boot fails with kernel
 panic on powerpc
To:     Joerg Roedel <jroedel@suse.de>
Cc:     Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-next <linux-next@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        mpe <mpe@ellerman.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        sachinp <sachinp@linux.vnet.ibm.com>,
        manvanth <manvanth@linux.vnet.ibm.com>,
        "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>, hch <hch@lst.de>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 3 Jun 2020 at 19:03, Joerg Roedel <jroedel@suse.de> wrote:
>
> On Wed, Jun 03, 2020 at 04:20:57PM +0530, Abdul Haleem wrote:
> > @Joerg, Could you please have a look?
>
> Can you please try the attached patch?

@Joerg, Linaro test farm noticed this kernel crash on nxp ls2088
Machine model: Freescale Layerscape 2088A RDB Board
while booting Linux mainline 5.7.0 version kernel.

After applying your proposed patch fixed boot problem.

Tested-by: Naresh Kamboju <nareshj.kamboju@linaro.org>

Test ref:
https://lavalab.nxp.com/scheduler/job/23787#L426

Here is the kernel crash log before patch applied,

[    0.000000] Linux version 5.7.0-03887-gf6aee505c71b
(TuxBuild@ecb9ef34f06f) (gcc version 9.3.0 (Debian 9.3.0-8), GNU ld
(GNU Binutils for Debian) 2.34) #1 SMP PREEMPT Wed Jun 3 18:21:26 UTC
2020
[    0.000000] Machine model: Freescale Layerscape 2088A RDB Board
<>
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] Unable to handle kernel paging request at virtual
address fffeffff80000000
[    0.000000] Mem abort info:
[    0.000000]   ESR = 0x96000004
[    0.000000]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.000000]   SET = 0, FnV = 0
[    0.000000]   EA = 0, S1PTW = 0
[    0.000000] Data abort info:
[    0.000000]   ISV = 0, ISS = 0x00000004
[    0.000000]   CM = 0, WnR = 0
[    0.000000] [fffeffff80000000] address between user and kernel address ranges
[    0.000000] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
5.7.0-03887-gf6aee505c71b #1
[    0.000000] Hardware name: Freescale Layerscape 2088A RDB Board (DT)
[    0.000000] pstate: 80000085 (Nzcv daIf -PAN -UAO BTYPE=--)
[    0.000000] pc : map_kernel_range_noflush+0xc0/0x280
[    0.000000] lr : __vmalloc_node_range+0x154/0x2a0
[    0.000000] sp : ffffb3b1dcbc3e20
[    0.000000] x29: ffffb3b1dcbc3e20 x28: fffeffff80000000
[    0.000000] x27: ffff800010004000 x26: ffff800010000000
[    0.000000] x25: 0000000000402dc2 x24: ffffb3b1dc53c000
[    0.000000] x23: 0068000000000f13 x22: 0000000000000004
[    0.000000] x21: ffffb3b1dc53cf48 x20: 0000000000000000
[    0.000000] x19: ffffb3b1dc627800 x18: 00000000000000c0
[    0.000000] x17: 0000000000000000 x16: 0000000000000007
[    0.000000] x15: dead000000000100 x14: fffffe020b990600
[    0.000000] x13: dead000000000122 x12: 0000000000000001
[    0.000000] x11: 0000000000000000 x10: ffff0082fe3fdec0
[    0.000000] x9 : ffff0082fe342d58 x8 : ffff4cd121ba5000
[    0.000000] x7 : ffff808010000000 x6 : 0000000000000004
[    0.000000] x5 : 000000000000fffd x4 : 0000000000004000
[    0.000000] x3 : ffff800050000000 x2 : 0001000080000000
[    0.000000] x1 : 0000000000000000 x0 : ffff800010003fff
[    0.000000] Call trace:
[    0.000000]  map_kernel_range_noflush+0xc0/0x280
[    0.000000]  __vmalloc_node_range+0x154/0x2a0
[    0.000000]  __vmalloc_node+0x5c/0x70
[    0.000000]  init_IRQ+0xac/0xf8
[    0.000000]  start_kernel+0x2d0/0x4dc
[    0.000000] Code: f90047e0 d503201f d2a80003 8b030343 (f9400380)
[    0.000000] random: get_random_bytes called from
print_oops_end_marker+0x2c/0x58 with crng_init=0
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!

ref:
https://lavalab.nxp.com/scheduler/job/23596#L603

-- 
Linaro LKFT
https://lkft.linaro.org
