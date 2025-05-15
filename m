Return-Path: <linux-next+bounces-6793-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9F4AB8420
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 12:39:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C9417A5A35
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 10:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC7A296713;
	Thu, 15 May 2025 10:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qAGahHWa"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C092D1CAA98;
	Thu, 15 May 2025 10:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747305533; cv=none; b=X6IzA6jKUJ69v4MICdETcBanda0L2LNPnwdeGTGUM55SaEDxeS0SrQ1r4U2sp742U5IdtiQtCu8zuvHZbHOAScL78J8iVUOjsxplpWSX0F1X3shzms/5ZV88y2UYmcEFqkJiUe8tJn0PdoLMOtZUjyLb5QzPo0hYEJdWVLn1Elc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747305533; c=relaxed/simple;
	bh=u9pQsJkb89PueyOZYpBzCJkMgn9f8gy5TVJODU5Rh2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m4ljKLE0OsPntbfUyKGp4x1n3XjItbYp6rm8KuIWfswugEA5MjD2fuVuGtoSVUg5mDfykicDi9ChuZXanoZGEWycenXT/5U9g+ivxqxhOtKx3i5/DjkMjhgu+dS6a1XHaRpkFj2kDuV0ayu/qTjIgJFJmWSSJT8Q2iL7LHnc+tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qAGahHWa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0B1C4CEE7;
	Thu, 15 May 2025 10:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747305533;
	bh=u9pQsJkb89PueyOZYpBzCJkMgn9f8gy5TVJODU5Rh2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qAGahHWaL8k6KSOhbcjSEY0w/Ehjc7yzWafCxOH8k4k8ehiCu73E7A4aRASK5u5Wr
	 uqQAnpY6IBWGMIo+K9BK9zPxpRei+L1wHbiYqx4KvCVdeMayO0/1E6u9dU+4YQQD/A
	 Vqfcj7dDPTmQGF9CI2to9S16Y4HkSlC6ZwTvcnLSottDQ7NHx8XKGCBiz7wApnzfEP
	 /D7rNvuXF8EejBqu0d6bdidWmzhEgXb8w4N+Rxl69h6gTikWa7mPnH1b8Mv9RRFnhy
	 sTaa4+DoLz32vuSoJLBIfquQgotrJ/mjvsZDCfgPiK5klWGIx32LtNA1l2YQIZ/H4Y
	 gbqOH7LwtaO0A==
Date: Thu, 15 May 2025 11:38:48 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the phy-next tree with the phy tree
Message-ID: <aCXEOGUDcnaoGKWW@vaman>
References: <20250515170912.509a9751@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515170912.509a9751@canb.auug.org.au>

On 15-05-25, 17:09, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the phy-next tree got a conflict in:
> 
>   drivers/phy/renesas/phy-rcar-gen3-usb2.c
> 
> between commits:
> 
>   54c4c58713aa ("phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind")
>   55a387ebb921 ("phy: renesas: rcar-gen3-usb2: Lock around hardware registers and driver data")
> 
> from the phy tree and commit:
> 
>   3767474d7497 ("phy: renesas: phy-rcar-gen3-usb2: Add USB2.0 PHY support for RZ/V2H(P)")
> 
> from the phy-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, lgtm, I will merge fixes to resolve them before sending it up

> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/phy/renesas/phy-rcar-gen3-usb2.c
> index 9fdf17e0848a,867f43132b7a..000000000000
> --- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
> @@@ -467,16 -472,24 +477,24 @@@ static int rcar_gen3_phy_usb2_init(stru
>   	val = readl(usb2_base + USB2_INT_ENABLE);
>   	val |= USB2_INT_ENABLE_UCOM_INTEN | rphy->int_enable_bits;
>   	writel(val, usb2_base + USB2_INT_ENABLE);
>  -	writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
>  -	writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
>   
>  -	/* Initialize otg part */
>  -	if (channel->is_otg_channel) {
>  -		if (rcar_gen3_needs_init_otg(channel))
>  -			rcar_gen3_init_otg(channel);
>  -		rphy->otg_initialized = true;
>  +	if (!rcar_gen3_is_any_rphy_initialized(channel)) {
>  +		writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
>  +		writel(USB2_OC_TIMSET_INIT, usb2_base + USB2_OC_TIMSET);
>   	}
>   
>  +	/* Initialize otg part (only if we initialize a PHY with IRQs). */
>  +	if (rphy->int_enable_bits)
>  +		rcar_gen3_init_otg(channel);
>  +
> + 	if (channel->utmi_ctrl) {
> + 		val = readl(usb2_base + USB2_REGEN_CG_CTRL) | USB2_REGEN_CG_CTRL_UPHY_WEN;
> + 		writel(val, usb2_base + USB2_REGEN_CG_CTRL);
> + 
> + 		writel(USB2_UTMI_CTRL_INIT, usb2_base + USB2_UTMI_CTRL);
> + 		writel(val & ~USB2_REGEN_CG_CTRL_UPHY_WEN, usb2_base + USB2_REGEN_CG_CTRL);
> + 	}
> + 
>   	rphy->initialized = true;
>   
>   	return 0;
> @@@ -764,7 -791,9 +792,9 @@@ static int rcar_gen3_phy_usb2_probe(str
>   	if (phy_data->no_adp_ctrl)
>   		channel->obint_enable_bits = USB2_OBINT_IDCHG_EN;
>   
> + 	channel->utmi_ctrl = phy_data->utmi_ctrl;
> + 
>  -	mutex_init(&channel->lock);
>  +	spin_lock_init(&channel->lock);
>   	for (i = 0; i < NUM_OF_PHYS; i++) {
>   		channel->rphys[i].phy = devm_phy_create(dev, NULL,
>   							phy_data->phy_usb2_ops);



-- 
~Vinod

