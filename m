Return-Path: <linux-next+bounces-8419-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E458B8FF1E
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 12:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10D922A13D8
	for <lists+linux-next@lfdr.de>; Mon, 22 Sep 2025 10:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D89283FE8;
	Mon, 22 Sep 2025 10:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPfx3bsT"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A6E2773EF;
	Mon, 22 Sep 2025 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758536056; cv=none; b=VaK86pcYGKmuV4DXMXLXOFV2Ic4+OQsTSRC2VDMgxMxU0wTN6oS3Aab3Ckx+T6ze5+szgUK95YlUjpydbtM/RKY3n4yVnXkcNJ5twPo+fUEadga5mt9O44aSFSL71xaHAGQb3n3pTDXspzBC7k/DxazL5SZBIfhL/Qo1XLWkiZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758536056; c=relaxed/simple;
	bh=3fGv9jId4bhWo4Z6/bnziCchlRbyyCaYsvGS2cWk89A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M61FYz3ho2p+IdieRt2c2iq1iWOzW3NebbBborW4hTHzGWJWYeFg3Okk+HaevNHPSIeUbyfUqD7p8ZpSog6ssEe3MB9jiF/BTqSuxEPHXZ8GzvAhH+CGrjYcryI051/dkEI6hHmyFo7YhVp7D4FjizNtS2GvggG3hfLodi7ioR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPfx3bsT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283AFC4CEF0;
	Mon, 22 Sep 2025 10:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758536055;
	bh=3fGv9jId4bhWo4Z6/bnziCchlRbyyCaYsvGS2cWk89A=;
	h=Date:From:To:Cc:Subject:From;
	b=QPfx3bsT9GlmLjP7zr6kGSwjwrxhH5kKnx5g7XvNGzZGZzAo1C7tPQfmv2u4kOXjk
	 fdTn9uDa3/I5ZAipi3YvOZar2nn8IWxFuUrgKK3B922InjiiZNjFDdgaF8d7M9B5A6
	 xtxScrL+D2s13M16YQnBBkaHDQmiCrTahqrGn8poZnmVtsMdPPZ8sIq2NkfS+c9Ztg
	 SthPs1+1qPa5jQ4V9bjVTiu5A0cPOoMLnI5/iv1tDJzYc4TgBb5b+ErbkA90CUsDyx
	 Z6tctyHMhu3rKPo+r6YymLFEIVygLhATh1/Mr8/vc1kguWLymBpIO+DXmPSWhxb4Op
	 jg6TEzrVd0c3w==
Date: Mon, 22 Sep 2025 12:14:08 +0200
From: Mark Brown <broonie@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	Burak Emir <bqe@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Gilbride <mattgilbride@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Subject: linux-next: manual merge of the bitmap tree with the char-misc, drm
 trees
Message-ID: <aNEhcEFTsdPXmtVi@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YBV5BQCS5crtrERs"
Content-Disposition: inline


--YBV5BQCS5crtrERs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bitmap tree got a conflict in:

  rust/helpers/helpers.c

between commits:

  eafedbc7c050c ("rust_binder: add Rust Binder driver")
  d9ea5a41cef80 ("rust: sync: Add memory barriers")

=66rom the char-misc, drm trees and commits:

  78d9de4ca3474 ("rust: add bindings for bitmap.h")
  ae384a4623fc3 ("rust: add bindings for bitops.h")

=66rom the bitmap tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc rust/helpers/helpers.c
index 3d7d0b40c9f13,abff1ef14d813..0000000000000
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@@ -7,10 -7,9 +7,12 @@@
   * Sorted alphabetically.
   */
 =20
 +#include "atomic.c"
  #include "auxiliary.c"
 +#include "barrier.c"
 +#include "binder.c"
+ #include "bitmap.c"
+ #include "bitops.c"
  #include "blk.c"
  #include "bug.c"
  #include "build_assert.c"

--YBV5BQCS5crtrERs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjRIXAACgkQJNaLcl1U
h9CAPwf/UI+vslJTo11FwgzJRsTCWTZ5mjLpmdogjB78psn4Eh76OQogJzEpNTer
WTg8XYgFOmoBZcckmTGr7H12Rat+EcsKTcSTWzUJQZJUKkrjL/39sozFdbX5Wx+w
kLhQysd3uk969ghMQ4MamAwem9S566RC+RtNQuqVu3CKuVPWmMCCcoon2I+7vQti
q62C3JQitIeK64azKpx5azQIld/EWlTVL1rQ5HpwR+SDsXNDdJL4qVq6AZjWpH3U
bgRpOMGe2e0+jbzb3wiJyuCo8SkkywceEJUitqqXwVT6IIiDPASkXVj/eK0E9Nlt
a4iduAp8o6F893TdorzA/WbDdegryQ==
=ek1i
-----END PGP SIGNATURE-----

--YBV5BQCS5crtrERs--

