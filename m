Return-Path: <linux-next+bounces-4497-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C017F9B3820
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 18:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8411D282DC4
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 17:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A941DFD96;
	Mon, 28 Oct 2024 17:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aiB7eBEs"
X-Original-To: linux-next@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929B81DE8BC;
	Mon, 28 Oct 2024 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730137431; cv=none; b=Xw4KiSgv8l/5BhnuHRLZXTQLTRdc+qroO8K5AtrhyVkJj7s52fzGtpTN8u2sjxZyJgI/YEWTEFxGeM3LCEXt3dM6GFZ4B2M0dy5dq/AVo53RxbgYIp6DgZp7CQul2cpH9W6SEV4SYN4Gk87S5+HSTsKDDotWVbymgPVj7OkUmlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730137431; c=relaxed/simple;
	bh=f/yeyqUr2JcyJhlTUa6RJ6NOKmfz1+MnUFWJuDF5jp0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ptDKtrXcaDjKR5WLSGiYAd6lrJkFjkcBlvO76xEet0GKVoD++q0ddawTYYtLIee4RfsRBpgXlTXnx/PXBLVR82I+MoKxV/KCjw5eQ6ng3roWKGZW3JSyrEfJ5et/JrakVt13HY3JwllirJkqLdwjywPWQilNVtVwsLcoGkzywXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aiB7eBEs; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 953EF60002;
	Mon, 28 Oct 2024 17:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730137426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mJH8NU3Vn9ttdIapYMp+zIr7NKZDJaU5TNdlqDTLWlQ=;
	b=aiB7eBEs91xng6LIj1pEfulvRpCF5yGrsBDCO0VMaGvSTj+48/56zIRXdHS3qrpzHiohoV
	tEbVHKlFJHE+Eb8f+4npIWqyt3rBX0cv4ku9m89BIN7iMpeuM9JVyLvfQh4YP/rcLAPmJ8
	p8g6JXisF3om4BDAms+S9oLwmshX/IeiTS1wW5v328UEuVZ8dV4e3Eu9wiXeFM2j0ht1d1
	1uFlcHOnron9QbOr/E2ZcLhgpzgUH52CfUcFy7rl9XNQVisyVzFSrrimkegqZb8FxJLY9U
	fyGGzgxbiNfUDuS/Fh3GT0m59C7vpttMakvSGDO/05JHixU6tZAk3iIi7v5L5g==
Date: Mon, 28 Oct 2024 18:43:43 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Rothwell
 <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Allan Nielsen
 <allan.nielsen@microchip.com>, Horatiu Vultur
 <horatiu.vultur@microchip.com>, Steen Hegelund
 <steen.hegelund@microchip.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 1/2] misc: lan966x_pci: Fix dtc warns 'missing or empty
 reg/ranges property'
Message-ID: <20241028184343.74ad5a26@bootlin.com>
In-Reply-To: <CAL_JsqK7SjfJ7Re4k-A8fQB+tNHyM3r2Rcpct_zUfR2yhEj+iQ@mail.gmail.com>
References: <20241028122405.27090-1-herve.codina@bootlin.com>
 <20241028122405.27090-2-herve.codina@bootlin.com>
 <CAL_JsqK7SjfJ7Re4k-A8fQB+tNHyM3r2Rcpct_zUfR2yhEj+iQ@mail.gmail.com>
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

Hi Rob,

On Mon, 28 Oct 2024 08:55:24 -0500
Rob Herring <robh@kernel.org> wrote:

> On Mon, Oct 28, 2024 at 7:24 AM Herve Codina <herve.codina@bootlin.com> wrote:
> >
> > dtc generates the following warnings when building the LAN966x device
> > tree overlay (lan966x_pci.dtso):
> >   Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/cpu_clk: missing or empty reg/ranges property
> >   Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/ddr_clk: missing or empty reg/ranges property
> >   Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/sys_clk: missing or empty reg/ranges property
> >
> > Indeed, related nodes are under the pci-ep-bus (simple-bus) which is not
> > correct.
> >
> > Put them outside this node.
> >
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes: https://lore.kernel.org/all/20241025110919.64b1cffb@canb.auug.org.au/
> > Fixes: 185686beb464 ("misc: Add support for LAN966x PCI device")
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> > The referenced commit is in the reset tree
> > ---
> >  drivers/misc/lan966x_pci.dtso | 36 +++++++++++++++++------------------
> >  1 file changed, 18 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> > index 7282687df25f..5466d013da7d 100644
> > --- a/drivers/misc/lan966x_pci.dtso
> > +++ b/drivers/misc/lan966x_pci.dtso
> > @@ -19,6 +19,24 @@ __overlay__ {
> >                         #address-cells = <3>;
> >                         #size-cells = <2>;
> >
> > +                       cpu_clk: cpu_clk {  
> 
> Preferred node name is "clock-<freq-in-hz>"

I based the name on the lan966x.dtsi
https://elixir.bootlin.com/linux/v6.12-rc1/source/arch/arm/boot/dts/microchip/lan966x.dtsi#L38

Of course, I can rename the cpu_clk, ddr_clk and sys_clk nodes but this will create
a difference against lan966x.dtsi on some points that should be identical.

Let me know with that in mind if I need to rename those nodes in this series.

> 
> Also, as a general rule, don't use "_" in node names (and properties).
> 
> Isn't there a schema for the device which needs these nodes added to
> it? If not, there should be.
> 

No, there is no schema yet for this device.

How can we describe schema for this kind of devices that are using
device-tree overlays?
I mean, this overlay is applied on a PCI device DT node. This DT node is
computed at runtime. It is, in the end, available in the base DT before
applying the overlay.
The compatible string that could be used to check the dtso against schema
cannot be set in the overlay (at least not at the correct place in the
hierarchy) without causing a property memory leak at runtime. An overlay
cannot add a property in a base DT node without generating a memory leak
and so, we avoid adding such properties in the base DT from the overlay.

Is this missing schema blocking for this series ?

Best regards,
Hervé

-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

