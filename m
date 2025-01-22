Return-Path: <linux-next+bounces-5290-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C72A18A64
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 04:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2735A16A823
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2025 03:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DEE481B1;
	Wed, 22 Jan 2025 03:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SoWzslVS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69EC1392;
	Wed, 22 Jan 2025 03:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737515925; cv=none; b=P9ZtVQ3UpKkIuhmXQLfXFCxkB/jdrtlxK0P6Tby6CfJ0N3RdIi6KihsRD/xsys0LOuBL8THRI/BEuA1Ex0CWsrfVEN9y+Z1IjE67ZizEpjs75hvxB96881/Mt2ln38qq9YwwD8oOwvbKyEzFdPH55BOCuy/acHWtGRyv8HC8zFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737515925; c=relaxed/simple;
	bh=X2Z1KCJqcNUYRqe/diPaD+lV706OVXvL4ZVFhL1+n2U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sO0zUmm2sB7Rvx3y9Rz4/e/4aAYsFqhY3UEZplqZaZ2tOFPggN7cd62+Twz6zTOGic0L38BRX1RBED0Xd4NWKr7XticeFwiZj7R1CAQ9fczkBOGfk5qs3dpCUyTgjYcMbep+HJTNtto3701KIOulvvzaFKkSkfHOxP21XI1BEHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SoWzslVS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737515912;
	bh=b2nyFgU3IyZU/7NaS7RQ1z2K/+DxtDayGpazRQy2JqE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SoWzslVSEO6wfxhorj5Z0ECKIpF0xUZZeQCBpZDKKv7567tWKyiRHYhE8goAQZ0dI
	 La3+mgDm9lTWy86I88ShJLgIcAzVvVcCr5cXOGwrMJMhBS/UVfxsugXPbLY43IRDPG
	 1Keo4sWzTYF6QXpdmEmXG8HG0/nO31K1JtE3Nd4is3SIARuPRXyc8QPWXIik0jzYoW
	 +CnNL6aIeAAJ7nTesKuJnk8PeFz9HvwRUfhJuEY4+iRBuE8PJe7KhQ3A/xbaRQMMJo
	 N4z9VnohU4c3k2ov8h9vuVBYjqUbraOJeYg9lVEcJPW6tigGW40oie7BJREaZinEQW
	 OfhaBXDYnCAnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yd8RX4GpRz4x5r;
	Wed, 22 Jan 2025 14:18:32 +1100 (AEDT)
Date: Wed, 22 Jan 2025 14:18:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Subject: Re: linux-next: manual merge of the slab tree with the mm tree
Message-ID: <20250122141839.6764f7c2@canb.auug.org.au>
In-Reply-To: <20241216152721.15c5864d@canb.auug.org.au>
References: <20241216152721.15c5864d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QbtoUzIKjX._evaHY6rRgx0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QbtoUzIKjX._evaHY6rRgx0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Dec 2024 15:27:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the slab tree got a conflict in:
>=20
>   kernel/rcu/tree.c
>=20
> between commit:
>=20
>   e20b770a87b4 ("kasan: make kasan_record_aux_stack_noalloc() the default=
 behaviour")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   c44d336ad5ba ("mm/slab: Move kvfree_rcu() into SLAB")
>=20
> from the slab tree.
>=20
> I fixed it up (I used the former and applied the following patch) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 16 Dec 2024 15:23:41 +1100
> Subject: [PATCH] fix up for "mm/slab: Move kvfree_rcu() into SLAB"
>=20
> interacting with commit
>=20
> "kasan: make kasan_record_aux_stack_noalloc() the default behaviour"
>=20
> form the mm tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  mm/slab_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index 69f2d19010de..4030907b6b7d 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -1944,7 +1944,7 @@ void kvfree_call_rcu(struct rcu_head *head, void *p=
tr)
>  		return;
>  	}
> =20
> -	kasan_record_aux_stack_noalloc(ptr);
> +	kasan_record_aux_stack(ptr);
>  	success =3D add_ptr_to_bulk_krc_lock(&krcp, &flags, ptr, !head);
>  	if (!success) {
>  		run_page_cache_worker(krcp);
> --=20
> 2.45.2

This is now a conflict between the mm-stable tree and Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/QbtoUzIKjX._evaHY6rRgx0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeQY48ACgkQAVBC80lX
0Gy73Af/aHb7/6WTBxcF50+/W/AX+uVAEx7CcQYrsCL02TDK9rYAoMJqUDAMZwPC
L+pk3SYrkltUFVoPmJNaFf8vpzneuKQIRq58WwiRWO7uFsFPjR/d19GdCkm2PWci
t25OPsg5zC1P6x5gFpC2/iuw2eLFm+WhHq5NqhmQ/G/TOyopW2OAbyh1Gf/38IKw
mUYnYIS+FzfDhZTGojwTQbner8/nxJoA32sfll6ZDCPQWiJGtXmyBvROhDTjHKGU
De7RjBnSb+ZLIItdNIh8Hw6ZZNfkzfX+EBMoOXxoMGh8nxtRAe1LDMU9H6O5bAJb
aEeyw73Lf2HCJeeZPIJPX33tllPflQ==
=C9ZH
-----END PGP SIGNATURE-----

--Sig_/QbtoUzIKjX._evaHY6rRgx0--

