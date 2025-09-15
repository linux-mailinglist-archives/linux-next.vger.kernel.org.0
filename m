Return-Path: <linux-next+bounces-8317-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EFBB587E3
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 00:56:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD29D1AA7CB9
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 22:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDE12BEFFA;
	Mon, 15 Sep 2025 22:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvbjSjQR"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15AB2B2D7;
	Mon, 15 Sep 2025 22:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757977002; cv=none; b=XCuQ95VuewM7bI4GtrFZ0Fpne5Aeec3Mt8nIgjHpOZv70U7xVHE2Yqk+WAjZ7wZYG3B2a6fLP6pAJzoWVoeTs4TvnxwzU0mJquFxsi8rh7AjnMm99XePlLwOKjH/iYBJnJzMOT9VhY1zf7Tw5KOKy2s9Jv/5Byf2ElMxzRLkeOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757977002; c=relaxed/simple;
	bh=TbuzNyZ7T+sq1u8dImr/tAIPvNrBs9FGgizyEUHTwQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dynyCXWEFmmDrbX2w7qNdBels/uOCnR2ZSGlOg4bJDVMYyHI1GyKjijyxOkZS6E44uiJNpwFXkmb6HKuDMlPbP9O3787YKddAJ5pt5eDtQY+E6Hd2pl6Z3VZJYs5W2yJEVUn7pGTjQqPKEDcKfyna9Zjnnx1vcwIlSKDBzvA/4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvbjSjQR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2787CC4CEF1;
	Mon, 15 Sep 2025 22:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757977001;
	bh=TbuzNyZ7T+sq1u8dImr/tAIPvNrBs9FGgizyEUHTwQw=;
	h=Date:From:To:Cc:Subject:From;
	b=bvbjSjQRYLyOTlzELB2ix7N6WpoSZ8AUc+rAUQ2EogBePJDhLImIa2ybqll3JeRlq
	 h2MSMYAe4KxruOzpe08deeYOugJXrUa3iCUuwRGChlCDPSt+nD4UgcIwD8bjn1yzmY
	 5jlG6AKuzyB/fmrwN6ufsmn74V9S6E1TsILK2pHFr8Ze9tHK+UdEx4pqIf/1mpBtJ2
	 MqeO0nDdm8PBBkfH5lr3mLyn+nqGj82zhfy5u/LXUSg3w2WZxqbLUO2IqqEEEw7E2A
	 bSGBzdGUolh4zJ7Nmb7jgSEuhDAlU/4bjLxrwiKfVU6eHCbjzx+06rFM84Kn7q2xT3
	 0OYfqwXKokofA==
Date: Mon, 15 Sep 2025 23:56:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Burak Emir <bqe@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: linux-next: manual merge of the bitmap tree with the tip tree
Message-ID: <aMiZpcBu2LDzwCje@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QJDNgAD0/hVihI62"
Content-Disposition: inline


--QJDNgAD0/hVihI62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bitmap tree got a conflict in:

  rust/helpers/helpers.c

between commit:

  ed17707bd8f33 ("rust: sync: Add memory barriers")

=66rom the tip tree and commits:

  ae384a4623fc3 ("rust: add bindings for bitops.h")
  78d9de4ca3474 ("rust: add bindings for bitmap.h")

=66rom the bitmap tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/helpers/helpers.c
index a16758a6ef395,abff1ef14d813..0000000000000
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@@ -8,7 -8,8 +8,9 @@@
   */
 =20
  #include "auxiliary.c"
 +#include "barrier.c"
+ #include "bitmap.c"
+ #include "bitops.c"
  #include "blk.c"
  #include "bug.c"
  #include "build_assert.c"

--QJDNgAD0/hVihI62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjImaQACgkQJNaLcl1U
h9AbJggAgZ5zsFUe1z0PlBeAhQsc6vVnAs+cYlVKL0/qag4siF6yp+agW3rvBO+V
67cQysmnwoL/Jk+wfHHLP0voKxw/sBjD+JqbL7H112akqWJbXJFo6K7f5g1V9yMw
QOPLg+DmQ8PiZcmEAw4Ahdw/4ysHANEzyotxVBmxobUnC9oyS5EVIu/Qx+OvFSN0
eKkilje0Qg9pH4njEIjSd9CjcujhxVjyGmL05QdSOVsr8w0UU3btHb4B5H0tHZ0S
xoulJkTLACPiFIkPe3tCB88Dr+wSiknCTzvwzWuzWtrD3co8cWLyxbEcetUk4C6Q
xtWCPycKqxFrP5HqpAOr4w6Uq4TYSQ==
=3ZVg
-----END PGP SIGNATURE-----

--QJDNgAD0/hVihI62--

