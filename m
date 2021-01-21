Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03BE32FF479
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 20:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726812AbhAUTHm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 14:07:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:38138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726680AbhAUTHU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Jan 2021 14:07:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4620A23A58;
        Thu, 21 Jan 2021 18:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611255322;
        bh=FBagPdjKuwtL8Rl9UI0E8tbyAtcpDMOgoSPG7m66OgA=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Oyp33BzG1ukm2BS4NiGuIIH1CJ8erzSBwHwysmbenJjsFYHF8i/oN87ulxf160Zsp
         h3Wwk6GbOI9ipsMJ2q6O9CaSCsQfn35tobXFdzsGSBd0qo0KiqrT4ROlVHwo1VQH24
         Xs3NweurwcDVQYGMlOop8mX8gCOZPid7de/t5NiYkKzVPlHIptQbNTY+qBMiflJiSS
         oL4HV3P+srJGN5qo02zN6q3NJubd1luw8XaLbNunhPThTVB5Z9LR9WIzW9OxRGDhF6
         2xqr0WDz5dLHfvAu5Z+jgGlkCObsZ+XwA1wOsIkEjzZzp/tKAbT5wW4K2J+q2CagxA
         M9FdQXZTSl/7w==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id DCA9035214EB; Thu, 21 Jan 2021 10:55:21 -0800 (PST)
Date:   Thu, 21 Jan 2021 10:55:21 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     rcu@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: rcu-torture: Internal error: Oops: 96000006
Message-ID: <20210121185521.GQ2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <CA+G9fYvV5SZ47M-XpABya11okgR7BJQk-3dDuFWzgVmGN3Lurg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvV5SZ47M-XpABya11okgR7BJQk-3dDuFWzgVmGN3Lurg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 21, 2021 at 10:37:21PM +0530, Naresh Kamboju wrote:
> While running rcu-torture test on qemu_arm64 and arm64 Juno-r2 device
> the following kernel crash noticed. This started happening from Linux next
> next-20210111 tag to next-20210121.
> 
> metadata:
>   git branch: master
>   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git describe: next-20210111
>   kernel-config: https://builds.tuxbuild.com/1muTTn7AfqcWvH5x2Alxifn7EUH/config
> 
> output log:
> 
> [  621.538050] mem_dump_obj() slab test: rcu_torture_stats =
> ffff0000c0a3ac40, &rhp = ffff800012debe40, rhp = ffff0000c8cba000, &z
> = ffff8000091ab8e0
> [  621.546662] mem_dump_obj(ZERO_SIZE_PTR):
> [  621.546696] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000008
> [  621.555431] Mem abort info:
> [  621.557243]   ESR = 0x96000006
> [  621.559074]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  621.562240]   SET = 0, FnV = 0
> [  621.563626]   EA = 0, S1PTW = 0
> [  621.565134] Data abort info:
> [  621.566425]   ISV = 0, ISS = 0x00000006
> [  621.568064]   CM = 0, WnR = 0
> [  621.569571] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000101ef0000
> [  621.572446] [0000000000000008] pgd=0000000102ee1003,
> p4d=0000000102ee1003, pud=0000000100b25003, pmd=0000000000000000
> [  621.577007] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> [  621.579359] Modules linked in: rcutorture(-) torture rfkill crct10dif_ce fuse
> [  621.582549] CPU: 2 PID: 422 Comm: rcu_torture_sta Not tainted
> 5.11.0-rc2-next-20210111 #2
> [  621.585294] Hardware name: linux,dummy-virt (DT)
> [  621.586671] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> [  621.588497] pc : kmem_valid_obj+0x58/0xa8
> [  621.589748] lr : kmem_valid_obj+0x40/0xa8
> [  621.591022] sp : ffff800012debdc0
> [  621.592026] x29: ffff800012debdc0 x28: 0000000000000000
> [  621.593652] x27: ffff800012e8b988 x26: ffff0000c634dbc0
> [  621.595287] x25: 0000000000000000 x24: ffff8000091a1e60
> [  621.596882] x23: ffff8000091ab8e0 x22: ffff0000c0a3ac40
> [  621.598464] x21: ffff0000c1f44100 x20: ffff8000091a5e90
> [  621.600070] x19: 0000000000000000 x18: 0000000000000010
> [  621.601692] x17: 0000000000007fff x16: 00000000ffffffff
> [  621.603303] x15: ffff0000c0a3b0b8 x14: 66203d2070687226
> [  621.604866] x13: 202c303463613361 x12: 2c30346562656432
> [  621.606455] x11: ffff80001246cbc0 x10: ffff800012454b80
> [  621.608064] x9 : ffff8000100370c8 x8 : 0000000100000000
> [  621.609649] x7 : 0000000000000018 x6 : ffff800012816348
> [  621.611253] x5 : ffff800012816348 x4 : 0000000000000001
> [  621.612849] x3 : 0000000000000001 x2 : 0000000140000000
> [  621.614455] x1 : 0000000000000000 x0 : fffffc0000000000
> [  621.616062] Call trace:
> [  621.616816]  kmem_valid_obj+0x58/0xa8
> [  621.617933]  mem_dump_obj+0x20/0xc8
> [  621.619015]  rcu_torture_stats+0xf0/0x298 [rcutorture]
> [  621.620578]  kthread+0x120/0x158
> [  621.621583]  ret_from_fork+0x10/0x34
> [  621.622685] Code: 8b000273 b25657e0 d34cfe73 8b131813 (f9400660)
> [  621.624570] ---[ end trace 2a00688830f37ea1 ]---
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> 
> Full test log:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20210111/testrun/3716647/suite/linux-log-parser/test/check-kernel-oops-2124993/log
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20210121/testrun/3791289/suite/linux-log-parser/test/check-kernel-oops-2172413/log

Huh.  I am relying on virt_addr_valid() rejecting NULL pointers and
things like ZERO_SIZE_PTR, which is defined as ((void *)16).  It looks
like your configuration rejects NULL as an invalid virtual address,
but does not reject ZERO_SIZE_PTR.  Is this the intent, given that you
are not allowed to dereference a ZERO_SIZE_PTR?

Adding the ARM64 guys on CC for their thoughts.

It is easy enough for me to make kmem_valid_obj() return false for any
address less than (say) PAGE_SIZE for the upcoming merge window, but I
figured I should check for the longer term.

							Thanx, Paul
