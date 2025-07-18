Return-Path: <linux-next+bounces-7620-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D811CB09D03
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 09:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A59F03BC28A
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 07:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A9828C866;
	Fri, 18 Jul 2025 07:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="F1SnHRHE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H7tKO8rQ"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A3A1BC3F;
	Fri, 18 Jul 2025 07:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825269; cv=none; b=SfqjJxws48TffKDmzmtNFR+fEbZKTSil52IXq4bvGiZSRmmyEa47WQXejq24llv0KuhAifxh8PRDCN+BwLX7xlH65jFSucidKG6VyEwWP2IKaJIVN7/hMzsBMaHFiGAb2HvhAyvgnbto7fKJJQ0tPayd9pqkRGqVjQTvqTRv+Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825269; c=relaxed/simple;
	bh=R76AnECYBN3LT7fFGfG6uSPemkYPK01kMpjvqcBEAjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+fuJjF0+QxO+wstOLUuJbEoLqDpXIIukxJj5O6xtX2PRSsBgHLXUPPftZEE/hRYhn9g/1Fete1hADiLiqkcuGQWTcrWa8Zvb3xZrNmZamAq3BSuEtsQimgEbgdqfPaCVpxhf4ljbXNWBKU/zX5EvLKJXbawLKmzIniL8ENNLZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=F1SnHRHE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H7tKO8rQ; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 71E231D00029;
	Fri, 18 Jul 2025 03:54:25 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 18 Jul 2025 03:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1752825265; x=1752911665; bh=TVh2yPvq3Z
	2x/UaOw0w05hq0BcOjGdoZBV3rde75ngI=; b=F1SnHRHE87XXF3e0X/48tJmci6
	yG8nYRWok1AGF6k6ceNuHvKuqMcJc3HeTu+RYUAsD7hIK7F9M93eXbVYdNaCRPRP
	s/oZCy8VCmI4pAfY3UIJfqPluhkyGTxRXdc2BhEjNvL+gtwaEjACoFbXRpFGwj8Z
	1GANum+Eafq6BQcehLB4sE487gHEzevbzVyxBqN7B90kj+/AfxrSay9V4pe0jl4b
	uUcJhICFWpRSm3SZYeRjmimBVAkB4EE7TDSyVWQBhSgEjBcrklFhkoVsOrMHjEl2
	bzZaBkU6+Te4LgZXZ6Jo4IyCBTGiKC8rMgEWh236+wd51hAuXBR+gdECXXcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1752825265; x=1752911665; bh=TVh2yPvq3Z2x/UaOw0w05hq0BcOjGdoZBV3
	rde75ngI=; b=H7tKO8rQqGvK+aBXG20Yb3il75vPT9EiqhLb/S19wJ7NcFKPVnX
	D6J4YdrNQqz+NSFGk5wyB/rn+ZxLw57CpobVqZTUW60sxXyYh+NS4tTRKmEjlUPk
	Td1Pdq8O0n2JxYVWN8sMUmrDv+RZjieBt6Yd73yuYV7hXxV/+s7NHNp+8iaCTomH
	RTp8Pjem/W+23YHBIeOooJvmsvMUSyPFzM93M+gbl7grT8KNsoMEmjgDF2DSQetc
	CoTz/WXAHY5BbPu0oKRm87Fb3g19ae6xbldDT/gSPtfXppSpJbtbzoKOr+hmmqsB
	amVXpS/s1fIUaNEZJt10Kg/C0pNSfGTFz1A==
X-ME-Sender: <xms:sP15aKBXTsxy_3dNMjVlLVXbpCBk06GyMJrRUj14GSfmwHL_MITzWA>
    <xme:sP15aMYZQAJGqTbs5RO1xJgpTMlW_Uywizjr5O3QJWgXKfK0OZ_E5PwonQunBwb8X
    -JJbMK8Hky4ag>
X-ME-Received: <xmr:sP15aM88rra4X90fQCJiufs-N-Lxk1SxfhA4y32GEc3EXRvtXL5vO4MysTXI6cSmIOKUyCCNtlO8LkxWU-2pIDQBqoqfAZ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeivdeludcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopegrrhhnugesrg
    hrnhgusgdruggvpdhrtghpthhtohepmhgufheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohephihilhhunhdrgihusehinhhtvghlrdgtohhmpdhrtghpthhtohephhgrohdrfihuse
    hinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:sP15aAhm9_eqzRMvKwQu1V1FOIEmleS5eJ8FSWBV2IvPz7kBPp2VEg>
    <xmx:sP15aHjf57iqh-KDVg_lRjpGSm9gwUkAsIchFHEVfSEPeUPxBRkDQQ>
    <xmx:sP15aO4RHJbR5XYcTrvVawOYZA0sZURkwdgVx3YRAu9Ilxaey1evpg>
    <xmx:sP15aBTC3d7gxEi6aqJEaw5ranN2y7TvyBuyH3Nw9SFX83NHbh34GQ>
    <xmx:sf15aOW6dlI_lGcAkMgMpC4m7ZHDv6Tys1r5zXcB3fia9Z-TMZpcOeuc>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Jul 2025 03:54:24 -0400 (EDT)
Date: Fri, 18 Jul 2025 09:54:22 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>, Wu Hao <hao.wu@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the char-misc tree
Message-ID: <2025071805-visibly-henna-b5a4@gregkh>
References: <20250718174129.24c0e968@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718174129.24c0e968@canb.auug.org.au>

On Fri, Jul 18, 2025 at 05:41:29PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the fpga-fixes tree as a different commit
> (but the same patch):
> 
>   29f4103b2585 ("MAINTAINERS: Update FPGA MANAGER maintainer")
> 
> This is commit
> 
>   1c6a132cb309 ("MAINTAINERS: Update FPGA MANAGER maintainer")
> 
> in he fpga-fixes tree.

Yeah, I already applied this before the fpga tree did, we talked about
it :)

thanks

greg k-h

