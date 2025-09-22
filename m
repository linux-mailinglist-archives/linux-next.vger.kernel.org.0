Return-Path: <linux-next+bounces-8431-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB63DB910A6
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 14:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFB2518A3941
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 12:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6062305E14;
	Mon, 22 Sep 2025 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="tnol69L0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H2vPBHbG"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E253208;
	Mon, 22 Sep 2025 12:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758542675; cv=none; b=txoKJ43ti3+G/Np9Jif5JvoTqa3kqMos9xbtHYa2MDXVx97r/BISy9KLywV+Qhd51wtLwqQd6QBRkcnJf1NbGO1wgfr8QBC4Q8iRhZhgMXtmgVgjUmBoJ7eYhG0t5s9+wQBhWyMhYM394/6/Hrn5XYkXTfQSDAyluHLOPpu/DUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758542675; c=relaxed/simple;
	bh=nGmfTn1SKDTj9/EFUk1FF/qSYPKEW6dElXWnOAMnoMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1euHFAeoPDzwo74xuxie8zY5BX+GKjcsiXrRYu6i3YI5nvFobOLuP+VLEtKg6Vp90Tsuo3AkK4ixk0a3uCcS8mSDvf9kSZxsZCLje9XxLXNPtf+J2vbs3IqsbCS/3/oRXxQSIBG6ba3ej5shUg5C38ePVdYdYG75CtwOFIAuws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=tnol69L0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H2vPBHbG; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1D22614000D2;
	Mon, 22 Sep 2025 08:04:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 22 Sep 2025 08:04:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1758542673; x=1758629073; bh=qiGGa07iRa
	3XyrB+IuyQNXJ7Vy2Z2XUIng9M1fm9FlQ=; b=tnol69L0+bIrbvR6bMP0aH3pIH
	sURe5K+fRgrHpTfCUnTI2ide5KUy7Q+KJE7fmbDwP+S1rmO9fcZ7UAT2Ae0s0dx2
	T3Tbd3Oap5kEQ3Ol4ab5PiodrINw1eSep8De9u49bbaN4wnsaqtePwus2VD6mw/m
	ovbgXDIOFMkZMq43du0pSeVdNIWvjL3wJMSMtISgcB/A4Rvld5pszCASXCdV17Q8
	qZn9jCHQapqlj3798M1fvHPPbgSfxgGgQtP4qsvIUhzV09TsIWqWVsxdxAnkcBoJ
	zqlFtsd4hqBo92hrv7S3x8fwRwj8fveqJGFK9J2aVU7js3UnwtDeza/L/hLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758542673; x=1758629073; bh=qiGGa07iRa3XyrB+IuyQNXJ7Vy2Z2XUIng9
	M1fm9FlQ=; b=H2vPBHbGngiURVEKwEgVEK0Cq/IO7jUfGckXo9FEc7BPWKv4fm7
	IgnauU2JQ1U6GF9iwCOM9a2A/U+f6OcAYf82V2+DvfZnkJ29hxtShYDzs75T/l4l
	ufCi+GbGwk17YXx4SVnmunycdG0lAHHCIh9IlMveTsZnjffLuDgrGKcDQO9QfsgE
	smRZT8YyqkfYr66ZAnReQekAp2WEkHYiayaMmi0dY+Dc9c6YW0P9JTuxbfRQ1wKy
	iwZVWwcs8M8aW8ak7JJvDa1Me6OgT2EMW8nbp7JWzmDq+eDGZYMrFVxQJOySN2qX
	Yx6DNJ2uXyCgQyskND2BSq5T1EFb2TrtEBg==
X-ME-Sender: <xms:UDvRaL5gQE9jg5TdBemiYsRXGLIkBLwGOHmBZVt83QT8zFRmPEteRg>
    <xme:UDvRaMeLjU5IXAkFtVqgtrYb5NvK3BNDcnuIJiJvVkwHQ_rvz-GzpoNMioijPZm-Q
    0hcbTa5P9dkfg>
X-ME-Received: <xmr:UDvRaCfqR9m5kfv6xvREa4ry8G71iGEZwLvzYezZTTAm3Rnbmoas5nQeSA73>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehjeektdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnh
    gusgdruggvpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepsggvrghtrgdrmhhitghhrghlshhkrgesrghrmhdrtghomhdprhgtphhtth
    hopegtrghrshhtvghnrdhhrghithiilhgvrhesfhhoshhsrdgrrhhmrdgtohhmpdhrtghp
    thhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgrrdgtohhmpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepmhgrthhtghhilhgsrhhiuggvsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:UDvRaBGwQtAkRJHp4tAnCktjiKsRraaR_mR8ocBPK0Dsi_yycNWgBQ>
    <xmx:UDvRaBFObPy-cf7TW3DFTiyKj_fKQ_WOSCeG2vkwo0lSQIalztkXhw>
    <xmx:UDvRaCBTj4r_MSdVTTdA8I1swUMhQnkOIzxa9v9UwaaYLkdKwf6zXA>
    <xmx:UDvRaN19fcFic8Y3RSFhAd2sFv-YGannypi4lq_hbaFeFJ6rvW2UWQ>
    <xmx:UTvRaOuGQLqnsbIw9Ml-LSYf5WlddniDI_YUdDogXm-E7pC8SpP6mPf6>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Sep 2025 08:04:31 -0400 (EDT)
Date: Mon, 22 Sep 2025 14:04:28 +0200
From: Greg KH <greg@kroah.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alice Ryhl <aliceryhl@google.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Carsten Haitzler <carsten.haitzler@foss.arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Gilbride <mattgilbride@google.com>,
	Rob Herring <robh@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the drm tree
Message-ID: <2025092219-prude-irrigate-9821@gregkh>
References: <aNEcp1CglKxMEe92@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNEcp1CglKxMEe92@finisterre.sirena.org.uk>

On Mon, Sep 22, 2025 at 10:53:43AM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   rust/uapi/uapi_helper.h
> 
> between commit:
> 
>   cf4fd52e32360 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")
> 
> from the drm tree and commit:
> 
>   eafedbc7c050c ("rust_binder: add Rust Binder driver")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc rust/uapi/uapi_helper.h
> index d4a239cf2a64f,de3562b08d0c3..0000000000000
> --- a/rust/uapi/uapi_helper.h
> +++ b/rust/uapi/uapi_helper.h
> @@@ -9,7 -9,7 +9,8 @@@
>   #include <uapi/asm-generic/ioctl.h>
>   #include <uapi/drm/drm.h>
>   #include <uapi/drm/nova_drm.h>
>  +#include <uapi/drm/panthor_drm.h>
> + #include <uapi/linux/android/binder.h>
>   #include <uapi/linux/mdio.h>
>   #include <uapi/linux/mii.h>
>   #include <uapi/linux/ethtool.h>

Looks correct to me, thanks.

greg k-h

