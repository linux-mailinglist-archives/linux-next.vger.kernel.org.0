Return-Path: <linux-next+bounces-6792-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF185AB841C
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 12:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 366D8168816
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 10:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4DC296713;
	Thu, 15 May 2025 10:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUqb9zfp"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D771E1CAA98;
	Thu, 15 May 2025 10:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747305497; cv=none; b=Xhq6DM6jVK99nT/UEULvwO/Sr9NHzHh9n/jjrqmByk8buhx9iQ/jhF5fJLut3iF9tVZieN14YhIfC0/6bAEKhIDK5aLlbU5TBmU8+3X2uie6ZIFQAqewThQRalIxLWUQOhbSZci8e+3O6tTdbTNtnS2AOsTB9lh7dqEqH6gr4t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747305497; c=relaxed/simple;
	bh=x9Lbr1DoKF4HtbvCtuiKWyc2ZMy6VV2uwQpQdYYX2Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQK6pPBsXa1/Mp51UXQiwe73Eqqo+QAa5S3tkFyjNW45f2/o3ueJm8zRvYnw+E5O8/xjTa7cELHnpvWIf5VJj/Iliqumdc1uTBwu6KvQOdihCwhanCjonvgPYkcDyodUi9bFPuU3fkVQJxyXVjA6Dae3ZtXru1M7ptr9xE1v+sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUqb9zfp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6A7C4CEE7;
	Thu, 15 May 2025 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747305495;
	bh=x9Lbr1DoKF4HtbvCtuiKWyc2ZMy6VV2uwQpQdYYX2Ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUqb9zfpsgC8dVu5e033p+AIW5d1YX26UDt6h2z2EoxmLpZA1QTRu5MwbZ10PmPo1
	 aAy1Wf5Z9dHBh/pKJJxqYg6iH3ww+ulKnNmVkGL7AayG5I1z23WvnF9BAbUiqNWBQx
	 BUjCCI3kzCRRlBtBeMeEi3AEiPy3gkXQILjyfi7iBoElwiIj+LjAwsaGqyjQK/Fdna
	 gqMM/C2GweYhOztywmY8GfzQ0OCuefQp3trjhbd46aZy5xx1EVCkLLdtL+oEefvHWe
	 KveZoq+/CwPEeK3v+vKVSN5gRz6eWi5cmx0gOwzx124b/qalipLbWXB6KMafkHGjqY
	 1La9m8YB2ZmOA==
Date: Thu, 15 May 2025 11:38:09 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the phy-next tree with the phy tree
Message-ID: <aCXEEeBSS08XcYB9@vaman>
References: <20250515170912.509a9751@canb.auug.org.au>
 <TYYPR01MB70241C298A797D6A6A67EB94AA90A@TYYPR01MB7024.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYYPR01MB70241C298A797D6A6A67EB94AA90A@TYYPR01MB7024.jpnprd01.prod.outlook.com>

On 15-05-25, 09:11, Prabhakar Mahadev Lad wrote:
> Hi Stephen,

Pls do not top post

> 
> Thanks for the report and fixing the conflict.
> 
> @Vinod, shall a rebase my patches and send a new version?

NO, once a patch is picked, it there. We have a way to resolve the
conflicts. Nothing required from you

Thanks

> 
> Cheers,
> Prabhakar
> 
> > -----Original Message-----
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Sent: 15 May 2025 08:09
> > To: Kishon Vijay Abraham I <kishon@kernel.org>; Vinod Koul
> > <vkoul@kernel.org>
> > Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>; Prabhakar Mahadev
> > Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Linux Kernel Mailing List
> > <linux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-
> > next@vger.kernel.org>
> > Subject: linux-next: manual merge of the phy-next tree with the phy tree
> > 
> > Hi all,
> > 
> > Today's linux-next merge of the phy-next tree got a conflict in:
> > 
> >   drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > 
> > between commits:
> > 
> >   54c4c58713aa ("phy: renesas: rcar-gen3-usb2: Fix role detection on
> > unbind/bind")
> >   55a387ebb921 ("phy: renesas: rcar-gen3-usb2: Lock around hardware
> > registers and driver data")
> > 
> > from the phy tree and commit:
> > 
> >   3767474d7497 ("phy: renesas: phy-rcar-gen3-usb2: Add USB2.0 PHY support
> > for RZ/V2H(P)")
> > 
> > from the phy-next tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This is now
> > fixed as far as linux-next is concerned, but any non trivial conflicts
> > should be mentioned to your upstream maintainer when your tree is
> > submitted for merging.  You may also want to consider cooperating with the
> > maintainer of the conflicting tree to minimise any particularly complex
> > conflicts.
> > 
> > --
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > index 9fdf17e0848a,867f43132b7a..000000000000
> > --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> > @@@ -467,16 -472,24 +477,24 @@@ static int rcar_gen3_phy_usb2_init(stru
> >   	val = readl(usb2_base + USB2_INT_ENABLE);
> >   	val |= USB2_INT_ENABLE_UCOM_INTEN | rphy->int_enable_bits;
> >   	writel(val, usb2_base + USB2_INT_ENABLE);
> >  -	writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
> >  -	writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
> > 
> >  -	/* Initialize otg part */
> >  -	if (channel->is_otg_channel) {
> >  -		if (rcar_gen3_needs_init_otg(channel))
> >  -			rcar_gen3_init_otg(channel);
> >  -		rphy->otg_initialized = true;
> >  +	if (!rcar_gen3_is_any_rphy_initialized(channel)) {
> >  +		writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base +
> > USB2_SPD_RSM_TIMSET);
> >  +		writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
> >   	}
> > 
> >  +	/* Initialize otg part (only if we initialize a PHY with IRQs). */
> >  +	if (rphy->int_enable_bits)
> >  +		rcar_gen3_init_otg(channel);
> >  +
> > + 	if (channel->utmi_ctrl) {
> > + 		val = readl(usb2_base + USB2_REGEN_CG_CTRL) |
> > USB2_REGEN_CG_CTRL_UPHY_WEN;
> > + 		writel(val, usb2_base + USB2_REGEN_CG_CTRL);
> > +
> > + 		writel(USB2_UTMI_CTRL_INIT, usb2_base + USB2_UTMI_CTRL);
> > + 		writel(val & ~USB2_REGEN_CG_CTRL_UPHY_WEN, usb2_base +
> > USB2_REGEN_CG_CTRL);
> > + 	}
> > +
> >   	rphy->initialized = true;
> > 
> >   	return 0;
> > @@@ -764,7 -791,9 +792,9 @@@ static int rcar_gen3_phy_usb2_probe(str
> >   	if (phy_data->no_adp_ctrl)
> >   		channel->obint_enable_bits = USB2_OBINT_IDCHG_EN;
> > 
> > + 	channel->utmi_ctrl = phy_data->utmi_ctrl;
> > +
> >  -	mutex_init(&channel->lock);
> >  +	spin_lock_init(&channel->lock);
> >   	for (i = 0; i < NUM_OF_PHYS; i++) {
> >   		channel->rphys[i].phy = devm_phy_create(dev, NULL,
> >   							phy_data->phy_usb2_ops);

-- 
~Vinod

