Return-Path: <linux-next+bounces-3899-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C37ED97B63C
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 01:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 700F51F22E87
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 23:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DEB176FA1;
	Tue, 17 Sep 2024 23:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ARGHAbHK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB65174EFA;
	Tue, 17 Sep 2024 23:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726616266; cv=none; b=d4outlBM8HntT2RXas+u0AcFkAmLrlFsxuB0N3KuEjlO6yTLJDCDZu+bu5BGq2U2I4WLBuwG+IwtZUX2JVuFn4g+HDoZYnrbqmLEweolcFuIOqmIoxew0/dKcgkpWrk3us1c1Q7M6ss+pEV+mzgi+iQ9LYmMbpD4PmKmDpbAxlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726616266; c=relaxed/simple;
	bh=IeQGCcYzD8Cb2a3HoWYEbAeSnkkf4gpNrRD9gJg7Itc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RyRJOuSzXq1xxtCUHKgLg/i6w/YhX3xsAfRtcvdFQoQTDVp7gGodZUrvgIWY5HiHzot6fYVMQFRbE0zg5PdQTUIusg3HJyPMzM9kZGveMM7tGJRiSPQB6+JQtJgebmb0GlpdHBxp/PHzxsISeof29ye5d012uF/k61z39glF5kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ARGHAbHK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726616253;
	bh=9K1Jwj7VRe6zoUK4rOxE26mm0OV3ZJlbf/JGUPe9vfI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ARGHAbHKT9b5IJnNDyIllzMQgxato/oh5fTQ0g3gnh50ckUZn2QXSK8uXMlT7U7lg
	 h1k9g3t9rIWvD2gPjl+ggC1Ccusnn+navJIxDqsMVI9PMiXDlXAEeoNbPV9aRbYR8o
	 5NrcuHirVRh1P7PIFmXo5iwadQPvirTI0ztlqYAKqXIgmcMm3ztTdnmArSSmUJpYov
	 2rptdk2CePK3MKMFA5Ze7P9ugGCmu6Y57y1ORbOtLblUTEGXoPpWoTiyppOEcIwyI7
	 sYGs2MkETqJeVKBjUxaXJrF7rqZTY6AvaxrRCLSkJngcwScxgIUF014Ca88yUM77GD
	 Ui4ktX765UGog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7dVj3nRxz4xbv;
	Wed, 18 Sep 2024 09:37:33 +1000 (AEST)
Date: Wed, 18 Sep 2024 09:36:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Huang, Ying" <ying.huang@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the mm tree with Linus' tree
Message-ID: <20240918093643.1662ccab@canb.auug.org.au>
In-Reply-To: <20240909100043.60668995@canb.auug.org.au>
References: <20240909100043.60668995@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Sb22zYFhbnog4DN6M18=2IO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Sb22zYFhbnog4DN6M18=2IO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 9 Sep 2024 10:00:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the mm tree got a conflict in:
>=20
>   kernel/resource.c
>=20
> between commit:
>=20
>   ea72ce5da228 ("x86/kaslr: Expose and use the end of the physical memory=
 address space")
>=20
> from Linus' tree and commit:
>=20
>   e2941fe697c8 ("resource, kunit: add test case for region_intersects()")
>=20
> from the mm-unstable branch of the mm tree.
>=20
> I fixed it up (I just used the former - and see below) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
>=20
> diff --cc kernel/resource.c
> index 1ac30110b5b3,2ee143fff1af..000000000000
> --- a/kernel/resource.c
> +++ b/kernel/resource.c
> @@@ -1817,8 -1859,18 +1859,12 @@@ EXPORT_SYMBOL(resource_list_free)
>   #ifdef CONFIG_GET_FREE_REGION
>   #define GFR_DESCENDING		(1UL << 0)
>   #define GFR_REQUEST_REGION	(1UL << 1)
> - #define GFR_DEFAULT_ALIGN (1UL << PA_SECTION_SHIFT)
> + #ifdef PA_SECTION_SHIFT
> + #define GFR_DEFAULT_ALIGN	(1UL << PA_SECTION_SHIFT)
> + #else
> + #define GFR_DEFAULT_ALIGN	PAGE_SIZE
> + #endif
>  =20
>  -#ifdef MAX_PHYSMEM_BITS
>  -#define MAX_PHYS_ADDR		((1ULL << MAX_PHYSMEM_BITS) - 1)
>  -#else
>  -#define MAX_PHYS_ADDR		(-1ULL)
>  -#endif
>  -
>   static resource_size_t gfr_start(struct resource *base, resource_size_t=
 size,
>   				 resource_size_t align, unsigned long flags)
>   {

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Sb22zYFhbnog4DN6M18=2IO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbqEosACgkQAVBC80lX
0GxZhwf+Pjhc05xgK+zqM0QQ/bfBXlX3Jzh6uwNfljvr60dv8JAplJ4IO6yIT09+
Nhb8wwYP1vDmYBvY4up/f5ggYhWWMOzg3/TsGVX05zzdNbcVpj9Zr/v/2LAt6Mrr
TxoXlYwtArR8Je7t6cyLjAPQDcXip/lALyJXakefKIB0NFLwlH42D/HKSsfKyNJt
3zEld2NtuzDSzerFxiOoxQ4uWWR4chJm9fSjWGOV1AqtAzREWLQqNGjCv+cd8sKq
RxLUDqByBQNonSZOIFatY5EQL04HXkxKTk1ay+JX9YXFvIYmI8ISTbR6dqhD/0aM
F735CWBlPd0Zk9Nji7Oh+oRjIuuRhA==
=eB6x
-----END PGP SIGNATURE-----

--Sig_/Sb22zYFhbnog4DN6M18=2IO--

