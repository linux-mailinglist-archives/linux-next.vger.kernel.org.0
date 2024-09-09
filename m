Return-Path: <linux-next+bounces-3672-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB7297114F
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 10:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6401F1F25BE1
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 08:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494D81B29A6;
	Mon,  9 Sep 2024 08:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uRuZDr0/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F3E1B2516;
	Mon,  9 Sep 2024 08:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725869442; cv=none; b=Zlv9poDZrxvrS6lbXBBn8j7XMvcPswbLqeocFD+Y09NrsO9ocmyn2dUQbw/qJdNDX0KtJJZ1ikGPbgaFKoFE6CKNfviqJrVCRbKDA1jFV11ohuP8j111Sx+JvPMQv8bB4+nrzHq9Wli9QkOfhVn5BYqdUzAw8wEIIBjZpCJU8lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725869442; c=relaxed/simple;
	bh=9LHgfDAg+Hee2VTxF73KY2GZYBImyoxKWr8WsCkE/sI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FplJBknVce0xR/smkRdcryhL06fpFtnXvyuJgWKz9pICzgLfMgi0FwpWmjU6h8KNtms+Y21dEdESQzpdZzsMpvluQQVrY6m/HUEubeaFwRzNelRnBdPYd1Mgawz6rR0aF+D4ew/GHnu5UqNmz0IOEJQPa3U4tNn5gSUhVS1sk74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uRuZDr0/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725869436;
	bh=c64sgUaPxLkd9MDHPmZOaK4Me9snX78MEr6ILXuo9Uw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uRuZDr0/wUlOPMSO4KXtBImmYjlRQ4ionUl0vPs4717aNtgZsTKd4kqKUDQ8c775W
	 4RiJGSdyZsdseMhJkOzjEGBVx2knN49TJCTZ5b9nmQy5GBJUb792fad/S6tBGGURvX
	 WYa2+8aauFNMYCgZLpZmVnXGGcxFiLCOnSDEiC8y5qXd1ZlixaVX8zMv+TfdIVQiyS
	 ATr00P6Ugcmqj7ITSEI/HKQ1rIrtGHk21OB7lKY6s1NPkTVteilT+XJK8Xlx5TeG2+
	 DReqezUJ9JQOb/3slTjgBQ5U8HMtS7doqVr3lMJtQ8C2+FyBGO/g946a3ozBpUaKJP
	 qbghSHjHnzt1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2KJr3xm6z4x21;
	Mon,  9 Sep 2024 18:10:36 +1000 (AEST)
Date: Mon, 9 Sep 2024 18:10:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>, Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the slab tree
Message-ID: <20240909181035.4ffd7434@canb.auug.org.au>
In-Reply-To: <20240909171220.32e862e3@canb.auug.org.au>
References: <20240909171220.32e862e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/63xXhraSpsUr0eRc8xSa6KN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/63xXhraSpsUr0eRc8xSa6KN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 9 Sep 2024 17:12:20 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> The following commits are also in the vfs-brauner tree as different
> commits (but the same patches):
>=20
>   c0390d541128 ("fs: pack struct file")
>   ea566e18b4de ("fs: use kmem_cache_create_rcu()")
>   d345bd2e9834 ("mm: add kmem_cache_create_rcu()")
>   e446f18e98e8 ("mm: remove unused argument from create_cache()")
>   0f389adb4b80 ("mm: Removed @freeptr_offset to prevent doc warning")
>=20
> These are commits
>=20
>   f2b8943e64a8 ("fs: pack struct file")
>   d1e381aa30cb ("fs: use kmem_cache_create_rcu()")
>   ba8108d69e5b ("mm: add kmem_cache_create_rcu()")
>   a85ba9858175 ("mm: remove unused argument from create_cache()")
>   6e016babce7c ("mm: Removed @freeptr_offset to prevent doc warning")
>=20
> in the vfs-brauner tree.
>=20
> These duplicates are causing unnecessary comflicts ...

So, maybe my merge resolutions were not sufficient, because that then
failed to build (powerpc ppc64_defconfig):

mm/slab_common.c: In function 'create_cache':
mm/slab_common.c:238:13: error: 'freeptr_offset' undeclared (first use in t=
his function); did you mean 'freeptr_t'?
  238 |         if (freeptr_offset !=3D UINT_MAX &&
      |             ^~~~~~~~~~~~~~
      |             freeptr_t
mm/slab_common.c:238:13: note: each undeclared identifier is reported only =
once for each function it appears in
mm/slab_common.c: At top level:
mm/slab_common.c:389:20: warning: no previous prototype for 'kmem_cache_cre=
ate_rcu' [-Wmissing-prototypes]
  389 | struct kmem_cache *kmem_cache_create_rcu(const char *name, unsigned=
 int size,
      |                    ^~~~~~~~~~~~~~~~~~~~~
mm/slab_common.c: In function 'kmem_cache_create_rcu':
mm/slab_common.c:393:16: error: implicit declaration of function 'do_kmem_c=
ache_create_usercopy'; did you mean 'kmem_cache_create_usercopy'? [-Wimplic=
it-function-declaration]
  393 |         return do_kmem_cache_create_usercopy(name, size, freeptr_of=
fset, 0,
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                kmem_cache_create_usercopy
mm/slab_common.c:393:16: error: returning 'int' from a function with return=
 type 'struct kmem_cache *' makes pointer from integer without a cast [-Win=
t-conversion]
  393 |         return do_kmem_cache_create_usercopy(name, size, freeptr_of=
fset, 0,
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
  394 |                                              flags | SLAB_TYPESAFE_=
BY_RCU, 0, 0,
      |                                              ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
  395 |                                              NULL);
      |                                              ~~~~~

So I used the slab tree from next-20240906 for today in the hope that
the duplications will be taken care of and the whole things becomes
clearer.
--=20
Cheers,
Stephen Rothwell

--Sig_/63xXhraSpsUr0eRc8xSa6KN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmberXsACgkQAVBC80lX
0Gyx6ggAj6hO281DYYIBfKZsOsVlM5wW6FpP4B6ge+UQ9VodaKbvhJGy1bhNfF2D
VFqk6a0Ybt0LfQoi+7sAcpJKBn96RVnNSVuHoeRrwEvTsd52he4ke278Ej/3p1oi
LlTnr6NnGY0W4RPbuLmoxOP75HQltUUvxx9sTC18hr1zO8vf9lUvJEVL7+Iuk83S
EjO0Z7g3ZMSJF041Nrt7c0BZ7afCkm2ZfERfUwm0WrlOavpAetJP/C+NYrz4QlM+
EkHxuMgbQ0p+OdyzU3U4oGUpU1+Dgf+oDm/dt28B4bGppAID3KLcFvJCk9xE6TAA
jS9MbfMXEVKXBuLeUwOFzIGLGkBTUQ==
=pLef
-----END PGP SIGNATURE-----

--Sig_/63xXhraSpsUr0eRc8xSa6KN--

