Return-Path: <linux-next+bounces-3538-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E249682ED
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 11:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FCAC280A1D
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 09:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6524B17CA1F;
	Mon,  2 Sep 2024 09:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b="YBp5SFOP"
X-Original-To: linux-next@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70898156993;
	Mon,  2 Sep 2024 09:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725268696; cv=none; b=jKT35X7o5LZ7zE6w37khG8FAOXa9ur+xST2lsFRzc//hLLo0Z7kP4ZOpphMyWuYd69U7obGCIcfsHarzpYHOMIJleQ4CMPxU+SnKSbELK/aN8bYx9HsiGa4W7z0YwID3k42OHj8KAEiqx1vSSYC0dWwrHv0pKHiH3Wjo5eGo4D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725268696; c=relaxed/simple;
	bh=vV+W+1SdJLosGo7vnr+ALq7HsNk9d757a5CIu0ptfrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdxImWQhBjz+1tlAaobetZAPItJPYJgKbb8EPBYb6j3PzPqvcY4PBtguSqIgIHaW3hCS7YkA6Eg4h1o9KUjCEhs8NziyWkWS5HEBbWMsP8/CSqcYP9FFAqy5zMY5p1lCCuH/HQzwxE58X73RLosP2HBLtDjjkYV1VWJPBT9ct6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com; spf=pass smtp.mailfrom=pankajraghav.com; dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b=YBp5SFOP; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pankajraghav.com
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Wy37z1yZxz9sRn;
	Mon,  2 Sep 2024 11:18:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pankajraghav.com;
	s=MBO0001; t=1725268687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+aTVW8R+fk9ktaLY3UYaXeuwp9d+gVqJvqvYXjWWjxM=;
	b=YBp5SFOPKd2GLKDd9KpA/PeqYCBVMMskCTgd6A6sOMyTDsPI3oQxdTQlsH0a0+/3tpw2qa
	fadOzLFM1zw2gpCGX4iBH0XYkL/1W2C/g8tUQMDAmpMiOcKTYpzsIFYmRpsxvy89lk513+
	vJpAcOiVGbaprXDCHLakF9xtWNnHSPC97Tot8kl29xOL5j1/+jDBoF9uKVgeqyMn3Mo3Jm
	hyoB/R7xJkLhbK2DTXAvZZxbCwO2Lv650KBjW6DFqW2QJNT94U6LKPjy5O7jK8dBGMkVxa
	8VMy+bcC9leyw+yB/CPe7tNLzCDkzfoB9q+cJWPCLDHDDUZVVn78s6D3YOJhpA==
Date: Mon, 2 Sep 2024 09:18:02 +0000
From: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Pankaj Raghav <p.raghav@samsung.com>,
	Usama Arif <usamaarif642@gmail.com>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the mm tree
Message-ID: <20240902091802.bitm7jutsit6adwj@quentin>
References: <20240902112101.2728f045@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902112101.2728f045@canb.auug.org.au>

On Mon, Sep 02, 2024 at 11:21:01AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the fs-next tree got a conflict in:
> 
>   include/linux/huge_mm.h
> 
> between commit:
> 
>   bc47772ebe8b ("mm: introduce a pageflag for partially mapped folios")
> 
> from the mm-unstable branch of the mm tree and commit:
> 
>   fd031210c9ce ("mm: split a folio in minimum folio order chunks")
> 
> from the vfs-brauner tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks Stephen.

The changes look good to me.

There is also another fix in this commit that I will be sending out very
soon.

@Christian and @Stephen:

I see that fs-next still does not have the mm-unstable changes. When I
send the fix, should I base it on:

- vfs.blocksize branch from Christian?

or

- linux-next which has latest mm changes?

--
Pankaj

