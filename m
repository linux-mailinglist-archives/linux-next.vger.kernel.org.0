Return-Path: <linux-next+bounces-5278-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5E6A1789E
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 08:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB15A16535A
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 07:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C701A2658;
	Tue, 21 Jan 2025 07:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ON8oavsI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C59E2E406;
	Tue, 21 Jan 2025 07:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737445168; cv=none; b=s61uINB+vo2lvcmMKqcahUXSqhcCXLRr4cyiAep/I8LcEkK53Ec2bFpfCc+6+w6Bh0u6OJoJjktig3zGifC82zbOi1p7ZMWtfUpgxt5rejaFRV54zgpHuLESdNQR75CDOIR54S9RsbfQSMpm1+VXD0+QhfNx7qk5C6Yh2B9bC1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737445168; c=relaxed/simple;
	bh=tYvpctSgcorLbdiJc50qeoHG+VlnI17wI0rEQsQiey0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y7qSPESj/MY4NbxoEzOfaUHStcKLH57AZPEn+s83Q5HA/MMQ7i+YfW0br/lhFUF9oiXlVXd6FGlrTBOWwuPHcw5yfC8jZpDSiWzPp37Y1e7r92PbH0mzsgSEAABTi6iHr+Cib43WPqSdywgHbl+jZiMggUYy3KddYLg6mFDSLPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ON8oavsI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737445155;
	bh=3emuC3l+hVYUJSxGhO69XR7+1fqRaPiP1GK6oD0i4k4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ON8oavsIvqxYSo3KQAaWtoxpErmLt/LlUKR0a7BwD6P7Y3EP03i4ixmIdDaOxsALK
	 9tkqS0CFsTG2sLrftuiU9O7qonpv9fSCrQvOxxqx+zyn5qDf3RTRgNZAkFo1ZjP2Qu
	 Xcyr2XcsvphbcPwkflPdCSTT3GoErU3+ASxtw1JgN5z1f7WjpR3FRiLe+C7rSGkR85
	 UcITNqjZKq3r4yTtGA7z7juTORgZqiNWYEEMQMaZpR+rty4L4Mq4gMUI16nCSobznD
	 7lZ0WVM1wF8kvy5WzujXQnNNws1rBGfYBOnQg61ek2t7UDasgYV8V8Hwsn2fP3YM3k
	 vzKcPcsMXwPig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YcfGp5QdHz4x2c;
	Tue, 21 Jan 2025 18:39:14 +1100 (AEDT)
Date: Tue, 21 Jan 2025 18:39:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>,
 Luiz Capitulino <luizcap@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20250121183922.48b19f85@canb.auug.org.au>
In-Reply-To: <20250110124406.17190e3a@canb.auug.org.au>
References: <20250110124406.17190e3a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rZDfjjYNN4LXNx1_zk1yTIQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rZDfjjYNN4LXNx1_zk1yTIQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 10 Jan 2025 12:44:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the block tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> io_uring/memmap.c: In function 'io_region_allocate_pages':
> io_uring/memmap.c:173:24: error: implicit declaration of function 'alloc_=
pages_bulk_array_node'; did you mean 'alloc_pages_bulk_node'? [-Wimplicit-f=
unction-declaration]
>   173 |         nr_allocated =3D alloc_pages_bulk_array_node(gfp, NUMA_NO=
_NODE,
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                        alloc_pages_bulk_node
>=20
> Caused by commit
>=20
>   1e21df691ffa ("io_uring/memmap: implement kernel allocated regions")

That commit is now in Linus' tree.

> interacting with commit
>=20
>   4f6a90a13f78 ("mm: alloc_pages_bulk: rename API")

That is now commit

  8c3cbdcf4d82 ("mm: alloc_pages_bulk: rename API")

in the mm-stable tree.

> I have applied the following merge fix up patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 10 Jan 2025 12:40:38 +1100
> Subject: [PATCH] fix up for "io_uring/memmap: implement kernel allocated
>  regions"
>=20
> interacting with "mm: alloc_pages_bulk: rename API" from the mm tree
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  io_uring/memmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/io_uring/memmap.c b/io_uring/memmap.c
> index dda846190fbd..361134544427 100644
> --- a/io_uring/memmap.c
> +++ b/io_uring/memmap.c
> @@ -170,8 +170,8 @@ static int io_region_allocate_pages(struct io_ring_ct=
x *ctx,
>  		goto done;
>  	}
> =20
> -	nr_allocated =3D alloc_pages_bulk_array_node(gfp, NUMA_NO_NODE,
> -						   mr->nr_pages, pages);
> +	nr_allocated =3D alloc_pages_bulk_node(gfp, NUMA_NO_NODE,
> +					     mr->nr_pages, pages);
>  	if (nr_allocated !=3D mr->nr_pages) {
>  		if (nr_allocated)
>  			release_pages(pages, nr_allocated);
> --=20
> 2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/rZDfjjYNN4LXNx1_zk1yTIQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmePTyoACgkQAVBC80lX
0Gy1zAf/WynbnRTfH7SAuONlSmL5ZMvF5XOWcdA46PwEI2aQK89RQVcgH/8ovlt3
FGSI19LEvkn7LBtjXGqs1auI/smls1Ldc+cIo6dIUsfb+hbbbaUs977+l8iUl+xZ
f+tQogGLFAiEbpTgHIvUHhCKHTfequLyQuAO1/kFhd+hINAs4RMdGQ4Xk/tcnSxU
jDdjB8eXnx45vjdvgC5UUTsI5ylUQvh/vehyHyf3h+/aqNjycSGUqoQaRmoqpneZ
HyDPYfL0VnJmi8C3vR6aJv9vmNO4J4HUpJ2x/V34502o5SGVwY4vZt+C8VpQW48c
kan1QM8jDDgcnsgwqXUSdsnJRa8J2w==
=6YZI
-----END PGP SIGNATURE-----

--Sig_/rZDfjjYNN4LXNx1_zk1yTIQ--

