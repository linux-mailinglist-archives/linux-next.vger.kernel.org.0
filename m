Return-Path: <linux-next+bounces-4449-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAAD9B0B94
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 19:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 704DF2869D8
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 17:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D32720D518;
	Fri, 25 Oct 2024 17:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nmRgUHNi"
X-Original-To: linux-next@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E217120D4F9;
	Fri, 25 Oct 2024 17:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729876885; cv=none; b=UXlx0ENGMgBoAtcQQ6mjTayUHj5/FDNs4u76gqTTIpMqYSU6WDjPsqS6xznmst/wACGDqPqFgZWJy0+MRD/OJWgd8MNsExDLDtOoyL2wU9eselnNEn6fGYoo4VqKqJrUVgzs88ct0w+oXhzt66FvXAeazVh2EEzY7kWhTUAkqZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729876885; c=relaxed/simple;
	bh=/ElsOcIvNpeea3zCmVYDdlwrZ+WRwA3Ffa4TCKCOQqk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fUlVxMhq5ycIyTKn5X1+5WR2Q41keFyu8YWC8ugtHV12VYSimZF63DdwVAYSPxQwH+dnip0tiig/BUI1fG8F3OX5uWOhYk+rbUJa+geONZmS7EujICdNDjSe6zOId9jkK7BYVrXmRXZVOUlEmwkH8YHFo4QqTWTOPoRvu2QkTrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nmRgUHNi; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8C5DE0005;
	Fri, 25 Oct 2024 17:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729876880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EPFpBv2f+D8oeKxd8AG77vQrSZHxbSu+XaDtA9mUygM=;
	b=nmRgUHNitKZbuVNakV4qZjNLp2eiA1PZRLBmBZi1SLvQ5i29y2L9PZl/HGGRDdQ+Ut1kFx
	gTFX3a7O9E0+qGoMrrbtstgAz8q/RfsrhTA3l4NREuQXkJPQrf7Kt+QJDBVjxRAD11h7zw
	HWRP8W3Ob4tZv0IdXmnxQ29jQ0zUuTgbnB5OIDk23TSrSpBbNFW24lqF3idOq7DQe/QVjc
	vbKWHhDn0PrGdFb/eXyHCNFdHvbhr4bvs/zYAAEdBMUYwJR3hbDEf7iu2w/ZjwwRS9mkEm
	3DckmdKVzoZ8pf/QBiunZXWLOZuCL0X97cHe7sQpBUGggHm2edINq2M9IrSAOw==
Date: Fri, 25 Oct 2024 19:21:17 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Arnd Bergmann 
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] misc: Silence warning when building the LAN966x
 device tree overlay
Message-ID: <20241025192117.0cf20075@bootlin.com>
In-Reply-To: <57793bb01e02f03e215dfa6f8783df18034ae2ea.camel@pengutronix.de>
References: <20241025161739.3643796-1-p.zabel@pengutronix.de>
	<57793bb01e02f03e215dfa6f8783df18034ae2ea.camel@pengutronix.de>
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

On Fri, 25 Oct 2024 18:53:46 +0200
Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Fr, 2024-10-25 at 18:17 +0200, Philipp Zabel wrote:
> > Silence the following warning when building the LAN966x device tree overlay:
> > 
> > drivers/misc/lan966x_pci.dtso:34.23-40.7: Warning (interrupts_property): /fragment@0/__overlay__/pci-ep-bus@0/oic@e00c0120: Missing interrupt-parent
> > 
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Link: https://lore.kernel.org/all/20241025110919.64b1cffb@canb.auug.org.au/
> > Fixes: 185686beb464 ("misc: Add support for LAN966x PCI device")
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > The referenced commit is in the reset tree.
> > Changes in v2:
> > - Do not handle W=1 warnings.
> > - Link to v1: https://lore.kernel.org/all/20241025145353.1620806-1-p.zabel@pengutronix.de/
> > ---
> >  drivers/misc/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> > index 885b22989580..196fb730817e 100644
> > --- a/drivers/misc/Makefile
> > +++ b/drivers/misc/Makefile
> > @@ -72,6 +72,7 @@ obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
> >  obj-$(CONFIG_NSM)		+= nsm.o
> >  obj-$(CONFIG_MARVELL_CN10K_DPI)	+= mrvl_cn10k_dpi.o
> >  lan966x-pci-objs		:= lan966x_pci.o
> > +DTC_FLAGS_lan966x_pci		:= -Wno-interrupts_property
> >  lan966x-pci-objs		+= lan966x_pci.dtbo.o
> >  obj-$(CONFIG_MCHP_LAN966X_PCI)	+= lan966x-pci.o
> >  obj-y				+= keba/  
> 
> Applied to reset/next to silence the warning until lan966x_pci.dtso is
> fixed:

This warning 'Missing interrupt-parent' cannot be solved in dtso.
I cannot reference the interrupt controller (PCI device node itself) which
is outside the dtso. This PCI device node is the node on which the dtso
is applied.

I think the patch you did is the correct one for this warning.

Related to other warnings mentionned in v1:
  Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/cpu_clk: missing or empty reg/ranges property
  Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/ddr_clk: missing or empty reg/ranges property
  Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/sys_clk: missing or empty reg/ranges property

I will update the dtso and send the related patch.

Best regards,
Hervé

> 
> [1/1] misc: Silence warning when building the LAN966x device tree overlay
>       https://git.pengutronix.de/cgit/pza/linux/commit/?id=68152eff5240
> 
> regards
> Philipp


