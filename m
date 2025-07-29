Return-Path: <linux-next+bounces-7736-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCECB145F0
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 03:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D69743A1418
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 01:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372B81F4198;
	Tue, 29 Jul 2025 01:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e1QL0QPV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5B61F1317;
	Tue, 29 Jul 2025 01:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753753383; cv=none; b=omgQ1aQuda5jTCbRWZrT/jXMWKWibQI4LrgSBPK/17O0Ddg551No0Y7wlWVzesuArPzF/qckoCfOSDtD1/6kXo4p2Gr67SdXyLpN0+Yo4qNFGjoGimEYB2nckQdbj+bIRU8T8+YoTlHgE2coyHxSrAF7BWrNDlIW51nhrktwnXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753753383; c=relaxed/simple;
	bh=DDWt1divItWHtE5C+t6yjBAZh3dCoBFC9gI8wQS29rg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M6+vOsjZXTp9NegU3/dAiaXxCW6noEUwK1uioDKFRylynCRu/WFHK3ypyTjLMdz4Uyu0BjLZbH0V0eBULAqALmwYpYy+c+DJYfWuK/jVxGd9nTKOBw2SELPreAUE4gWlp/J/LKlcxvbBpZVh4Z2WoSkY5dkvVNZ1FNleVBrmweI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e1QL0QPV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753753167;
	bh=HAFrszZcLHiyykr0JLCLAKIRgFg9YnfBffD/rfx2r9I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e1QL0QPV3PjW4RC1ZEKhDpizmJEqKtffMLQMPpswyyOzo7nDn0133whIcAoxJGFk3
	 Y/rDn8LgTD6TfGFkYcFemWMrOfGz7h1Tk3+k/HdPeLCp1QDMuhsABW7uTqhntW8RYP
	 UowRS5jsd5QzAGWYkKrxo3ckFylEC1sSKGjICl1vsweqGRQiE0SH1arRT0a758hjnv
	 K5qLOu4tZAl69l3Nc3RU9kI3OgqpSlk1AdLvpcJdwGowYl8oWW/OIUkFWm7JpVfmvH
	 NgpOg8i3cbfoIsqv462jI1y8ALVnzEs9DXmV3zc9sDlbZ6zKWhBH0sHnfGDR5K8PrR
	 QM3NklbVo060g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4brdLQ2ZDxz4w2J;
	Tue, 29 Jul 2025 11:39:23 +1000 (AEST)
Date: Tue, 29 Jul 2025 11:42:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, wangzijie <wangzijie1@honor.com>
Subject: Re: linux-next: manual merge of the vfs tree with the mm-unstable
 tree
Message-ID: <20250729114249.2d2f4002@canb.auug.org.au>
In-Reply-To: <20250616105846.45af3a7b@canb.auug.org.au>
References: <20250616105846.45af3a7b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_vYPl1C+mMc5w=2Uai.OP+l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_vYPl1C+mMc5w=2Uai.OP+l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Jun 2025 10:58:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the fs-next tree got a conflict in:
>=20
>   include/linux/proc_fs.h
>=20
> between commit:
>=20
>   e4cbb84d3ce3 ("proc: use the same treatment to check proc_lseek as ones=
 for proc_read_iter et.al")
>=20
> from the mm-unstable tree and commit:
>=20
>   5943c611c47c ("procfs: kill ->proc_dops")
>=20
> from the fs-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/linux/proc_fs.h
> index 703d0c76cc9a,de1d24f19f76..000000000000
> --- a/include/linux/proc_fs.h
> +++ b/include/linux/proc_fs.h
> @@@ -27,7 -27,8 +27,9 @@@ enum=20
>  =20
>   	PROC_ENTRY_proc_read_iter	=3D 1U << 1,
>   	PROC_ENTRY_proc_compat_ioctl	=3D 1U << 2,
>  +	PROC_ENTRY_proc_lseek		=3D 1U << 3,
> +=20
> + 	PROC_ENTRY_FORCE_LOOKUP		=3D 1U << 7,
>   };
>  =20
>   struct proc_ops {

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/_vYPl1C+mMc5w=2Uai.OP+l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiIJxkACgkQAVBC80lX
0GxTcQgAmIBaemn5Ktu5ihiYAVRhM3/BQt7XrOuc/roSaYVIphIOWIxlc24jHrKY
Ug2f1gqpC5s8U5SZ80My+Nem7kXfMTeNuhaxEWrJNAGuVeCVTP2DDk5Qv6K8Z0HT
VDTFwpnOqFL/AMEw8GbntfbMettDuTop/ezn5dkx8xIsrOqG9O8Yzy8tb2ZXkW78
sD+sHyS7/AiZ0Bg42V6yJs2C4qXz6AePu8HelWkJqB87uQuhKnNfERI3gaDbW2ji
yC7PKOnDWgeT/2cUrrRFcleHRUgzhc4g0tMl4NCXYk9npbjzdcVEVulkNEH881pa
/30LOseZHjL3Go8TaXX581tBmY1i9Q==
=cBWx
-----END PGP SIGNATURE-----

--Sig_/_vYPl1C+mMc5w=2Uai.OP+l--

