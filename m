Return-Path: <linux-next+bounces-7513-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D906B0384E
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 09:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4FE31750FD
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 07:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443A4214811;
	Mon, 14 Jul 2025 07:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="DbWXUD8W";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Zq3mUlkg"
X-Original-To: linux-next@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126EA23506F;
	Mon, 14 Jul 2025 07:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752479486; cv=none; b=rLi5Odyj+CJ5t4ez4t1GK8lrt281UjY6ueygPRJKx64rYZ7noimLrH2j4FVzn7WkYKwLxSSgwggJGg99gpiD1HqWK/haTCAPKyT58Ct9LRH/kMkJbJXg1fiSYzvvuX5p/Gf+J+obiIRYpTD/Kq6Si60GBYZNXdj6j6f5JxHyqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752479486; c=relaxed/simple;
	bh=PUWD+9ZyGVo9p7xAIpW8BnKdVr6TObw83sx6TU8IGlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fal7zGHnQqPyDOoRXlv7A3K29MwQ6u3nIvFyQ5IKQXvkraYIObjdqnnuBs5jztVLllWbrS8FfSVm/t48aE6ywll5Ng5DA/TqmbooHX+quGxOA6ev2HpaPd8B+iyvOYtQrzIjOYbYSoESAAye444WMTn+U15KVsWA/GvJ7W5XtQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=DbWXUD8W; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Zq3mUlkg; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id E0870EC054D;
	Mon, 14 Jul 2025 03:51:12 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 14 Jul 2025 03:51:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1752479472; x=1752565872; bh=DuwArUH5sW
	ZfqLJS/7ORa0NWyL7z+oMKjED/v6Wt/Wk=; b=DbWXUD8WBHa2+jxh94QgPvUlG7
	uZjRr9/AVoGTm+4BRgzedaElGjStigWmbwlCA4SGeY4NwcWQBi8/gbzdnIFLP/6F
	gTnQtWi1r2bHG1Lru83JGAj2LAYfImMUiAEcqGX9AEDcm+IOqw3KhhueHyyDlgJG
	qcQoGIdAKc1MPmUjjX18IFicYxL2vewztLro5o2xyi+0a03JlXoAYYi7jF8yCTX/
	kl7iodvdtAHDJvMW9CmNK+H6gFLTvYuKWXsH7+PA91XTjSoTxdddJ1Fth67vWBXw
	5mQswzqRuLFxYUvKYkPMXe1MRhnDp1NGm+v1/8p03KkshlsuVenIRiIFWrIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1752479472; x=1752565872; bh=DuwArUH5sWZfqLJS/7ORa0NWyL7z+oMKjED
	/v6Wt/Wk=; b=Zq3mUlkgt/dJOb/aXHS6aWc6N5tAYHgGU2wYdQnM4wQqEHsDnuK
	ASNXn4zxj5slKKZ8vLn1cGmkkiI803tiFaY6BN3LC96kqET36pFU3rf3QmWOovDm
	sTiYplPSkthya2Dso+FJVQNk7NBN1DEvghYL/YqDmEiqqzbJwArvoLhH7G9YV6fj
	Fn1MCBLARtXUtCRQkSGDgthEtx/L8WCpWFRzgs2TOgAazupyULU71ggrt9mdMCBM
	+ARyHT+9QmC9GvG2m8SqnycMU9sWIpvaPmojX1tX4yEn+kfQu9ph8gXtPrJik2tj
	Eq3XrhMR6NfWvU3qzfeOeM3TjE4FW/3zeEw==
X-ME-Sender: <xms:8LZ0aHwNrMQ1voBcLQIBcsQyqBM0EfwGc-Wq3Q29D0ydovktsvIYiA>
    <xme:8LZ0aEy8OY79UONVWNoW9aVbeUHrJANg6zoEeywt943M2lmQAlBijGu6cQS4bFYf2
    GFhZdjSrHP77g>
X-ME-Received: <xmr:8LZ0aAZG0Ba7aHz9GQLKPOIksLY3d02QAM1CGIHWuh_fAgEZXDUqbRsjH9uPsNEYdH0h7YprKGrtSYVIduoQoevJ8ZOSD2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehudegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehsfhhrsegtrghnsgdrrghuuhhgrdhorhhgrdgruhdprhgtphhtthhopehsrhhinhhise
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:8LZ0aF1CuGDchdknviKYdeTPQmLZYAamrPE-03CBkCTmtbUrP9lPMA>
    <xmx:8LZ0aCdOOuD7vIWebkxiBoZuBkL56WLBldNtwntYpOeqhIaXiVIiRA>
    <xmx:8LZ0aCJy7jVIrJaTNR1Uk0j57TICmuNk4_s180gVL9f8RkFGUMiejQ>
    <xmx:8LZ0aArE1knVlrlfACZnlnz5jZFAjaBIVBBFiy-nRSKJAxbySjexvQ>
    <xmx:8LZ0aPp6OtWwHXmDQ_YFDIweqZhtSLWKSwA8mqP2yYBeCyA83SWGz9l8>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jul 2025 03:51:12 -0400 (EDT)
Date: Mon, 14 Jul 2025 09:51:10 +0200
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the nvmem tree
Message-ID: <2025071443-humbling-paddling-a4de@gregkh>
References: <20250714173446.7e78d9cf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714173446.7e78d9cf@canb.auug.org.au>

On Mon, Jul 14, 2025 at 05:34:46PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the char-misc.current tree as a different
> commit (but the same patch):
> 
>   d102a7924f44 ("nvmem: imx-ocotp: fix MAC address byte length")
> 
> This is commit
> 
>   2aa4ad626ee7 ("nvmem: imx-ocotp: fix MAC address byte length")
> 
> in the char-misc.current tree.

That's due to the nvmem tree sending them to me in patch format.  Should
be fine, thanks!

greg k-h

