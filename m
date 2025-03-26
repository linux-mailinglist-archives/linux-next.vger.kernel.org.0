Return-Path: <linux-next+bounces-6028-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1FDA726EF
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 00:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54876189B18C
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 23:16:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2506215F41F;
	Wed, 26 Mar 2025 23:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Tv3VntZD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC05C5028C;
	Wed, 26 Mar 2025 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743030980; cv=none; b=h6ChpevNxZVPVLKTyIcNirDpMHsiWU7EbHCKRMY43k0I8GgzIJOzGkL5G2QS/gaZMiDSLSn+9+YDtAUxtALAfMbl9R2oKn3uUHfPKSE1hOMFhAf7SyAG6kKwraawNVRNyfQ6ZkkH9Y6KvJuzeFuJ6Ip3il9V7rHL+yr84tLWu4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743030980; c=relaxed/simple;
	bh=iibPQi1jbEKb8TuwjxFEMZOgHjBaf0QzPvAicONf/PA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bAPCoLc9O7GCdny5Hf4xj9Ntg2JJ32D7SWdY9h3Nuz2nGeh3pP4ahd2RWZSU9maJ0zo15pqQ140W1VK2K+HWafGBFKrBEH1OsbP+tblSc0vTiGigryX82gVpPnQmN6HPm1pcjRX4u5bToVXhBS6TyMs+ms8f0Othjg4QZ7TNRAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Tv3VntZD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743030971;
	bh=sLtfBn0Pq3cONRZPmTGBl06p95bTjzxsgyIlXm8HOmM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tv3VntZDDr3RGZwV0JlMK7lZMxA6ZtTsHwSYxR1p6hROukjipsjNIOjyWtlxVOLOC
	 z627CcHArro7OxrQIO+5jjgX6PAJACINhUtRUfKboclUcA6bhXcdv7lE5t1+RePBiE
	 i1XJv1EOUiWn6TkF2/7aTEp2uhCA+SMekvSmoiUYmWWvm6YpAx3mvmGeNLcbNG4Db7
	 ANPHBbDFDwrAWa14x5BMoGze8DdXlAVgnHpSymEHKPJoWlu/a+iC/F57kmBwjy15GS
	 rkK9azwvCNUqvJRwsfm2xYWi5ANMYKa8ATkZeeS/iG4lGB7hDnt756zJOC8zi/PWJ+
	 C3j8sdJVuELhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZNN2M1QQqz4wbx;
	Thu, 27 Mar 2025 10:16:10 +1100 (AEDT)
Date: Thu, 27 Mar 2025 10:16:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>
Cc: Oliver Glitta <glittao@gmail.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, Alessandro Carminati
 <acarmina@redhat.com>, Guenter Roeck <linux@roeck-us.net>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Message-ID: <20250327101610.45f13473@canb.auug.org.au>
In-Reply-To: <20250324103048.3d8230f9@canb.auug.org.au>
References: <20250324103048.3d8230f9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YO42.FBf5s2aLCbKoHOlXTm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YO42.FBf5s2aLCbKoHOlXTm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 24 Mar 2025 10:30:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the kbuild tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/kunit/backtrace-suppr=
ession-test.o
> ERROR: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o

This is now lib/tests/slub_kuni.c

> Caused by commits
>=20
>   19f3496e6241 ("kunit: add test cases for backtrace warning suppression")
>=20
> from the mm-nonmm-unstable branch of the mm tree and
>=20
>   1f9f78b1b376 ("mm/slub, kunit: add a KUnit test for SLUB debugging func=
tionality")
>=20
> from Linus' tree (in v5.14rc1) interacting with commit
>=20
>   6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()")
>=20
> from the kbuild tree.
>=20
> I have temporarily reverted the latter commit until the former are
> fixed up.

I am still reverting that commit.

--=20
Cheers,
Stephen Rothwell

--Sig_/YO42.FBf5s2aLCbKoHOlXTm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfkiroACgkQAVBC80lX
0GxdbQf/aQKxRk4LtsWM+dWwv18xlIZOfEhbFPkWhBmjkmR7ozuM4LwrNpn1XH9r
+q0QUpN4MHXFTPPbSHSWTwWCzB6Hpb2TsX1jeKRBfuCpDERKA8elKmpnBECSza7y
E6yR1zg818wZ0D7NeaSBPDL0wWab+YN4DjBVX5w+OVfNdPVwPqU0D9N3UdPLMGlk
CrcguiiLl+y219jaoxBkF0c0rfinJZ7jIEa5OeENBJHtXjPoHAW/m9VHfpgkiA/H
xFL7025Zg3YkELVHeSokG+1r0DzmjVcVKU7m+x9MtpMmqQwO2TGroLLM9psJNJRe
qrIQ/REUmsf3daRqlvkl4wsblnusEg==
=aVzn
-----END PGP SIGNATURE-----

--Sig_/YO42.FBf5s2aLCbKoHOlXTm--

