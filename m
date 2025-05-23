Return-Path: <linux-next+bounces-6917-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D797CAC2300
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 14:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CE131C00748
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 12:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45FC2E62C;
	Fri, 23 May 2025 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="LPIRd/8Q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cCsyRVd/"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11F32576;
	Fri, 23 May 2025 12:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748004624; cv=none; b=bYz7Ck+qkO/jV5Il441CeWqmr9plagI+fFmOdQjXo/VfslPKvt7VNQAfy8bG7BxSVFANwodchsccLGO/mBqxS2Vdur4/cdSiu+doC+EWx5+NAtUJoDYVFFryNV1FUjFXyQhM58qwxIrLMOnsz1NqYL8u4hHpRBbKjmo2oC88vhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748004624; c=relaxed/simple;
	bh=s68+E7ctAYoJcPBM1D4+htBme6u+WOWt5Olodz1asVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+gP72jSaciuL4QDkHkoFvgju9AIFLhvg8y8m9yCdZUyKvcA4KpsGcIt/M3QCnA8e6bH5KPE7QwckHmgGfB98TVo029v7ZqqE8hbAv3bhvs97ggV3N9xeohVbZe5jVdN3qEb2/4bRil/fGvHAjMy8BBWKzBCDqFyH/CXhHZqb8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=LPIRd/8Q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cCsyRVd/; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 87E371140178;
	Fri, 23 May 2025 08:50:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 23 May 2025 08:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1748004620; x=1748091020; bh=PwwEtOtJCz
	k3vlOMeCM+Nvpswbr381LHbWSMQWgkYPA=; b=LPIRd/8Q1IPcVO5ZeGx6qmsVCn
	6d6deZwnvkoyzEnZW6/HaT0GGbwxcqc66jUSecG3T8AMh2fdsa8fkJrOD61J+AAW
	P04UP1kQNyzK8GsURUvv/Nbab/UPDsHU9rSaFhZjOLl554nr6EzsG2F79PtA1Cgj
	5GIQ5rVZimrDLuj+C+szmlkXguBTG1oFdW2FDX7QGaMlk9JAyqcTCScxkvJ63Nc9
	W4PkUrw9qLa95YMum2DwHs7ilfK08wo0AZJHoMXwcRmdhgI5lUj0iSG5Y5okDsTO
	fOWEYac5SQFY4hN7CdTKncuIBoSq+HFB4BiySNKUXvbGJZSpiCAoqrEjuylw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1748004620; x=1748091020; bh=PwwEtOtJCzk3vlOMeCM+Nvpswbr381LHbWS
	MQWgkYPA=; b=cCsyRVd/nk9pwzNZfqqn0OD9Cj3eUUNwd9yqtKwgW1EsCuwrZLJ
	2Tu6blSKJL/r4iWAuV+yHERB65YfA8wFpiuvdu8++QX0w4D4abNVTxrB9uMmLPOF
	cnuJDETRpMhzvXsKe+gOAoLJVB4bhD56IfT7V0A9aWdjqHy3agQrHiE67xdhR6Z/
	IDaAbP4SFRChaPSgC3HJe70Z3JzB2ZVs/9oqYxClSNN4soqn5xMNzawo3VJjqKm1
	dHubj3AxWvaxO2/bhtpBBZmLd7G4YCgU4juKkujHAauuI72Ed4utuZsAsi2NdoHK
	PNuUm/n++DdyPkTOYGQGIkm6drriycuEwaA==
X-ME-Sender: <xms:C28waIVDDGXGg24pAg8nJezolkWrsSyJFI9o3_oqWOC7xo17QQxa3w>
    <xme:C28waMlZdOckPzignd6CbbJrJSNQx7Rz0uCweWl26lTqtNUt1Afl9jsQXKzNdLdn_
    jv5R5R55CphiA>
X-ME-Received: <xmr:C28waMYo4R9i_AKV1jy5tlIi5jRcKuvKPu6EEDPNvh9OFM52ymGxdusEqi6Hc4sVC7m4p6FC9DDrkTHDwq2wqaFllRsTblk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekkeelucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhgg
    tggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhroh
    grhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledt
    iefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphht
    thhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrd
    gruhhughdrohhrghdrrghupdhrtghpthhtohepjhhonhgrthhhrghnrdhsthhrohhuuges
    rghmugdrtghomhdprhgtphhtthhopehrrgguhhgvhidrshhhhigrmhdrphgrnhguvgihse
    grmhgurdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:C28waHWs62z-EH0hpd7LOE6wuJ8wVUeZ9Df7Fusnuw-D-mBGKoRAWQ>
    <xmx:C28waClQacsxU1uUlODW_VRX58-kkNYxL55PooJdhgSRI3lTMzozgw>
    <xmx:C28waMeTji5nTaXeK45kdnJoU62YqGPa_uNHffHPpXCVWQum4L9eCw>
    <xmx:C28waEFHiyus5Ib_0vQhzQXk4cblrKqcQUOPhm9jo-2NnswiPfjw_g>
    <xmx:DG8waFYzuIR48AtLn_U-YiERSA-PjGMSILrbyFs7dtKrjxVoiqrO7VDw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 May 2025 08:50:19 -0400 (EDT)
Date: Fri, 23 May 2025 14:50:17 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jonathan Stroud <jonathan.stroud@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <2025052309-moisten-antiquity-a888@gregkh>
References: <20250523150934.09d99b2b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523150934.09d99b2b@canb.auug.org.au>

On Fri, May 23, 2025 at 03:09:34PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the usb tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/usb/misc/onboard_usb_dev.c:358:12: warning: 'onboard_dev_5744_i2c_write_byte' defined but not used [-Wunused-function]
>   358 | static int onboard_dev_5744_i2c_write_byte(struct i2c_client *client, u16 addr, u8 data)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/usb/misc/onboard_usb_dev.c:313:12: warning: 'onboard_dev_5744_i2c_read_byte' defined but not used [-Wunused-function]
>   313 | static int onboard_dev_5744_i2c_read_byte(struct i2c_client *client, u16 addr, u8 *data)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   1143d41922c0 ("usb: misc: onboard_usb_dev: Fix usb5744 initialization sequence")

Should now be fixed, thanks!

greg k-h

