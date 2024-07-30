Return-Path: <linux-next+bounces-3163-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02217940E9F
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 12:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E81251C2256D
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 10:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872D8194ACA;
	Tue, 30 Jul 2024 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PLGWJ1Bz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C6418A92A;
	Tue, 30 Jul 2024 10:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722334061; cv=none; b=C5H/WIYvgHAMcx5RKc+6tBvOiCx2LjFfyRoyPfzg7XkpYPiX+RQHhaQ5cuMAIG8fZWNbtyn62NbWHXNwUk0xpgc/dwAgEU5WFr/6PDicTpBzad+NXZ0VNDcwYX0ZbL5itWe+9mO2VVJm+O1bpLoIdQfgdq35YskdGQMTYsG8zZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722334061; c=relaxed/simple;
	bh=SCRkjIBOxnLP+yJONqEtuUXJnYA4kS6A9y2fIvraAYw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EvohF9IeKhx6i/OATGa9lAhmz5XLXJ59BlFv5UeOg/523kqZU/KYHEzRWuW9auwZ2ggquTAEqqV7/Ib5hungRXJA7StFSqeOUbsyfN3LTk4Hzbfwxg8lOm8X9fEt6BMia4dG/fy4rPD4XMVXWzGiVlhMW1fFh4u6P+yH34+g2WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PLGWJ1Bz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722334057;
	bh=QX2NbI1lfe6V2g/dcRwCQX5rEjKYwVZk2jTCLv+38Rw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PLGWJ1Bz/VFkxHZPSihUvbw1A7NwQXqNjjvE+8oYYkXt7ngr0CyRDuUKZeC6GyZ6s
	 olmvNf5xbQMLajGXGCrsHRQMUYQ/4P37IEz8r9TqTqthOI77lc/V/FCD4fpXoYGcLu
	 l5ovvOaZQ1JfJCHhmX7X9kj0DtEbU9IuPG5y9j3APJAHbEo7TlO9mBWSqyvb4QZJMv
	 HE1C8I8BF4WPgaqpJ46+KmQlC+s2yicWz6lZqckliI1ktNEPsgUJdb6dTvPTr5BCt0
	 8rIz5Zwu6/SKxYZHJT6PUucMG2baJ3fHyE7fD9Nl6TT2VBdndziUphA4JVOW8rUbbQ
	 ogxGuJiZz5wig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WY9rn4tzZz4wc1;
	Tue, 30 Jul 2024 20:07:37 +1000 (AEST)
Date: Tue, 30 Jul 2024 20:07:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the device-mapper tree
Message-ID: <20240730200737.67bb4d4f@canb.auug.org.au>
In-Reply-To: <622b892-d792-382c-46f8-fe5cfdba4df1@redhat.com>
References: <20240709185733.4aac356a@canb.auug.org.au>
	<49ab648e-3c89-d4d-f2f7-3c1e2aa2cab@redhat.com>
	<20240710082824.30c8161d@canb.auug.org.au>
	<622b892-d792-382c-46f8-fe5cfdba4df1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0tWX9EdL_Nt15MA_Iga7rKY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0tWX9EdL_Nt15MA_Iga7rKY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 10 Jul 2024 17:48:39 +0200 (CEST) Mikulas Patocka <mpatocka@redhat.=
com> wrote:
>
> On Wed, 10 Jul 2024, Stephen Rothwell wrote:
>=20
> > On Tue, 9 Jul 2024 11:56:27 +0200 (CEST) Mikulas Patocka <mpatocka@redh=
at.com> wrote: =20
> > >
> > > On Tue, 9 Jul 2024, Stephen Rothwell wrote:
> > >  =20
> > > > After merging the device-mapper tree, today's linux-next build (htm=
ldocs)
> > > > produced this warning:
> > > >=20
> > > > Documentation/admin-guide/device-mapper/dm-crypt.rst:168: ERROR: Un=
expected indentation.
> > > >=20
> > > > Introduced by commit
> > > >=20
> > > >   04a1020ad350 ("dm-crypt: limit the size of encryption requests") =
=20
> > >=20
> > > How should it be fixed? Delete the '-' character? Or some other chang=
e? =20
> >=20
> > Looking a few lines above shows indented paragraphs without the '-'
> > which seems to work. =20
>=20
> I hopefully fixed that.

I am sill seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/0tWX9EdL_Nt15MA_Iga7rKY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaou2kACgkQAVBC80lX
0GyY+Qf5AQGTiFOmxB4oNTZVWDbjQVBVSvVe6pOIYynoV6cFnkD6OaaBMJrdLAZh
btSJTfvMMbfuhNY8B1y2ewnnQtOKLhnaZW3GFxZZjeg5lQxlZ4FuI6V5JYHwVUnd
Q3GB55dTv9JzMgMgmNDHEOVbm8mDA59nI9+CXCyyCuKwFlo3bACFQ+adXuL9Yo+B
RBs+lPBgDc1IS957NBjXhxAKo5ODRIkthMNFBxed7TZEDD7MQ8pp/v0GXfbiMePr
eT3w+ZTh/p7afsMfn4RkfvqRag07brtXoXH2i7/nUlWXFxNEHB99j7NfxTInuAq/
yH6vibp4wUHXt68wyWf8b17pDxKu+g==
=V0FE
-----END PGP SIGNATURE-----

--Sig_/0tWX9EdL_Nt15MA_Iga7rKY--

