Return-Path: <linux-next+bounces-5517-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8ECA3D13B
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 07:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AC53176651
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 06:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D231E2611;
	Thu, 20 Feb 2025 06:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="p65P1oBB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RdeevMPF"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0061DED4A;
	Thu, 20 Feb 2025 06:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740032044; cv=none; b=XOq9XUq+kDH3CCXbrP5mj+lVn0V1hiKc05DoHSCHyuDKcg4VYXtdKz4tNMvX0udxiIbzI/puXnKenxiARdJZAw1HOfhwogFZJ1eeMVJlM5H3NqUOjdMUHO1+tCjNWcrBd27mkAfMO7mBVJbELowtyaF/LfmudFLMgYKAug5Zq2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740032044; c=relaxed/simple;
	bh=BqDg+bL05wKJcJ8Y4rA9SqSBxjSCXWDuIWSbFz8eJWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3oRBqq8KTOU54WCnRXJPQIpZLtv1OlwpRbp5brgjPp2B7HqpnBasseuYcy+tsbA/0idZ6T9wCwYfch8RXnwEVtygbq679njm7ZpBkVcAwTGjbZ41UXN6auQ2IuFx9OmlUjW89Fw3DWf1t9TdZeNQNScLjJPapGzgeKwkJmk7wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=p65P1oBB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RdeevMPF; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 5FCDD138010A;
	Thu, 20 Feb 2025 01:14:00 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 20 Feb 2025 01:14:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1740032040; x=1740118440; bh=Ygl55ijcCg
	e3LSmy3+n+yw2r2UrUsnGwAw0IMUagstM=; b=p65P1oBByq4RWgNF6QTGrgCKj9
	9Aq6i7h529rCXYl6B4DalV+L90I94tIX3OEiY0fvl/K9MdYAFOgb0GTUuSJ38YK2
	rxWjdY5du5f3Yo3voXxzxaYpOVpLddb+3JztliFeFFHCoVyLpcbt3dPiaAUQ4v+T
	554K3ChBMvOBwpyu8SBEduLQYoUCo9Se1ikOn75oL6npaZa/wwLlyK2bTEP4zmyq
	BWIBKfytw79hzwvbqFJMbjuRZaxR9il6hP5aiJ+ny2F78duqE0mym3lJ3jbCYA3G
	XjbK0be1YsxmUkkS/hi1uVy4zzySbWxu8rG//dkLz01rFaslMCS0Pn7tIh1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1740032040; x=1740118440; bh=Ygl55ijcCge3LSmy3+n+yw2r2UrUsnGwAw0
	IMUagstM=; b=RdeevMPFhCy7qQ9pj4qE7Ni6P9CTGArOG9rhOiPPd9Q0QB/Jq+0
	TFeJPh5gqB5Qw4DvD6Tc7SKUKccpLOIchH9N6vr9K+RWGjvr8K1qdUtg4T08yrd6
	Eb431Y9SziU2p9eqTr1e+2PIMIHmVo581bJJO22eRK9+s3g+FhE9wzdFLYeh+1l9
	9pJ8TjRntruUYG9+y1JZSrlm0pyMIsHIHDqbuyweSSm0Ab30l/V0+QzgzLFjoc5l
	pS0FDXXSa4YQ/n5b7LYShNHQxoPikKEBEk1VSaOwYv4AoSTcMfsUJ6SengD01rTY
	1i5VCgLe10Ujc1empZvf31cVNaSI/5GtIcw==
X-ME-Sender: <xms:J8i2Z4Mlfs3254gZAN8yI8mFZlP_g38sSQH8gdh7zaRDrAFBmR-AaA>
    <xme:J8i2Z-_GI0tsKr09KFOOK3-MK76Tf6EECT3tXwuKfB0inUhb6EUC3OPVrfJCPxWra
    EMPXgThLAoANg>
X-ME-Received: <xmr:J8i2Z_TFqsDDoi9Q3lKdeKNYQLRm0y0b2NIVu0iWAL8gkUIl088PNd3oV18l1Nmj4UFF0jCCRSd7-r1XwSAH099Fia2WDU85EmZvMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiieegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepuddvpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruh
    dprhgtphhtthhopehlkhestgdqqdgvrdguvgdprhgtphhtthhopegumhhithhrhidrsggr
    rhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepsghouggurghhkeejle
    egsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:J8i2ZwvtYtBtQNswuKlf_WgjmXqO-G_9QNjwpcCR6SKPGZj2QxuUVg>
    <xmx:J8i2ZweUfufiFle-YWvjaQOwXX31SlmdiHgGfww7cnDiBW3LmdQJVw>
    <xmx:J8i2Z03tPVOHRdf_HX_Z_EW4Tf7cb_jp78GbvbbecyNumazcB8eWMQ>
    <xmx:J8i2Z0_JKhDzY8xvYfs0FE68MIF7_mIjhhVujddhTFKALjrcuSK4FQ>
    <xmx:KMi2Z2275-6Ns4fJR-9wDwPMFV2TdqFg9Co101u0Hxb1qEVNk5O6B1Jy>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Feb 2025 01:13:59 -0500 (EST)
Date: Thu, 20 Feb 2025 07:13:55 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Fedor Pchelkin <boddah8794@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <2025022051-barman-peculiar-24cc@gregkh>
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



Looks good, thanks!

greg k-h

