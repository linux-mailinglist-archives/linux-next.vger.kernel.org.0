Return-Path: <linux-next+bounces-7233-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E22B4AE64BA
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 14:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77CB91BC0860
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 12:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD5A290D8F;
	Tue, 24 Jun 2025 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3U1Zrr3"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E7128EA70;
	Tue, 24 Jun 2025 12:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767407; cv=none; b=H1/NwPvAE90TDiBNcWlzn2Ts0M8I2tZM5oUyiOozVWujbJ2jmYdh+eUQ+7IOlQ3SI0EvA4TxzNebTtRdZZrBcyGfS2I/mdp7ytFP1fCu7cMdt17nhOgnjyh0T50FmqM7fPKdFHZGHONmS5OlHlYkvDaO9fFsWZxsg0ePe3Gsips=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767407; c=relaxed/simple;
	bh=re/iZ1Xy6h+93CDA38MmYEx1dtYphIFoepyWMPmknGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ke9VDvIdOFLsMffy4Hw5AiZi9VuV+sQZeBgfOW0nTska6ZqLhYYxIcJfxBQdW8/Z+HCo3R0GoaX7IdshpAL2X0u2n1rJHHyXms+t0wxI85ywnARJH4jmJmvGt3Lj1S3DSfYkcxUELrwLINpNXN0nj9Xq66Sy+SSDuvYB7wrZPiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3U1Zrr3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF02C4CEE3;
	Tue, 24 Jun 2025 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750767405;
	bh=re/iZ1Xy6h+93CDA38MmYEx1dtYphIFoepyWMPmknGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e3U1Zrr3T1m6uY3mXdRYU3cFZyaUYmxzsMOXQmqbITWbCj0wS9ErqwfVdTdI28blY
	 qkYEVNLqQ4IICAAMgpCNaxq6UVJEFvrOj/WQsMM17laiIdW1uWw5Iy+4em1fBmn/BC
	 8qkg/Rj+c4cwCKYiDlJusjFHxzsK+nTRAJdWFVHGRg9YmgEVj7e7vQBKU6ldC4VXQx
	 /gUHp4gjNVW0m5bDWWoD9HsH7tx8Rc4kEPAJGVXTuf3UcdNgJgPpGEQ1jAXGUudPDp
	 TlsDyMHuCU40hwq85PEnG+juugtzxyqtDRa9nFkOtmOhuCP80omw3ZDTJGI/lxLr1O
	 QEJotkHF28oog==
Date: Tue, 24 Jun 2025 14:16:40 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rust-timekeeping tree with the
 drm-nova tree
Message-ID: <aFqXKKAxQp0yxUvL@pollux>
References: <iuo4BpdTglZkpW9Xyy1ehjFspmj3ay0q7iejyeOShBG0HLZmIrhzIpi0eG_wBv71ZPPCgh2lcn2BOsrFHOegfg==@protonmail.internalid>
 <20250624195142.1050e147@canb.auug.org.au>
 <87ecv94ay9.fsf@kernel.org>
 <DAUQZ1TY9VT3.UJEFQ96157DJ@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAUQZ1TY9VT3.UJEFQ96157DJ@nvidia.com>

On Tue, Jun 24, 2025 at 09:03:48PM +0900, Alexandre Courbot wrote:
> On Tue Jun 24, 2025 at 8:48 PM JST, Andreas Hindborg wrote:
> > For the Nova people: You might consider if it makes sense to take a
> > `kernel::time::Delta<C>` for the timeout.
> 
> It probably does now that it is available. I'm willing to do it this
> cycle if we can find a way to not break the build. Should we have a tag
> to merge into nova-next or something?

I'm not sure about the generic in Delta mentioned by Andreas above, but the
Detla type did land in the last merge window, so it's available in the nova
tree already.

In case it would not have been, I wouldn't recommend doing signed tags for such
a minor thing. We should only do that when things are really getting into the
way.

- Danilo

