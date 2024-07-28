Return-Path: <linux-next+bounces-3143-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C7393EA12
	for <lists+linux-next@lfdr.de>; Mon, 29 Jul 2024 00:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4812D1F21CB0
	for <lists+linux-next@lfdr.de>; Sun, 28 Jul 2024 22:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7BD87C6CE;
	Sun, 28 Jul 2024 22:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FMiAHxl5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02277B3FA;
	Sun, 28 Jul 2024 22:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722206745; cv=none; b=lCvzzYxxevZ5AeeVV5RdR8dxsVOQQjsopmXDD73ybOx69TtfX+nbCVur+D5Z60MNt6dlv34/eV1QpgvRAkysrN0PzHwFW5sl2OMIXNE2RY7lFG3oVSdsxuAcJ0E4dG9lrAt77vbgN6vANBBLLQujuUP4Tt8NSY55mnh+DmA48Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722206745; c=relaxed/simple;
	bh=O1xXYGl00L4DvJO1d7fD0JL5ThPUNdGMnSjG2CF9xU8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n9X54sYnNscQTKqL910e6pdcjHL92Y5Sv7DwyyMzv2MrU8JamgROYoEoRijLe17fg51GVrsdvJJpukVAcBrhArcfPFDaDPMzvIvYluZTZwZpncusDlNlaAoxZ7skkdIUKp+XDh8FXOy+26wA/lfC6pFcZnT+KXDpxThEPqprU+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FMiAHxl5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722206740;
	bh=fdCcSFS34XOl6p8GwbWWemwHvbTEXMBsd/hmSHxACRs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FMiAHxl507bZapTrOGfC21o1rcsBH29cbwZCY48tERqbf9FfWx2Ld8afKMxSn0dUH
	 ndQHKVcq2xIMJdbH9+hEV6HlRXL1h/K3hqvE76YqJs0nPUc28rNX0+zQWWXJRqtfYF
	 cTTj1JXwG5LQyURDqAHCzA5iL1inL0UBJj2ZE34YtdFfp6vlW/6OqLvo3vmpdDSVwy
	 dNDxnWOoQ26NqT/bkkmjAgqMrkOXpE4Gv0dVjFxVXY1s/1FDhaPH0ZFne2WY8+NWSI
	 HChOrMW17Iqwz+pX7lS3TIoGKD7G6yDs/XbkN7LuB+uoZKcRNP2K5hWKHN0nRvDgD9
	 jP5A0QVE4RAcQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WXGmN4FCXz4x6n;
	Mon, 29 Jul 2024 08:45:40 +1000 (AEST)
Date: Mon, 29 Jul 2024 08:45:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Wei Yang <richard.weiyang@gmail.com>, Yury
 Norov <yury.norov@gmail.com>
Subject: Re: linux-next: manual merge of the mm tree with Linus' tree
Message-ID: <20240729084539.4c501073@canb.auug.org.au>
In-Reply-To: <20240729084117.3fd74b2c@canb.auug.org.au>
References: <20240729084117.3fd74b2c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g3+aBa6kmipLyt.b7nnUy.r";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/g3+aBa6kmipLyt.b7nnUy.r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 29 Jul 2024 08:41:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the mm tree got a conflict in:
>=20
>   tools/testing/radix-tree/bitmap.c
> (renamed to tools/testing/shared/bitmap.c in the mm-unstable branch of
> the mm tree).
>=20
> between commit:
>=20
>   692a68ee9c3c ("radix tree test suite: put definition of bitmap_clear() =
into lib/bitmap.c")
>=20
> from Linus' tree and commit:
>=20
>   28b9ae6595be ("tools: separate out shared radix-tree components")
>=20
> from the mm-unstable branch of the mm tree.
>=20
> I fixed it up (I deleted the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Actually, due to this and the conflict in
tools/testing/radix-tree/Makefile, I decided to drop the
mm tree for one more day while it gets sorted out.

--=20
Cheers,
Stephen Rothwell

--Sig_/g3+aBa6kmipLyt.b7nnUy.r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmamyhMACgkQAVBC80lX
0GxIFgf/XXP8wsZeAsbOBoY+8yt5+QcRqinB0UdrxwJWRQoG9nivxwZipLkwv52h
6FDefyO59PFT7ppyxa1Yr0D7hTSkoroS0HaA4dbVf23DGvtdzX/8E8DplNRtWkvZ
jyoOZUkA22HkhggMSV6f2grd111kXPOFFGgcy9/hdKK4x+CvU4+nvFr2KPSy+Q4g
zZs/BI0w/m+2soOY8DHZ51uEdhpvUnv63cA+WI+yPL2znJRb0MMW3E62eSRbS+V+
uOC5u6y1WkJOXNQCjBYs0cb9/4v/jqwC+L114NXhysyc+/J4umXwFBT+uBFbYxzB
zSjvwAnyvaSlktuQp4I7FqcWMl2V7w==
=mqZ5
-----END PGP SIGNATURE-----

--Sig_/g3+aBa6kmipLyt.b7nnUy.r--

