Return-Path: <linux-next+bounces-3342-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6D69542D1
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2024 09:36:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F351AB2665E
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2024 07:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE1685C5E;
	Fri, 16 Aug 2024 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Umztj2RG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qTNKSldc"
X-Original-To: linux-next@vger.kernel.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B278248C;
	Fri, 16 Aug 2024 07:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723793775; cv=none; b=kk7eDm8vsT4W2dVTQZwW6AN9ODcTizv16Flks/CW5j0mOdTMzypqrlwfQGH6v3umLEHWwKUN3qR6yk/4689NNCLs2D1nvw3iX/qAcnkj7OvnAVVI9bRfzEYZ/62K6H9PIBaiZ39ZOQ62ZAMemHPwy2wYRd6VIHic67hQcLv1qhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723793775; c=relaxed/simple;
	bh=n1L6r8KrOD/h/tSsNlfxD0fvyZThkR3abO1tZsDXJYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Si4Z5RscnB3wA3GG53+zSXuUw1BHkAPxU/7SmfVNvNtOIOhjM2zDWXZ2tRyVXPCKsoTghaJLDPpsu22+e88vm1lw8fq/bhzYPt/xFZssNUcRqf/kBCROupOOdc7hXTrfnT2k0fJQm9jP/jdE9ztQ5jmzde8oQ2+YDG1TjjNKl+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Umztj2RG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qTNKSldc; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 58537138FF6A;
	Fri, 16 Aug 2024 03:23:07 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 16 Aug 2024 03:23:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1723792987; x=1723879387; bh=otW7NOXTBR
	CiGM3bO6PN502kUbF4o9ycxmrdasNJxp4=; b=Umztj2RGdZePX0AqsMqOBUseQ5
	rJ7sSDxi6EpoSaIYezB7qqduuyjlVHXygt2Pt6eVTagfeW+W15+CtZsWsV+Q1JPE
	5kmCk+c2U2XwS/qKczrbClXtbYHNucHJ8esDnTX6MWLeo9KXwpAMimbPJQTo7lP9
	gK1rO+SMX1fxlgTn2py9IHokwixjWVtIRVJUAtz2okDbQN5w8n3QMFar3KskkFOt
	oUi0SiM3wID9jvvnkFzbUHqEVh8QIRWs14HJWX1n5cFNyk5XiSWKCs4fIRt8zQo7
	WcV/V5Opg4ufjcxDV9jw/DwxrnfAyinFVGIyA59r3wQpoEN7NHU/uAdTEdgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723792987; x=1723879387; bh=otW7NOXTBRCiGM3bO6PN502kUbF4
	o9ycxmrdasNJxp4=; b=qTNKSldcY+ZQGZRhNy+V/PL012WSy/WF/NpN10S7K0vJ
	rq7dlMXIpdvENYXrC4hORxueQmZrZtO5akxFJ/i9WQIFv6xRpt8SL/xt8Ii08D3E
	BrZAtX9AjtSU21q6UO9YPY7Zn+6ghf2ckkWs/IheOJX6G00DZgVePAGarMrNUAzr
	LN7DQCTBnF1e0K5WMhmEO0xKYHGl7uZBF4A1BIeUgcBH295E+cG8zlcxh/juDP6O
	OUSya8j1TkDUF/sTW9Z8iukIzu0bPrBf0zTx7NrnSue6ut4W2FaPVnIYaLvGHqIT
	MG8qhudG66kKIpS2xct34P3l5UHEc7ZzrcuGeJAEzw==
X-ME-Sender: <xms:W_6-ZhGudhXnMYwREFOxMAxDiNb0VAmfAVA95kge8s7i8fU1rFQCbA>
    <xme:W_6-ZmV_jUGpZo0biVQ91YgNSCrdhraodZB4QFNR_OcZfq6qb-b9oG9g7xHRoPGLi
    cPcZAfoL4ur4Q>
X-ME-Received: <xmr:W_6-ZjJUMAisFAYmb-vRpKrwu2ep9UccTqkyjvTeVhQRAXMl_rG_pEW6Tw-KIZSIh3yhaINxQXD9wbROpaW3gSRnMcpaxoh_UUNrLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddtjedguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueef
    hffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehgrhgvgheskhhrohgrhhdrtghomhdpnhgspghrtghpthhtohepkedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtoheprghgrhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:W_6-ZnExNCd18HrT3LPQf0a0Ybyc4yjogZJHLZXnj68GSEl5gj472Q>
    <xmx:W_6-ZnVXFGTUGudglhRjHPYPJHccnAlQ0ybjNQXvhfMwzPodUXL4WQ>
    <xmx:W_6-ZiP3_nkiBAlbNZ9GlcgRILR-eA8o3uUl2aRKHX4-qJArpx-hqQ>
    <xmx:W_6-Zm09eqRnDhcUg4hYl4x_AZacR8RUsEUmeHYQ46xnBvHsirdkPQ>
    <xmx:W_6-ZjqtRJN8ft2QckoLnSdnQsAypaELmKIZi8M31TRmcEBdoawMe5D6>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Aug 2024 03:23:06 -0400 (EDT)
Date: Fri, 16 Aug 2024 09:23:04 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andy Gross <agross@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the usb tree
Message-ID: <2024081658-broaden-roulette-21bc@gregkh>
References: <20240816123709.3fbfef5d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816123709.3fbfef5d@canb.auug.org.au>

On Fri, Aug 16, 2024 at 12:37:09PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the qcom tree as a different commit
> (but the same patch):
> 
>   3c2360f1a50e ("dt-bindings: usb: qcom,dwc3: Update ipq5332 clock details")
> 
> This is commit
> 
>   34b8dbef668a ("dt-bindings: usb: qcom,dwc3: Update ipq5332 clock details")
> 
> in the qcom tree.

Should be fine, thanks!

greg k-h

