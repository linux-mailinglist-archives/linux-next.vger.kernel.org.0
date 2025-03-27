Return-Path: <linux-next+bounces-6033-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17749A727ED
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 01:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 938E816AF67
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 00:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0606D528;
	Thu, 27 Mar 2025 00:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tjPfeI6e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E343C2C8;
	Thu, 27 Mar 2025 00:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743036852; cv=none; b=gw3aTsZlct+UCwDiUD1LVTO2XYnoDkjsIwM1j0WemGt3DSCXVwtva20Iweaxr++8V7/2lt9TqgDu68Iw1DVUICaHYkJrFoXKSHvTBWNnMFndQ9PDjyaHxR2fm2FEK80d6sztb7ZSiE1PLpCJmUl7ZyuBGxvHz3f3wd9xxVNkZMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743036852; c=relaxed/simple;
	bh=L+6ogoi4NO41UQnP8geqYxTPISm+Am2nckYILgUZcRk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uud0xVQZybOcYQLV8k/75BUrS+hcAlBQtUn89hJf5v1GOHjwk/O9FitZTCMJvuNVHQDZWuoTDKtyF7MEAIWyb38dy0cNY+CnnxMZc2c9pklHnPW5p1uTPR5g+8r0xKTRaXB+pBx/LWFHyqmJXZbCEUDoAydkZ4nYUUsftCrPZ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tjPfeI6e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743036845;
	bh=7yr9Lo9Y0VL/znkYjRiW27oh92p+2n/KuTKZoC+L5xE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tjPfeI6eMO9duLM/AqOmDmR66ixlBwa2KWO5yqRN+Gbua6/eGLaLr8849p8OEkz+r
	 7HyZXn4xeYuGpoWQGUBf3Is1+Jsz1IeydqxBAh5FLEa+GN40SP8b8UKox1yyctcA3+
	 Zhkt+14YM/dsAEWsOOgfYbNPoq/FR9GEoWWdZIdhRT3K5SFlr5bIjaqL8P12NgU9zM
	 a0DvJbFDFFOmYemtAcuIrXo8WiXif/qyFE/fAXff/jbmUViFuMgzHRpttwH9bayPi/
	 m7k1Ds1ioScF3tuKwSu627lXNyZF7KPR/fiKVUy5iKPMjHcTdJQjNnRvmhDOumOLbd
	 5pIySA06JW+ww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZNQCK0CMRz4wcd;
	Thu, 27 Mar 2025 11:54:04 +1100 (AEDT)
Date: Thu, 27 Mar 2025 11:54:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Uros Bizjak <ubizjak@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bcachefs tree
Message-ID: <20250327115403.039e8638@canb.auug.org.au>
In-Reply-To: <20250326132819.30db65e7@canb.auug.org.au>
References: <20250326132819.30db65e7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E2DiHvhfyTb2Q2/i1KL72_K";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/E2DiHvhfyTb2Q2/i1KL72_K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 26 Mar 2025 13:28:19 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the bcachefs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> fs/bcachefs/time_stats.c: In function 'bch2_time_stats_reset':
> fs/bcachefs/time_stats.c:165:27: error: comparison of pointers to disjoin=
t address spaces
>   165 |             stats->buffer !=3D TIME_STATS_NONPCPU) {
>       |                           ^~
> fs/bcachefs/time_stats.c: In function 'bch2_time_stats_exit':
> fs/bcachefs/time_stats.c:175:27: error: comparison of pointers to disjoin=
t address spaces
>   175 |         if (stats->buffer !=3D TIME_STATS_NONPCPU) {
>       |                           ^~
> fs/bcachefs/time_stats.c: In function 'bch2_time_stats_init_no_pcpu':
> fs/bcachefs/time_stats.c:192:23: error: assignment from pointer to non-en=
closed address space
>   192 |         stats->buffer =3D TIME_STATS_NONPCPU;
>       |                       ^
> fs/bcachefs/time_stats.c:192:23: note: expected '__seg_gs struct time_sta=
t_buffer *' but pointer is of type 'struct time_stat_buffer *'
>=20
> Caused by commit
>=20
>   5490554cf06f ("bcachefs: bch2_time_stats_init_no_pcpu()")
>=20
> interacting with commit
>=20
>   6a367577153a ("percpu/x86: enable strict percpu checks via named AS qua=
lifiers")
> (or an associated one)
>=20
> from the mm-stable tree.
>=20
> I have applied the following merge fix patch for today (but I think it
> could just be applied to the bcachefs tree).
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 26 Mar 2025 13:15:00 +1100
> Subject: [PATCH] fix up for "bcachefs: bch2_time_stats_init_no_pcpu()"
>=20
> interacting with "percpu/x86: enable strict percpu checks via named AS qu=
alifiers"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/bcachefs/time_stats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/bcachefs/time_stats.c b/fs/bcachefs/time_stats.c
> index a8382d876835..b16540aa9ca4 100644
> --- a/fs/bcachefs/time_stats.c
> +++ b/fs/bcachefs/time_stats.c
> @@ -11,7 +11,7 @@
>  #include "time_stats.h"
> =20
>  /* disable automatic switching to percpu mode */
> -#define TIME_STATS_NONPCPU	((struct time_stat_buffer *) 1)
> +#define TIME_STATS_NONPCPU	((struct time_stat_buffer __percpu *) 1)
> =20
>  static const struct time_unit time_units[] =3D {
>  	{ "ns",		1		 },
> --=20
> 2.45.2

This now fails like this:

fs/bcachefs/time_stats.c: In function 'bch2_time_stats_init_no_pcpu':
fs/bcachefs/time_stats.c:190:23: error: assignment from pointer to non-encl=
osed address space
  190 |         stats->buffer =3D (struct time_stat_buffer __rcu *) TIME_ST=
ATS_NONPCPU;
      |                       ^
fs/bcachefs/time_stats.c:190:23: note: expected '__seg_gs struct time_stat_=
buffer *' but pointer is of type 'struct time_stat_buffer *'

I have now )instead of the above) applied the following merge fix patch (wh=
ich should be able to be applied to the bcachefs tree directly):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 27 Mar 2025 11:42:11 +1100
Subject: [PATCH] fix up 2 for "bcachefs: bch2_time_stats_init_no_pcpu()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/bcachefs/time_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/time_stats.c b/fs/bcachefs/time_stats.c
index 725d433a246f..2c34fe4be912 100644
--- a/fs/bcachefs/time_stats.c
+++ b/fs/bcachefs/time_stats.c
@@ -187,5 +187,5 @@ void bch2_time_stats_init(struct bch2_time_stats *stats)
 void bch2_time_stats_init_no_pcpu(struct bch2_time_stats *stats)
 {
 	bch2_time_stats_init(stats);
-	stats->buffer =3D (struct time_stat_buffer __rcu *) TIME_STATS_NONPCPU;
+	stats->buffer =3D (struct time_stat_buffer __percpu *) TIME_STATS_NONPCPU;
 }
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/E2DiHvhfyTb2Q2/i1KL72_K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfkoasACgkQAVBC80lX
0GybWgf/ZD0j5W/I2ykPCzOJnhYLR7/bhHlUM7LoAxL97o5BtFm2Y4m73Bh6Z8SM
74FT68+Wb1gX9vQvHFX+pbNzyYLM9I3AhFmsa2xqktUX4d2GCjJUYbrnbGQKKFQe
PKuxIVXcsK/YZYw8KBGDXUVWTUrVSyaZ4Y4hOrrGFr2g7Y4yCbXdSHryDjmUNfrX
Poh+gblAPBcJidwEXtXAtW1VEDONO72m88vwDdfjoYyIf6dDS5//xQIxIV7Nlay2
hLim+UdM/o6g9Jk6CWDDn1aaQldoobQQioBkLgEkLMYGBiiMd1SwZXR02dPDVsss
uagE2XZLe0L7wGukGLoWixylo/N77Q==
=YDym
-----END PGP SIGNATURE-----

--Sig_/E2DiHvhfyTb2Q2/i1KL72_K--

