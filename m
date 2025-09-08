Return-Path: <linux-next+bounces-8219-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8580DB4842A
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 08:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2BB23B9E73
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 06:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C1D205AB6;
	Mon,  8 Sep 2025 06:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nbgwAegI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E42023717F;
	Mon,  8 Sep 2025 06:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757312757; cv=none; b=agxQgzl35IdZKF7uuW0PmI0ZWGzx+RBQtVGx2KushN037tJIiI8PHDoc9c+upGyBK++dem9Vvx4q/C+RPy5Y2TmVYFkb/Ve6qwRopynUCyNJ0QXPgR99B0f5wwhnPxotx7pSvcXn9mWQmdFy+ggzTUTid8I7A/BAK2HSwmrL2a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757312757; c=relaxed/simple;
	bh=DvgmReGZHWcuzz4aO3hfeI5JSIkCKSBHozOOANeB/0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i7E7DGBIbXoQucyi8USTGhiB0SbuSgKP12P7D1jmhVAZmDsIqT3nd2Wus53t9kOthoEJbMRKBUZw+iqsdaE9SpVarTX2bNmRGQzoA78IX5+yOB8m1R0rjHTxkaQwfOQt7WhPMjEDdZjxpCaDg3YrTrjIEItlqxpH7ybC60FsToQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nbgwAegI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757312752;
	bh=EtvbN0PEaNVLRwOqpibbboLBjguKBFwYv9UUTRx6J5E=;
	h=Date:From:To:Cc:Subject:From;
	b=nbgwAegIidKr68K+hhrF+OTMSCV8V4zd+1kvi1QMIe+uKDQbL8YcSsuSpxm3BrHlc
	 U9ZsUedfwB9V76V6Q2xITOjxoU+eCCqXVIHJNUYIZkR3C1LTvvfI+KbC1mbbYJRikE
	 U7znFfLU6ICYyK/13kJbREezR7GbIOv2NwxdbwuEMU53xpUWDla04WlgGWedmR5i8Q
	 zfX4ubsgYhExroJKdb22RiRAKWEzWoMg+Cigdp7wL+YjAOrhD/JhLsM4nkvCRs33Sp
	 aD9kYSYc9RjxSGx9EeKvSL2UJMl07cOiTCsXLXlfAKoStTn5TTccy2L6LAaTbnoJzE
	 PHIAujE8vdmHw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cKxlz1dYxz4w8x;
	Mon,  8 Sep 2025 16:25:50 +1000 (AEST)
Date: Mon, 8 Sep 2025 16:25:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Alice Ryhl <aliceryhl@google.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the driver-core
 tree
Message-ID: <20250908162550.1a250f96@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9wQ_Hp4bFJ5UsgdoIiOO17F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9wQ_Hp4bFJ5UsgdoIiOO17F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  rust/kernel/lib.rs

between commit:

  1f54d5e5cd2a ("rust: irq: add irq module")

from the driver-core tree and commit:

  06cb58b310ea ("rust: iov: add iov_iter abstractions for ITER_SOURCE")

from the char-misc tree.

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
index 5300318a5309,99dbb7b2812e..000000000000
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@@ -93,7 -92,7 +93,8 @@@ pub mod fs
  pub mod init;
  pub mod io;
  pub mod ioctl;
+ pub mod iov;
 +pub mod irq;
  pub mod jump_label;
  #[cfg(CONFIG_KUNIT)]
  pub mod kunit;

--Sig_/9wQ_Hp4bFJ5UsgdoIiOO17F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+du4ACgkQAVBC80lX
0GwGhAf+MYHgL7cdyQ/+kxcVhxXeFGkPhfcRV/DJ2pE/LS0lKf64NG8+EC5qhmUW
Eav/M6niB8V9r9oEi5BDTJ2MVIyzsxCt15yZ2Tn6tSQzSHIMo/LsNthfV7/gR5Iv
mvFvUaO0bXGuO9dc5jqd1MxHqMTE/vMtRPTsHtV6wpH15UCtrQCfeRDvpMcXNKnp
qO/q5lqN8N8C+wf3M/yNEpACPQSTvcuA5vli0B0kdscnu3bfp6RAkOSwPVdmpTnX
uXUFIg4wENqH5u8yAQGsBSPPhTVVJ1KiKwP1YiVw3MOuR7Ezo1kGpb5P0eNlpzAK
ucdlsZub7rrZGH35+zrun7hAnL5ISw==
=B0rP
-----END PGP SIGNATURE-----

--Sig_/9wQ_Hp4bFJ5UsgdoIiOO17F--

