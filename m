Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDEACB21E
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2019 01:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730290AbfJCXFr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Oct 2019 19:05:47 -0400
Received: from ozlabs.org ([203.11.71.1]:46835 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730258AbfJCXFr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 3 Oct 2019 19:05:47 -0400
Received: by ozlabs.org (Postfix, from userid 1034)
        id 46kpWr3kTYz9sPp; Fri,  4 Oct 2019 09:05:44 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 8996ae8f05a1cc5559120aaec36183edb9c68c50
In-Reply-To: <20190930101342.36c1afa0@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: linux-next: build failure after merge of the powerpc tree
Message-Id: <46kpWr3kTYz9sPp@ozlabs.org>
Date:   Fri,  4 Oct 2019 09:05:44 +1000 (AEST)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2019-09-30 at 00:13:42 UTC, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc64
> allnoconfig) failed like this:
> 
> arch/powerpc/mm/book3s64/pgtable.c: In function 'flush_partition':
> arch/powerpc/mm/book3s64/pgtable.c:216:3: error: implicit declaration of fu=
> nction 'radix__flush_all_lpid_guest'; did you mean 'radix__flush_all_lpid'?=
>  [-Werror=3Dimplicit-function-declaration]
>   216 |   radix__flush_all_lpid_guest(lpid);
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |   radix__flush_all_lpid
> 
> Caused by commit
> 
>   99161de3a283 ("powerpc/64s/radix: tidy up TLB flushing code")
> 
> radix__flush_all_lpid_guest() is only declared for CONFIG_PPC_RADIX_MMU
> which is not set for this build.
> 
> I am not sure why this did not show up earlier (maybe a Kconfig
> change?).
> 
> I added the following hack for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 30 Sep 2019 10:09:17 +1000
> Subject: [PATCH] powerpc/64s/radix: fix for "tidy up TLB flushing code" and
>  !CONFIG_PPC_RADIX_MMU
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/8996ae8f05a1cc5559120aaec36183edb9c68c50

cheers
