Return-Path: <linux-next+bounces-5370-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 230DCA286A0
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2025 10:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B5631885E78
	for <lists+linux-next@lfdr.de>; Wed,  5 Feb 2025 09:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4D8228C9B;
	Wed,  5 Feb 2025 09:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DkccVivH"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB5A21A452;
	Wed,  5 Feb 2025 09:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738748040; cv=none; b=kVIM1CEfwvmXaRy3F0r6lWoNzF9EUijm018H31qIntQkAC9Y6gskIzY8ZgbrOjvmG+PDU7Phz17pTKaoj5zgIaw5crKiKa8pB2oxQxpG25SCUC3oYHsgZ45W4OROgCfB2tYFnx+09oDPymVI6ggFxugpreGLWV19xg8ALwA8gqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738748040; c=relaxed/simple;
	bh=tzRMXKZzO95mcP5eMffinRwb2km28q9DUzNSVJ2qTaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/VSiVczHT2V95dxSnCnR8kG4iCz3DeNRvpM4QVZEagGoMSEGU3KJuLWhHofu4xS0l+da6XAh6Hzs/oY7bv51wuw4I2W8MzY9C+f7QbsWTCKc4liiFibJf7ghcUG8kf+xpiJbjS6R2PlocB34qIO4oD0mz+W9mPzhFlJ9yGPCeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DkccVivH; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2Se4JrlRqU3OaPcp6MZTvfuA0o3oMi92fGri0Ng0pDw=; b=DkccVivHxLzYZXPHKSxa/C2WA6
	GsumaSfDED2XiJXsoMgN75kcGLHhFeWLDVmHfmdph2eDIEeOm+icaBlx29oBmq5ISwLEJ1ofmiei5
	mbIe22+K5SC05kr7QKgjqsdD1lbXDh6eRYUgXUGxAPB4k2OoJ4Hsr9TGzRW4Z6rDo1l9PUD1MdBnl
	sA0U+1IwMlPNQeu0dz9rkDnjQh1EUM8/1HhJmo3XZ30QOFWJoUp/hmFeQ14pbK6/wDNr9t1TGoew5
	16ZD6qCO6F1ncMzyUhSE6q++ccH9qgmndtY7+d89lJTWA3eTh31Olac0+ljYO7r/0nE+zeuybTzSB
	2x7WgeAw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfbn6-0000000GbLy-238v;
	Wed, 05 Feb 2025 09:33:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 120063002F0; Wed,  5 Feb 2025 10:33:52 +0100 (CET)
Date: Wed, 5 Feb 2025 10:33:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Liao Chang <liaochang1@huawei.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20250205093352.GN8385@noisy.programming.kicks-ass.net>
References: <20250205080053.30dbe654@canb.auug.org.au>
 <20250205091427.GZ7145@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MRA9r8Hcg4vXgeJS"
Content-Disposition: inline
In-Reply-To: <20250205091427.GZ7145@noisy.programming.kicks-ass.net>


--MRA9r8Hcg4vXgeJS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 10:14:27AM +0100, Peter Zijlstra wrote:
> On Wed, Feb 05, 2025 at 08:00:53AM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Commit
> >=20
> >   a66396c911bd ("uprobes: Remove the spinlock within handle_singlestep(=
)")
> >=20
> > is missing a Signed-off-by from its author.
>=20
> Bah.
>=20
> > Looking at the original patch, it seems that some process has cut the
> > commit message off at the '----------' line ...  the divider is
> > traditionally '---' or '-- '.
>=20
> Yeah, except akpm uses/used a much longer one IIRC.
>=20
> I'll go fix up and rebase I suppose. Thanks!

OK, I think I managed. I've tried using lazygit for the first time
today, but I'm not sure, this might be worse than normal git :/


--MRA9r8Hcg4vXgeJS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAmejMHoACgkQdkfhpEvA
5LpG9w//VcRnDOKaA9i7WwEkzqAWvKDMKTHeIv2gaZICnWT7qxegEo44yd8XYgGE
3KKpRwUhetfWPYhnOfNUvS3gcDkE/EFNqLd/tYHIAtbtZ9EjlFrVAs6LhCZaDfdU
nQzaAChjO+nkHuSB6Eka8grAJgdhFVPzMg7V1FPi0nLUYvtbn24jnC7oNAoqoRyJ
yVoMbmuMgGGQnOPtCUi3nY/YGKCXTW29tLkhPnjG+YQ7BNkuJGn6c+NIXCBuC4T1
Ns/TGQ/g5sFQQjmYmNdnPzHZutXIYGrbBTOVg89hdxgeFvksGM3i2bj5jkFnPTKG
4o2eBIZHxMO48PvCAnP1VYzshCpi+9VGuivF7uO0t/ZJDzsK7SMcQT9AWM2+2Ue8
WbKsmfUlSrsYnEFPaf/ae6sLCAXv2X7gJ/gtwXXuLxIV9u1KZYA4OorK0ODbDVNy
EmJ/+i1+FHIw9Jzc9czAseMVrDVBTZlRUrhonDF58BPRgSNwcrCukhGyQFvRNZpd
SKKUXnUXrRQhBCpwo89hTSJuLvayW5+omW8w4nwhrRDNi0GSJF1FY9lUzlLVUEKQ
ZjAiXyZ0PygvLql+DsC9M4uJO1NPOfzK0kaDoVhyTkni8ItycDk/EmWDOSY1qaTB
SI4jRZfKpSqmPSlnU/cFn8VWY4lNvMDWvl/XCtjyR2QWnOdbsjM=
=vUFg
-----END PGP SIGNATURE-----

--MRA9r8Hcg4vXgeJS--

