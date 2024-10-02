Return-Path: <linux-next+bounces-4067-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BBE98E6F1
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 01:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 289681F232E5
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 23:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D0C199EA7;
	Wed,  2 Oct 2024 23:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="T3pApad/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432241953B9
	for <linux-next@vger.kernel.org>; Wed,  2 Oct 2024 23:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727911847; cv=none; b=gGifEat/aKnka0ziClm6l7NMR08MWUxo3B9aiC5OClx7a1VBPcb/8bo4oxqQfpF0eGLzwSBUzjkoHb0dh/kVrAsxAg+kpLRfCJo2JfADq7gP3R02Id+phkxEGuh3ff1FtZrQfjmkuwgBIfy7GUI67JoXdsLGpbXuAAEN88hLmNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727911847; c=relaxed/simple;
	bh=US+ucAHtGUvo5sGx9gznMTFfZNz+JNszzcftXXi7E2g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LuVCj0JRpMJhg/9abN516zRDBdIx0kE5cFwm9aSNviJVIs0CdVo+mHdL5Hi8jxGxHwAHBQemF4mUo3ivtpumDRx50z3rUEcqBrEj07BlER1gvgB13/Hs1zgzAKsarFRTvUV/Et+jItGgPMyUw0fCm/xFXgLjwW36B8yrIwYQjSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=T3pApad/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727911840;
	bh=7S4S4QGGWYrU0AlSTQ/DIcYkWX79o272TnrVrni7vs4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T3pApad/To1RlgFUB1Jhda5PuICMa8ISeqiXZRQDC0haRuC20HEGHsZhQjFd0o4MK
	 Lajk/cFwVh7T0acPgivCF/DYGKRkm52RoIgOEx1Cf/d5Ebb2laDQfGgr9yDvXVS2SW
	 baRgKs+XuG9SvweShTI8+LUO6CJXV02xgbsUh2vluk+5M8Gjxh07R9flTEFMc4gASs
	 F6BrybS81AdKSl0r1nCtkp+7NxcQJb6CHusBTq6RzHQZV5/7DgeB7D070QkKSwz224
	 7iDe/HnXip6D3jTrpmvZPkTGlabkoICaXa3IHedB2jVvIJxEQQ7ogrX4iHuRmdM0NQ
	 3hwAXKZcW6xxw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJrdr2ysRz4wby;
	Thu,  3 Oct 2024 09:30:40 +1000 (AEST)
Date: Thu, 3 Oct 2024 09:30:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brahmajit Das <brahmajit.xyz@gmail.com>, david@redhat.com,
 gorcunov@openvz.org, linux-next@vger.kernel.org
Subject: Re: [PATCH v2 1/1] fs: proc: Fix build with GCC 15 due to
 -Werror=unterminated-string-initialization
Message-ID: <20241003093040.47c08382@canb.auug.org.au>
In-Reply-To: <20241002144806.255d62115286e173bbf42655@linux-foundation.org>
References: <20241002080534.835250-1-brahmajit.xyz@gmail.com>
	<20241002080914.841071-1-brahmajit.xyz@gmail.com>
	<20241002144806.255d62115286e173bbf42655@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/egIuoYU05i6LpJ6T00nIwAY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/egIuoYU05i6LpJ6T00nIwAY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 2 Oct 2024 14:48:06 -0700 Andrew Morton <akpm@linux-foundation.org>=
 wrote:
>
> On Wed,  2 Oct 2024 13:39:14 +0530 Brahmajit Das <brahmajit.xyz@gmail.com=
> wrote:
>=20
> > GCC 15 enables -Werror=3Dunterminated-string-initialization by default.
> > This results in the following build error/s
> > fs/proc/task_mmu.c:917:49: error: initializer-string for array of =E2=
=80=98char=E2=80=99 is too long [-Werror=3Dunterminate d-string-initializat=
ion]
> >   917 |                 [0 ... (BITS_PER_LONG-1)] =3D "??",
> >       |                                                 ^~~~
> > fs/proc/task_mmu.c:917:49: error: initializer-string for array of =E2=
=80=98char=E2=80=99 is too long [-Werror=3Dunterminate d-string-initializat=
ion]
> > fs/proc/task_mmu.c:917:49: error: initializer-string for array of =E2=
=80=98char=E2=80=99 is too long [-Werror=3Dunterminate d-string-initializat=
ion]
> > fs/proc/task_mmu.c:917:49: error: initializer-string for array of =E2=
=80=98char=E2=80=99 is too long [-Werror=3Dunterminate d-string-initializat=
ion]
> > fs/proc/task_mmu.c:917:49: error: initializer-string for array of =E2=
=80=98char=E2=80=99 is too long [-Werror=3Dunterminate d-string-initializat=
ion]
> > fs/proc/task_mmu.c:917:49: error: initializer-string for array of =E2=
=80=98char=E2=80=99 is too long [-Werror=3Dunterminate d-string-initializat=
ion]
> > ...
> >=20
> > To fix this, the length of the second argument of arary mnemonics needs=
 =20
>=20
> "array"
>=20
> > to be 3 instead of previously set 2 (i.e. from [BITS_PER_LONG][2] to
> > [BITS_PER_LONG][3])
> >  =20
>=20
> Yes, I'm not surprised that little party trick we used in there fools
> gcc.  And really it deserves to die.

However, the C standard explicitly allows for a string initializer to
be too long due to the NUL byte at the end ... so this warning may be
over zealous. And the code referencing these "strings" was deliberately
written to be correct.

--=20
Cheers,
Stephen Rothwell

--Sig_/egIuoYU05i6LpJ6T00nIwAY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb916AACgkQAVBC80lX
0GxQ6wf/dl3yxJ7jJuYKGoNCdNYhhAcMhAksEeAT+1K/CNRiJP+Mz+oz29Fiuvw4
MLKkPb/V83WS1N/QXShe7gJ56JhK46ViegIbg8kBTDgOO5zyY+kO/2RDsIZ+FbwK
QisSCFEcG6ZizQ3GPk8UDwbbqlIYxw4SaEsYc8H/qVhLbz7lZ2HrFf5p2tTq584Z
SBlHmLpiRHIrVEpq/hwN5leb1gTmz2nbYZFiE+yJnwBru0yjWutOoP/khK6gp8ES
Nzw68okXq9LOtA03UcYyGzxH6/IGYCAWMVlxI/WOc0ImlYEyMxryBhe4t4dVGjbV
F4TMVEp6eLDfCriYJEDs78koKlULjg==
=6mcn
-----END PGP SIGNATURE-----

--Sig_/egIuoYU05i6LpJ6T00nIwAY--

