Return-Path: <linux-next+bounces-6973-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE77AC74C8
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 02:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F01E188EB91
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 00:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE98CB67A;
	Thu, 29 May 2025 00:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nsF+oZqC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A044CBE49;
	Thu, 29 May 2025 00:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748477003; cv=none; b=BGA2xb45wBZd37T0p70ScOGHI5FVyZiYaZO+LbSUJj1gUGk5qjftn1nmtQh/22x8ShoC+uY1jctR55RAWfZtmmqdjcP2buX8KO+H8Mnp76lV3h1WdTehlvLJtsLKbiZDCUQGrrQaxT6eNkgu3TkoD0lXxfMu0+b5Y0g7zoB9ZHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748477003; c=relaxed/simple;
	bh=Glx/Ro0IgvvHBP+BrLUoA0phiOcaaugtzmu0ER7Owi4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WNg8yMDKONnztUm+jzqrZE1sVSruDPGOBwZCvBsEKw/wZhbgFxrV4VcmgWbFaL9xS8FrIfqgyHfQtYwhA0k8tUHEpj2W1FFbSx5Y9LRPE2Bwn46t6oxSdxisDoi4f7qob/MoC1bLBwaZZ4OFXBfRzpnQZIkOZRoWTiy+o/okRAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nsF+oZqC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748476998;
	bh=/M7FUjiB8SjnpAFmZyun/xfGtS5/4bQBYz+cFL4Jgck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nsF+oZqCyZ/Lh3ie8l8CHPHToZMkOW94jaPsMJiRc77d8Wgvw1Dfep32H8SOp1Q86
	 9TIxH65bogeTCBoVKM5Rf8+xpdBzt4YUHUJ4Ook3rbe03RliuKbHFu0U24zgtQbZ3M
	 7tQXROJsn9nVooKJt95gVBfQRJc9T9N9G1QWfHvuu5+U7Y2W3nhpWs4GOqosr0pmVC
	 LJhzRyNwIqmVwaePWCjdpSCD+hAktpbHZkE4gpxLj451Rf7G5uKBzS5dNloPWOinVt
	 iclp1OwHh+S16l/6edG/Nz/O8FkC3crfnQUZoes8hQGXX//FdCIOjQVLDOjLyTPx1D
	 /cqYc53zTJOwA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b765f4ZVvz4wxh;
	Thu, 29 May 2025 10:03:18 +1000 (AEST)
Date: Thu, 29 May 2025 10:03:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shivank Garg <shivankg@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-ID: <20250529100317.1af7ac47@canb.auug.org.au>
In-Reply-To: <20250529095938.43087534@canb.auug.org.au>
References: <20250529095938.43087534@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nQ4Ox0kX2zKUp31e06EhV+Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nQ4Ox0kX2zKUp31e06EhV+Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 29 May 2025 09:59:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:

>=20
> After merging the mm-hotfixes tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> mm/khugepaged.c: In function 'hpage_collapse_scan_file':
> mm/khugepaged.c:2337:21: error: implicit declaration of function 'folio_e=
xpected_ref_count' [-Wimplicit-function-declaration]
>  2337 |                 if (folio_expected_ref_count(folio) + 1 !=3D foli=
o_ref_count(folio)) {
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   3bdddbba5f02 ("mm/khugepaged: fix race with folio split/free using temp=
orary reference")
>=20
> I have reverted that commit for today.

folio_expected_ref_count() is not introduced until commit

  86ebd50224c0 ("mm: add folio_expected_ref_count() for reference count cal=
culation")

in the mm-stable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/nQ4Ox0kX2zKUp31e06EhV+Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg3pEYACgkQAVBC80lX
0GwGlAgAhX5OSUxEN+cbd+5WQQ/qsL6goXv/wc76rWsgqH+2rih3oXw1IlVpUaFX
ydLwJXfVBAeoKgpx3ErCvX9BHu04MWiHNstyk5LtaoWHDmLcLHM52CaLT+B3CUkP
nev6B+blk6ypV7wK0D9wGya7pJwyD041IOy+bM5QKbNoM375Sp9O4r3e8ezrm7Xg
jJSVijDzHexXPxxKaUDmKGiPBnd1ixwBuKdPNqf+OWVx6NtYDTNwqnOPrfBMqvU0
HgOP+K5n+UKVbefHXknZS1hgMO/8XsSJBJ2xusML/MAALJG/g1otBnw9E8+t67dv
Cd9DODzkPE0FxXNFvnqIOmRy0BrnvQ==
=rOKk
-----END PGP SIGNATURE-----

--Sig_/nQ4Ox0kX2zKUp31e06EhV+Q--

