Return-Path: <linux-next+bounces-7754-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CADB4B155B1
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 01:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B78218A69F0
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 23:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA602222D0;
	Tue, 29 Jul 2025 23:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GhdHUxnR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A560314EC62;
	Tue, 29 Jul 2025 23:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753830348; cv=none; b=OD5NxsY2EYB8v3vo0AaU4XKoTqC5mKxOKWqhwKaoahaAPvIu1ZBDH6VkGYfiqTf3jFBcp+wf8IHuEBfaia6rNraBQfwagZrlnhNYxLk2RY2SCTsgNv0nzQNKS89eFBzKG7ZsVg0C7JT71PHqvi59lKVnfKQhymjzMuHbcAvR5X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753830348; c=relaxed/simple;
	bh=kuaCr/k2O36y+I62RKTruoUhcXNI9YzM2g2t+rYVaxc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P9MrfoXX962dkJVhG+MGC6DbllfLNdY3OrtNMiDjxS5H0ifiV1ITeuDTKmqhYTGKHJsnbd+w1mYZynan/Jmq8Es4vscwNN9STNB1Ji8BWgeB03bqy91C/PRxIwiZtFJN0Bk8zVcgLVzgzCc1/UNzz6v05Z2tifYI1Qm9aDB/mhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GhdHUxnR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753830128;
	bh=7pF5j65uCZA1BNcWGQXATVm1zXAWZ7ikAIEcUbenzfc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GhdHUxnRoyxPcznSm+ik1tl4SByAXhER9szG8DeWiP7tX9cyZJY+xc1fRBD0XNont
	 ENepBx/A1eFE70WOaFqzuhBfsPUp1pu46K6pYrg3l7y69a3QNkZjVi/ThWox41QpIq
	 +dirB0WvG0EL3o2KiS+nZM55EIOwXIim88J+K7woDgxtpuLSYYMmJlRC+QdNKp1S5w
	 UWQL/2O2/1Ox9E5LXzgdZrPGT7d/K5BSYKPz9IRGNA+oPahsGg9dN6ns2y6S8bAXGW
	 k6bdPzEiJiNcL2s6PqDSQ7VqTRnOUdVDv41oygRHgrf/nkvKEK1PJ+iH3FzC2KM+VB
	 JT9GIxgPC5F/A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bs9pR3tpKz4wb0;
	Wed, 30 Jul 2025 09:02:07 +1000 (AEST)
Date: Wed, 30 Jul 2025 09:05:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Linux Crypto List
 <linux-crypto@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the libcrypto tree with the s390
 tree
Message-ID: <20250730090540.52bdd52f@canb.auug.org.au>
In-Reply-To: <20250704141635.57ff7b16@canb.auug.org.au>
References: <20250704141635.57ff7b16@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cIdumkS1QA3f4mbQz8CwBLZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cIdumkS1QA3f4mbQz8CwBLZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 4 Jul 2025 14:16:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the libcrypto tree got a conflict in:
>=20
>   arch/s390/lib/crypto/sha256.c
>=20
> between commit:
>=20
>   65c9a9f92502 ("s390: Explicitly include <linux/export.h>")
>=20
> from the s390 tree and commit:
>=20
>   1a8f59dfdca0 ("lib/crypto: sha256: Consolidate into single module")
>   b8456f7aaf35 ("lib/crypto: s390: Move arch/s390/lib/crypto/ into lib/cr=
ypto/")
>=20
> from the libcrypto tree.
>=20
> I fixed it up (I removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the s390 tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/cIdumkS1QA3f4mbQz8CwBLZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJU8QACgkQAVBC80lX
0GxrKwgAlWq5ylxd8EdbWQ2yqTAzUtLQDxOD/UhbwxLi2aHrHMGHD8I/WSyukjvD
uXy8l2Razz0sdAvjbDnBnEpRb9khQUPf/j9HOE7dMpy/spOpXo2YOohPb5P4Z7lT
kDfbCJaqUUZjsZaBAlx/eZe6cUXxz+d+M7Yq4z4fEHzRdPoGea0yXEPI9q4xVpe1
qvWAXCQYhXcczY3bOr0IYOlsdkI3uuKW2TLPEDcd+EPQmIecOVQkAIusjPNxvlsy
hXC6Fy6cE9LMFFsaDVtIxPH50N/KdpSgxwyPRMjijao7Ic8bUbJwLBxIMnRTe+Tq
jiw0q89CTRX+Ed9qf+7q+Uw2ZpMxCA==
=LvVA
-----END PGP SIGNATURE-----

--Sig_/cIdumkS1QA3f4mbQz8CwBLZ--

