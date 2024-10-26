Return-Path: <linux-next+bounces-4454-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A77409B1777
	for <lists+linux-next@lfdr.de>; Sat, 26 Oct 2024 13:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 193E8B22034
	for <lists+linux-next@lfdr.de>; Sat, 26 Oct 2024 11:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF721C7B7F;
	Sat, 26 Oct 2024 11:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YxJvbwCz"
X-Original-To: linux-next@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E231A1FC3;
	Sat, 26 Oct 2024 11:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729942501; cv=none; b=TcLL28ZKeBq8j05rX4OwCAy5jAjyOZHScQl6d4FBqbcIooP21ZcaFHZX1caE3TU3QJ2FPankBYhFqnO7AC0HKQggshtwAgnWkv05CbKSM409GCR0y4aww/bk0z89Fc2Amgn92GQ4w+UetJteCD6+CofUOtdFDkP6G/nMYleIh+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729942501; c=relaxed/simple;
	bh=gc2nX1FenozmlIeCX6Hna+IrfirzZd4vy02ZiBYdTQA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kHx1lcdSsIk2yGWujngAxmA89pK+LUC0qO18L2d8IpIcOQiRNaJXOKQ2ghZxdY1Jx4Am3Upw8okd7LH2JX8mrA/LrRV1MACbLAC5TxhxcMPFzHbUVa8opGXXL4Rm6WM6lKpPeNkCxA1A8OMbkG3412rzMZaaHLgBFbWp+E5OubU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YxJvbwCz; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18C511BF205;
	Sat, 26 Oct 2024 11:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729942490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9boJFCngh87o2N5te23vwSNEi1J2uQEAd3yS/VJtkLo=;
	b=YxJvbwCzow7HO0SQ/ESpa4hUM0VuIPuQkR7yU/SA+DjP8UeXObGS3vfVfU1QuiRYSzfk/y
	Hai+72edhsUchvrCbuaOFLv4O5SMzfwxRJmVcC0VQ0hcUAa2aX2UdC1sWiGDOf7xSdxjxP
	xCaxqoiLiUGIG5biMiYLGcIkFF3DOHy7Np+irHcb1QhwGNTOBIwWISY+kZrZSbXvqU1y63
	OaAECc0oGAqemLkU09MZZf3CDbo0THltF6mKYsdwZz96urOvId3T4nevLc3xUrCm4DAB84
	ykd89iP05F0QzObHixHScpLxp3wqrYOiTgGQEM2jSEMibvdjUv3jbj40VDyPqA==
Date: Sat, 26 Oct 2024 13:34:47 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Arnd Bergmann 
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] misc: Silence warning when building the LAN966x
 device tree overlay
Message-ID: <20241026133447.26df7466@bootlin.com>
In-Reply-To: <20241025192117.0cf20075@bootlin.com>
References: <20241025161739.3643796-1-p.zabel@pengutronix.de>
	<57793bb01e02f03e215dfa6f8783df18034ae2ea.camel@pengutronix.de>
	<20241025192117.0cf20075@bootlin.com>
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

Hi Philipp,

On Fri, 25 Oct 2024 19:21:17 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> On Fri, 25 Oct 2024 18:53:46 +0200
> Philipp Zabel <p.zabel@pengutronix.de> wrote:
> 
> > On Fr, 2024-10-25 at 18:17 +0200, Philipp Zabel wrote:  
> > > Silence the following warning when building the LAN966x device tree overlay:
> > > 
> > > drivers/misc/lan966x_pci.dtso:34.23-40.7: Warning (interrupts_property): /fragment@0/__overlay__/pci-ep-bus@0/oic@e00c0120: Missing interrupt-parent
> > > 
> > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Link: https://lore.kernel.org/all/20241025110919.64b1cffb@canb.auug.org.au/
> > > Fixes: 185686beb464 ("misc: Add support for LAN966x PCI device")
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > ---
> > > The referenced commit is in the reset tree.
> > > Changes in v2:
> > > - Do not handle W=1 warnings.
> > > - Link to v1: https://lore.kernel.org/all/20241025145353.1620806-1-p.zabel@pengutronix.de/
> > > ---
> > >  drivers/misc/Makefile | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> > > index 885b22989580..196fb730817e 100644
> > > --- a/drivers/misc/Makefile
> > > +++ b/drivers/misc/Makefile
> > > @@ -72,6 +72,7 @@ obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
> > >  obj-$(CONFIG_NSM)		+= nsm.o
> > >  obj-$(CONFIG_MARVELL_CN10K_DPI)	+= mrvl_cn10k_dpi.o
> > >  lan966x-pci-objs		:= lan966x_pci.o
> > > +DTC_FLAGS_lan966x_pci		:= -Wno-interrupts_property
> > >  lan966x-pci-objs		+= lan966x_pci.dtbo.o
> > >  obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
> > >  obj-y				+= keba/    
> > 
> > Applied to reset/next to silence the warning until lan966x_pci.dtso is
> > fixed:  
> 
> This warning 'Missing interrupt-parent' cannot be solved in dtso.
> I cannot reference the interrupt controller (PCI device node itself) which
> is outside the dtso. This PCI device node is the node on which the dtso
> is applied.
> 
> I think the patch you did is the correct one for this warning.

Thought about a way to remove the 'Missing interrupt-parent' warning
modifying the dtso. I will propose a patch on Monday.
If accepted, it will replace your patch.

Best regards,
Hervé

