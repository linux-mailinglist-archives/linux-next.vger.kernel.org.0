Return-Path: <linux-next+bounces-8269-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA0FB5401D
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 04:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA9737B3414
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 02:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1023141C69;
	Fri, 12 Sep 2025 02:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GXAJZND2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B1A78F2E;
	Fri, 12 Sep 2025 02:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757642526; cv=none; b=CyyVwA6yNvb0NNPDGexCvZDml+fRkjy0+CY5cjoZA3vbq9i4+OlXxOPLHaJDXHHS0kTbcxNwZ4oFyeXK5DIjSnsIRvDeuWAPKmPyYPhCIYaaptNg1wn6uDLd09gDnmX5DF/W419+8cSqeKpFC6EQzK9pHyfLHwyg6XR5Ed1QX1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757642526; c=relaxed/simple;
	bh=ofHx56BppN7uG4nMoIOUkT9YW2WwswxmiLHeRFONwG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p+btDAlBf/ebEzyHK7eqsFFlqSYvkobNe/Ctpl++1orU/jpwJBxXuXOGYmZ6izz34+NEoWaMCHJnixvWDv4+DG+ZzkzrQxAdOkQvbkxgSqxIm/RNhasxp32AiKrnXvcPws2n+2DmI14s2vubH1IvgiDg0awdfN4OMDDtRQv6hAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GXAJZND2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757642520;
	bh=Z6CwyDe+rDUXNJFHQE/lWblQ0fLT8qQmbmGhKk4M4Rk=;
	h=Date:From:To:Cc:Subject:From;
	b=GXAJZND2vcIqgv2fWvefMWl2zMRFl+CN51fozERMQCMmJHIrdgGpqI2FljsXeAHJ3
	 Zn/CTyg2BinP2zp4A+CemHyjvyk3dImeBKYbh+2c+ZIPx8uH9uwybgfopWhppMw0dV
	 89qhuPWh8kThH2DH8TLWK6W9Hd7dntH9PIT+OZJz4B1MCRYe+WYV2sfSj/Mb1TRAUl
	 oBkRKZdLtEFOz+Z5nvFc6z2MhHHi8FRFMwG456T/gFCusNe/9MNvxHK1pzOqXiqxpI
	 cPdMDIo+mE/MS+E7rE3h8sRWVbOJVP+EsdCjzJioz6cRdgCu+aeOAmmTwtPIfwxwlu
	 NqXTbsE9rLdXw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cNHjg4wffz4w9Q;
	Fri, 12 Sep 2025 12:01:59 +1000 (AEST)
Date: Fri, 12 Sep 2025 12:01:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-rust tree with the
 driver-core.current tree
Message-ID: <20250912120159.1d6518cc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=7zD693h/Iauq0ScLjN9yaz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=7zD693h/Iauq0ScLjN9yaz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-rust tree got a conflict in:

  MAINTAINERS

between commit:

  f6d2900f2806 ("MAINTAINERS: Update the DMA Rust entry")

from the driver-core.current tree and commit:

  c58466b85b16 ("MAINTAINERS: rust: dma: add scatterlist files")

from the drm-rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 5bcaa26029f2,8a11e6c5dd80..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -7263,18 -7251,20 +7276,20 @@@ F:	include/linux/dma-mapping.
  F:	include/linux/swiotlb.h
  F:	kernel/dma/
 =20
- DMA MAPPING HELPERS DEVICE DRIVER API [RUST]
+ DMA MAPPING & SCATTERLIST API [RUST]
 -M:	Abdiel Janulgue <abdiel.janulgue@gmail.com>
  M:	Danilo Krummrich <dakr@kernel.org>
 +R:	Abdiel Janulgue <abdiel.janulgue@gmail.com>
  R:	Daniel Almeida <daniel.almeida@collabora.com>
  R:	Robin Murphy <robin.murphy@arm.com>
  R:	Andreas Hindborg <a.hindborg@kernel.org>
  L:	rust-for-linux@vger.kernel.org
  S:	Supported
  W:	https://rust-for-linux.com
 -T:	git https://github.com/Rust-for-Linux/linux.git alloc-next
 +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-c=
ore.git
  F:	rust/helpers/dma.c
+ F:	rust/helpers/scatterlist.c
  F:	rust/kernel/dma.rs
+ F:	rust/kernel/scatterlist.rs
  F:	samples/rust/rust_dma.rs
 =20
  DMA-BUF HEAPS FRAMEWORK

--Sig_/=7zD693h/Iauq0ScLjN9yaz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjDfxcACgkQAVBC80lX
0GypTgf+Ld8DInPsDsOfnv2DIzx5uJa5979Lqg5pKOqfBakHom+Viwl41pQKmJRQ
gR0zvQNpTyUW4rNBUABVQROjP6mpwazh/rP5bPbGq/MEXIv/o3TvnRM9yflfKpdF
afHNsb8MlBzw8g+I609i+q1e4c4r+R8cLuco99ad+9a4D8H8tL9w8OPZdFNepx/n
ZmNVC3wVcuCOkHv43hkFbM6qt5pbzIu0cyTsrrLTVjMml4QVvfNH32uR4EQialWZ
w5t+HSDoDlxal9B5ub/bSpeUjZUEfSgNNExiJqzf0u1aeW7lmPEs8qfotRx4fSgQ
S8+ok3kQnPGqOUIwr8AWJk0+e6Zy9g==
=mXO7
-----END PGP SIGNATURE-----

--Sig_/=7zD693h/Iauq0ScLjN9yaz--

