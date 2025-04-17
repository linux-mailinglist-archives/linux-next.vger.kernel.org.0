Return-Path: <linux-next+bounces-6281-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 859BFA91237
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 06:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB4FB5A200D
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 04:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180431C5F1B;
	Thu, 17 Apr 2025 04:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TKGLnctk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4AB42065;
	Thu, 17 Apr 2025 04:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744864006; cv=none; b=l3WZyR83fVr778wfTg7jUUDOxI07bUcuIeLN/F0m+PRdqC26EbKR7kYx5ggvi8MAIfNdawb0wLQ+4n48SZfHpbAYfcaUPJ4NAOgdTvfeGbK8AVl+A+Cr9dSG2foHE2gGiY8J1l/tcwAFym0v2SXjtFVfi8F/s+TX9dh4Er8hRGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744864006; c=relaxed/simple;
	bh=i+L8jTjPD0ik2pCvSNzTyOooHNoLje8NKu436vjLZgU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q1MmUPr3HOARYTFKw9Q5HMcDYEHtOxLttZDBnuzeKFipOrjoq0RQw+mVsKcbV8cIu4A6kD/gUT8o+CjSOzTNodWi8QQzsqCZou5UTvqU3XBJlOAcT+LZVzOY5CkRKwPaa8X5bPkoXmS6CAc3QSMnzwHJ8TZRvaBGDwE827tvyHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TKGLnctk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744863998;
	bh=+3m97MTJ+N0KGqyOod6LMCb1XHbHUgGTPA6db0+tFsE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TKGLnctk2CoXrf+IYCywZ/wEfLg7KP1dXMBpj5TBPSG3fazpZs0UJ0qAgFij/GCvZ
	 HFvYecPowWVS3Kwb5pRlwQoxbX422KNhvEAVy8WljoUinM4CFZws9pM6wzcZiNmKLt
	 oP8jcXCFD9PPlBe3E3FNVjvs7bReqcwACAMyfhmZArAwd9t3+AEFDckauQrHaN4sey
	 t7JJg0ivbAOQjhZDs8+I3K6LeklNQGtriu3lIbMkGU19foa1uYh/ZMMjqzdOuTEc2p
	 XFrToLk3DbeXHgtSusIEWBDlEk+9x17E2k6nCMrhOF+4w2SKClmVAcXdv2insOi3qz
	 1Hw1LKcGAkSrg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdPws3gRyz4xM1;
	Thu, 17 Apr 2025 14:26:37 +1000 (AEST)
Date: Thu, 17 Apr 2025 14:26:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the workqueues tree
Message-ID: <20250417142636.0e73728a@canb.auug.org.au>
In-Reply-To: <Z_50QbWczACrwL5f@slm.duckdns.org>
References: <20250415140116.13544ac6@canb.auug.org.au>
	<CAJ-ks9kUBCX6PjOeOSVQNXYGcy9gkYw++BEmHZ0eFbsyZeBZcQ@mail.gmail.com>
	<Z_50QbWczACrwL5f@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hqcHcv.5R_L3Wd9f_o/DOYV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hqcHcv.5R_L3Wd9f_o/DOYV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Tejun,

On Tue, 15 Apr 2025 04:59:13 -1000 Tejun Heo <tj@kernel.org> wrote:
>
> On Tue, Apr 15, 2025 at 09:24:32AM -0400, Tamir Duberstein wrote:
> > On Tue, Apr 15, 2025 at 12:01=E2=80=AFAM Stephen Rothwell <sfr@canb.auu=
g.org.au> wrote: =20
> > >
> > > After merging the workqueues tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > error[E0308]: mismatched types =20
> > >    --> rust/kernel/lib.rs:204:9 =20
> > >     |
> > > 204 |           ptr.sub(offset) as *const $type
> > >     |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ types differ in mutab=
ility
> > >     |
> > >    ::: rust/kernel/workqueue.rs:495:18
> > >     |
> > > 495 |               ) -> *mut Self {
> > >     |                    --------- expected `*mut ClosureWork<T>` bec=
ause of return type
> > > ...
> > > 505 | / impl_has_work! {
> > > 506 | |     impl{T} HasWork<Self> for ClosureWork<T> { self.work }
> > > 507 | | }
> > >     | |_- in this macro invocation
> > >     |
> > >     =3D note: expected raw pointer `*mut ClosureWork<T>`
> > >                found raw pointer `*const ClosureWork<T>`
> > >     =3D note: this error originates in the macro `$crate::container_o=
f` which comes from the expansion of the macro `impl_has_work` (in Nightly =
builds, run with -Z macro-backtrace for more info)
> > >
> > > error: aborting due to 1 previous error
> > >
> > > For more information about this error, try `rustc --explain E0308`.
> > >
> > > Caused by commit
> > >
> > >   345e029b561e ("rust: workqueue: remove HasWork::OFFSET")
> > >
> > > I have used the workqueues tree from next-20250414 for today. =20
> >=20
> > HI Stephen, I believe Tejun plans to back this out. See
> > https://lore.kernel.org/all/CAJ-ks9k2FEfL4SWw3ThhhozAeHB=3DUe9-_1pxb9XV=
PRR2E1Z+SQ@mail.gmail.com/. =20
>=20
> Yeah, sorry about that. It was in the tree only for a couple hours and th=
en
> got rewound, but we got a bit unfortunate with linux-next pulling. Should=
 be
> okay today.

I am still seeing this failure.  Forgot to push out?

--=20
Cheers,
Stephen Rothwell

--Sig_/hqcHcv.5R_L3Wd9f_o/DOYV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgAgvwACgkQAVBC80lX
0Gx4kAf8CyyGLJI3BHnCKvjA32ifhppP8teDbmxVK3F7OQi2cR+d5bzcZf40BCA0
k4K3PpcE9XyGHwHk0Bd+KXnwXN6G/Yy5pa14oAknhjgWDbfxNDxp7KWdQ2ZOPSc4
W559x7PKZ0Lg9Xb8lqytAotF4kz448Ctq7WqwkOAXOzPeKtWARss5koayqxIj2dZ
ylGeuvDSPrxrkblfxnTCXrvIGWp1zEem4+Xjrj9ZMMHaSLRgQScHrSnLkaJxyh72
66TyKiij5Y3NvpFRfFFhxz76nate5G71DbU3THXDiWwstpi2EBAQVsZmqdtSPyY5
nNzTR7crwQwP2MueLsWIJpJOzHoX6g==
=ar5p
-----END PGP SIGNATURE-----

--Sig_/hqcHcv.5R_L3Wd9f_o/DOYV--

