Return-Path: <linux-next+bounces-7299-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D989EAF0834
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 03:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B5281C0447D
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 01:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A101369B4;
	Wed,  2 Jul 2025 01:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="RpUJV7H0"
X-Original-To: linux-next@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6A93C26
	for <linux-next@vger.kernel.org>; Wed,  2 Jul 2025 01:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751421490; cv=none; b=pzj26hxq25x2dbpr4asZP9uwD+Ex6IfBTDiYrCx7RIuNHUpf4YZGcykom8jDff7NyiDJcobizxplbt2Qy8SZWqTrS5zTzl9qbDyBPzdH5GrNRW5dl71HI+4zbndD8dcmsqo66PMqs5Q5IjHk4b4tKf+a124GI8atLt3vTyiXckU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751421490; c=relaxed/simple;
	bh=FikZ2tqBYmNhAVY3oqnGQ7MPas/t5KOAWI/+eYy3y0E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HWkgvDOespCbfVmVuuaysmxQqTy8i0yO7WM/pE1ud/4sFsN+X6yCVpgeKETosIp4kTSLcc/xD1KXBfYLRA2AV5weNDCx4d/PPtUqfg3CE2gp8uCOqyosvIK3UH4HtKPmY9p9y5pSOkuxIGwVqfcGttxdwDRbQtJtzzB7rcPSfhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=RpUJV7H0; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751421487;
	bh=FikZ2tqBYmNhAVY3oqnGQ7MPas/t5KOAWI/+eYy3y0E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RpUJV7H0lb+POZjhJ1kNG1d86TBEbT0WT3hS1RHABYv6qvUJcNimMrg6UT36VPNCp
	 SOp+JGCpScyM624y4BTceBkyJdAUax+0wlMICosNn6JLx/rKpHwWS3MWJXZSE0l11P
	 1nma8oCwyQeDEUA1Pk1gbpiafqiGjxNpI7RIwg//x7YanAPfxtLSerYits2FrnVgBr
	 y2CJI7bsEGTcufux5WVfAon5DO2FPLtH/pEiK4CaCYXLDJZgGik35RzWZDLd5rhYan
	 POscMV+LONrOd5z6wPCHU84aQjkSQXbplUf96UJLHKJakOE/KvRD+yg0oZY5R1M18F
	 maj175ErQGpWA==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 93B8D6443C;
	Wed,  2 Jul 2025 09:58:06 +0800 (AWST)
Message-ID: <8b035557ad025d31ab347349ebf9b91ff668498a.camel@codeconstruct.com.au>
Subject: Re: Add bmc/linux for-next to linux-next
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org,  openbmc@lists.ozlabs.org
Date: Wed, 02 Jul 2025 11:28:06 +0930
In-Reply-To: <20250702114941.5bfe1e5a@canb.auug.org.au>
References: 
	<2ae27beb3fa9266e8f73cfa10d8299465d872183.camel@codeconstruct.com.au>
	 <20250702114941.5bfe1e5a@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Stephen,

On Wed, 2025-07-02 at 11:49 +1000, Stephen Rothwell wrote:
> Hi Andrew,
>=20
> On Wed, 02 Jul 2025 11:01:54 +0930 Andrew Jeffery <andrew@codeconstruct.c=
om.au> wrote:
> >=20
> > Could you add the following to linux-next?
> >=20
> > =C2=A0=C2=A0 Repo: https://git.kernel.org/pub/scm/linux/kernel/git/bmc/=
linux.git
> > =C2=A0=C2=A0 Branch: for-next
> >=20
> > This aligns with the recent patch to MAINTAINERS for the ASPEED tree:
> >=20
> > https://lore.kernel.org/all/20250702-bmc-tree-update-v1-1-c270cd8af0ab@=
codeconstruct.com.au/
>=20
> So, does this replace the aspeed tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git branch
> for-next)?=C2=A0 Or sit along side it?

It can replace joel/bmc.git, however, it should be fine to sit along-
side until Joel confirms removal of his tree with you. I've been doing
the BMC SoC patch wrangling recently, and he hasn't been updating his
tree with the branches I put together until I poke him about it. In
this case I'll just hassling him to update his tree, which should
remove any opportunity for conflicts or the like.

>=20
> Either way, who should be the contact(s) for this tree?
>=20

Both myself and Joel.

Cheers,

Andrew

