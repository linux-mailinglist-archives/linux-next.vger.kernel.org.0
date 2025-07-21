Return-Path: <linux-next+bounces-7672-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A968B0CD40
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 00:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EAEE5425A1
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 22:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA5B23C8D3;
	Mon, 21 Jul 2025 22:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bA+Yi8aN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1673922173A;
	Mon, 21 Jul 2025 22:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753136658; cv=none; b=Sg0IO5yuYxn/9TQPGdWjZEpNPe/03yHluzTnvckRxAkm/gp4muwdfVnUuXhgSeUsq/4Rhdr9T/P+9zm1mqtBEUsgcwgW/g0ck4UaCoMMY1wc+GDNG7W9QMaK76OsZ5X1tYhaz6Vthy/N8BhPzAbHtfNjCvB/kARL7Ee+LmCNHiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753136658; c=relaxed/simple;
	bh=Ar8NAKZeMLI4LKDdpOyw77ark2aK0tDnDdGAoiqgfsc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZCks/x62owoU+A1xtFUsuM9Bv+jImBV0tLTvZAvSqbGc5UnwoBpsIFyNwBniVo6ghTepYEaIQAsPWu3EFmxwaDz+YCZsbX7rEbbWag2KJcHWSYk2NZ5Pi+VdIHzMVJ526IwLmaPiQxFCPeAa5KiLmjN/UvMpvd9xLIgxyh89LDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bA+Yi8aN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753136497;
	bh=x1xD2TtdNgugM98hUGXV8Wf8b3JmtY5tjK46Ct4FpGk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bA+Yi8aNsAHg2sXLam588yhbpFFj5w4TShlvX1IdLZL1iWjPv0e0g37nwxyx3uLip
	 uAkqAs0+cgxXdxBDLou/xDTb0jzn4QQ8elPyD3KZOKYFGwrUWJO6ePOaL8tslYANwl
	 nr0YQv0PUaSM4LkZWlktd4NOBhTA0XVkobpioPHyBJbFW6ZqfUsG03QfaHcwDZ4Pn2
	 foHnJ6WA3EqwjFgL3QwN+tAzHPVWef8KH56PCUcGoOARZD3M8C2J1+0xpUq+SSaSQy
	 O8jtailuVIV3BVwngBh17RgvSmztMsNx2LLpnqWZp2FHRIomnsFaDJ2ydSOdUFuw4O
	 iymkD1ek2aYfQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmFHN5G6qz4x21;
	Tue, 22 Jul 2025 08:21:36 +1000 (AEST)
Date: Tue, 22 Jul 2025 08:24:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux Next Mailing
 List <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, George Abraham P
 <george.abraham.p@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: build failure after merge of all the trees
Message-ID: <20250722082411.130825e0@canb.auug.org.au>
In-Reply-To: <20250721141336.1491a3b5b09529171d65db6f@linux-foundation.org>
References: <20250721173754.42865913@canb.auug.org.au>
	<aH4nnsecLEqrCrpK@smile.fi.intel.com>
	<20250721141336.1491a3b5b09529171d65db6f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/50t.AIzQNbnyofssB+0kNR9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/50t.AIzQNbnyofssB+0kNR9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon, 21 Jul 2025 14:13:36 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> On Mon, 21 Jul 2025 14:42:22 +0300 Andy Shevchenko <andriy.shevchenko@lin=
ux.intel.com> wrote:
>=20
> > > Is there any good reason not to do this?
> > >=20
> > > I guess this patch should have
> > >=20
> > > Fixes: 39ced19b9e60 ("lib/vsprintf: split out sprintf() and friends")=
 =20
> >=20
> > This sounds correct to me and your patch should be sent as a fix to the=
 stable
> > kernels as well.
>=20
> Yep, thanks, I added the cc:stable, queued it up and shall send to
> Linus this week.

Thanks, I was going to get around to that this morning.  One less thing
to do :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/50t.AIzQNbnyofssB+0kNR9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh+vgsACgkQAVBC80lX
0GzmSQf6AoVnvCNq0WfaPORsvNGheFD4g/zjevDLAy9S1kNtdepYSQFvIaIAgrD2
zdmvPZhTLTCmDYckqGX+WDZYEugJjSbri7hwqWbXKmdnAlTaV4szFet/RHVd+A9n
SCGagfuv+bILVRJSg+mXuCD5tjl6DVP0VDw5yt1/OC8emwASjIWUZRmmLrw1QSpT
PNsCKDfXNqZ4qQFggC7MuCsrcokLd+NUCWDfWH+xBQIAeNIBuVMRcXlG666O5Dgq
yYez/5tr+ODTBx2Cc7FEsdNmv8R8WxhfDy7iwIAFTbLLyrIAX6saASNmzAHsj55A
ai8neN+CTs0QFrWxGskOCZ+ASHxiYg==
=lUCL
-----END PGP SIGNATURE-----

--Sig_/50t.AIzQNbnyofssB+0kNR9--

