Return-Path: <linux-next+bounces-9203-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 40322C83A7A
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 08:13:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 630FA4E8F87
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 07:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1E72D4816;
	Tue, 25 Nov 2025 07:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="nQE9ek+t";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uDiMtnDs"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDB22D94BE;
	Tue, 25 Nov 2025 07:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764054658; cv=none; b=A8p+uMzIfPlJecdl4XmkRaTPhS4PmYbL6P06bSOJ/gPLsZ1tu0XmsnpOFKMEr93owPBuxdfQC1Z/gO+ZtgCqEXbVCbDybrTfGnOML3loppRhCd/8mBqvFRkrUZkh/YX6LwUWExK4aA91qU387HGX3MVwfFimUPQrIKKZnQ0No3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764054658; c=relaxed/simple;
	bh=5KU+CCvWNBqTTvPCl2wWTZ07laFTOukF6MZANSviPeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyZYZtAP6KRkrXCUPmaXoJpn+Zh1vPCsYsVQeBLT5UyS9JXGsX9Ko7OYkmrRKdwP+9hBlqAma0juigaCfZx1fOmTHMHf2DTg84nYYJ8V3X9S7cCnBKJwINhjXVGVqM0D71kWkpe0UK7YSX9flrhJJ5HuC32XCwgLb1WsIkuVCRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=nQE9ek+t; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uDiMtnDs; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 0C3B6EC0219;
	Tue, 25 Nov 2025 02:10:55 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 25 Nov 2025 02:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1764054655; x=1764141055; bh=/7nHdSSvCN
	URh2WpYo0p4TmaLj4LfgEDgdryDaUmxFs=; b=nQE9ek+t0/02/Fe34SA8ZaeSDY
	gxdIXhfuGYYU7dGdeF/bjolaSmg85KqkdCSc5+LyCw4EX8I5MCkOrt1IWeDhF4N6
	dvbIhnLQhGu8kS8yCU1IpgOUKUfLJaa6alvmdYuDw/Q7A/+dFL8ahJj1BB2P5Mb1
	chIg8VS0KQqB9MEVL+XURj26Ih6hNPn0t/HsE2hOkv3JhYOEI2CVt+xURKg5DzTx
	xCSOOAJVquWZteBqhRlD8XDC5mradIKM5tJ9/14SvKKtJnwTTfvZHjM5szzjhf59
	WIsoPLyvicDcUVhcdTxTB7uZoSMZaHO2v+80x3N8BQv9/C0FLr0X5P3GWC9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1764054655; x=1764141055; bh=/7nHdSSvCNURh2WpYo0p4TmaLj4LfgEDgdr
	yDaUmxFs=; b=uDiMtnDsgBE65HH0NhKYoqYrNCcdJKcfWlcaYY+YXTezB0+yn+L
	6jGVhrY+//Y0TCGnQQNuxXiu3G09mWdhtB8fi9aC0hsqrSgoNZDYsH2JmmWgTc+l
	jrRcs2XdYdoAXIvQ5lU+eavTapJLPV8ASRI5OVBK6I7MPb+eEbJm8+4zL8pIeJxY
	tJqYmHepLTv1C+GUdooT4QkcIdIKvUxtEoaUfaLXwV5Qi7gC8C+C0z7pMC6Bid9V
	sjTjTx/jLV+HiDYxDK0ASC9YJ1znH2XLUBJ7QoHZWGiSMn/qxUMSmMPdUqYRUz1x
	5h4rwTPDtw34nAx4Z2+nuY3ypxmKtuJ3Rog==
X-ME-Sender: <xms:flYlad6jOdaf89u5zlOB8cYQgfGWein1qgSBpIwC256cLa9n4okx4g>
    <xme:flYlacd2GseSv4V-B_WGCJhUg24hAOUMfhwsKCAnoHx3oQy2l53KZBmjskW-85JVB
    WQZgz4jonw1DKvUac8k4wfZi1EG9mvNxnRIUCDgfkx6UoxtJQ>
X-ME-Received: <xmr:flYlaTvz-eRNRlncd-OmOe-qygbNM2fH2stvUlMAA97Gg-87jTFOkplri663er5-M9QB-nNtrEE86YoWtNRLV6n9txgfRA4hGE0iYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgedtkeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepshhrihhnih
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:flYlacljVp7-V0pUxtCBR6MYjjkZruJey3t-jkN8cE4XwRSANbubhQ>
    <xmx:flYlaWQgVB0gR1NDvdD3uKCY07Zjus6V6opFXeMmLPmIMiBMwwuMiA>
    <xmx:flYlaSIhhvjTAkp02rRT-Kvg8YPtWaEfEud3I4HL6V5WTA1kNCwLvQ>
    <xmx:flYlaQHJKNeNNwkndkRqTG8QoPmqafc_7OH_Wq0ah71SvWxDlk1RQQ>
    <xmx:f1YlabxWSlqqwfqQcWj9hyaqUteHjl-vMx4rtwv3FCTbWmOpJfCEOqeI>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Nov 2025 02:10:54 -0500 (EST)
Date: Tue, 25 Nov 2025 08:10:51 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the nvmem tree
Message-ID: <2025112535-lavish-apple-9cbe@gregkh>
References: <20251125171705.7912ab65@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125171705.7912ab65@canb.auug.org.au>

On Tue, Nov 25, 2025 at 05:17:05PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the char-misc.current tree as a different
> commit (but the same patch):
> 
>   8b6322da3c1f ("nvmem: layouts: fix nvmem_layout_bus_uevent")
> 
> This is commit
> 
>   03bc4831ef06 ("nvmem: layouts: fix nvmem_layout_bus_uevent")
> 
> in the char-misc.current tree.

This should be fine, as I was asked to take it in the char-misc tree.

thanks,

greg k-h

