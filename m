Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC092FF782
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 22:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbhAUVo0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 16:44:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:40528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727273AbhAUVoI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Jan 2021 16:44:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7507E23A54;
        Thu, 21 Jan 2021 21:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611265394;
        bh=qj3RrM+hGGEbQA50Mwahsi0VaXZuShqtsPO0Lx/8LwE=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=je6Vk1jj8Fnh78pX6xyhg1YoN+8oFceX96bVh0UxwrAVx8RYxb0l8yPf7dyQTOxgV
         X11Bk/O3tF3RmMvaQoEQ8ROGIdpkhOZCc4vRWf0zjCQqQL/e9rQ5bKrpPBkvrnQupU
         7QklaabUw8fnF6kKU61Mhz92siKB12guuQzlCHYnPBjHVH7r2cZVGSdrwpo1zK3W5i
         zVe6/vcB0ihX0rL4EWcdMtCjEiSY2dca+QfjfyA/RQ/RY4+zgh6RL/PUHw0Sog96cI
         dpHUC7VfEW96+SjnX+Efwp2Ly0o+nW4dRcb77BQwdd8SJ0TCaFRFsEcEheGZ/peIHM
         DLcazNBbBgFDQ==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 3F1AA35226D8; Thu, 21 Jan 2021 13:43:14 -0800 (PST)
Date:   Thu, 21 Jan 2021 13:43:14 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Will Deacon <will@kernel.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>, rcu@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, catalin.marinas@arm.com,
        linux-arm-kernel@lists.infradead.org, vincenzo.frascino@arm.com,
        mark.rutland@arm.com
Subject: Re: rcu-torture: Internal error: Oops: 96000006
Message-ID: <20210121214314.GW2743@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <CA+G9fYvV5SZ47M-XpABya11okgR7BJQk-3dDuFWzgVmGN3Lurg@mail.gmail.com>
 <20210121185521.GQ2743@paulmck-ThinkPad-P72>
 <20210121213110.GB23234@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121213110.GB23234@willie-the-truck>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 21, 2021 at 09:31:10PM +0000, Will Deacon wrote:
> On Thu, Jan 21, 2021 at 10:55:21AM -0800, Paul E. McKenney wrote:
> > On Thu, Jan 21, 2021 at 10:37:21PM +0530, Naresh Kamboju wrote:
> > > While running rcu-torture test on qemu_arm64 and arm64 Juno-r2 device
> > > the following kernel crash noticed. This started happening from Linux next
> > > next-20210111 tag to next-20210121.
> > > 
> > > metadata:
> > >   git branch: master
> > >   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
> > >   git describe: next-20210111
> > >   kernel-config: https://builds.tuxbuild.com/1muTTn7AfqcWvH5x2Alxifn7EUH/config
> > > 
> > > output log:
> > > 
> > > [  621.538050] mem_dump_obj() slab test: rcu_torture_stats =
> > > ffff0000c0a3ac40, &rhp = ffff800012debe40, rhp = ffff0000c8cba000, &z
> > > = ffff8000091ab8e0
> > > [  621.546662] mem_dump_obj(ZERO_SIZE_PTR):
> > > [  621.546696] Unable to handle kernel NULL pointer dereference at
> > > virtual address 0000000000000008
> 
> [...]
> 
> > Huh.  I am relying on virt_addr_valid() rejecting NULL pointers and
> > things like ZERO_SIZE_PTR, which is defined as ((void *)16).  It looks
> > like your configuration rejects NULL as an invalid virtual address,
> > but does not reject ZERO_SIZE_PTR.  Is this the intent, given that you
> > are not allowed to dereference a ZERO_SIZE_PTR?
> > 
> > Adding the ARM64 guys on CC for their thoughts.
> 
> Spooky timing, there was a thread _today_ about that:
> 
> https://lore.kernel.org/r/ecbc7651-82c4-6518-d4a9-dbdbdf833b5b@arm.com

Very good, then my workaround (shown below for Naresh's ease of testing)
is only a short-term workaround.  Yay!  ;-)

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/mm/slab_common.c b/mm/slab_common.c
index cefa9ae..a8375d1 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -550,7 +550,8 @@ bool kmem_valid_obj(void *object)
 {
 	struct page *page;
 
-	if (!virt_addr_valid(object))
+	/* Some arches consider ZERO_SIZE_PTR to be a valid address. */
+	if (object < (void *)PAGE_SIZE || !virt_addr_valid(object))
 		return false;
 	page = virt_to_head_page(object);
 	return PageSlab(page);
