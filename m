Return-Path: <linux-next+bounces-2281-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E416B8C4A25
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 01:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E01E1F21B55
	for <lists+linux-next@lfdr.de>; Mon, 13 May 2024 23:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168D685622;
	Mon, 13 May 2024 23:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pz8EFXLO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB73E4F211;
	Mon, 13 May 2024 23:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715643692; cv=none; b=E4Bc2iHDfAf/kVbX9rAkcmr9LaIa4yTg/X4iQSpjKmoOReFmkLGYlSdx/WYp7FZrAf1bzg5e4JOWxAtsk/w6h9NEyF1DIdJOSY95UnW1x/p9PAUL5yNyXXrgbMBqzzN1A+lR3AqdJKfNzmUdC103fbfuA8rqaEdl0aRZLVdQiYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715643692; c=relaxed/simple;
	bh=IdqGzDvLjBju9Scyk7Hs0Dw/FmlmxRrNGlV+6RdagvU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BYyXAw/8lbQymsJ0ocpt4b31BT16EpR42UzB/gbkc5MpWNFildfxdVQXWDKeYInjLYYr5tV3GFvoY7M5l2mkGTOK/4u+bZUEQpkvtwkycAzPfnGQG7kD9hUHGxYlQz3LUOUudidXSDYb+dsAxVRwF7aJD/zX1buZbqfHnEEy0k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pz8EFXLO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715643683;
	bh=Sfv3FzJctuHHasXoC8+PgEAJeh/MiGZci2RyR6BJ4y8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pz8EFXLOPH//wDirhQEJTZnfWE8kQu5LHlMJ07kQsXfLD1wsCvX5ou5eAy6ICuXg0
	 RfVrRkhkU0LjAY933CQFhsdOnifNIsbkwS4f/T6Ib5npgyXMNzLxhza/oHb3NvQLhZ
	 p5K6S8fnbCj7uMGKhe93NVcbFBlTpSMPJqA0Lsyy/Z4ZaHXzRL/Z/w6Pwcd6rcQr1Z
	 KLbJTZJlceVbe+8fmgjbhKYmJFIWUXLbdq0WomPRuy8O4Pw6MBEA+DCQvgjsKE6FW+
	 iqU2XKXWzVuq80lwetE5frXFzhvoPAfm6jC9x/PtFzwLBvWprv91/DbshkSvpjsFpu
	 u5ow+mJarTQ8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vdbbl3M3xz4wc8;
	Tue, 14 May 2024 09:41:22 +1000 (AEST)
Date: Tue, 14 May 2024 09:41:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jens Axboe <axboe@kernel.dk>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: linux-next: manual merge of the block tree with the mm tree
Message-ID: <20240514094120.0ae75f3a@canb.auug.org.au>
In-Reply-To: <20240402112746.3864d8a6@canb.auug.org.au>
References: <20240402112746.3864d8a6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7/k1p.dO.hCk7Kr1E/R2SWx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7/k1p.dO.hCk7Kr1E/R2SWx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 2 Apr 2024 11:27:46 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the block tree got a conflict in:
>=20
>   io_uring/io_uring.c
>=20
> between commit:
>=20
>   d3329b3a9d72 ("mm: switch mm->get_unmapped_area() to a flag")
>=20
> from the mm-unstable branhc of the mm tree and commit:
>=20
>   624d801ce45b ("io_uring: move mapping/allocation helpers to a separate =
file")
>=20
> from the block tree.
>=20
> I fixed it up (I used the latter version of this file and applied the
> following merge fix patch) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 2 Apr 2024 11:25:46 +1100
> Subject: [PATCH] fix up for "mm: switch mm->get_unmapped_area() to a flag"
>=20
> from the mm tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  io_uring/memmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/io_uring/memmap.c b/io_uring/memmap.c
> index acf5e8ca6b28..5c9e70132cd1 100644
> --- a/io_uring/memmap.c
> +++ b/io_uring/memmap.c
> @@ -302,7 +302,7 @@ unsigned long io_uring_get_unmapped_area(struct file =
*filp, unsigned long addr,
>  #else
>  	addr =3D 0UL;
>  #endif
> -	return current->mm->get_unmapped_area(filp, addr, len, pgoff, flags);
> +	return mm_get_unmapped_area(current->mm, filp, addr, len, pgoff, flags);
>  }
> =20
>  #else /* !CONFIG_MMU */
> --=20
> 2.43.0

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/7/k1p.dO.hCk7Kr1E/R2SWx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZCpSAACgkQAVBC80lX
0Gw29Af/bx/BTlz7Sk4WnkwezV2xiB4icZ1Fi2BTQX67Ta0Ptgkuhcy5zrgOn1jy
/Qow6hdDC/5b7XNm6+IOj7p79HoMecpmKM6h2oIWwfbg5fk+Hd7nP0CBuhjAt6B8
YoZJeMAWCaz0S00zNj3gamyKfhxsCDPFSmGNBRNuoLcn6B600xdEmcssi6zsz/4M
omd2+KFIWP+CD4IERrCjedLH5+2sJook3WdO9aezxk9Y7+XI80r6Jdo2xbKNwM0g
I8iqPBngkguTNMC5xDbIz5zY19QMGCd92d+avx9LASbFb2Yrwy/AboMrp09XAJja
tMifuhrWKHCr8soUd4+4DdzXd921Yg==
=RQ6q
-----END PGP SIGNATURE-----

--Sig_/7/k1p.dO.hCk7Kr1E/R2SWx--

