Return-Path: <linux-next+bounces-3583-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A3696B161
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 08:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E36591F26075
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 06:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DA4F83A09;
	Wed,  4 Sep 2024 06:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="U3CUgT/C";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NoMVzaF+"
X-Original-To: linux-next@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B08C823DE;
	Wed,  4 Sep 2024 06:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725430669; cv=none; b=OIy0g6p9kN0ow/bLF74eOpCyl5Y0wrsNiaKe6fuTBAos+KkpsU78S6lwmQvCUfxEpapWIqwxH5EocF5hWwreyEPvms4sq3gPFHk2X+GRpHIn5unycAOSmjDwQN9XC6dWUy3QxgTwGaTe1VWKdHOVM2oHkuv8DUhMtfxBcghBAIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725430669; c=relaxed/simple;
	bh=tgOkS2MnLyubjO1D0RGMYBHHNKwzgFn5mHakG26atOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmO6bSjjy9k1VFKy/O0YGLU+a+Fp0IeOfxKjYFGsMzD9DrB17TKXvvNPmal/5pq5djcgfDk//wIbfE4fbeAU4GodlN/d/TctC7vN421xu5a9hbIj8QDvCennwXJKFvYVGZfVuaNYyEgdz9XDjbgG9HdIkFgCpeGC0sQyd0M8Sek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=U3CUgT/C; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NoMVzaF+; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 7663E138010C;
	Wed,  4 Sep 2024 02:17:46 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 04 Sep 2024 02:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1725430666; x=1725517066; bh=2frmxt4GEU
	GpO4MxS11bhFRThh3ObuT29vnXyIgorwg=; b=U3CUgT/CBWSvkZFuEG7/4Ffpdx
	ikNZfSyItPCi/qmJku4zfQ/hw5WT+3f9k/0a1WTdgSZdNbmjpSoA8Sl+dByDQ6Ud
	ygI9chGPVY9axyP2DD9lsiKChZmJj7k+3uk1xI6RHXUZ1kZjlYZo7qJlwhsU6wMD
	kRCtYxmQnfzhdtbZ/rSnc5kCep7/JWzGs/S7Qp05E+1B9qHEbmiX/G9IIgLt1rQ0
	uF1AidJTIL3Ikl01oDUhT/wgunYw96hZfRoxJdD/rg97/1ex4zVPczei0VRphbUG
	f3u7gvbgLkNejfHg/BQLyJNUjIT2u3e0+vR2247kr7z5IvNGiUmnudfL55xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725430666; x=1725517066; bh=2frmxt4GEUGpO4MxS11bhFRThh3O
	buT29vnXyIgorwg=; b=NoMVzaF+eYQqpMmVs3mX2HLl7E2JgD/rPJi0zdYddEpX
	/031o6KcFJ6Rll2D5K9c0BGhtKfGv/SLHo0RpsDYGbLzML5/I7i4LA2jgJNMncuD
	ibON4GXfycIHYNZX1qxaIJtbRioDeeNtRIhxtLJR+2WNK8G41ciQb3tMj0hSWdZ7
	WKyBA4C/XkzVUGriUgdpr21t9SsreGD2uVHw64PgE8peZT218O1zcTxEoEebdbRg
	zmj+qLf/rX7uFsohU86VrrgIcoJkt+NUe61kQsoiDVnBVd5KpGcsc2qfQgl3DaSL
	odnaUazUeRWwut0iQ4w3vRsgmAfErNCj/guf4mPgJg==
X-ME-Sender: <xms:ivvXZtneyHEQrq5PuCtkRktzkQzQXmebIkUl7pswXgnWTvXtGPCVCA>
    <xme:ivvXZo30v9D2nn4ae02GyY4xP72N_v_dtOQWbTqr0p2rEU2feQzSwS-tMk84A_seO
    S0YqmJOqPyZ2Q>
X-ME-Received: <xmr:ivvXZjomzgaWP1jhT0BrzDzFWmAUB1XQLLs9EznsUEWxO2gwgP4Wwdal5BVGPvadhfaZc26nqOTHkBXb65BHNaeyUsSqsnzhrJtfsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehiedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepkedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtohephhgvihhkkhhirdhkrhhoghgvrhhusheslhhinhhugidrihhnthgvlhdr
    tghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:ivvXZtnOeeohhZbaB2Cg0EJraWYHPjYnOC4hcbIwrc8RdyMoVg4fng>
    <xmx:ivvXZr3MA2B7-h-R6nFzseTjdFT_2U71OM1a9vTyFCg3gPWLQ_Pk6Q>
    <xmx:ivvXZsuWsnCqOWEDlPqucvI8MJMDfkX29NDXx0UucxeRvRL5rWLExA>
    <xmx:ivvXZvUnRu-_2ZJz8Gf4M72IXw2Ie_yGhIC7YN7zGIt-OoVoYKiCog>
    <xmx:ivvXZkIRm6ABwCcD2zk7Qt-4dCS317vRx_9ZWEl9zQCnSaxuxEhuMI29>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Sep 2024 02:17:45 -0400 (EDT)
Date: Wed, 4 Sep 2024 08:16:10 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <2024090439-hexagon-imply-db4e@gregkh>
References: <20240904150522.0410150f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904150522.0410150f@canb.auug.org.au>

On Wed, Sep 04, 2024 at 03:05:22PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/usb/typec/ucsi/ucsi.c
> 
> between commit:
> 
>   87eb3cb4ec61 ("usb: typec: ucsi: Fix cable registration")
> 
> from the usb.current tree and commit:
> 
>   73910c511b1a ("usb: typec: ucsi: Only assign the identity structure if the PPM supports it")
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
> diff --cc drivers/usb/typec/ucsi/ucsi.c
> index 17155ed17fdf,f0b5867048e2..000000000000
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@@ -993,11 -929,12 +939,12 @@@ static int ucsi_register_cable(struct u
>   		break;
>   	}
>   
> - 	desc.identity = &con->cable_identity;
> + 	if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> + 		desc.identity = &con->cable_identity;
>  -	desc.active = !!(UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE &
>  -			 con->cable_prop.flags);
>  -	desc.pd_revision = UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV_AS_BCD(
>  -	    con->cable_prop.flags);
>  +	desc.active = !!(UCSI_CABLE_PROP_FLAG_ACTIVE_CABLE & cable_prop.flags);
>  +
>  +	if (con->ucsi->version >= UCSI_VERSION_2_1)
>  +		desc.pd_revision = UCSI_CABLE_PROP_FLAG_PD_MAJOR_REV_AS_BCD(cable_prop.flags);
>   
>   	cable = typec_register_cable(con->port, &desc);
>   	if (IS_ERR(cable)) {
> @@@ -1094,8 -1009,10 +1041,9 @@@ static int ucsi_register_partner(struc
>   	if (pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD)
>   		ucsi_register_device_pdos(con);
>   
> - 	desc.identity = &con->partner_identity;
> + 	if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
> + 		desc.identity = &con->partner_identity;
>   	desc.usb_pd = pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD;
>  -	desc.pd_revision = UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->cap.flags);
>   
>   	partner = typec_register_partner(con->port, &desc);
>   	if (IS_ERR(partner)) {


Heikki, does this resolution look correct?  I knew there would be a
conflict, just want to make sure we get it right.

thanks

greg k-h

