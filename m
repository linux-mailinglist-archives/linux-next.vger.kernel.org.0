Return-Path: <linux-next+bounces-5813-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EC1A647A0
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 10:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1515188C643
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 09:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF513221DA4;
	Mon, 17 Mar 2025 09:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qgPtwMUG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F1F221710;
	Mon, 17 Mar 2025 09:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742204295; cv=none; b=BsjgOYJg627HM62GVJq16wymtut+bR4N7qP+JZTLz3wncek6jHqz7sej/nxufcBuvauFhG/oWJA4E0IXj042ZhNlADxK+WOVxLeSym+yEbYf0XDJMUwgpgQINdD1QiiI20hXYP3KLv+VXxIfksNWizz6ocAIJnXja5nJ4eaa2ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742204295; c=relaxed/simple;
	bh=Jv81Q6hsbzmxg+WoCJttRIyXbLTZAr0IVGCca3s9vOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g6rLmvYQPnce1KT3EdZ9FwEzYDHeVK6APnrUCQCincTcgNlyx6pN0mbhtBsztUx5tTtyDQoLL7nAPXz85KQ2SnmojvWYCW/HP8a90XTg11ydRuW3hChY8Waf3lyID2rx7CGurRULAPivWuMXrmxQChiCbiB1x5Jsi7L6iKacEZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qgPtwMUG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742204287;
	bh=liP805BV/RX2j5y5s4w1RMN/E8uRdKZdi+fxxKJ/5Hk=;
	h=Date:From:To:Cc:Subject:From;
	b=qgPtwMUGGV58ZqHMCuGz4B0lfezgla3Ce2Rj2Cyze5ComBX9RyP8wG/lBF555+2NL
	 deon+AMdZzSU23U8xl3QP9M2rEE3J3ZSIboeBhPtQJ2yyTTGaVFqDyCJAyL0PBuCeK
	 L6M8nHSMgT0OiTxnP5af4USHcseupyEpVWuFP6Z5OL+PjVhuWCSW1kLfTDm2hcY1gE
	 6IUkkgFwBz9X/9ZZNZCDkUWJZwsBvzCTyvKUmXVzlrje5EvvS8Y+IEaM3gYabIaJJ6
	 sh+Bv5E3+ab2QO7luLVZLwNuXFhi+K0Jg04uWgVqtkbzdNw85TUQmaZt8wGwc3dttI
	 gpSSuNBbyVdZw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGVJb5g2Lz4wcw;
	Mon, 17 Mar 2025 20:38:07 +1100 (AEDT)
Date: Mon, 17 Mar 2025 20:38:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust tree with the kbuild tree
Message-ID: <20250317203806.63d4bc95@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mrCyX6PCRjQ=bUu.mgUvzH6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mrCyX6PCRjQ=bUu.mgUvzH6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/Makefile

between commit:

  e3de46f775ec ("rust: kbuild: skip `--remap-path-prefix` for `rustdoc`")

from the kbuild tree and commit:

  d7659acca7a3 ("rust: add pin-init crate build infrastructure")

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

diff --cc rust/Makefile
index 089473a89d46,e761a8cc3bd5..000000000000
--- a/rust/Makefile
+++ b/rust/Makefile
@@@ -175,9 -199,9 +203,9 @@@ quiet_cmd_rustdoc_test_kernel =3D RUSTDO
  	rm -rf $(objtree)/$(obj)/test/doctests/kernel; \
  	mkdir -p $(objtree)/$(obj)/test/doctests/kernel; \
  	OBJTREE=3D$(abspath $(objtree)) \
 -	$(RUSTDOC) --test $(rust_flags) \
 +	$(RUSTDOC) --test $(filter-out --remap-path-prefix=3D%,$(rust_flags)) \
- 		-L$(objtree)/$(obj) --extern ffi --extern kernel \
- 		--extern build_error --extern macros \
+ 		-L$(objtree)/$(obj) --extern ffi --extern pin_init \
+ 		--extern kernel --extern build_error --extern macros \
  		--extern bindings --extern uapi \
  		--no-run --crate-name kernel -Zunstable-options \
  		--sysroot=3D/dev/null \

--Sig_/mrCyX6PCRjQ=bUu.mgUvzH6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfX7X4ACgkQAVBC80lX
0Gzr/Qf/XxiByq1iQ3aI42Zt8uyv17Rt3ykmiNx7YFSQOEHt4MzIYKiu5AS4JVw3
sDZcPWwK6ycup11KwC6EneL2O7L4E2xApTTqNEEUpR3Cwni2rZ52pxdQImCzCoh1
0FGIR4vpFDyIGbZiw0F9CzsqHK7oS8Eb4nMo09EdesyrBdXueNQ9J+Ko/CBRttlj
sjpwc+43p8ttEIShZifvO2hc4eFuC7sr+b2yxWCPy7AJKKImqZmkz5gLvQEOYglR
jHilgqmfHgKcsJ20BY67BOVUNt6xyJdl2uMQAs9xEBjGmfpGaXsLaaVpOjVRlU7c
9YMdRzITzCegENM4mBPzFvYZBLhnAw==
=S7RZ
-----END PGP SIGNATURE-----

--Sig_/mrCyX6PCRjQ=bUu.mgUvzH6--

