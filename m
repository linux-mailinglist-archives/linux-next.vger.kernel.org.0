Return-Path: <linux-next+bounces-2661-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F05F915E03
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 07:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0FD51F215F8
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 05:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D0B143890;
	Tue, 25 Jun 2024 05:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="QPREX/zI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nRYWjbf3"
X-Original-To: linux-next@vger.kernel.org
Received: from wfhigh2-smtp.messagingengine.com (wfhigh2-smtp.messagingengine.com [64.147.123.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2499C13C9B8;
	Tue, 25 Jun 2024 05:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719292297; cv=none; b=pL1n3YgXe2Pono7yk6RVkKk9v4UTphmM8e+/+Q3KPInBUqgOGiLz6t0Z9is9LSSoJ6VgGLkSpGLHqFTEESH/YohlPVRndsGpSljMx9K1pE3S7L2S2EI+uW2U3lOkcIwMy1BjwrOlhCZqk5fw1hMWyb+mr2LrD7uPdzo+kNvLavM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719292297; c=relaxed/simple;
	bh=DOy/19zdjDeiV5mrvzvx+sa05n7UM/Te9jvjMfqZJGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGIY7MBKvKmhPYimZ4G3a3P6Dr+Vbklk0rQjzA0ncmizcbFf6Ox2D0ZAhnPmr+CpyMQlLshLB50hFq9/3Bztb6kB+3BSLEJSiCLOR5RMlxJAW7SPpR9aix9EQa9FfIq+lEHXJhOo6cJs13vwKcew6129hjIhTQcGZgQBMgIU0QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=QPREX/zI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nRYWjbf3; arc=none smtp.client-ip=64.147.123.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.west.internal (Postfix) with ESMTP id 785E3180007D;
	Tue, 25 Jun 2024 01:11:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 25 Jun 2024 01:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1719292293; x=1719378693; bh=5sNiZBdV5R
	x00kTy0wL5E5z7iGsVeBKdADwPXeyoaYE=; b=QPREX/zIYgwKUgXI5ubNuULqla
	oTRzz1tMsDz8FmvIbJlraVuY+6WeBmnn2B6pDZ+OIpceYnwff1LdnYOTLB5GAAU/
	6D9TeIWfs7HjBeQEVRdPZBwJR9EfRi1Hnt0/bKDjIOmT9RS8Xk77+osL8xFLBmC4
	bFMcCE0CkhpC1HcL5VYTVjxxkwu2Y0ehpkJUOzH1lbBraTUST6qoH6fm+BUGbGWh
	LG/7ZwPfGZvkJrP1jg6Dc4TMFe3QzxB1VDrEWzHdKp8smHpFhZpOZvmQibervhYG
	dhyQkUK2Opvgm+4XNubTwuzMLPFJBwiDsi8sE5WBDNKoJUQYrlcSCLbcDTCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719292293; x=1719378693; bh=5sNiZBdV5Rx00kTy0wL5E5z7iGsV
	eBKdADwPXeyoaYE=; b=nRYWjbf3Bt6jOKbmRHu7CGVd77tbZ/IsNXVdIXOY1Hrr
	kFIee0dAR+C7sQmZ7G6RfIyQ6G5OH/P7GzWFWqarn2FiLeeujf7BtGhC/4IehpRD
	Jil3KahXcgEYM1J22RzGxfMk9ij9WIGTrFksuTFjQ4UYnXLJn2SmHMbTIqHvgNBA
	dCNkldj8RHRY9IBU3BFKQv46imTDSeRRNY9XzPHRPA1N51H8ou5p64EeAPimjJgj
	lpKuhmxL3QP22y/22AqGC4QkxQ1Q/imt5O4gbCI1hM+rnf0G8HwePllxc1GB8guc
	oaGElnt0sB2ZXpNUJO0aiJlUJy+1yJoOo7Tn3u20gQ==
X-ME-Sender: <xms:hFF6ZkOnUf64f57lttcJsobyPLmhuPsI92XHdjG_EsT5g8g4yBLSZA>
    <xme:hFF6Zq-FxDiihB0QBLsCi2Do-Pligq82PsHXjv7WiTke84QQtFH7d9ZGctaiM71ZI
    SptFXbPfke5Dw>
X-ME-Received: <xmr:hFF6ZrR9fLIAX2Ztf-SO7f_NFCs7RDG8xK2bjHNcLCkpqxEMGbISGlfRr38PMDEgN0OfRj--5Gpy2cazffsimV2GC1bSMGX_sYUBsg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeegvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvd
    evvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:hFF6ZsupxBZ2Ubg_ubmWfHFMT5tBuAxg3TNf7cS4w0JhW5-y3JB8Vg>
    <xmx:hFF6ZsdxsC8RJmTfS-shQaHp4D98SrAzEMKk502dpkw8Fte5dAIr_Q>
    <xmx:hFF6Zg3Ys8px2Q5eYnBf1Dxu7mlrCiX5e56FNn_Wu1bn9QnGp5DozA>
    <xmx:hFF6Zg89SMd_IheXbrLUDuxD529GB5oTg2LVjel1hmn8TpvNCzX1Ow>
    <xmx:hVF6Zn3vrVPG0SzDBT-PhbiG2MsWofqGLjnkYFiPIK-FuS43FCQfFIMa>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jun 2024 01:11:32 -0400 (EDT)
Date: Tue, 25 Jun 2024 07:11:30 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <2024062524-numbing-winking-dde5@gregkh>
References: <Znm5qDrsqIY8VNTc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Znm5qDrsqIY8VNTc@sirena.org.uk>

On Mon, Jun 24, 2024 at 07:23:36PM +0100, Mark Brown wrote:
> Hi all,
> 
> After merging the driver-core tree, today's linux-next build
> (x86_64 allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/net/ethernet/renesas/rtsn.c:1381:27: error: initialization of 'void (*)(struct platform_device *)' from incompatible pointer type 'int (*)(struct platform_device *)' [-Werror=incompatible-pointer-types]
>  1381 |         .remove         = rtsn_remove,
>       |                           ^~~~~~~~~~~
> /tmp/next/build/drivers/net/ethernet/renesas/rtsn.c:1381:27: note: (near initialization for 'rtsn_driver.<anonymous>.remove')
> 
> Caused by commit
> 
>   0edb555a65d1e ("platform: Make platform_driver::remove() return void")
> 
> interacting with
> 
>   b0d3969d2b4db ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
> 
> I have applied the below patch.
> 
> From 8f276c3b5b1be09214cbd5643dd4fe4b2e6c692f Mon Sep 17 00:00:00 2001
> From: Mark Brown <broonie@kernel.org>
> Date: Mon, 24 Jun 2024 19:02:24 +0100
> Subject: [PATCH] net: ethernet: rtsn: Fix up for remove() coversion to return
>  void
> 
> Fixes: 0edb555a65d1e ("platform: Make platform_driver::remove() return void")
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/net/ethernet/renesas/rtsn.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
> index ad69d47463cbd..5a6cc99e6b35a 100644
> --- a/drivers/net/ethernet/renesas/rtsn.c
> +++ b/drivers/net/ethernet/renesas/rtsn.c
> @@ -1358,7 +1358,7 @@ static int rtsn_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int rtsn_remove(struct platform_device *pdev)
> +static void rtsn_remove(struct platform_device *pdev)
>  {
>  	struct rtsn_private *priv = platform_get_drvdata(pdev);
>  
> @@ -1372,8 +1372,6 @@ static int rtsn_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  
>  	free_netdev(priv->ndev);
> -
> -	return 0;
>  }
>  
>  static struct platform_driver rtsn_driver = {
> -- 
> 2.39.2
> 

Looks good, thanks!

greg k-h

