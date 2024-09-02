Return-Path: <linux-next+bounces-3529-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F91967F1B
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 08:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7C361F225C3
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 06:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE8D154433;
	Mon,  2 Sep 2024 06:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Tr/7HBYZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE1276048;
	Mon,  2 Sep 2024 06:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725257085; cv=none; b=ROzYFq8hrrjl0Ip9yQQMRW0sxUufCChd76k9UPRyYilqOEaRj4otJO9UMUL8u7DNh/NLs5vimAuLvLVZ8cRpu9lM9QZYtDe4RX7O7Ryly8Ij+fuZEe1PH3sRZvc1sdfUnFu+F36bEKlqZ1zJpV2PvB5ivhwh/YMLPQJZPutd7ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725257085; c=relaxed/simple;
	bh=b7IZfiUMBbRO7Ejgq5vss54UCHHDHJx+uoTOUp3mMu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=chSN47oNG2Rq+JjOmAkuRMaIT2knYvWV3LTZl1n4OIE9+x44/p02vN6kT8FM2XwRinzd6hiR1xuDQq0fho3uew1T610PLYvWg0eMTmWP6Sn4KfZGDhn6rdkCr2kO6kQBwV0uwlh22/AlEzUS8S6Dz5Z6aj6sm3lrviyyssoC4mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Tr/7HBYZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725257077;
	bh=aa4OAbzz7YRi5L1VNRB/ibrEjKj9B2zaCGxrRi0Oj+o=;
	h=Date:From:To:Cc:Subject:From;
	b=Tr/7HBYZFPm7aWO3rc4IzcyEjdtdyetBBCcXFSjyHBwuMpMgpJ9+lgD3sF8co6xnA
	 +ivFSRqFbfTA6FSOZOlt2iToE0qhZdNdVeB74uMleshcIw8mXLyQjtcmJ7Y0pKdcKB
	 N0xJ9WUUgQlJhDKTrdTZNsQZ7vmqV6pnZKFx0Zoj6a8BF6t/te+anaDt3oCERbReX8
	 aMb8HY0qBp6EKB59m1pMbFs95FccNEbVvRIc6bZ3XipNIruhPHJ+szrzBnSpC43jkv
	 m/4HfrLTPlqeuS1Hm22/HB155+fZnyj2oOgA1743zr2UDb6P6tes53PqOa77G5fcr7
	 aEcSBKqCGIe6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wxyrh4zDBz4x92;
	Mon,  2 Sep 2024 16:04:36 +1000 (AEST)
Date: Mon, 2 Sep 2024 16:04:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, David Miller <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matt Gilbride <mattgilbride@google.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: linux-next: manual merge of the rust tree with the net-next tree
Message-ID: <20240902160436.793f145d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5=A8KWZpQEiXoTH8rf2GJDk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5=A8KWZpQEiXoTH8rf2GJDk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/lib.rs

between commit:

  4d080a029db1 ("rust: sizes: add commonly used constants")

from the net-next tree and commit:

  a0d13aac7022 ("rust: rbtree: add red-black tree implementation backed by =
the C version")

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

diff --cc rust/kernel/lib.rs
index 58ed400198bf,f10b06a78b9d..000000000000
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@@ -43,7 -44,7 +44,8 @@@ pub mod net
  pub mod page;
  pub mod prelude;
  pub mod print;
+ pub mod rbtree;
 +pub mod sizes;
  mod static_assert;
  #[doc(hidden)]
  pub mod std_vendor;

--Sig_/5=A8KWZpQEiXoTH8rf2GJDk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbVVXQACgkQAVBC80lX
0GyDZggAgmKU6kF3VQPzsD9ho4oI0zqd0q7Eaa0hvBxB0/uoJ6fC95G4rEsygWVv
U5AnTG1K/1AiWVBVLkZPMCy0C/VQcc3hfzaGsSBtNaIaqRjjYZ7EPP6TmNyT0oTQ
dqICXXoav1ucZraHePwuz4vHOaKwL/xyLYJCdleWanKLBum0bAy4izLNoKonCFeQ
wNxLGHd9Fyduz0KFycIOagGdyhcusm9vLukiLCIEgSIdR26ldqE27n2Owyqll8rl
MNOJCDBv777ZD7tnZm0xLWm6QcubnqpZ2hMxhYQZP0brwBwFSBVy/DnbKaJWYKIk
xQR6Y4sfCiLiW3Ui1dbsW/FfmlZkDA==
=rGdu
-----END PGP SIGNATURE-----

--Sig_/5=A8KWZpQEiXoTH8rf2GJDk--

