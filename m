Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D23B2FF758
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 22:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbhAUVdI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 16:33:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:38276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727305AbhAUVb6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 Jan 2021 16:31:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E23E23A53;
        Thu, 21 Jan 2021 21:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611264675;
        bh=L5lsmNVyN/gM7eKC23++Z8NFz5Zp1K8u7Gf3EzsLgTA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s3E9tnK1u5bQtDZDhFxLwTEjQoye8OEe0JSXIIJXh59aGqORZ3Q8zdNRiWOaMY+g0
         TyUNgL3pMTFaj2i3ooCy4cYUQgvFaWz8j3pr7ekeyTHWMRQm9QUVerC+yaSarK3yAv
         k+nnKZRsH9DipeZjI+Gyv2WfmmJpfAvnKNk38ZgnZtopWjVX/ds6YZFCJlf7Fzsgmw
         rtNd74QkiodsM0W+U02QglBYZ24GfAaF4uX1/H7V2igVdCZbkDbyUU9SgJ8QuK+MpZ
         bvOiVG6YGB0g+tiI+r4SIy132vvXRgO3YyF2zsSGpEidBTJBECm2W4/wcn4D2sWSrO
         m+qCinZgzKkHw==
Date:   Thu, 21 Jan 2021 21:31:10 +0000
From:   Will Deacon <will@kernel.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
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
Message-ID: <20210121213110.GB23234@willie-the-truck>
References: <CA+G9fYvV5SZ47M-XpABya11okgR7BJQk-3dDuFWzgVmGN3Lurg@mail.gmail.com>
 <20210121185521.GQ2743@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121185521.GQ2743@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 21, 2021 at 10:55:21AM -0800, Paul E. McKenney wrote:
> On Thu, Jan 21, 2021 at 10:37:21PM +0530, Naresh Kamboju wrote:
> > While running rcu-torture test on qemu_arm64 and arm64 Juno-r2 device
> > the following kernel crash noticed. This started happening from Linux next
> > next-20210111 tag to next-20210121.
> > 
> > metadata:
> >   git branch: master
> >   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
> >   git describe: next-20210111
> >   kernel-config: https://builds.tuxbuild.com/1muTTn7AfqcWvH5x2Alxifn7EUH/config
> > 
> > output log:
> > 
> > [  621.538050] mem_dump_obj() slab test: rcu_torture_stats =
> > ffff0000c0a3ac40, &rhp = ffff800012debe40, rhp = ffff0000c8cba000, &z
> > = ffff8000091ab8e0
> > [  621.546662] mem_dump_obj(ZERO_SIZE_PTR):
> > [  621.546696] Unable to handle kernel NULL pointer dereference at
> > virtual address 0000000000000008

[...]

> Huh.  I am relying on virt_addr_valid() rejecting NULL pointers and
> things like ZERO_SIZE_PTR, which is defined as ((void *)16).  It looks
> like your configuration rejects NULL as an invalid virtual address,
> but does not reject ZERO_SIZE_PTR.  Is this the intent, given that you
> are not allowed to dereference a ZERO_SIZE_PTR?
> 
> Adding the ARM64 guys on CC for their thoughts.

Spooky timing, there was a thread _today_ about that:

https://lore.kernel.org/r/ecbc7651-82c4-6518-d4a9-dbdbdf833b5b@arm.com

Will
