Return-Path: <linux-next+bounces-7831-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A26B7B199D2
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 03:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AA967A19F4
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 01:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC131E9B31;
	Mon,  4 Aug 2025 01:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VVgWiBV1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D683929A1;
	Mon,  4 Aug 2025 01:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754270652; cv=none; b=Eq0e2lsK44sBM+n3uQMX9G6clutr+jgB9pGrSI7DC1AC5NSPxf4q3Omh+OUdzNC8ePDeDXuFq4K/t1X9uGUjTdEVjBJxOYFLeYonty8JUSYTyFwutjJ+HVYiQFSvBxuK7VqgCsB0F2qp31nsZl7uJ+xfBdTCN2uKl3zuJ6tZx+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754270652; c=relaxed/simple;
	bh=kLcRsSYCPsQi3pE1QnIDeEQOJrxGUQsns3ainheqIJc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FkkmKsbOLUN6FJrme5DtPBzTvMtjWPkszBcQfSuaoDK3AARr4+08yRlb+uIRBnAgnjEZAYE+Jifqf0h0k22LGSYrGB/bWYLObctRRL4xqYFQZGvQy2G/pDq1ASpoLaZrCo+nDn7Mg9SgyNH9qDStXb74qF/KzBpXP1ZNS4/aYYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VVgWiBV1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754270645;
	bh=rYpK11Ananx6jBbqeC+LX+9/Ug66iSShsa9Cl92oX54=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VVgWiBV1TnB0wlST8qopM7l7h7wEaAphxYTMw1Sdvqq5fDMzUxbMvXXjIdS9Ii+IQ
	 HubVyeA5o0rkKULdWz75xrPDeOkzkDEhR+G2rH11IahTuImDmz0giINSrEzlhxk/1U
	 AIMCrTcAGeE4a9qgdrawg78X5i5YkV+w+nM9+tZIwI+VJlbks9ljSNJWHpOg8AqW2q
	 ak3tkzSKeZoGA9MHrqexiT7LPcNYrDBMsKtCUm1ytX6UFiS8u2vdWIp/NHR0X2q4Qr
	 SZmcuRM8uhIR+oblAoxh0H76Atv/CeQLXWh+8tsqvl0NMYqKRcBJhRAQ0Z4Rooa397
	 DXE9sygwhoIVA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bwJjw6GZVz4x21;
	Mon,  4 Aug 2025 11:24:04 +1000 (AEST)
Date: Mon, 4 Aug 2025 11:24:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the modules tree with the kbuild
 tree
Message-ID: <20250804112404.6c6e1565@canb.auug.org.au>
In-Reply-To: <20250801132941.6815d93d@canb.auug.org.au>
References: <20250801132941.6815d93d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+Yra=FBrL_.tY=yJ/j/kXo6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+Yra=FBrL_.tY=yJ/j/kXo6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 1 Aug 2025 13:29:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the modules tree got a conflict in:
>=20
>   include/linux/moduleparam.h
>=20
> between commit:
>=20
>   7934a8dd8692 ("module: remove meaningless 'name' parameter from __MODUL=
E_INFO()")
>=20
> from the kbuild tree and commit:
>=20
>   40a826bd6c82 ("module: Rename MAX_PARAM_PREFIX_LEN to __MODULE_NAME_LEN=
")
>=20
> from the modules tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/linux/moduleparam.h
> index 00166f747e27,a04a2bc4f51e..000000000000
> --- a/include/linux/moduleparam.h
> +++ b/include/linux/moduleparam.h
> @@@ -17,12 -24,8 +24,9 @@@
>   #define __MODULE_INFO_PREFIX KBUILD_MODNAME "."
>   #endif
>  =20
> - /* Chosen so that structs with an unsigned long line up. */
> - #define MAX_PARAM_PREFIX_LEN (64 - sizeof(unsigned long))
> -=20
>  -#define __MODULE_INFO(tag, name, info)					  \
>  -	static const char __UNIQUE_ID(name)[]				  \
>  +/* Generic info of form tag =3D "info" */
>  +#define MODULE_INFO(tag, info)					  \
>  +	static const char __UNIQUE_ID(modinfo)[]			  \
>   		__used __section(".modinfo") __aligned(1)		  \
>   		=3D __MODULE_INFO_PREFIX __stringify(tag) "=3D" info
>  =20

This is now a conflict between the kbuild tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+Yra=FBrL_.tY=yJ/j/kXo6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiQC7QACgkQAVBC80lX
0GzgLwgAhIfZsXaKiVBGO8abZKiyOsYy32tIRcwDRGUa602AoxGXa05po+l2tKyW
4CKv8A79QZqMhxfEipmK98Cbcol+afdU3Ksu52Xm7DuMe3oNfdMApBrSN0SvsBWF
XPrNne/6y1DyZAZNBytApP0uog7I3j+iL2H41EvN4PpjZK4fLvhgu2XJOpavQzz2
qENb0pVhg4poH7mw+VbfWjUTftW6ypuwyX2queA9e5gzSHAB8U77Ex5Swx4ICfwl
pp/JShAlza4yUoahR9QQVRIAU8P+8/40uuZT5JaH6c3xqHoKXaAm8MDt5fpIn5yQ
lWTEt3w2ujA/j/ZagiaZHqn2HjIvYw==
=98xx
-----END PGP SIGNATURE-----

--Sig_/+Yra=FBrL_.tY=yJ/j/kXo6--

