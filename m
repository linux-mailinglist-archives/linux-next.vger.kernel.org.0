Return-Path: <linux-next+bounces-4126-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00587993A9B
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 00:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85203B22B3B
	for <lists+linux-next@lfdr.de>; Mon,  7 Oct 2024 22:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947CE18E342;
	Mon,  7 Oct 2024 22:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="h3BWDo+J"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442C918BC19;
	Mon,  7 Oct 2024 22:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728341893; cv=none; b=QE7AnPlSCJACYCzXYnit1QFDZ6jixd5DnO79uF58KsdlsWz6kutzf+d33OfGGbNKpOrUq5oc4XrlwwyqJAScxk8jkK3Nq3OqRoSKlpxnbnfuC2DPgGd+u80+MjfJ9wiA4pGq3mx3J5hNw479SIHcjK7w0RiCDj5XsZkAhPmoLX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728341893; c=relaxed/simple;
	bh=stTWrRjNyu0ARG+l7hjoTBCVfZOqCrwoCAhQ0NsVG4c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNM3IDPPJjH8abz4W/tjm1Ri6xI6NpVOjVjJavMyswD9bqoMLU6nUYDS3Qd0BnYed+5UU8sno0vLAbReLDbqHqubLRa5sVRfi9MVszGuymLWy5Cs07Ij1wgpBoKzGF1RjiBlcKa4Bl9Ef1+vq7m3cxFQtrfYWO1cv5XuBbOiMeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=h3BWDo+J; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728341888;
	bh=9SVP3WIRERpKcOzPEMArQXJ8Mt+Ddc56mBbnzkH8ldE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h3BWDo+J3TDrV1/CohVllRqnaBFMq8U+rxDtWp9COYpG5sAQLi8D7JFB6ktBqvcQ0
	 Fnw8V+1ZuaijbtMGL8tlLs70C3i1gW+bzw+5ZCWrBZUoMXiAaqUzYgsdATSkm00dRV
	 sYdegJFOkYrE5JRxOqxU2tacBTlSKVOW3Pub4XcDMFVmTyi7QpIr9jK8JJ6tL7gQRc
	 mbbLFqCBgbJkGEeURlJEwmx5NST1k7EMs4Be7lrP49uY0deRRRGXkHsq5BeYmCsPYU
	 Uc6iCOMPqduE6wxv4gJYukpLyFcaN8Oq/YZK/KIKavJLwg0WNZcWD2XtXyYMQBFi/7
	 25Dn8RjanwSAQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XMvh04Ds1z4wbv;
	Tue,  8 Oct 2024 09:58:08 +1100 (AEDT)
Date: Tue, 8 Oct 2024 09:58:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Benjamin Coddington <bcodding@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20241008095808.1ee10054@canb.auug.org.au>
In-Reply-To: <20241001-feigling-lotsen-223db961f8d2@brauner>
References: <20241001091134.1eab47c2@canb.auug.org.au>
	<20241001141958.77cf8bd6@canb.auug.org.au>
	<20241001-feigling-lotsen-223db961f8d2@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Tdmh=HwOf2PLtbeB0utmYI3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Tdmh=HwOf2PLtbeB0utmYI3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Tue, 1 Oct 2024 17:00:49 +0200 Christian Brauner <brauner@kernel.org> wr=
ote:
>
> On Tue, Oct 01, 2024 at 02:19:58PM GMT, Stephen Rothwell wrote:
> >=20
> > On Tue, 1 Oct 2024 09:11:34 +1000 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote: =20
> > >
> > > After merging the vfs-brauner tree, today's linux-next build (powerpc
> > > ppc64_defconfig) produced this warning:
> > >=20
> > > fs/lockd/svclock.c: In function 'nlmsvc_lock':
> > > fs/lockd/svclock.c:483:34: warning: unused variable 'inode' [-Wunused=
-variable]
> > >   483 |         struct inode            *inode =3D nlmsvc_file_inode(=
file);
> > >       |                                  ^~~~~
> > >=20
> > > Introduced by commit
> > >=20
> > >   81be05940ccc ("NLM/NFSD: Fix lock notifications for async-capable f=
ilesystems") =20
> >=20
> > This became a build failure in my i386 defconfig build, so I applied
> > the following patch for today. =20
>=20
> Thank you. I just folded that fix into the commit.

I am still applying that patch.

--=20
Cheers,
Stephen Rothwell

--Sig_/Tdmh=HwOf2PLtbeB0utmYI3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcEZ4AACgkQAVBC80lX
0GwV3gf+Nqpd9Y7MWuMqG6GDakA9xO7L9WZ3FL2YTH/cOFzF86BqWcDQIG19URkI
bQbJOpah/YvMVmBJD3FSpZv2h+8jPgKQ0TkxTrUQiS+oCQsxhl2tZaMlTd7LOpBF
fQxw1/SP6mSbvPq8WgNg/5p0xbdrO9iOxaz+l8kjwkCbke6YmuIKWlZuaMr+9Z0q
fwIui5Z/oW2lp9Eld1ZP7Y808Zloqqyl8W6FX7FV7/QYiPv97yWfSqJIPK2PYRA/
fmcCmOv1I2AT9NTJPSvi8CBuHu5+j4w7yO9sKjYX5K9R6dxkcAJGRbmDKCVdlkaH
x2ushgbYlnl7CZ1spkbogJrzQdmoFA==
=cP5k
-----END PGP SIGNATURE-----

--Sig_/Tdmh=HwOf2PLtbeB0utmYI3--

