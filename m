Return-Path: <linux-next+bounces-5789-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59345A60350
	for <lists+linux-next@lfdr.de>; Thu, 13 Mar 2025 22:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B43503B3EE3
	for <lists+linux-next@lfdr.de>; Thu, 13 Mar 2025 21:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F9A1F542E;
	Thu, 13 Mar 2025 21:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IatQbLGu"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA041F542A;
	Thu, 13 Mar 2025 21:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741900658; cv=none; b=ouCi5vm44PWyHCUmlXFxLu5nPVCym0Az1sqn0MmAfbDKDBEIB4RJ3Y1XHJSH4VNr7ESeXdHdGHKwjUJxXZyQRhO4OYx2aL8UH5i58JsHkAzCy5NMsNkyukQt2mcqfUIsYfTtH0Kw9tbMf0yrqzKqGAzHhn4Xbaow6kr3JiiiOwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741900658; c=relaxed/simple;
	bh=Le6EQ1Pr/AK5Dy86XGbDFF8qdnl/LrgWUu4Ti5KP2U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDZGb6YJewWRFoKxXj0IXhxoYlUTw0PoYuuq08YUBVDT5dTHCtnraTRSZMw5OT9NJPZWRDw5t6p5pS+nY+0VX4C3WUDTgmqEduBLohoOZXm+BHdp0VQWCGvTbfohFHCdjxJkzBJwq0BevCFpDsg7Aa3UPd1k60EyNUN8JYDz6J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IatQbLGu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2D4C4CEDD;
	Thu, 13 Mar 2025 21:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741900658;
	bh=Le6EQ1Pr/AK5Dy86XGbDFF8qdnl/LrgWUu4Ti5KP2U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IatQbLGuuQDS98eiH/zBFSxXIgQRopSCsXLo8obJRduaiCY8e6F5LU6qJ+rn5H10r
	 LIs3pu3r36ROHuQkZeEA5tAYobF/0ZLqQkXmXpXvHeAKIslTPIKYmoGs4wFpfdYnx0
	 ORHNfOHQ5HwETC7reG5MFdfJdVRI1Ng5Dmq7c+LYePrO4b6+ckIdaJHQxAhjxVlQNg
	 DMf1zkJvK/mgpuFDlyVwtaQGXt+X2b4ayIkZwI5SQtXhq3fGcIJwhuAES1TmAXI0iZ
	 gsHwgGqPh/fnqe7OKiMVynwJJfEpoe5z0E1CSOe0iIpIxNhvlPT8t/XooeFTFYbZ4n
	 4LWgVNYONCp4w==
Date: Thu, 13 Mar 2025 21:17:33 +0000
From: Will Deacon <will@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Christoffer Dall <cdall@cs.columbia.edu>,
	Marc Zyngier <maz@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm-perf
 tree
Message-ID: <20250313211732.GB7937@willie-the-truck>
References: <20250312201853.0d75d9fe@canb.auug.org.au>
 <20250312124501.GA6181@willie-the-truck>
 <Z9G_aKHzs4GFe4O5@linux.dev>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9G_aKHzs4GFe4O5@linux.dev>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Mar 12, 2025 at 10:07:52AM -0700, Oliver Upton wrote:
> On Wed, Mar 12, 2025 at 12:45:02PM +0000, Will Deacon wrote:
> > On Wed, Mar 12, 2025 at 08:18:53PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the kvm-arm tree got a conflict in:
> > > 
> > >   drivers/perf/apple_m1_cpu_pmu.c
> > > 
> > > between commit:
> > > 
> > >   c2e793da59fc ("perf: apple_m1: Don't disable counter in m1_pmu_enable_event()")
> > > 
> > > from the arm-perf tree and commit:
> > > 
> > >   75ecffc361bb ("drivers/perf: apple_m1: Refactor event select/filter configuration")
> > > 
> > > from the kvm-arm tree.
> > > 
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your tree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particularly
> > > complex conflicts.
> > > 
> > > -- 
> > > Cheers,
> > > Stephen Rothwell
> > > 
> > > diff --cc drivers/perf/apple_m1_cpu_pmu.c
> > > index 39349ecec3c1,6be703619a97..000000000000
> > > --- a/drivers/perf/apple_m1_cpu_pmu.c
> > > +++ b/drivers/perf/apple_m1_cpu_pmu.c
> > > @@@ -396,7 -428,11 +428,7 @@@ static void m1_pmu_enable_event(struct 
> > >   	user = event->hw.config_base & M1_PMU_CFG_COUNT_USER;
> > >   	kernel = event->hw.config_base & M1_PMU_CFG_COUNT_KERNEL;
> > >   
> > > - 	m1_pmu_configure_counter(event->hw.idx, evt, user, kernel);
> > >  -	m1_pmu_disable_counter_interrupt(event->hw.idx);
> > >  -	m1_pmu_disable_counter(event->hw.idx);
> > >  -	isb();
> > >  -
> > > + 	m1_pmu_configure_counter(event->hw.idx, event->hw.config_base);
> > >   	m1_pmu_enable_counter(event->hw.idx);
> > >   	m1_pmu_enable_counter_interrupt(event->hw.idx);
> > >   	isb();
> > 
> > Looks fine to me but I'd also be happy to stick the first two patches
> > on a shared branch to avoid this. Oliver?
> 
> Agreed!
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/oupton/linux.git perf/m1-guest-events

Cheers, man. I'll pull that in shortly...

Will

