Return-Path: <linux-next+bounces-7178-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FA7ADFF9E
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 10:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7926C171233
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 08:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149CB219302;
	Thu, 19 Jun 2025 08:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="B9qCw9kz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gvZpsmi5"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2261F1A3167;
	Thu, 19 Jun 2025 08:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750321149; cv=none; b=mla9yrVKuc0gaXBy40SngbIHrbz8EiMCDjYInWc+iY+B8M5QxMFJaZzDkJZ3hRHJLYHTGs6t/Yh9cMlmUCKsotk2pdKvwdQNR02UBy91oAglFhn2Ax5Wnh1kez/aLg02jtZ4ukHUe7AfhsjpU8m0S8jwOYa6sovHYAUZseJqMFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750321149; c=relaxed/simple;
	bh=U24ePa0nanp05YZEOass92derLdtbGsggI2byD2tmBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnVZtp1eNkMjz85qZ4heLZUBdhxY+CseZhmn/+ZoBQNGEKo6wtaI6UM3ovP6szMnkz4zcrj7Lf5CC6dZgvoC+TnrsUKU2b5cbGoDaPinqRbaAr20J6lU8Q9Ow996msiu+yTHLMbKRbog28NWlWU5Fa5fFbTMg0/72Z1O628iszU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=B9qCw9kz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gvZpsmi5; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id F24FC2540255;
	Thu, 19 Jun 2025 04:19:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Thu, 19 Jun 2025 04:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750321145; x=1750407545; bh=Nce9V9mRM2
	Dk/vQPq0T79XpYK+ZRtg2BVMRFr+7euj4=; b=B9qCw9kzjn2BhntlM3xLKnxmNb
	m9cHGLy3RwCB5qfZiLHWrl/fAKrgWrkqd/IAF5Sgcb4veDQqVJZivH+L5fDqIuwT
	K1GW4+2iRVjONzY2R0mPK8+gIFDh8jzJrUGamfRyQssMTJvepbSX8gB4jPXmQCGy
	rmsVfe2bBF8UJhC9ya+5JRy3PwztczLemRCbMcGfv0kGsH7UfO8nheFUJoQPuSKU
	zniYLmoXri8ekp27DU5JQuaeat0aQP1HuHQMEiRhUBqrtp2snYtDJErwmlJ1j781
	Z7/HV/M5buAJl0B+rwJziYkyj/qfHZ7o1JMwCyfz6vpeXe4WypRyrm9ikwlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750321145; x=1750407545; bh=Nce9V9mRM2Dk/vQPq0T79XpYK+ZRtg2BVMR
	Fr+7euj4=; b=gvZpsmi5hXmiCVqHO1ojuZ/mQAp442bUjo0jDx2vvtcVxdsRw2V
	UZE+IQCWQdu9zMC2kM0Zzhv5yzXv6/IhVdzOPP4Lyrr6bJHKu+mnOqPQwjD8ZnhC
	4xeuVLs45GeCajpVganXBWqEGDxXtjcYHaiMhNh2R7/hgOc9N7H836pX/d+EkQNd
	Eroam3jXx1EDOmytugd91PH9YEdkTYMtUAKp/kB1iAjHW9Iobmk9ZCflIlxptI9Y
	WUZ4nnnLUYzX7t4ZBU8l0Aum/YfODUGznxJ7v/XN4X+AAQ3k8sS1u3WZGhPC1Rho
	8kEZTRlSIwrTlIaOTQpxvAj3ytDGt/zOakg==
X-ME-Sender: <xms:-cdTaJwjbNZ_rfTpqbpVdf_xgZJLL-vb-SRxdDOW2tBbgyu0cx6BPw>
    <xme:-cdTaJRtz9fG-4VC6O5W2ytvPic6mQoxp_b3FNSsPxI9kKlPOU3aS4_x6u2ac4fN0
    kITaWBFWRL7wA>
X-ME-Received: <xmr:-cdTaDX4lJO0j3IEwlyqhn5FuIKa4KFsQw7jd-75-ivx5o4miHXKwNdXqhzvofOjmXkz5itbu459tNkrnh5Jk3kI1hb_G34>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfmjfcu
    oehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvdelje
    eugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtoh
    hmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehs
    fhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehjihhrihhslhgrsg
    ihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-cdTaLi4LLmXqn-Ekrly12G-ZYjJulYoGx8_7w6WT3-ohkXnQdRR0w>
    <xmx:-cdTaLC64xv8ReoOBusJFWWTM8f_KHlBeC3c1byxzfrhadH159jkQg>
    <xmx:-cdTaEI517RLRQ70PByQ2-yjNL1Vz9pm-sJt9brpBkl_6e0xBTqnZw>
    <xmx:-cdTaKA-itRsbVhIuan4YBdZ7k_MAn2EbwOnnOpWjcFD5ByGB0TOKQ>
    <xmx:-cdTaHRCR9b17WZuHewDrf2PrM0dvICyVU7ZixGSmBVfdclLRFocBgKv>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 04:19:05 -0400 (EDT)
Date: Thu, 19 Jun 2025 10:19:03 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tty tree
Message-ID: <2025061947-velvet-scarce-f5ab@gregkh>
References: <20250619165607.33403e19@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619165607.33403e19@canb.auug.org.au>

On Thu, Jun 19, 2025 at 04:56:07PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tty tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
> 
> ERROR: modpost: "rsa_autoconfig" [drivers/tty/serial/8250/8250_base.ko] undefined!
> ERROR: modpost: "rsa_reset" [drivers/tty/serial/8250/8250_base.ko] undefined!
> ERROR: modpost: "rsa_disable" [drivers/tty/serial/8250/8250_base.ko] undefined!
> ERROR: modpost: "rsa_enable" [drivers/tty/serial/8250/8250_base.ko] undefined!
> 
> Caused by commit
> 
>   5a128fb475fb ("serial: 8250: move RSA functions to 8250_rsa.c")
> 
> (or its neighbours)
> 
> I have used the tty tree from next-20250618 for today.

Jiri, can you send a patch to fix this, or should I revert the above
commit now?

thanks,

greg k-h

