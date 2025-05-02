Return-Path: <linux-next+bounces-6499-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E12C2AA6AB2
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 08:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58C9F17D5F4
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 06:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567221E5B93;
	Fri,  2 May 2025 06:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="FXdPTY1L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ujPcTrex"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267E41B4231;
	Fri,  2 May 2025 06:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746166838; cv=none; b=EGY2JdjUNJxdKU0cEAYTvGQVRPUTbNr3UwHX9TdPGwnZgQ0H5MGs2gJFmjeJ/ugOGV0ZOfqmBRy63Ej+5JVMsNmFcWSzncjAeN5naLjZkjGIr2EMgNLwFwt/XLl0nrKvjDFwUV/hyVNB1iOZRbD4PEcaT2SX5uhOpKsqYsBcLO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746166838; c=relaxed/simple;
	bh=WvuPt5RdAVARTfYOxm0Wmhk/DhsvsRamVJN5qy5+S9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPyYAlgPLEKN7tE64os4/bHTtyvOHW1p/2Isb62NlWhNH9hbtD7KzvoBP0xQAqUcfBKeDsa3NdWunS6X2ks2ihfYJRBM0fFp8NserAuPnohPtCFWR2uaQrIOfwykSA0gSETOXmsq4QMm/rr7fNdriU+PFVtKyaiMyYYQsLSRj04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=FXdPTY1L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ujPcTrex; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id EB32013801CD;
	Fri,  2 May 2025 02:20:34 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 02 May 2025 02:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1746166834; x=1746253234; bh=EGToxZctGt
	PORdHrRC19/O8b5uQYvPDPBokXEfm3l4I=; b=FXdPTY1LnJNC0YYiru4tx3rOaB
	gB5Z6A8FuaNaHQDmFj7acOL/AkjNB42eCJXw+haeu5vj5zPFOGgG+bk7gd3di4wh
	/mVoQvyEYwHS7knJFU8058Zy9yCD2MqCMEPQXN47yMaZsVTXP4Tb4dVPMPat1GWE
	+dsoh4H0Y2TgX1ELiBoc3CjomieV8dKnCrin8oW41t0I6jquyapja76t/9TY8ywp
	D9g8Ie3IQYC11PpKetPcZWatq+FjqIjqo2yvmdc8n9Sgjfjg1af1Q0C3m6N+S9p/
	amyiVU7gylSd8Kh5Kz4Xq6dCYCiemGgvhUeFcweVDyOCTzBjscQkH5nPbg1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746166834; x=1746253234; bh=EGToxZctGtPORdHrRC19/O8b5uQYvPDPBok
	XEfm3l4I=; b=ujPcTrex5pB9ZNmn9vUoBY2uPyfhxXSFWG4D6Nkm7kt7LqHpQLz
	U1YjzdGrtLqgC5VjJ/bv4J0SqVd/2vlDWRmV3qKA9ceKgHIZd2xeyI0NluFsp5S8
	yfrlMXCgfdNP6uuv5XKxyQypRrHLehKApy3YMamCv51nI+Du0RIhtOdAWvIZZr18
	XB4UOfuuCOvtQ7zgEXj7o2NdeRoeIVkVXrazgUR4nV4z6pukLQcXdF9EgK4S/k9Q
	cJlOiTT9B9GLEfQbzgu3XNQsIYdZvYzPGXX6oAdAdvn4uh/tjniOcSZZz03Rsarq
	Ge3gSJi77Lc8Wyvmv37KG5Nxk+8QwbUPtzw==
X-ME-Sender: <xms:MmQUaO_vtCo5kC7AtOCWSZ3jGMgK28GPRXn7gdg_4UTVKZDMpLmC6w>
    <xme:MmQUaOv-5HiRdwjgZO97-iNM9TXAiR9XoufLsivjIWTaZ73IrYMDoUMFoNgEUhQYK
    NB0Nqdj46ZWfg>
X-ME-Received: <xmr:MmQUaEAEjPjxlL6QJ0MtsQBC19u5vhya4g8oqzuX9P_2Sqw2jOVHyR6qErC2kqAD2kRKr6M6ehlBaAT5ifApHLmeKdfh1EQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedujeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrg
    hupdhrtghpthhtohepshhrvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhithhl
    thhlrghtlhhtlhesghhmrghilhdrtghomhdprhgtphhtthhopehsvggsrghsthhirghnrd
    hrvghitghhvghlsegtohhllhgrsghorhgrrdgtohhm
X-ME-Proxy: <xmx:MmQUaGe7Uk-U6UOPZIvbpBDOmcmcDAr26VcaoJJZ6gp7qB1ZwQv4EA>
    <xmx:MmQUaDMZ0GtcDOumI1zvi_7jB8C1rZgCDDzSUnf4eXvcvjMpyMcepA>
    <xmx:MmQUaAkpKdTJ9RZZJuaw0BswtweKhBzn7LXBrtlkvMXEprVG36E5lw>
    <xmx:MmQUaFsgTmXFOeCKh7no1Oh1asfmCt6FyVj9sIDhPgAP3G4pXSJL_w>
    <xmx:MmQUaG5w1N0XBj3B22eu0Hl-E68nxCwV_lIrBBH40EtoqH-YRaty-Oz7>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 May 2025 02:20:34 -0400 (EDT)
Date: Fri, 2 May 2025 08:20:28 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sebastian Reichel <sre@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: linux-next: manual merge of the usb tree with the battery tree
Message-ID: <2025050219-whoopee-duplicity-f859@gregkh>
References: <20250501161515.21916747@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501161515.21916747@canb.auug.org.au>

On Thu, May 01, 2025 at 04:15:15PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   cfe769670e82 ("power: supply: add Huawei Matebook E Go psy driver")
> 
> from the battery tree and commit:
> 
>   00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
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
> diff --cc MAINTAINERS
> index f7a8c23d211c,91279eaec446..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -10998,7 -10967,7 +10998,8 @@@ M:	Pengyu Luo <mitltlatltl@gmail.com
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
>   F:	drivers/platform/arm64/huawei-gaokun-ec.c
>  +F:	drivers/power/supply/huawei-gaokun-battery.c
> + F:	drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
>   F:	include/linux/platform_data/huawei-gaokun-ec.h
>   
>   HUGETLB SUBSYSTEM

Looks good to me, thanks!

greg k-h

