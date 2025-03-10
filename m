Return-Path: <linux-next+bounces-5702-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D78A58C9F
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 08:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6E88188CE90
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 07:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF0861C84A9;
	Mon, 10 Mar 2025 07:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="YCSnSpI9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J7sE2/bH"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382B71B4153;
	Mon, 10 Mar 2025 07:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741591045; cv=none; b=hPm7lJtK2UuXJxlWsuDj3yoFvLEcGh01Ki2kFzf2kKlL1XBJ5kfyHx/FV9Nbjowrlq04ANql0XTTph/EiT7qHgJpMGuzEp3IoZVdZJn5+jwEtegf6YPgFxvhcxFpzb2YgmiR0yzA5mh6PReLoZM4Jkt/fk+h77HqkX4AWrxakp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741591045; c=relaxed/simple;
	bh=9L8JCBhgoFxdIePQoDp94udzf7pnTqrsbwNxET6a7Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LulswUemrwLMib5mXHpOKlvqQzgTWMLhdTptkYT7VRKP7r567DxK8UfmLG7FhypD+0pYRxD25K4RpPuHIXtno0WIbjwEMMNA5Q8AcVeHVZVrcVILVqAdxHfFeV1krW0KkgD3+ZEoPxS/FZEGu/saduhHSprjJOILJLkUU3Ymuac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=YCSnSpI9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J7sE2/bH; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EE75F2540146;
	Mon, 10 Mar 2025 03:17:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 10 Mar 2025 03:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1741591041; x=1741677441; bh=I6iCa18A/p
	d2A9SeKJfs9/4Am1VGJRgjZyfzz/7cgMs=; b=YCSnSpI9lrANtHYc5QQFjusx+7
	5q7OB5PDB2A70lHcgJ3m0Ffk0zv8ByD1ulfBMfSC6KTTYGVGG9gQpXhyrslSdmaR
	W76Lf2TdiOkz00llD/J8gbOANFUAS5HRtanPZOIg1SVQdNXau34tzYuIW/b4RCq6
	kFfi4xM9m2b+YgKsWeeSkeRBqfOy/gn6QcwrhIPoTvNiCUK2m+LCuTklGVe3Bdvy
	1k6xLCix5uLKSyGBrp8Wwp8ofvscI5N8s3EDigqug2DRRiV3auknUPoiPkTgqlIK
	l/MbyhTDpaJ15vuOL8/U8BFuxFT0YTzeAp8n+VAL9ehQJpyJCPuQe7xT7Kiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1741591041; x=1741677441; bh=I6iCa18A/pd2A9SeKJfs9/4Am1VGJRgjZyf
	zz/7cgMs=; b=J7sE2/bHPs4mM1TAR73K78Auxfh0JjF8gBjJ+q8/Cd1PEbAXW7U
	A8o7Bn6cAoKv18Lk+zeNt4niwzMVktK2XQ4owow9WQsHqxt1ThdEU5QwkRVXJGvA
	LF4qKFv/I7LD6fsfaRh+iGJ/Es3qiAjixxeL0oTFy/d5rHV/k16O0D7vxDaxNUp+
	iboECaz7K2GS2hTVKkf0Uq6bjxapYouI+v47voru+HbjW9ChbUjQpeTVpvRNua8x
	6zEKg3smIr5ssh0o7OVM6+8dpF+D+mFeDQ6+HrhXEBIyxNq0FTWI3BN5jA/pctWr
	l8bI4BuH38cPO067q4IsjHJMg/jUAOljRqw==
X-ME-Sender: <xms:AJLOZ7cZ4YH04XNn4zqTklGi2FOduzIU64meXkY0NZR1s42DxhVVVw>
    <xme:AJLOZxN5nDjsPwPCrlxrEtL__GEpoW1RPQ5yBgyI_cAF8nmdO3sRzrQbPjQtYSNRR
    Q8p-sTKQSn-Gg>
X-ME-Received: <xmr:AJLOZ0j3Sr5ZPZSBEMuLfX8Fl1IDkxTuE6EsDuqSB4LEK1RwjUPLj6RlyZXPRR8epnXXsmwtsHObUYIld6yyRp92nvv-OlBLCJzbTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekjeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrg
    hupdhrtghpthhtoheplhhksegtqddqvgdruggvpdhrtghpthhtohepughmihhtrhihrdgs
    rghrhihshhhkohhvsehlihhnrghrohdrohhrghdprhgtphhtthhopegsohguuggrhhekje
    elgeesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:AJLOZ89lWQu1VcP4aH9xlmZE4Hx_4w8salYJGTp3hBxfCqg73NNaIQ>
    <xmx:AJLOZ3sXoL-7_5sScP_l5Rk5zEv96IjNMLxS-mDHGT7j5597iGPacw>
    <xmx:AJLOZ7EdjTySaap-b9QteRGShIBmQ1tFwgZTqTYnTkliAqGHyZcOYQ>
    <xmx:AJLOZ-M7jOBdvvxM3m3S6Y045TRYPLWCNrWU27VAGV2Qw4mXqLFOig>
    <xmx:AZLOZwH7mgUizHWuhsNQmY-F4HsFfiz4IsoEcfckm3TmvI3et8I8W_KI>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Mar 2025 03:17:20 -0400 (EDT)
Date: Mon, 10 Mar 2025 08:17:17 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Fedor Pchelkin <boddah8794@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <2025031003-stimulus-overwrite-6e88@gregkh>
References: <20250220141559.71d7db7c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220141559.71d7db7c@canb.auug.org.au>

On Thu, Feb 20, 2025 at 02:15:59PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/usb/typec/ucsi/ucsi_acpi.c
> 
> between commit:
> 
>   976e7e9bdc77 ("acpi: typec: ucsi: Introduce a ->poll_cci method")
> 
> from the usb.current tree and commit:
> 
>   f9cf5401526c ("usb: typec: ucsi: acpi: move LG Gram quirk to ucsi_gram_sync_control()")
> 
> from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/usb/typec/ucsi/ucsi_acpi.c
> index ac1ebb5d9527,ada5d0d21ee6..000000000000
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@@ -131,25 -131,7 +137,8 @@@ static int ucsi_gram_sync_control(struc
>   static const struct ucsi_operations ucsi_gram_ops = {
>   	.read_version = ucsi_acpi_read_version,
>   	.read_cci = ucsi_acpi_read_cci,
>  +	.poll_cci = ucsi_acpi_poll_cci,
> - 	.read_message_in = ucsi_gram_read_message_in,
> + 	.read_message_in = ucsi_acpi_read_message_in,
>   	.sync_control = ucsi_gram_sync_control,
>   	.async_control = ucsi_acpi_async_control
>   };

This is now fixed up in my tree, thanks.

greg k-h


