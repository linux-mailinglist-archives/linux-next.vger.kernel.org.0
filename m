Return-Path: <linux-next+bounces-7792-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 997A0B16FBB
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 12:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EBD33B4E3F
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 10:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBCE321CC71;
	Thu, 31 Jul 2025 10:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="H+yuWJcN"
X-Original-To: linux-next@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD0E20AF9C;
	Thu, 31 Jul 2025 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753958524; cv=none; b=HZF3lR2H4wemVHRpcKnGZUPuHU+Cnk/Bks4V/zIwaKAVvrLCS9avsHpMc+DPVvujK1tRKr7G+gc2hnMFWMRClKSYMHWXFROy7vrWu317t6v2gPh9lvbrNRaZEREFxwQHwMaPKXjb5UAonCKcu0S75yjTqdLSYJNw14MnE8u9VXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753958524; c=relaxed/simple;
	bh=qRkWUT21KCGiimgUoK6QG0N/s/cSD0B0lcRtMsovMVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpO8nCpbT6kTZ0KM7WwPoaYnrQwvMwrWr9877vEuzqrqlIHNTtGHTJbKLA5X6yRrylHcMrIgMDvhU2vc/efS2XTq/m6yN6cKAPRciomSE7dvn/86iM1AyIv/dCYyO9yMG8jQKji+4C1mkV+wpewW83cOJdmboQsreoeJffkxcx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=H+yuWJcN; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E5B91F68D;
	Thu, 31 Jul 2025 10:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753958520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lq/eijQgI55h142GKNEKrN3qWvYFmQuBOjaMycA3eaA=;
	b=H+yuWJcNrffRFeKD6s/SMGLFOmhg7j/wBX7PIUdVhbUHrTkAWe6XLchIdTgJIWq7iz3Iey
	oY4a1AzAJssYtxjTlf9PmcKzjBLMU4N/b82VcADg1qjZeuBCcslKFaYlgA/WAV531QRSNx
	+RTt7ThNW8tbsKHr3EugMzwwrPo5N6NnyV9/h7obOLtR1WHHmu93IpCOW5+wM31fUjIUus
	Hi0REZYmhX8wXG6qxa/HVjzYILRgIeb6YC0ukHbqBrM1Q89tFU0C4gKK963FOxOe9yWjif
	ttJEa3FKkbltyy75yVsIbUb5vRdZiLpITHTg2HOtTNUB8vIN5cef6NERxL9H9A==
Date: Thu, 31 Jul 2025 12:41:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Frank Li <Frank.Li@nxp.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the i3c tree
Message-ID: <20250731104158beab8423@mail.local>
References: <20250731094944.4c547f36@canb.auug.org.au>
 <aIsg4Supas6vh8er@shikoro>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIsg4Supas6vh8er@shikoro>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddtiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepiedprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdpr
 hgtphhtthhopegsohhrihhsrdgsrhgviihilhhlohhnsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On 31/07/2025 09:53:05+0200, Wolfram Sang wrote:
> Stephen,
> 
> > Maybe you meant
> > 
> > Fixes: 733b439375b4 ("i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()")
> 
> Absolutely correct. This is likely my fault, sorry for mixing up my
> branches :( And thank you for pointing it out!
> 

I removed the Fixes tag yesterday as the commit is going to be in the same PR as
the one it is fixing.

> All the best,
> 
>    Wolfram
> 



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

