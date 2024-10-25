Return-Path: <linux-next+bounces-4431-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4779AF9E8
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 08:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 968D81C221A2
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2024 06:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4167118DF92;
	Fri, 25 Oct 2024 06:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NCsdj+DI"
X-Original-To: linux-next@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868D64436A;
	Fri, 25 Oct 2024 06:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729837712; cv=none; b=eywioXUYDz/nRgkQvj0iPObsiH7auJiU3uDza+RDSknpFNsSEqNrIFBmqp2hPoF9DIXGMNFCHOieRBl7drTjWJoA6IuTo2s70XOVgIMwF3Rb4Sr7PnTkyhhCSJdWh+bXEQEjtg9BOu5/lb9z45Hd1ytCSnci2BoL5WziSgqpl5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729837712; c=relaxed/simple;
	bh=eW5cNoq4HhqCleohpEdEFNz15qAmy3Q0PscLTgWOAvY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dv5zCUmW4tMemKdFXsb3i767K8HRvo1UnLqzmVdBDlYz0VUMWIJkq62huWzC6ea4VWRBZuq+kw1k2GW5dP36nZTiaPISdjsub132fT8+paeOPO9BZrG22qZj5PhEaeuXgiXN7QlujosTHnG5csFdmNY35OrFoTMy2qGxjd72Q58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NCsdj+DI; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0AF88FF804;
	Fri, 25 Oct 2024 06:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729837700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T2urxZr4PdBqe/WP4JjhB39N/OOp7KvKgjKG4IyRf8s=;
	b=NCsdj+DI5bkXRQexT60OpdJck6eHoD2BwdnMbuETa12Hmld6Oi66EBLttuoNU1Ur4NBQGU
	WzeayFaZDH2K1uCpbcYsMbNAWZFQMj0zYu6TZrMaJ3VESfDUeX3rSX0R84v4fgjC95DMeC
	QMYEBr3pFC13a9IsLC/5A12+zErJ4o1yyfBbFtUgGRLDT7DkyGBa1QwUJ8zCx0cqhwFCz0
	r0p4oXDbKrYKSvPBo+3SU2YoRUEclI/eXhdLN29389NK4PmGAOFWeEQqHq0ADRs6W36r8q
	hCjQjtkDBFilu5awmdt4Zz2LjYjvf1FTG7Y9o45Zp+2wKkHarwA3rDKojv+7UQ==
Date: Fri, 25 Oct 2024 08:28:17 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Rob Herring <robh@kernel.org>
Subject: Re: linux-next: build warning after merge of the reset tree
Message-ID: <20241025082817.28056f52@bootlin.com>
In-Reply-To: <20241025110919.64b1cffb@canb.auug.org.au>
References: <20241025110919.64b1cffb@canb.auug.org.au>
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

Hi all,

On Fri, 25 Oct 2024 11:09:19 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the reset tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/misc/lan966x_pci.dtso:34.23-40.7: Warning (interrupts_property): /fragment@0/__overlay__/pci-ep-bus@0/oic@e00c0120: Missing interrupt-parent
> 
> Introduced by commit
> 
>   185686beb464 ("misc: Add support for LAN966x PCI device")
> 

This warning is normal.
interrupt-parent is not present in the oic node. This was discussed in
https://lore.kernel.org/all/CAL_Jsq+je7+9ATR=B6jXHjEJHjn24vQFs4Tvi9=vhDeK9n42Aw@mail.gmail.com/

interrupt-parent is not mandatory for a node and if interrupt-parent is not
present, the interrupt parent resolution code will look at the parent node
recursively until an interrupt-parent or an interrupt controller is found.
https://elixir.bootlin.com/linux/v6.12-rc1/source/drivers/of/irq.c#L56

In the LAN966x PCI case, this goes up to the PCI device which is itself an
interrupt controller. This interrupt controller is not described in the dtso
because it is the node where the dtso is applied.

The LAN966x PCI device DT node has the #interrupt-cells and the
interrupt-controller properties. This build at runtime:
https://elixir.bootlin.com/linux/v6.12-rc1/source/drivers/pci/of_property.c#L186

Best regards,
Hervé
-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

