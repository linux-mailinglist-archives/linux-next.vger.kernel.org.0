Return-Path: <linux-next+bounces-4653-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D019C0071
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 09:51:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E9831F221F1
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 08:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1425819F120;
	Thu,  7 Nov 2024 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="MndZh2uV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AZtEeqp5"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8137C38FB0;
	Thu,  7 Nov 2024 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730969513; cv=none; b=giDiXlO3ayyAstjhc4jLTBlwhg+tX9cLfwa1BzyMHkZS8YYHe1HH0uHeznvwwR4xlmKB1xssLRvqSdnpa2RWnr7YSQ4kXg18F2YjvtTed3jvOHsy7XnPggDk3o9nY/xr9JmJXj5yStJTbrsJGxIRJevOIv2HXsOCG/fnr2C7OJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730969513; c=relaxed/simple;
	bh=+yCI5Y08iCTDBIHlMEsCVdskeck8YG+AF5B+AuVrptM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUllG/R6Ku6oeCY0QM6QNw7pCoJkXDXa5uR2YNkzc1tREbCpSIO9yXlYX/sK41WbmFIUBncoOH2WbDjTUM+dnxavxSTYBXdevWpXnS0c5XFQqSSGhvnd+hQGQN/WzY+sTG9K0A1CvzidSznypHqLdeUzpBkyt0mke98L+KQnMtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=MndZh2uV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AZtEeqp5; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 1AFEA11400CF;
	Thu,  7 Nov 2024 03:51:49 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 07 Nov 2024 03:51:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1730969508; x=1731055908; bh=mLYrGgR7xi
	150q2EmTJsQhEuZ8EEIYlqYshpmAVqwAA=; b=MndZh2uVrHvHfeaJ5TG5IL/gxz
	YJN0BwRnjK9GWvfSKwzl3SucW5Bg1y58/rjXrg0wu4/Q6MhsJn2hvQIE+Nw0iFHd
	IN1Gdr7U1MJ6l3aXYgzAFU8sziUAuct9olW6B2rD15gJNEd5cSQhN37JS1+CtSDD
	bfjHcvQqCC6XsUexce/owwnb75kkcHkxnraJJEWsdaUPxRyraOQrDWcWN4GpeJlx
	adL+2ME1OZLOnip770VBjYlOYhHXUw7IX8hce7vRiXDrO6FFMOFkUVjEe2oDJROF
	Cgap/5N3rwYY6XZB0YrQpR2BQlB1V/Ei6OvNWaddfcUqar4hFGzoK9TIh28A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1730969508; x=1731055908; bh=mLYrGgR7xi150q2EmTJsQhEuZ8EEIYlqYsh
	pmAVqwAA=; b=AZtEeqp5+LeTdKCqHuRfHd8r+GNAtVtupKvrMZw+4HyhLXLYYkj
	7RDJ6LJDn74vZCcv59CnM8woXwzIpRtJVwbGutDUn9bPCnZueLHCNqEtDVvgZFXi
	aGOdFt8ABh5EEJb5wyLAkERwV8wp1Vuqyn+AHdyjPKjcIltw/izob2ngMbkJovAg
	+tT/WEulzzBv8ysIfJHZ+dvA6tUxkv1zb8uPqYVYExwI7MtRhiYUi14bmxGkyQ4v
	PSn74vI5mO8Lqmcx+O54QyqfxOzNAWSZhJIAHsq0SKqZDwDlRwQ0W2TMmcpThD1l
	xGwX8TwS7WOGmGgcvlAAEqLczTxt2z05pFA==
X-ME-Sender: <xms:o38sZ0lOQRl2ofk2myBjw8ppoWf03HTAMkpnMJh0ut9HGtkkPCeqeQ>
    <xme:o38sZz0HZi6sh3K9wDoRWquxTBvX8Bh7jB69Bu9P6DcYcQx0lY-iPF3Fg_LKYJOmd
    dMOPpQR7gLuJA>
X-ME-Received: <xmr:o38sZyo7jvX2p-RBCfSqFZphhy9TP2591rph7qEWWZF9O8DmcSSggFyqKVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrtdefgdduvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeduiedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehm
    rghrkhhgrhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrh
    hvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhumhgrrdhh
    vghguggvsegrmhgurdgtohhmpdhrtghpthhtoheplhhinhhugiesfigvihhsshhstghhuh
    hhrdhnvght
X-ME-Proxy: <xmx:o38sZwlZUpL4qbrMrjZprh8Ilz4XU7ZJYRGRpxdI9E3ezu_EKTJQsg>
    <xmx:o38sZy3DnWeKTKmPQVValhjSlUJOJwi4yiLsKHgtAfHWmQX0_kWmwQ>
    <xmx:o38sZ3sk6U9onJ_Cyf2F050PgoYVPmFddMh9Z_hDCRCN2rEQFMSA0A>
    <xmx:o38sZ-WbDDvpcN4W2h7nxco1Urjv28hnh782NUFeBGRiYEnfo9_Xfw>
    <xmx:pH8sZ7EAkOVurLCH7gTOErYUwS9H08xbNKQHIXj8b_IgklXALEEp8KiG>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Nov 2024 03:51:46 -0500 (EST)
Date: Thu, 7 Nov 2024 09:51:28 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Suma Hegde <suma.hegde@amd.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 drivers-x86 tree
Message-ID: <2024110719-detective-directly-fbcf@gregkh>
References: <20241107194007.1d247bde@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107194007.1d247bde@canb.auug.org.au>

On Thu, Nov 07, 2024 at 07:40:07PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   drivers/platform/x86/amd/hsmp.c
> 
> between commit:
> 
>   9df193087b9e ("platform/x86/amd/hsmp: Create hsmp/ directory")
> 
> from the drivers-x86 tree and commit:
> 
>   b626816fdd7f ("sysfs: treewide: constify attribute callback of bin_is_visible()")
> 
> from the driver-core tree.
> 
> I fixed it up (I deleted the file and applied the following patch) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 7 Nov 2024 19:36:12 +1100
> Subject: [PATCH] fix up for "sysfs: treewide: constify attribute callback of
>  bin_is_visible()"
> 
> interacting with "platform/x86/amd/hsmp: Create hsmp/ directory" from
> the drivers-x86 tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/platform/x86/amd/hsmp/plat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index f8e74c0392ba..748bbc356484 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -75,7 +75,7 @@ static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobject *kobj
>  }
>  
>  static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -					 struct bin_attribute *battr, int id)
> +					 const struct bin_attribute *battr, int id)
>  {
>  	u16 sock_ind;
>  

Change looks good, thanks!

greg k-h

