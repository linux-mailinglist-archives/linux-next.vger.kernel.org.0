Return-Path: <linux-next+bounces-7426-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5DDAFE257
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 10:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3B407B9C83
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 08:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276CA23AE93;
	Wed,  9 Jul 2025 08:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="K3uPXDRV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="P55Cnqb6"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A7223B61B;
	Wed,  9 Jul 2025 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752049099; cv=none; b=ozV3HkXv5y6RfGYIHZGCtfUF8R08VlMoHz2QC76lBjj9hFs1y4OTZiml1ui7XtO9SFrgBVPaOaUti2wVbQzpmkZOzRnPI+nWXNKr/nRnVt5MaBImLb4VazAnNV1/D9pIaI3u3neLTJhvv3185aDnXIAYofM8xU+6PSzVbmMjyUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752049099; c=relaxed/simple;
	bh=qdmnmV4uNW0XHO9h6+yYMKBXbFkFRSmQBe0AP4s7ZHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLiX885N4PFGrTomAPmaY3dEByhy6wDvmDeziRcDXklQGHVzJ7fScQFJpWN9CwOyflUz41NrGk7Q6h9SWNfDecH+G0i4F6dG9DwJ96I0dlXw0PCM7zL7y1DFds9tdXIBEWct31e61nwcmkzQbE5CcuKZjbStV/l4bHsrwfEeknM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=K3uPXDRV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P55Cnqb6; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0FC3E14002D1;
	Wed,  9 Jul 2025 04:18:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 09 Jul 2025 04:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1752049096; x=1752135496; bh=ZOIP/PK4Of
	02wFHsSrYd0YQrkxDF3i1HbgPLPbMZXqc=; b=K3uPXDRVC0ytw6bGgAdXvWDxdm
	kO1UFHJdmkJDEHm2PWV/FE8pm0rX419L166slce+eXJrTqciYJU8n0u68TagnTHP
	SCheS+TWWlJ2YR5ePhk75r4TTJjzMigjSs4zfrjRx1zQN9e2snvcQ/DKkxhGpYA/
	nrOdcKDTuGC1U10ZsLjE/vL1Dc6IhXNlDk5YrCc0931elgx+QZaxUrBt9YZSTf1a
	oNj8NsRnk7uHCR0OcZfK+0engag7Aqd4/oR75cwOE2eqVI9kOsimDvJsLz7uYE/V
	yTjb9r4LvbttGgpqLoYCeWo+DLvPADRLAqZ1ntC9PoM5zQ4/gBcq23qERwcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1752049096; x=1752135496; bh=ZOIP/PK4Of02wFHsSrYd0YQrkxDF3i1HbgP
	LPbMZXqc=; b=P55Cnqb6NJOxWTFdyjQLA8gXP9LKYSy/QC0AKjmwFHWwz5ygIPF
	s/qo0vuy3Tayct/tH11N53jcxp7wuUbs/qkZ71iSGsrIpsm0LtEsox7llZX/8ebx
	Bbq6fMHB2L0AT2ZbUomxpfw6aphkHJ8m8inmCDWuwcTLf/uLqATOpIL28MJdQizt
	20VvjQZ2ahP2m8TLQre6byI/xtqEtqEsnqgYPSFmmrbQBwia/36diUgyAw9QUSeG
	sNvlRAlSMDyhtLJqQlUTin59pQsgtGuKd9u1lN+j5IbO109NQC/WFQ0MnVptM22I
	OD4U6XHzhvAoiEGoH0uePQu59NW5QQLBQrg==
X-ME-Sender: <xms:xyVuaANbzD4eGOivR6_uHTTtFZ9oKFutjubs5bkUU6JsKMtAUh_NkA>
    <xme:xyVuaMeRKiJs7_ljGWL5t-Uc-83pesKTbYWsNKr6zjwIlVoknrY9hbVczRGh-aJAn
    SvoxmslQKLnrA>
X-ME-Received: <xmr:xyVuaPlypyJeztpl_khTmGtv0ySIW6pFfJAQSsio-IAEfhxcMQcKO26Ns0Sz>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjedtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehshhgrfihngh
    huoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrhes
    lhhinhgrrhhordhorhhgpdhrtghpthhtohepjhgrmhgvshdrtghlrghrkheslhhinhgrrh
    hordhorhhgpdhrtghpthhtoheplhgrrhhishgrrdhgrhhighhorhgvsehngihprdgtohhm
    pdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprhgrughuqdhnihgtohhlrggvrdhpihhrvggrsehoshhsrdhngihprd
    gtohhm
X-ME-Proxy: <xmx:xyVuaGxp2rlmJkVwF91q-0zyVFqVRE5Uq0s6gvEZiPT7Hqd7PIQ7JA>
    <xmx:xyVuaKOhPDjavM4UjqZ6NNCLTlB6mOwK8sAgVsOf-fJsqhlX3i_VZQ>
    <xmx:xyVuaPhN89wXHm_QtJbcksCWka33q7gwHVt_Ic9VzcFwBbA9DQTKkg>
    <xmx:xyVuaC9gKLFc4cnXA0aQets8ZaTlCe7g1jT-NmKOD31mThTA3QYwoQ>
    <xmx:yCVuaCyzhksSF136bh5I3FAWtJRaj6V8pnScMLLe3UB9mdNdLvsieBbX>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jul 2025 04:18:14 -0400 (EDT)
Date: Wed, 9 Jul 2025 10:18:11 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Larisa Grigore <Larisa.Grigore@nxp.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>
Subject: Re: linux-next: manual merge of the usb tree with the imx-mxs tree
Message-ID: <2025070903-census-heavily-929a@gregkh>
References: <20250709172138.34ffb49f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709172138.34ffb49f@canb.auug.org.au>

On Wed, Jul 09, 2025 at 05:21:38PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got conflicts in:
> 
>   arch/arm64/boot/dts/freescale/s32g2.dtsi
>   arch/arm64/boot/dts/freescale/s32g3.dtsi
> 
> between commit:
> 
>   06ee2f0e2180 ("arm64: dts: Add DSPI entries for S32G platforms")
> 
> from the imx-mxs tree and commit:
> 
>   d1b07cc0868f ("arm64: dts: s32g: Add USB device tree information for s32g2/s32g3")
> 
> from the usb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good to me, thanks!

greg k-h

