Return-Path: <linux-next+bounces-4258-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE0F99C419
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 10:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 296EC1C225BE
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2024 08:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC3D1531E1;
	Mon, 14 Oct 2024 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="k6bE0d/L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eik0b+53"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4288D14F126;
	Mon, 14 Oct 2024 08:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728895946; cv=none; b=g67v6MMSX+xVwU/mjdx0rRfgemelyJQ6dRrcATF4/gpN/Ou8wzSKjQ88f9wIm007Ki40znZeMiZqtdDDwJ6crfittqucDl3BxcbC8MUnzYfD/74d1Di19YZWrzb2uRkrt4gce8C07DQBgG96IAzhE6nMASukFTqpenaS4WYzpls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728895946; c=relaxed/simple;
	bh=UhYaUzHVY8nMAfdeHenLnAfjyBjBpTQSNCFScqg6X/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPdn32mFXIBdwrVKKL/4HyC77w0TuhkbT0B+azYR1qudXFf52lxsHUyE2fprNiPt6KaubzyKbcOFza+9UjeBuagxiakSknbeGjcWKpT18hhe9JABW/nfTVaGPSw+xu7Kxj1Klue1qKP40/to7osbg1Nl63ryr8VJj9nvovCRObs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=k6bE0d/L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eik0b+53; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id F3010114008E;
	Mon, 14 Oct 2024 04:52:21 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 14 Oct 2024 04:52:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1728895941; x=1728982341; bh=2cZybKjM9D
	cFIqUkv4bmvjg5bZFx69NeviweXujIacs=; b=k6bE0d/L0a807uJPUsp6sSsLJF
	2IqzoA+AzrJth2GPI2YkSJuTg5As6fxjr06pt8qylyvHrY7E2NIhvm5150xZKCyM
	AxMEeqwAY2n+cvHSIJSaMrviWhIyxeSdozv47I+qf1e6RA+xBegJH28baIFoWQWT
	9friiwdltOUC0c1VNS4LJRys0XflkGEm48D+jbtd8lDyYtGElzCsZByGMf5/3IM4
	QJDAtNEqsE4OgmfvffbDDQBjD8gyGgYH6yenK7HtVHIO0575Ex3WMhSUHOQQiRvg
	wCWw2Pc5nLXffwG6NHqim5NNpTwdjdL5/hUVW8gzfDsHI1hLYa40MhNRr9Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1728895941; x=1728982341; bh=2cZybKjM9DcFIqUkv4bmvjg5bZFx
	69NeviweXujIacs=; b=eik0b+53T9C6lSMzhzxiNF0ujMifij6WxBkUONSy8qNk
	WW+M/ZxqM41w5D/X7aqDPH+RXyHm7HicpAFaWnH1iLSgqQNPvyaP4g54/TPH6dMO
	TWVMFl4yIAtsW6k4MKoqQ1VpsyRHXXpdXnEkPDZHoolynYBQrolVVxlEfA+Qtn5y
	1esUjjn9DkKs1fd43IhFo3M26w77U9fTNyj+ugwMaeRlLBXiF+HxoTo8oT7v3T8Q
	QPIxUKOmHTuWh1t2hRsaMPzOylFIXOvfjXVo02M6/A11ataPF9FERxUu0KzOqYll
	MlsJrvzCK6T3+ImLDB6/wU28ORyk3u03Z5wYpJyk7w==
X-ME-Sender: <xms:xdsMZ6COQCb4QDLse78uYTQFE_d7fqK1ONvAGeh40GollnnpDJ3png>
    <xme:xdsMZ0iWFs3qxnqOroiVIr0ACdOl3HpLeLBubMDOxjZzbAi_gg9kJxWgjtm3LJ-cG
    _TClzHEkijXjg>
X-ME-Received: <xmr:xdsMZ9kEY4_6c0L807LwkjQDxXlZ8LYx53iRcFMNE6zC82Z429KEpaBWzRIlHgqTK-bKybV3H1G6Ywzerir1iDOqgBCBbfhscMCvtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeghedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprh
    gtphhtthhopeguphgvnhhklhgvrhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:xdsMZ4xyc-48AIDtuzPEFeQlWgW4OfGjwGFlpx7q1ine2_2cACdrLQ>
    <xmx:xdsMZ_RRZX2MZkx10pXa5ry-DgAHUvVu0WZoCXcUWBwbTcZrd3xVtA>
    <xmx:xdsMZza5mxHD2bpCtzHgue5Inw6bBVCO5DmvjvB8hMClLAeSXuM5OQ>
    <xmx:xdsMZ4TxGWw7O2QllnIjEm32Oq70SZWYmtmdxwyzTU4lzcjN100C_A>
    <xmx:xdsMZ6HVMPjWY3wWeyNtXN8OejL5wK43baWqJV3js68cdR8warmj8AW4>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Oct 2024 04:52:20 -0400 (EDT)
Date: Mon, 14 Oct 2024 10:52:19 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the staging tree
Message-ID: <2024101453-ladybug-esteemed-66b2@gregkh>
References: <20241014162054.2b91b5af@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014162054.2b91b5af@canb.auug.org.au>

On Mon, Oct 14, 2024 at 04:20:54PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: modpost: "isapnp_read_byte" [drivers/staging/gpib/hp_82341/hp_82341.ko] undefined!
> 
> Caused by commit
> 
>   6d4f8749cd5d ("staging: gpib: Add hp82341x GPIB driver")
> 
> isapnp_read_byte() is not exported to modules.
> 
> I have used the staging tree from next-20241011 for today.

Thanks for this, I'll go mark this driver as BROKEN right now until it
can be properly cleaned up to use exported functions.

greg k-h

