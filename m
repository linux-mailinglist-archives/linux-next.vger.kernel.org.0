Return-Path: <linux-next+bounces-9086-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAA8C6EA57
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 14:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 3D8322E94F
	for <lists+linux-next@lfdr.de>; Wed, 19 Nov 2025 13:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2F4833FE05;
	Wed, 19 Nov 2025 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JC0lCE8A"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7963633DED7;
	Wed, 19 Nov 2025 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557296; cv=none; b=IiLpYBoEIhGlhQ7QqZLmBHTq0YES1v9xb0hrCaLXZqGhhufEvvtb7bYT/yK+oZLH2LSHr8OVyEBeXTA/flAiHRNrkO4UhisjGijgGssFdM+zX8rUTWsatWDyzg1tZwsz6BbyRxsY99aRnafxEgyV82f5BoBCH1I9MDD9IyF03hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557296; c=relaxed/simple;
	bh=N9729XdX1GMG7PWym9AGKkRBjiK24gsCrzNwmG8ZX34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDj0xIKgpurNULT82Wtdry4bP/OQDvP1QgApkKi1b9QqpyaPEha/pkRmR66OehiwVmJ/hiqcd4sPVmB8Wj0Uqp+GWktWlZo9ISDriCwLPmwc6kUw0BSs1eU09M49u7vP1kJcVfDAvba4h/4ltdw9ecavxADsa/vAWvZ2Rfds8JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JC0lCE8A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B84EC2BCC7;
	Wed, 19 Nov 2025 13:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763557295;
	bh=N9729XdX1GMG7PWym9AGKkRBjiK24gsCrzNwmG8ZX34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JC0lCE8Av32yp0MwkzMsAmnPjGx1Sl2hHhjxXN3Yp4SGDnkxq12gLJI8aGZgy1Kkn
	 p+5MD0xs46BvdEPiejp354vFYHF5LzFthbu4tH97BqBwN4GtXK/ZF4YkxbHtnvZa/I
	 3XEYiPaAGilVdHQdoCaftW5W/6tlTCLugZhAtUf/9zDLFHISBxhlx6OIlh6hD6/Ean
	 tUb7JVUpTHtYUc+Z/7ieMeMlVXjAeEIVIHBJqwBwZAhaw8i08zR0MDFhoUrRSoWhBc
	 HhtUqglXWVoPlOWORtj5Au5Cv5gFAT8RnCATPKoxHWKj6Fg3U05TSDFCtdU5UATTQt
	 Ah4aw9X/woviQ==
Date: Wed, 19 Nov 2025 13:01:30 +0000
From: Lee Jones <lee@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the mfd tree
Message-ID: <20251119130130.GS1949330@google.com>
References: <20251114144243.05facfce@canb.auug.org.au>
 <20251118183319.GR1949330@google.com>
 <CAPDyKFr70C3hXyjVeoMZ2h79yyuau5E_-pZxa2txpHFZc92oOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPDyKFr70C3hXyjVeoMZ2h79yyuau5E_-pZxa2txpHFZc92oOg@mail.gmail.com>

On Wed, 19 Nov 2025, Ulf Hansson wrote:

> On Tue, 18 Nov 2025 at 19:33, Lee Jones <lee@kernel.org> wrote:
> >
> > On Fri, 14 Nov 2025, Stephen Rothwell wrote:
> >
> > > Hi all,
> > >
> > > The following commit is also in the pmdomain tree as a different commit
> > > (but the same patch):
> > >
> > >   30ed024fb076 ("mfd: bcm2835-pm: Add support for BCM2712")
> > >
> > > This is commit
> > >
> > >   060d111e8a56 ("mfd: bcm2835-pm: Add support for BCM2712")
> > >
> > > in the pmdolain tree.
> >
> > Why is this in the pmdomain tree, Ulf?
> 
> The corresponding dt doc patch is in my tree too, so to keep them
> together, but also because Florian acked/suggested it to me [1].

Neither of you should be deciding the fate of MFD patches.  :)

> I can rebase and drop it from my tree, if you prefer to take it via
> your tree? The DT doc patch is however on an immutable branch just
> named "dt", so you need to pull that in that case. Please let me know
> and sorry for the mess!

Yes, if you can drop the MFD commit, it would solve some issues.

Thanks buddy.  Hope that you're well.

-- 
Lee Jones [李琼斯]

