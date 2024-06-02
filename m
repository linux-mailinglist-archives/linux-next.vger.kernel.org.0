Return-Path: <linux-next+bounces-2442-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA108D73E4
	for <lists+linux-next@lfdr.de>; Sun,  2 Jun 2024 07:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0B4B2817E6
	for <lists+linux-next@lfdr.de>; Sun,  2 Jun 2024 05:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DFE8467;
	Sun,  2 Jun 2024 05:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kQKqP7vz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505E8625
	for <linux-next@vger.kernel.org>; Sun,  2 Jun 2024 05:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717305672; cv=none; b=Fu4+53Ok/+I5MYwgUxtOavRAGm84aOzZpRDOBLLVUrheQZ7YjWsNj4E8OvPYaDncl3+DgCwigBoLpMXhTvgykDr6/ZEqOVT7Q/rcYx9yws2ABe8rKoO1kTHbeePXJraj0GHyH8r03bvMqd4QCtT8eN91TyNOmHccR1pR/9G/BQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717305672; c=relaxed/simple;
	bh=2DwQizc09vDj0hOjBYqRErLzcC3C4KoGCg/eObaIELQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T6CG5kLY2CGctuzg480UhxxPtY+ZhefdLYIDxXdAX342cpL+SppjDko6e8Nn2o67SKvhPN6r/0GBlGUKN8eqMJDVEbOv5ulzwGlOxnQkzAbxQHTskctOLpDSWaDbuJWO63ua0C1GOh9ioegm5PPu++/c/IjmtLLUXghTF3G6acs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kQKqP7vz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717305664;
	bh=2DwQizc09vDj0hOjBYqRErLzcC3C4KoGCg/eObaIELQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kQKqP7vzTVSHQ0UhYzQS+fJfdSjUIRTz68+/tuhR49fK+SsRzk4Vw1vNGEsXbfNB5
	 fGOuy6Yiiw227C0/JWf+ik0edpxXuEdM+AvWSavHHfWZD1Y/E+tSesT+4lCfVay0rf
	 GYBiJIyk8fpTM7sp8KrCOgYAb1B+4kMu3nJ/M1wMgL/rwkcIIQqfVJupqnETH+5OQk
	 fr0RpL+/uT3OZ7AOOvH/hKQmDZTQVgcm1mGP7x4OTp/AOVNGiRNzwBawuVslTZSSuA
	 YzsPafN1/y8kCjWABXqB0SrFohVLUvelemj9OTG7dr2u8f7ft6SGR+IyZavSh02sFo
	 izYrZmMzumNmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VsQDv4xCLz4wcg;
	Sun,  2 Jun 2024 15:21:03 +1000 (AEST)
Date: Sun, 2 Jun 2024 15:20:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, <kexec@lists.infradead.org>,
 <sourabhjain@linux.ibm.com>, <bhe@redhat.com>
Subject: Re: Please add powerpc topic/kdump-hotplug branch to linux-next
Message-ID: <20240602152058.276df8e9@canb.auug.org.au>
In-Reply-To: <87mso42pag.fsf@mail.lhotse>
References: <87bk60ji79.fsf@mail.lhotse>
	<20240424074023.43932cca@canb.auug.org.au>
	<87mso42pag.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kx7e0nSXIXyfuOD1Yc5aE8u";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kx7e0nSXIXyfuOD1Yc5aE8u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Sun, 02 Jun 2024 09:53:27 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> >
> > On Tue, 23 Apr 2024 23:56:42 +1000 Michael Ellerman <mpe@ellerman.id.au=
> wrote: =20
> >>
> >> Can you please add the topic/kdump-hotplug branch of the powerpc tree =
to
> >> linux-next. It contains a series that touches generic kexec code as we=
ll
> >> as x86 and powerpc code.
> >>=20
> >> The hope is to have to get it merged for v6.10, so it should go along
> >> with the powerpc next branch in the merge order.
> >>=20
> >> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/=
?h=3Dtopic/kdump-hotplug =20
> >
> > Added from today. =20
>=20
> This branch has now been merged and can be dropped from linux-next,
> thanks.

Removed.

--=20
Cheers,
Stephen Rothwell

--Sig_/kx7e0nSXIXyfuOD1Yc5aE8u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZcAToACgkQAVBC80lX
0Gw/4gf/Xpxz7iv8f7mNzqzlovFpBO0pdnSSU2Ui6uHaRbl5irBMzCK5n+S6JpKy
EFMO2NWyzrMI2g80hQjkve0Q5bygdABPAEjBJBMM1Dsp6sBgCZHU/hj8qnxfNh2c
ZVP2Jp90JdK37Iu8usPBJKTDX+OkX2l1dxcxiBjIOwGEI9UZ/gIvifoWlrSUFHb0
uKzGxKmsqUdc3wjY/f5MGgVaWnTK9Kr3Tj/iLFA+dvAbIkGjDbXEd7Q6XbWvg8A6
zPSsD/ph4RBfUOM26R3GcwGr8Su/wNm2qfG/0TcD3+a25j5DjBSjbetZxjav1fQr
sFqgwtONYNnL+JbVrmzNz8G5VlLosw==
=mtNi
-----END PGP SIGNATURE-----

--Sig_/kx7e0nSXIXyfuOD1Yc5aE8u--

