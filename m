Return-Path: <linux-next+bounces-2868-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBBA92B19C
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 09:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29B8C1C21D66
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 07:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E9514C582;
	Tue,  9 Jul 2024 07:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dZ91Cye0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38CE149C65;
	Tue,  9 Jul 2024 07:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720511587; cv=none; b=AD6PcEF+4uD/45ijg/pJMCmBo6xYzUUG+qhVbeHy4Rfts2bjCnoAkrSXHbgZA7yHqerzOs8Q5IVi5aW3qysxtNGDLfNf5WIS5g9L0vQjZHMWmRRVzv/ANOnoqRuD0Gpg9BFasx0yE2uTiWk8iABDjmKToxgzuhy33JqtnRY9/e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720511587; c=relaxed/simple;
	bh=hegsRFX7NQKjVGjCdz4KVwALImyN3hLPZGU3RhlrtAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mLqQbOsKi5+qbtCq0lkof3AMY22ewSCREnCZ/+N2KK8iqN9S0OwtW/Gqn1GgYl4+1U9QA1368c53RN5r8BrsR+fKUlrprlz59mbRyjfOGYQ2W1mcOd7k6awLuIi3pqVHif+Dkz5JC0KzVLesFEbLCEI+tmJ3/XvnL4Oy3VaWRN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dZ91Cye0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720511577;
	bh=C7lWI/s0awXmqQP7OIm2jZjarG4yH/o8pzRFe6Y/kp8=;
	h=Date:From:To:Cc:Subject:From;
	b=dZ91Cye0aBF05LoxkaxNtoH8ddRpq7kROvi0KTIuFcepbXgvWr91xeEUXXZ1iOOyx
	 E+FycZ4NCAaTqIe+iPxekeT8Ptr818NTW7mDQkCbQk+gm9UYjC95IlhceeROfhDGJg
	 xi2VyNbd6d06eYQpqDCPnEMCrVvvXJ6xBtI5VtDeSlz62FJe1QJy6hwi8A27F+JCFr
	 J4dSYCvmSFiag28McgfmTYnOjnYRrwHNdy5m8DPn9PcJpw7/cEsWypAfUpijV8uiIY
	 CBZuZTy5kbwN3K8evZdDirqgq0yg9BIP4GB37Y/DrcPsVfJIXs7HsClHuBrhigKkIK
	 GZ2ezLjqmnFxg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJCs45cLfz4xPc;
	Tue,  9 Jul 2024 17:52:56 +1000 (AEST)
Date: Tue, 9 Jul 2024 17:52:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg
 <a.hindborg@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the block tree
Message-ID: <20240709175255.71439654@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SQaM2+PQVQpHyl/GZVumm26";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SQaM2+PQVQpHyl/GZVumm26
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/bindings/bindings_helper.h

between commit:

  5b026e341207 ("rust: block: fix generated bindings after refactoring of f=
eatures")

from the block tree and commit:

  ab44079e2869 ("rust: alloc: add __GFP_HIGHMEM flag")

from the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/bindings/bindings_helper.h
index 53c996e4bedf,f2bafb10f181..000000000000
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@@ -30,4 -26,4 +30,5 @@@ const gfp_t RUST_CONST_HELPER_GFP_KERNE
  const gfp_t RUST_CONST_HELPER_GFP_KERNEL_ACCOUNT =3D GFP_KERNEL_ACCOUNT;
  const gfp_t RUST_CONST_HELPER_GFP_NOWAIT =3D GFP_NOWAIT;
  const gfp_t RUST_CONST_HELPER___GFP_ZERO =3D __GFP_ZERO;
+ const gfp_t RUST_CONST_HELPER___GFP_HIGHMEM =3D ___GFP_HIGHMEM;
 +const blk_features_t RUST_CONST_HELPER_BLK_FEAT_ROTATIONAL =3D BLK_FEAT_R=
OTATIONAL;

--Sig_/SQaM2+PQVQpHyl/GZVumm26
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM7FcACgkQAVBC80lX
0GxcWwf/TXx1Qn6sERh8dtnIHcUrY59B3lh6/VsRoba/j4nWIjjF4BJQbyIIWkfz
RyC5pj382gQrw3elMEZcWZHCUsFWlJ0CtWXFrQPJm9Yg5S6LFDvW37K6DulV6O0H
mf5KRUP+W9zQB04wzb5/Ku7Qv5RqmcLFYPt8npQiZl2q3ofkRBvs6JG1tyoX+YoA
xq+JbM8BjmMUmHcQg/dNJIR3SgktYLKA6+4qDXwjOnrTXwLT585PBY2p5MpgVbsv
xuQPwaVujxBSeKnB60h2K1sAE71zt62mLqxK+NN9d+fgf6E1HmeFbUA7QxFqKP0i
qPMBhP/ngTGfcm55HID06VuRPU17DA==
=H4xZ
-----END PGP SIGNATURE-----

--Sig_/SQaM2+PQVQpHyl/GZVumm26--

