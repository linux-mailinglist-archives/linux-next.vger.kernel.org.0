Return-Path: <linux-next+bounces-2838-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0F992A9BE
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 21:21:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEE8A281CCE
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 19:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FE014C5BE;
	Mon,  8 Jul 2024 19:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u0c2Axxn"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC34A14C58E;
	Mon,  8 Jul 2024 19:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720466452; cv=none; b=Tys2lwbJBoVdtmgRn38m//W5mr34uglVuafuyz6OgBo0h/1Hr6aXshwjQ/ddz/QZoDexPM//xAf2Nem4Fmbrw1dWq+ntWZdBKqMzP8VgXZsmnR/aR+TTW2FWmC3JJKtS/invCqOGymkzlYSKZ/rYyQtBSyiK12jo/WzR3v93JLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720466452; c=relaxed/simple;
	bh=OsrWd4BqZBZ2b+fwGJXmNa6so9mX+eyKWWuxa5n57p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2Yy0mYqWOquFtDNd0s9EBiCTGP6NhTo/Fvl1arILgEbLiygVKg7fNuXnsJz5R/oFSzD0USUwlRbRCXx7qhWDEr93wzliXaS506CUR6biVO1KU3mmOavf7ts9sobXcZ4rq2qMfHyianjC1EF4kCzC92xzWXrP5LFYADIESQ2PXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u0c2Axxn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E18C3277B;
	Mon,  8 Jul 2024 19:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720466452;
	bh=OsrWd4BqZBZ2b+fwGJXmNa6so9mX+eyKWWuxa5n57p0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0c2AxxnsHldVEwAirVkvL/z0iodZbYatLDUo6vbvgv18dLJgyicirHCv7rXPljv1
	 gtUjPyoKtfK+97sxuikunPLHp+XxmIuqAe62IS+4ydTjU7P/2mwJYFu1l4POBkHB3z
	 J3LgL/pU6dMsd2ePrQHIVkA3idj4aBGXnN0P9PHdOjdk/W0AtiB9I1Q0Y/xZ0tACmS
	 Ej69FdOV5Ei8f0d13OE4xrvntrifYW5VMTvb6VxHkuLgEy//G7sy6zN0DHWvvUIN4C
	 SvytaIXReUVg2/HncfLeEyZp1w/wKTAX9QjnbD25eaJqsjo2eEcjAJWU2I5Ei9nGrp
	 ZVoG7hnd0vE1Q==
Date: Mon, 8 Jul 2024 12:20:51 -0700
From: Kees Cook <kees@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the kspp tree
Message-ID: <202407081220.31CFF5E@keescook>
References: <20240708182458.06d4eefa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708182458.06d4eefa@canb.auug.org.au>

On Mon, Jul 08, 2024 at 06:24:58PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>   e3890eadadad ("string: kunit: add missing MODULE_DESCRIPTION() macros")

I've dropped this from my tree now. Thanks!

-- 
Kees Cook

