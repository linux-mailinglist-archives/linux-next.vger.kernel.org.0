Return-Path: <linux-next+bounces-3750-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 023E2974C38
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 10:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD4D9B21F7B
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 08:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC48214A4C5;
	Wed, 11 Sep 2024 08:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="liF8U9rN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7247E137772;
	Wed, 11 Sep 2024 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726042205; cv=none; b=sAQWIsMRDYk1Nxy6CZ8lXDQGap8Crg2dLYW0UeMGxdRaqDOiZWTxgurfUD7ljhSq5DKXsMcYqVIfmOCspLouM7jaeMOVYq+7XQ/qByACnnYgwhJjkVml0CZ5eq+iyfPFe1AjhmfkttfFbLThgCSbDOuLUCUKej/WaNKdlHKrmds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726042205; c=relaxed/simple;
	bh=vXEUwXUzgoRd8b9tA21Z0XfB4IfJKQxAWmR6hDpgMQI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rji7B+ZqLMuxPKpAQ7GHPar0uh0fdxf6X57GhUP7vcdz//bw4KppUc/jN2n3FjZMPeEtK9gbjRpbWP64jS1rvG6lhF0HqB35vJSKgqjV65tkZXnRyvPzszPVnXbVG0BpU/+hXn7TYNr+GrbvfAt5quTNO/rNQN5Bm8ySC3jlBlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=liF8U9rN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726042200;
	bh=J92WU9tGhjrjxwGVX33KwIAeP4ckNqFHcn2BPZpwao0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=liF8U9rNIXoFROWMBdfTebkiRsiwH7qFHZlm0Z2/5BcqD2Oaw7IIDYRcuv1T9nxdg
	 0ay9RMeWNqL+mU0kUnXUmUXzSjZpwktzZ6U9f35fgLS0yCQMOD8DPCtA1BGNqtwPJx
	 vdBYYWFzI6rWlVDCWkrnxo7gSmfH3lknHV/OhjcesEBVhLHNJw9ENkjF7LlpVo9yHm
	 n0eji7D0bdDDHFbjSM77FC7Yw1dYDp7HvJ2ERDmqOnHi/5WDveukuw76D/O5qtz+L0
	 DZNjY3f6Uo3f0TKleW0+uvNRqGRDGOX79NzB9aEorVnI1E11SgiR1NhuTcc2J0GrmG
	 nG8148LMjOwXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3YCD1mp2z4x0K;
	Wed, 11 Sep 2024 18:10:00 +1000 (AEST)
Date: Wed, 11 Sep 2024 18:09:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the s390 tree
Message-ID: <20240911180959.12c4ad6b@canb.auug.org.au>
In-Reply-To: <20240808135836.740effac@canb.auug.org.au>
References: <20240808135836.740effac@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Oa2.UPR02sxOHGxv18Ds5=X";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Oa2.UPR02sxOHGxv18Ds5=X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Just a reminder for the upcoming merge window ...

On Thu, 8 Aug 2024 13:58:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the s390 tree, today's linux-next build (s390 defconfig)
> failed like this:
>=20
> In file included from include/linux/percpu.h:5,
>                  from include/linux/percpu_counter.h:14,
>                  from include/linux/mm_types.h:21,
>                  from include/linux/ptdump.h:6,
>                  from arch/s390/mm/dump_pagetables.c:3:
> arch/s390/mm/dump_pagetables.c: In function 'add_marker':
> include/linux/slab.h:848:61: error: too many arguments to function 'kvrea=
lloc_noprof'
>   848 | #define kvrealloc(...)                          alloc_hooks(kvrea=
lloc_noprof(__VA_ARGS__))
>       |                                                             ^~~~~=
~~~~~~~~~~~
> include/linux/alloc_tag.h:206:16: note: in definition of macro 'alloc_hoo=
ks_tag'
>   206 |         typeof(_do_alloc) _res =3D _do_alloc;                    =
         \
>       |                ^~~~~~~~~
> include/linux/slab.h:848:49: note: in expansion of macro 'alloc_hooks'
>   848 | #define kvrealloc(...)                          alloc_hooks(kvrea=
lloc_noprof(__VA_ARGS__))
>       |                                                 ^~~~~~~~~~~
> arch/s390/mm/dump_pagetables.c:259:27: note: in expansion of macro 'kvrea=
lloc'
>   259 |                 markers =3D kvrealloc(markers, oldsize, newsize, =
GFP_KERNEL);
>       |                           ^~~~~~~~~
> In file included from include/linux/fs.h:45,
>                  from include/linux/seq_file.h:11,
>                  from arch/s390/mm/dump_pagetables.c:4:
> include/linux/slab.h:846:7: note: declared here
>   846 | void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
>       |       ^~~~~~~~~~~~~~~~
> include/linux/slab.h:848:61: error: too many arguments to function 'kvrea=
lloc_noprof'
>   848 | #define kvrealloc(...)                          alloc_hooks(kvrea=
lloc_noprof(__VA_ARGS__))
>       |                                                             ^~~~~=
~~~~~~~~~~~
> include/linux/alloc_tag.h:206:34: note: in definition of macro 'alloc_hoo=
ks_tag'
>   206 |         typeof(_do_alloc) _res =3D _do_alloc;                    =
         \
>       |                                  ^~~~~~~~~
> include/linux/slab.h:848:49: note: in expansion of macro 'alloc_hooks'
>   848 | #define kvrealloc(...)                          alloc_hooks(kvrea=
lloc_noprof(__VA_ARGS__))
>       |                                                 ^~~~~~~~~~~
> arch/s390/mm/dump_pagetables.c:259:27: note: in expansion of macro 'kvrea=
lloc'
>   259 |                 markers =3D kvrealloc(markers, oldsize, newsize, =
GFP_KERNEL);
>       |                           ^~~~~~~~~
> include/linux/slab.h:846:7: note: declared here
>   846 | void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
>       |       ^~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   d0e7915d2ad3 ("s390/mm/ptdump: Generate address marker array dynamicall=
y")
>=20
> interacting with commit
>=20
>   d4a913add37d ("mm: kvmalloc: align kvrealloc() with krealloc()")
>=20
> from the mm-unstable branch of the mm tree.
>=20
> I have applied the following merge fix patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 8 Aug 2024 13:50:39 +1000
> Subject: [PATCH] fixup for "s390/mm/ptdump: Generate address marker array=
 dynamically"
>=20
> interacting with "mm: kvmalloc: align kvrealloc() with krealloc()"
> from the mm tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/s390/mm/dump_pagetables.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/s390/mm/dump_pagetables.c b/arch/s390/mm/dump_pagetable=
s.c
> index 9e2dc42143b3..fa54f3bc0c8d 100644
> --- a/arch/s390/mm/dump_pagetables.c
> +++ b/arch/s390/mm/dump_pagetables.c
> @@ -256,7 +256,7 @@ static int add_marker(unsigned long start, unsigned l=
ong end, const char *name)
>  	if (!oldsize)
>  		markers =3D kvmalloc(newsize, GFP_KERNEL);
>  	else
> -		markers =3D kvrealloc(markers, oldsize, newsize, GFP_KERNEL);
> +		markers =3D kvrealloc(markers, newsize, GFP_KERNEL);
>  	if (!markers)
>  		goto error;
>  	markers[markers_cnt].is_start =3D 1;
> --=20
> 2.43.0

--=20
Cheers,
Stephen Rothwell

--Sig_/Oa2.UPR02sxOHGxv18Ds5=X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhUFcACgkQAVBC80lX
0Gxxswf9F8u8k+x7hZfh2iG9ZH9OpjWIzebTh1a7qpm8zPCyL94mK1EQukT3VTWo
pil3oOwkyNfwaWmadkvs7DtwXVoVYNYln8eTnrtTRVfjMqof6Mih9j/4IeUHxazQ
7R0mvbPwSZ0w9DRxtP8OzY3TvqmPB7JIUcgbCZScyY9Bhi9bf7YwzRVa+3loePK5
aBV3H6iIN8xCUSe6ZEU0lrsiNIpYQBSYDY81RFEpOV6lh+WWMv6urM4QOEs+vLlb
VKaI73xvSIcR5Ro3eZtE1LaVqEW9iBaTw2GZQd4lm0VkAZKxrOqO2YIQpN7t4k6B
VR2O8u6sonvAM3awpHD63Jvp5ieAUQ==
=4Dej
-----END PGP SIGNATURE-----

--Sig_/Oa2.UPR02sxOHGxv18Ds5=X--

