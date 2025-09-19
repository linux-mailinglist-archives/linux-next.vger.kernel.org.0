Return-Path: <linux-next+bounces-8385-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4FEB888A9
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 11:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 068C91C82323
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 09:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FD52F25EF;
	Fri, 19 Sep 2025 09:25:15 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C452D239F;
	Fri, 19 Sep 2025 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758273915; cv=none; b=XdPQfJYxzPEq7bF1S4Aa4Rw15z4PRUEor6g+p1KgbkjDYA0bJgdehqXfSk4UiLHl5qLFiGV5XtUJ/bkWaYk1by/0ty3ob9Tmv5WzE2J1nV2wO7M8zN4BM0IhRotn1o9bFR/s0zC7ra60ipeE1fGkiVJwGDl+b6ZpxfnBI0ThXxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758273915; c=relaxed/simple;
	bh=+hQV36ermCg3GTswyjokH750Usr+sQ7Ds8u5SZvEtEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrbclEgFztPEFPAvZDQOohUZr3HDSkk81LXNF/d4kEBv5XK02/Gzf5GJjSgON9PNINtL12s6j9i+pu9QlRDQFTQG1rq0i3dv1aKQPrff6fDVsSMZcc/K/ULwW0Zs6/XIt0NJ2ljRl2Ly3uiBNzQi2ZcGI9UmkjXaZUgUHbsUXVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 649F03420AB;
	Fri, 19 Sep 2025 09:25:12 +0000 (UTC)
Date: Fri, 19 Sep 2025 17:25:07 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Mark Brown <broonie@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>,
	David Miller <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alex Elder <elder@riscstar.com>,
	Networking <netdev@vger.kernel.org>,
	Guodong Xu <guodong@riscstar.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	soc@kernel.org
Subject: Re: linux-next: manual merge of the net-next tree with the spacemit
 tree
Message-ID: <20250919092507-GYA1279412@gentoo.org>
References: <aMqby4Cz8hn6lZgv@sirena.org.uk>
 <597466da-643d-4a75-b2e8-00cf7cf3fcd0@iscas.ac.cn>
 <76970eed-cb88-4a42-864a-8c2290624b72@sirena.org.uk>
 <20250917123045-GYA1265885@gentoo.org>
 <20250917125947-GYA1266976@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917125947-GYA1266976@gentoo.org>

Hi Paolo, Mark, Arnd

I'd like to have your attentions, see below

On 20:59 Wed 17 Sep     , Yixun Lan wrote:
> Hi Mark,
> 
> On 20:30 Wed 17 Sep     , Yixun Lan wrote:
> > Hi Mark,
> > 
> > On 13:03 Wed 17 Sep     , Mark Brown wrote:
> > > On Wed, Sep 17, 2025 at 07:48:34PM +0800, Vivian Wang wrote:
> > > 
> > > > Just FYI, Yixun has proposed for net-next to back out of the DTS changes
> > > > and taking them up through the spacemit tree instead [1], resolving the
> > > > conflicts in the spacemit tree. This would certainly mean less headaches
> > > > while managing pull requests, as well as allowing Yixun to take care of
> > > > code style concerns like node order. However, I do not know what the
> > > > norms here are.
> > > 
> > > Thanks.  They're pretty trivial conflicts so I'm not sure it's critical,
> > > though like you say node order might easily end up the wrong way round
> > > depending on how the conflict resolution gets done.
> > 
> > Thanks for the help and fixing this, but ..
> > 
> > If it's possible to revert the DT patch 3-5, then I'd be happy to take,
> > but if this is too much job, e.g. the net-next's main branch is imuutable
> > and reverting it will cause too much trouble, then I'm fine with current
> > solution - carry the fix via net-next tree..
> > 
> > But please use commit: 0f084b221e2c5ba16eca85b3d2497f9486bd0329 of
> > https://github.com/spacemit-com/linux/tree/k1/dt-for-next as the merge
> > parent, which I'm about to send to Arnd (the SoC tree)
> > 
> No matter which way choose to go, I've created an immutable tag here,
> 
> https://github.com/spacemit-com/linux/ spacemit-dt-for-6.18-1
> 

I've sent out the PR of DT changes to SoC tree for inclusion, see 
https://lore.kernel.org/all/20250919055525-GYC5766558@gentoo.org/

There is a potential conflict with commit from net-next:
 e32dc7a936b11e437298bcc4601476befcbcb88f ("riscv: dts: spacemit: Add Ethernet support for Jupiter")

the conflict itself is quite trivial, and should be easy to fix, and I'm also
personally fine to have it solved in net-next tree if Arnd has no objection

But if need assistance from my side, just let me know - I can handle it
- if the ethernet DT patches can be reverted from net-next
- I can apply them at SpacemiT SoC tree
- send a incremental v2 PR to the SoC tree

> > BTW, The 'for-next' branch is a merged branch contains clock and DT patches
> > for SpacemiT SoC tree's which isn't immutable..
> > 
> > Let me know what I should proceed, thank you
> > 
> 

-- 
Yixun Lan (dlan)

