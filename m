Return-Path: <linux-next+bounces-4023-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA58298B175
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 02:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55EBA281855
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 00:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68658645;
	Tue,  1 Oct 2024 00:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oBU1unHC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D6628EE;
	Tue,  1 Oct 2024 00:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727742528; cv=none; b=Wodm3cJ/GyZL5A+ZPUAThxIRoTReWjD+qREDVXqJlC+ffVrcGIcArKJL3PDhnqPq0xdfWUqhJz4wYERUeDEX6DxNjaqrMCxZb3paoACGjciMrE649O0V2pIQ0dkfP6gGBXiPwd1ltLQkv4Hg+e16o6Ty/OvAWk4oSoCx+L/ZUyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727742528; c=relaxed/simple;
	bh=NQRfHInSRyhNMKkLtYSjGa7i/JV7iU/gWWdIh08HA+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dVug9PTTpvTD3bXJCcZZdcXSwNxT4U63y58kMhn8bR8VbS8/AuYc9Wq2ADxLrwKPXJwwU4R9GhA42BYE5QzCpi5G0j0cLVnBAiV50LemY18cYriiWxPqdRIbRDU7iiIIiL36OvW76OmvTefuDyIncnXF4xRXhBTeJg1kSObgmFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oBU1unHC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727742520;
	bh=xhFUxYfUeS/SPCd3Z5CW3b3H52xKBE3imtzIsaJAWZA=;
	h=Date:From:To:Cc:Subject:From;
	b=oBU1unHCBP5w4fp/G1trX1ZwlgMzW2QYifPU4HyRHozX7e2ealzKBcwvIVHJh6ob5
	 NJj+SM8HD5L8DVNs9OO/fGoRCwf54Pz+fSCqCFtPrh3UMnOBrCnlSKBxBtcJG4oHuT
	 RZXQSt13F8euJxzrlf10twnRie3ZCjJK2QqxDiuh8f7Rt0NFuTMBS8UCj1kWX0h83g
	 NBXkGtfqF/tMuORZtglH23jxgrkg/wZWnpgWeml2/oUrmo46OpNHAQDy/Qkj/EPFck
	 vOBv3sEsYtbWemXZjMnSLJ/T1KsYt8EfQTbLPJrC+bj655XjPz0l1cwGwrgLd1jnub
	 Kqe2jWd5ecqNg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHf1h5DWJz4wbr;
	Tue,  1 Oct 2024 10:28:40 +1000 (AEST)
Date: Tue, 1 Oct 2024 10:28:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the
 rust-fixes tree
Message-ID: <20241001102839.77211fb8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OmpkJ.nUj/wm.QloXFhZjk7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OmpkJ.nUj/wm.QloXFhZjk7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  rust/kernel/lib.rs

between commit:

  ece207a83e46 ("rust: kernel: sort Rust modules")

from the rust-fixes tree and commit:

  94d356c0335f ("rust: security: add abstraction for secctx")

from the vfs-brauner tree.

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
index b5f4b3ce6b48,ff7d88022c57..000000000000
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@@ -44,8 -46,9 +46,9 @@@ pub mod net
  pub mod page;
  pub mod prelude;
  pub mod print;
 -pub mod sizes;
  pub mod rbtree;
+ pub mod security;
 +pub mod sizes;
  mod static_assert;
  #[doc(hidden)]
  pub mod std_vendor;

--Sig_/OmpkJ.nUj/wm.QloXFhZjk7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb7QjcACgkQAVBC80lX
0GwX6Af9G87aQg+c0eyaHqS8gQDe7eoKaq8ExfhvbN68844NYEz7UP4vDravErRh
fqzRrL7U3zwMPXybLZ8pSNHt8Frxzukd4VtYD387qSDW/MmpXYEuzhcxYDAt49fy
4R2stWV6ux5Smfrn5jCvlVL93LxFVo42pubxi62h1PqPMr8Hwn4sbTpYXaEjLCRn
BY5yQjmOUiMi9y/K3J91ZOaoHi+ANXYR2EOs7anjbRhCbVNZQ267HH1rLOd0ogsC
L5FsQ86an5OdsQ3vQdPIMcscFbAGu3187MoQsgdyjeF4uipMmsoPzZpOrE82Vf7d
04hs8ajDxSndZO+XMkJCCYB1A+Fs0w==
=O4g4
-----END PGP SIGNATURE-----

--Sig_/OmpkJ.nUj/wm.QloXFhZjk7--

