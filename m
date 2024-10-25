Return-Path: <linux-next+bounces-4445-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB169B0A16
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 18:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D84D1C20F52
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 16:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A6C1865ED;
	Fri, 25 Oct 2024 16:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SslaFRyC"
X-Original-To: linux-next@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F24021A4C6;
	Fri, 25 Oct 2024 16:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729874294; cv=none; b=gNjLHmhxq+XkkF0vA+uwRHbdhyGtxuzfo8NG8uzuIV34khMig3FLccoCGZysk23I9nWw/bdPSsICVfAKnfv8ApTWdd4TFOzM6zlIe1El5Zgh6gqRfeKRUO/UeXJ25TvPXhY2LSsfzy4wzPGdkoO9saWqx//HpaJexcXlFaSu1eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729874294; c=relaxed/simple;
	bh=g/2wJX/RGQhuv2k/lrED0dP9TUgpQ6Iugoy1lPxcCec=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D6kIQsOOOakBT+nCxDWUU0+pl1Ak2sMSecoW1yLvhAzeGj1K49adlN9qHnQXRTczFbttRp/fsatM6MPZz1img5Qoy/w400YgdiJNqzHOFchFqLs4zt2Nr9xIAOiC6HpT6y3u6C/CXQDJDZIKT1zjmSeQ0BoIwZo6iND7bi2USL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SslaFRyC; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C4BC60004;
	Fri, 25 Oct 2024 16:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729874283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w0CJvqghK8kZRmG1YaS78UMDJgG8ck2tV2/7ZvGaAZ0=;
	b=SslaFRyCvUu0n3dfd7XLJUQvfAB6MFbBj+4rrf9+UlaFYhJzeLAeG8gZtV+y4LY2nVTOw5
	NrCGXPVjuzt/zXMbemQBjO3suEk/TE9KguRkxRbF7NPOJe0WpFIaGg9LZxYvLiabgrdQ69
	iLTpY8WwAkDzpyJnU8MOU0b84NtO19rbjNg9fEXNf2VkO98w6cPpThcAj3PcSSEBcr1i6i
	WuG52H6DGa7Ao8ITveDMSweEl/sGx/72tz4CN1QIIZUibumc4QnlDevPe7mqxG0Kf3fTO5
	5BXATkaEax2WDMAbu21poO5pNd9Rhh3yWU3ivo7ZsfmnUb4KbV/17SrSe4Zolg==
Date: Fri, 25 Oct 2024 18:38:01 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] misc: Silence warnings when building the LAN966x device
 tree overlay
Message-ID: <20241025183801.0133a0a7@bootlin.com>
In-Reply-To: <bf1a5649cd680213d66b249684b18afbc6083b6e.camel@pengutronix.de>
References: <20241025145353.1620806-1-p.zabel@pengutronix.de>
	<CAL_JsqKebRL454poAYZ9i=sCsHqGzmocLy0psQcng-79UWJB-A@mail.gmail.com>
	<bf1a5649cd680213d66b249684b18afbc6083b6e.camel@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com

Hi All,

On Fri, 25 Oct 2024 18:17:30 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Fr, 2024-10-25 at 10:40 -0500, Rob Herring wrote:
> > On Fri, Oct 25, 2024 at 9:54 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:  
> > > 
> > > Silence the following warnings when building the LAN966x device tree
> > > overlay:
> > > 
> > > drivers/misc/lan966x_pci.dtso:34.23-40.7: Warning (interrupts_property): /fragment@0/__overlay__/pci-ep-bus@0/oic@e00c0120: Missing interrupt-parent  
> >   
> > > drivers/misc/lan966x_pci.dtso:42.22-46.7: Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/cpu_clk: missing or empty reg/ranges property
> > > drivers/misc/lan966x_pci.dtso:48.22-52.7: Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/ddr_clk: missing or empty reg/ranges property
> > > drivers/misc/lan966x_pci.dtso:54.22-58.7: Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/sys_clk: missing or empty reg/ranges property  
> > 
> > These nodes should be moved out of the simple-bus.  
> 
> Ah, thank you. Hervé, can you send a follow-up to fix these?

Yes, I will do.
Is it ok for you if I send the patch on Monday morning?

Best regards,
Hervé

