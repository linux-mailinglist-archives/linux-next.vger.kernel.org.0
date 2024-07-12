Return-Path: <linux-next+bounces-2967-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 606DE92F6D6
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 10:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91CDE1C22453
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 08:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B34813D609;
	Fri, 12 Jul 2024 08:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cL0fSDoF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DEE13D509;
	Fri, 12 Jul 2024 08:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720772517; cv=none; b=c1HxQ8iG15oKY9H2adsLVDtfiGeV/TkMmGyMgr0pAvqDhECeBQGWutBIPTQ1bD4pEPnf9JVd2Uaxzkp5VgtIw2aNX7D3CBXy2wph6nuqtjUkPMtWbXmCh0ejCvCN609JJoHqHFQMsw+g/9+/2EG2+eA0z2GI8fPVXcdSeoxTFmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720772517; c=relaxed/simple;
	bh=8bMsk5SOo1mc2TFA8uYHzwh3XmMNKj9uKFyKVesNCCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oblxBbe9x7vaa+7VNa12YJ4eO2T6zm8wyczUPhPJQZzVvU7K58fQz15hRRg/l/9Moqo7zAAibls9RHuJ4dhQs5oyQCSzo7oTGbtSh21B9IbQB785nGw05933hUlSg0BpsU+SXD1DOzwyAocQ5yWCZkbLYJYY/KfRDVlvDjuLj/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cL0fSDoF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB6CC4AF09;
	Fri, 12 Jul 2024 08:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720772516;
	bh=8bMsk5SOo1mc2TFA8uYHzwh3XmMNKj9uKFyKVesNCCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cL0fSDoFH1Rs0IQXdBwP/LY2Hyjz2pLFGrpxXKz4bURQxCTcIY6Wgo+6UlsJriUvQ
	 dc4doYxAUUI7vMCuHAzektY2+59PdviQun9Ac6fosb59ZEj/HFWQLCF5BeyCWcZkfK
	 /GG0+UOrdCoi3XZXkks2mYR6PkwwFqcNop6FuBUk+X/JzbpfutXQh1VXR12BjGYkE0
	 OynHiMwE0i4ki0YSBC+dhvGKw+1xYwPdvZ7fog1uBCQXkGlnFC93JqStIUz5tAIG7Z
	 vDla3tcl+wE8ivi2Jelt0jhTumPFXhYtg9QZc6XPo93xPSOjjQ+4qX6GG4rrT094x4
	 5XeZtKs/PJ+sQ==
Date: Fri, 12 Jul 2024 09:21:53 +0100
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds-lj tree
Message-ID: <20240712082153.GP501857@google.com>
References: <20240712144831.269b1bc6@canb.auug.org.au>
 <20240712073139.GO501857@google.com>
 <6690dfdb.df0a0220.90a81.64f1@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6690dfdb.df0a0220.90a81.64f1@mx.google.com>

On Fri, 12 Jul 2024, Christian Marangi wrote:

> On Fri, Jul 12, 2024 at 08:31:39AM +0100, Lee Jones wrote:
> > Christian,
> > 
> > > Hi all,
> > > 
> > > After merging the leds-lj tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > > 
> > > In file included from drivers/leds/leds-lp5569.c:11:
> > > drivers/leds/leds-lp5569.c: In function 'lp5569_post_init_device':
> > > drivers/leds/leds-lp5569.c:204:52: error: passing argument 3 of 'lp55xx_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
> > >   204 |                           chip, LP5569_REG_STATUS, &val);
> > >       |                                                    ^~~~
> > >       |                                                    |
> > >       |                                                    int *
> > 
> > The only reason for applying this set this late in the cycle was that
> > they appeared to be fixes for other brokenness.
> > 
> > This is the second set that you've submitted in recent days that has
> > caused build breakages.  Something is wrong with your current
> > development practices.  Are you able to identify and rectify these
> > issue(s) before a lose trust in your submissions?
> >
> 
> Yes, I identified the problem and the config was silently getting
> disabled and hiding all the errors/warning. Driver also was tested on
> OpenWrt build system where the option WERROR wasn't enabled as I was
> devloping other stuff so this added on top of it of not noticing stuff.
> 
> I promise this won't ever happen again. Also I sent v2 for this hoping
> things can get reverted and the correct series can be applied. If not I
> can quickly send a followup that fix this. I verified with the repro
> that the warning/error gets solved. (it's just channging the int to u8)

No need to follow up.

I've applied the new set and sent for pre-testing.

Once passed, I'll push so it'll end up in -next again.

-- 
Lee Jones [李琼斯]

