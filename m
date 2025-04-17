Return-Path: <linux-next+bounces-6283-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E45A912B5
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 07:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55F32190677C
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 05:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90917195FE8;
	Thu, 17 Apr 2025 05:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="QucMYgwf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CAnFn2N0"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA9B2DFA2F;
	Thu, 17 Apr 2025 05:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744868136; cv=none; b=UpAFlDFNeoA7POxuFE+WoBVN2mvzuwbyndFBW5IQW+y4GpEKGDUnlbP4rhs+57xNwc0BnBbx2GD6OfnE4mcmD4m7WNzfDPFWvK6VlKtoC1tFVWFqfWnYzHxzj74wtWVq1C9/xpbTrgJX2vB/rLtBC0t5J8VHGOOsUMAJQeLZ+ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744868136; c=relaxed/simple;
	bh=Slvx1D6twob46gSrZLqBdVv7oyktOZCDbUx61Hxl6Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLjlQEjsIS1k6GrYzIHoJwXNlYIR5GSqOqL1IUU5T3AdETgMYmX4/ldV5BjwD1gq/XVUDwvmDxpxg/Fd4pF/Fxma0whuMcPVrWHJ7Xb8tR5jI1jj0WqqnG1k4cs95nJ+UPQ5E1bmUNBhG8iyctZ0yAOux32Ms3vYaPKWeHBVrZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=QucMYgwf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CAnFn2N0; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 64EA11140295;
	Thu, 17 Apr 2025 01:35:32 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 17 Apr 2025 01:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744868132; x=1744954532; bh=C646+KxKq2
	N5WzwP+wIgUiP5cHyRP6fbp7IlKQwHZFc=; b=QucMYgwf3pY1sSSCnjYILzHnnt
	qePWQYLwJfie+AjYhohu6ZP9iCjCQ4XnRJmrA7be5d/VB+9eykScL00D5iog1ffu
	SW78cCUJx3ArrYHx8vtQ1rX/R2/6OhgkS+DGZXW4pRA5szAgtderV0xqoNjk1NTC
	tOuiamgnfrrV0+zhnynZcnclFV7PyNvwJj9zWi7kjDZPpacK/RlG32LJ4m+JpGtH
	bCrdGUMnjxdE+GS1WGkXOw3ug8NmDaklbxeFOIDrA8tzM/GxB5Fg5UK8fZ7ed1DU
	wByMKHwrpxoyFW1xgbq+iEFNn6V+vhPVS8aTxWxLLMnIxcNGKTbm6dssruQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744868132; x=1744954532; bh=C646+KxKq2N5WzwP+wIgUiP5cHyRP6fbp7I
	lKQwHZFc=; b=CAnFn2N0oWSeY5NaTQaUlm5W7RKbUILrpY9OBEc3OQEZnnftgu5
	HyFNtQDbL9Ezs+UtAWN971AyUgyFaEoTMqDOGBF8sp1FxdqJWa8Jxspu3WiI9rUH
	Z/MDW6QZ2LY65S29mB/NvyC4edbaTxNNiOBJSU6X9b7j2GJVL9qnNzkc6s+AAQs9
	FAFVssKk6cCCaTr1NMCVRKuDgRi6ox2WoTVXW3G4FjVoRhRj0L7sRbSuKFndH/bi
	vpx+VSrn7G86URTUmFiAQ8rBhKFgIM/EPq2qy3Gishk95S6c7/GZP81MEbYTn4zj
	JyLeYHpTu27mYcSnIwremb5+hCOTn0lFjHQ==
X-ME-Sender: <xms:I5MAaD3k_2bZXeDhJkI5FlvC3FsSG92RZTYpK-P75cF41z6sTrxheA>
    <xme:I5MAaCEYNVj-F9n-AMFx_hE6kuDlx1bMM93v-sJoXeblrsRL6QrcoL0EMuX2hR4H2
    wjEwscWGD0a5w>
X-ME-Received: <xmr:I5MAaD5EFRaFO1xeMyZNsw2BOL7CMSMLQC713ds3aAm4xlwZcc21AGM74RScdejZWFX5ACXx_O-dp0Ipkp4CXSOC83jbRbI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdekgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecugg
    ftrfgrthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeu
    fefhgfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrg
    hupdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggv
    rhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheplhhinhhugidqkh
    gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidq
    nhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihsrgdorhgvnh
    gvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhm
X-ME-Proxy: <xmx:I5MAaI0uaXQfzFA3lmVHO3CzgR9PeE-6o5jHyu96t0a8ZUTsn5PCKw>
    <xmx:I5MAaGFE23yzfHu9SBnYAhUdJ33bcCTnyPLwiLjmLh8XJN7gf4yiYQ>
    <xmx:I5MAaJ_fHdEw3fIBfg9TsEMBbdUpQtfe1CwY8zYTus6kEka0Y-q4NA>
    <xmx:I5MAaDmi0lv5lk2fiN3IfLxVTTyF7Ef-3ZD9m1tZvVA2STiw4UYu4w>
    <xmx:JJMAaHwem31P8l6yFRaTsnbO05vMOzAUvqyS9C0AHDYYSgpkpY4_1HYR>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Apr 2025 01:35:31 -0400 (EDT)
Date: Thu, 17 Apr 2025 07:33:55 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rob Herring <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: linux-next: manual merge of the tty tree with the devicetree tree
Message-ID: <2025041745-swifter-dove-7095@gregkh>
References: <20250417144625.4be32ba7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417144625.4be32ba7@canb.auug.org.au>

On Thu, Apr 17, 2025 at 02:46:25PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
> 
> between commit:
> 
>   672da444fccd ("dt-bindings: remove RZ/N1S bindings")
> 
> from the devicetree tree and commit:
> 
>   0ed228275485 ("dt-bindings: serial: snps-dw-apb-uart: Simplify DMA-less RZ/N1 rule")
> 
> from the tty tree.
> 
> I fixed it up (Ijust used the latter) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Looks good, thanks!

greg k-h

