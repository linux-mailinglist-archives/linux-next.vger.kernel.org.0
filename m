Return-Path: <linux-next+bounces-4515-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFFE9B4313
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 08:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1507DB21C1D
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2024 07:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C342022DE;
	Tue, 29 Oct 2024 07:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lceFApI0"
X-Original-To: linux-next@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9834E1D7994;
	Tue, 29 Oct 2024 07:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730186808; cv=none; b=DwiEQ+G8DduxKMXNhfj/2HoqfL1sLaiN00MylUOZc1PTT13QOW8MiSTZaKgYzDT6A55F47AP6P/Hm2KsUf/RlpxUWj0J3KbmaZzvzuQbrupv7Vtj9RpVBZ8Nt0DYxgIx9vlwTookSFgz0DdlGZESVdeAy8cVYKoV4GEPig1Bd7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730186808; c=relaxed/simple;
	bh=tlRoJmKwWghyXvArwEPPbAULld9pZxhD1wy+KDEiITg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WysrEZLsHmcPYtKCLo5AwDwoLqA4GFO6IagFHeV0d6pyhxBu7dlmMGJfCEVztbFKatBKOoa9HTUqcJ0cCMb54UQvzGnDSgwP5SfBaxdOcU7EkQ4mjodzxw9moUZHBZGzUm2fTm5uzXq1UebPmLNhR+fKs/LEXKXlr3Joeqr34dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lceFApI0; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FA50C0005;
	Tue, 29 Oct 2024 07:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730186802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m7so1BTABY1k8Brmth1KMoewt9oM+sY1vHo1xKTYlic=;
	b=lceFApI0oRoGy1SCgPF2dPZncqAvUGyRn1AwH5Wmnel/79kx4F+WTwyfqvBv4iBBNI9wH0
	8Zto8bVmT9MpJ3WgkWXbFyge5NGQNwf9NlP9znfAinOSwZPe8yFSFIuI+9qV3OrJj4S6U2
	O0rmjSbLO3idfN9jxqlB7n5JLjcMvkiXbFn8sfwELHQ67IrUJu2yoe3WbQ1UWkpO3b9+dm
	eeXJa5WIxiNH8XARYE0zrtt9t8L1GHyKTIsoGJq7DARmGfwZASvVlporrU2HrtsduH7pfT
	od5ojKwjF6OeVktWbVjWHC5QFt8/5lfWX5ZrDK2DoWHl7p5DlTIyFbPEXVqbRQ==
Date: Tue, 29 Oct 2024 08:26:40 +0100
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
Message-ID: <20241029082640.7e19e7bb@bootlin.com>
In-Reply-To: <CAL_Jsq+_VHsMKufVwUj3Q0pv1X6d8Xe0FN6A9svCmWJ3cuuUqQ@mail.gmail.com>
References: <20241028122405.27090-1-herve.codina@bootlin.com>
	<20241028122405.27090-2-herve.codina@bootlin.com>
	<CAL_JsqK7SjfJ7Re4k-A8fQB+tNHyM3r2Rcpct_zUfR2yhEj+iQ@mail.gmail.com>
	<20241028184343.74ad5a26@bootlin.com>
	<CAL_Jsq+_VHsMKufVwUj3Q0pv1X6d8Xe0FN6A9svCmWJ3cuuUqQ@mail.gmail.com>
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

On Mon, 28 Oct 2024 14:52:09 -0500
Rob Herring <robh@kernel.org> wrote:

> On Mon, Oct 28, 2024 at 12:43 PM Herve Codina <herve.codina@bootlin.com> wrote:
> >
> > Hi Rob,
> >
> > On Mon, 28 Oct 2024 08:55:24 -0500
> > Rob Herring <robh@kernel.org> wrote:
> >  
> > > On Mon, Oct 28, 2024 at 7:24 AM Herve Codina <herve.codina@bootlin.com> wrote:  
> > > >
> > > > dtc generates the following warnings when building the LAN966x device
> > > > tree overlay (lan966x_pci.dtso):
> > > >   Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/cpu_clk: missing or empty reg/ranges property
> > > >   Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/ddr_clk: missing or empty reg/ranges property
> > > >   Warning (simple_bus_reg): /fragment@0/__overlay__/pci-ep-bus@0/sys_clk: missing or empty reg/ranges property
> > > >
> > > > Indeed, related nodes are under the pci-ep-bus (simple-bus) which is not
> > > > correct.
> > > >
> > > > Put them outside this node.
> > > >
> > > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > Closes: https://lore.kernel.org/all/20241025110919.64b1cffb@canb.auug.org.au/
> > > > Fixes: 185686beb464 ("misc: Add support for LAN966x PCI device")
> > > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > > ---
> > > > The referenced commit is in the reset tree
> > > > ---
> > > >  drivers/misc/lan966x_pci.dtso | 36 +++++++++++++++++------------------
> > > >  1 file changed, 18 insertions(+), 18 deletions(-)
> > > >
> > > > diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
> > > > index 7282687df25f..5466d013da7d 100644
> > > > --- a/drivers/misc/lan966x_pci.dtso
> > > > +++ b/drivers/misc/lan966x_pci.dtso
> > > > @@ -19,6 +19,24 @@ __overlay__ {
> > > >                         #address-cells = <3>;
> > > >                         #size-cells = <2>;
> > > >
> > > > +                       cpu_clk: cpu_clk {  
> > >
> > > Preferred node name is "clock-<freq-in-hz>"  
> >
> > I based the name on the lan966x.dtsi
> > https://elixir.bootlin.com/linux/v6.12-rc1/source/arch/arm/boot/dts/microchip/lan966x.dtsi#L38  
> 
> That should be fixed too.
> 
> > Of course, I can rename the cpu_clk, ddr_clk and sys_clk nodes but this will create
> > a difference against lan966x.dtsi on some points that should be identical.  
> 
> Then maybe they should be sharing a .dtsi?
> 
> > Let me know with that in mind if I need to rename those nodes in this series.  
> 
> Yes, easier now than later.

Right, I will rename in v2.

Best regards,
Hervé

