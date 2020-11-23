Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA8E2C197E
	for <lists+linux-next@lfdr.de>; Tue, 24 Nov 2020 00:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727656AbgKWXjR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Nov 2020 18:39:17 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57557 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727637AbgKWXjR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Nov 2020 18:39:17 -0500
Received: by ozlabs.org (Postfix, from userid 1034)
        id 4Cg3X33gPhz9sSs; Tue, 24 Nov 2020 10:39:15 +1100 (AEDT)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Axtens <dja@axtens.net>,
        Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20201123184016.693fe464@canb.auug.org.au>
References: <20201123184016.693fe464@canb.auug.org.au>
Subject: Re: linux-next: build failure in Linus' tree
Message-Id: <160617472873.1817800.16473753588453276266.b4-ty@ellerman.id.au>
Date:   Tue, 24 Nov 2020 10:39:15 +1100 (AEDT)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 23 Nov 2020 18:40:16 +1100, Stephen Rothwell wrote:
> After merging most of the trees, today's linux-next build (powerpc64
> allnoconfig) failed like this:
> 
> In file included from arch/powerpc/include/asm/kup.h:18,
>                  from arch/powerpc/include/asm/uaccess.h:9,
>                  from include/linux/uaccess.h:11,
>                  from include/linux/sched/task.h:11,
>                  from include/linux/sched/signal.h:9,
>                  from include/linux/rcuwait.h:6,
>                  from include/linux/percpu-rwsem.h:7,
>                  from include/linux/fs.h:33,
>                  from include/linux/compat.h:17,
>                  from arch/powerpc/kernel/asm-offsets.c:14:
> arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: warning: data definition has no type or storage class
>    66 | DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: error: type defaults to 'int' in declaration of 'DECLARE_STATIC_KEY_FALSE' [-Werror=implicit-int]
> arch/powerpc/include/asm/book3s/64/kup-radix.h:66:1: warning: parameter names (without types) in function declaration
> arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'prevent_user_access':
> arch/powerpc/include/asm/book3s/64/kup-radix.h:180:6: error: implicit declaration of function 'static_branch_unlikely' [-Werror=implicit-function-declaration]
>   180 |  if (static_branch_unlikely(&uaccess_flush_key))
>       |      ^~~~~~~~~~~~~~~~~~~~~~
> arch/powerpc/include/asm/book3s/64/kup-radix.h:180:30: error: 'uaccess_flush_key' undeclared (first use in this function)
>   180 |  if (static_branch_unlikely(&uaccess_flush_key))
>       |                              ^~~~~~~~~~~~~~~~~
> arch/powerpc/include/asm/book3s/64/kup-radix.h:180:30: note: each undeclared identifier is reported only once for each function it appears in
> arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'prevent_user_access_return':
> arch/powerpc/include/asm/book3s/64/kup-radix.h:189:30: error: 'uaccess_flush_key' undeclared (first use in this function)
>   189 |  if (static_branch_unlikely(&uaccess_flush_key))
>       |                              ^~~~~~~~~~~~~~~~~
> arch/powerpc/include/asm/book3s/64/kup-radix.h: In function 'restore_user_access':
> arch/powerpc/include/asm/book3s/64/kup-radix.h:198:30: error: 'uaccess_flush_key' undeclared (first use in this function)
>   198 |  if (static_branch_unlikely(&uaccess_flush_key) && flags == AMR_KUAP_BLOCKED)
>       |                              ^~~~~~~~~~~~~~~~~
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Fix allnoconfig build since uaccess flush
      https://git.kernel.org/powerpc/c/b6b79dd53082db11070b4368d85dd6699ff0b063

cheers
