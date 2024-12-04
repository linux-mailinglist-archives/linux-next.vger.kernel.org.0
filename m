Return-Path: <linux-next+bounces-4876-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D33869E30B0
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2024 02:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F3D3B21C5F
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2024 01:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5C44C8F;
	Wed,  4 Dec 2024 01:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QguQQjyQ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04626FC3;
	Wed,  4 Dec 2024 01:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733275151; cv=none; b=fVtAgg/ghSf3rG81OkSWvElJ4ow1ThUQaLSyQUSbHqZPOUg56pgw8YZHG3np9dtsi8SijYlBk3ruZG0YlyumNv/hu4BAdDd+5NP8BYWfIXa18+kihrEOvK69rtMRsoBWqhBO9FrtQBEEoq833U6l55z+tpxjCeNYSAfx0LZHPPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733275151; c=relaxed/simple;
	bh=D1JTVh2llkGP7M08LB8Jrx4grDf8oiYimk21RcwDoDM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BG8RGYcRfe26OFDeGb153NTWmxO8v/dAhWhHhEgI2dZES7es0kvKMRUQ0Bc9benelOLdTZiTH+ZUqedRBT+Q/c4kEFBanxzySaxfistEqjqTMcw3bdmAFEayTSeo2XlqMn9tszBSuXO8DGaYM9bIkExFxPoiNw/prh/Syct0nzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QguQQjyQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22819C4CEDC;
	Wed,  4 Dec 2024 01:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733275151;
	bh=D1JTVh2llkGP7M08LB8Jrx4grDf8oiYimk21RcwDoDM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QguQQjyQdmGjTP38ssKqc5gs45y6/T3xU1DpE/IVKjroimS80v+P8wLrHEuvrSb+h
	 B+8ZiWHQLLvWBM4vRAVtxEemxhfkICv2pVXZQe9EHSFQ5q2tY7Osy21n4/yRwuIhaD
	 WN0h0bizQB1WXT03jZRkrZPApFGOjvz4G/OmR2sQJlUhiS13xqpcvtp3St87isF5Wo
	 QxW68jYWlH4a/RAWSwwo7mwr1Mk78q4c5Epr0EbcQRwrjWu9RJ31UX3F8+vT4bnUGx
	 2xU+DPYKFyIvytDfS7pgwt2FkjNH1KwvSpwdexYhbSqrD0no3MGd+pRI2fGHtP+jUq
	 tVqvW5B/Xbkzw==
Date: Tue, 3 Dec 2024 17:19:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, richardcochran@gmail.com,
 yangbo.lu@nxp.com, dwmw2@infradead.org, Linus Torvalds
 <torvalds@linux-foundation.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>
Subject: Re: [PATCH] ptp: Switch back to struct platform_driver::remove()
Message-ID: <20241203171910.27c0a170@kernel.org>
In-Reply-To: <5qiehbnmzufzqjgn2l4jcghebdx7llr52lgl7hi2jizpg7gfnd@c73bpxxxdeiv>
References: <20241130145349.899477-2-u.kleine-koenig@baylibre.com>
	<173318582905.3964978.17617943251785066504.git-patchwork-notify@kernel.org>
	<CAMuHMdV3J=o2x9G=1t_y97iv9eLsPfiej108vU6JHnn=AR-Nvw@mail.gmail.com>
	<5qiehbnmzufzqjgn2l4jcghebdx7llr52lgl7hi2jizpg7gfnd@c73bpxxxdeiv>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Dec 2024 12:49:54 +0100 Uwe Kleine-K=C3=B6nig wrote:
> > Resolution: just take the version from upstream. =20
>=20
> But IMHO my variant is better than Linus's. After Linus' change the =3D
> for .probe and .remove are aligned in the conflicting files. However the
> other members initialized there are only using a single space before the
> =3D. My change used the single space variant consistently for the whole
> initializer.
>=20
> So I suggest to either drop my change, or in the conflict resolution
> take my variant and not Linus's.

I'll revert, it's less work.

