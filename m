Return-Path: <linux-next+bounces-2904-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC792C63A
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 00:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0672C1F2374E
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 22:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33734185619;
	Tue,  9 Jul 2024 22:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iwkq14wq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EB2185600;
	Tue,  9 Jul 2024 22:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720564112; cv=none; b=FCwGHVpZiuF8LgXgDuByb8gwS0X2ZsI8WpN5vpLL8zTIoj9LP4LNCbD1ygVhpqRJpUtp4YgaKZFPEtWAtiGRiiPByqDdtL6K97JDk60mI2eFi3OA6w6kQaQrab9DDZMYVjrl7zlx9r2qRYCfvSRfTBTaxg6rsHM9jh8chfpekss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720564112; c=relaxed/simple;
	bh=1KiUlhAMkUIT35meQibdwOUkujg03vPthJqDKYBal/E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DhBQE3YHMKB2nfATw/m9ORjrjrdlqyyX/i9JfriTR+iwdUFi89hsL+DX30I2+59imez1VjG3AaiGNOF/JshwtMcHrXCNqYUwCDJ39N13l6EaL3JL6zcpQERt4NTgeJKpL+GDctVW9zwMKIU2zExWC+h4SSCBgafgrEjQGrqlJLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iwkq14wq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720564106;
	bh=xQI/A+SPwuxjtre0HfrRzD1YQL8gU+oP7+fZVdu7QaY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iwkq14wqNjNu3BGGDMqVtmD2OrQltRvxlWMbNjGyf4/x/9++g4hzR7pMMWhZYEI6T
	 vfYLZ4yazBILhin/3h75A2E7V/t49rcR/bomR3glxr2d6cR9Ipnu/pDK6zneUKiJk1
	 Mm9Dgt4onCxAZpyopIXErsG5NtefqWk/a3wZKkUen7/ED0RDhay8faemVpXpcTKU2Y
	 iu462iH0NakdUhBT8vv3tRlwm0LjSJ9cUEQUWq20HqhjIRheV2OfaqXPoZhfLO11Du
	 TRrTb5pF97gA4lNTU5swbeguzp9S0aAVVcZRRjIJmXkfMd3dSbWNsNTm82N4gET2tC
	 W7WxqqQOSFKIA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJbHG2fwbz4wnw;
	Wed, 10 Jul 2024 08:28:26 +1000 (AEST)
Date: Wed, 10 Jul 2024 08:28:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the device-mapper tree
Message-ID: <20240710082824.30c8161d@canb.auug.org.au>
In-Reply-To: <49ab648e-3c89-d4d-f2f7-3c1e2aa2cab@redhat.com>
References: <20240709185733.4aac356a@canb.auug.org.au>
	<49ab648e-3c89-d4d-f2f7-3c1e2aa2cab@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/08Pdo.w9r2MpeqY+CE9N9Nm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/08Pdo.w9r2MpeqY+CE9N9Nm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mikulas,

On Tue, 9 Jul 2024 11:56:27 +0200 (CEST) Mikulas Patocka <mpatocka@redhat.c=
om> wrote:
>
> On Tue, 9 Jul 2024, Stephen Rothwell wrote:
>=20
> > After merging the device-mapper tree, today's linux-next build (htmldoc=
s)
> > produced this warning:
> >=20
> > Documentation/admin-guide/device-mapper/dm-crypt.rst:168: ERROR: Unexpe=
cted indentation.
> >=20
> > Introduced by commit
> >=20
> >   04a1020ad350 ("dm-crypt: limit the size of encryption requests")
>=20
> How should it be fixed? Delete the '-' character? Or some other change?

Looking a few lines above shows indented paragraphs without the '-'
which seems to work.

--=20
Cheers
--=20
Cheers,
Stephen Rothwell

--Sig_/08Pdo.w9r2MpeqY+CE9N9Nm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaNuYgACgkQAVBC80lX
0Gx5Pgf/Sz8JpvKP/FN4O7V82spSVgeJsw75WDylUmFysUJ1mhNWknK03M1uu8+k
EkgYphmTs/sjf/a9qsIg6rpUUBJ6NQYqg6pkS8e5i+OwY/uBV3WseBz+eF86NPHw
jXVh/9kq5kZuneoadSyM0zMSNq/VV7jIu5fIxI4RMG6t3zj+REfpgqoosG0ZY/tw
GoYZICEo0hfDLTV5jFgaIdx2oIuEAnZmw09fp7Hls4lgsc/rQz8icBIj1mgLg8EY
2gsgu5BDsaVDwbBNcrqbNmNyeY+IQItHTBdi+hpAA2V6x4joB4XMGqCea//b6aOR
FShW/cfFRBwgekaOdJ9Dig5p13cGig==
=E4nC
-----END PGP SIGNATURE-----

--Sig_/08Pdo.w9r2MpeqY+CE9N9Nm--

