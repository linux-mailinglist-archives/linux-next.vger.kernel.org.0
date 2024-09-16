Return-Path: <linux-next+bounces-3870-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 266AF979C6D
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 10:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5861B1C22E34
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 08:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A45DB41C62;
	Mon, 16 Sep 2024 08:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HqhLufiP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AAA2F2A;
	Mon, 16 Sep 2024 08:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726473804; cv=none; b=FitYr5RNC/ZsK93CX/6owbm0ayC8RYKmlAeIFlciQdLUSJRGx4BzGgcFFoISmn3DVXzvHzT9ki9pkfWn/ITlBM2NHFt1qVkFRY4fn0260DNeCXxn7q6519h1crjVuyScYDwJASXS/yApb/IgS7amz/uds929USmZh43RL1nYpYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726473804; c=relaxed/simple;
	bh=G5VzGVwIsK7h38mVuBaX5GZ8HnA9UxAug8gE6Dx4uKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mNKWKMXbntxfydYZ7kfibq2/lTS4SVKNUWL88SP+ygHNqAwhjQQPLG4t2Ym+4cMuPZr5Gk1Gn0PHemN0ec9RkWPluKbMbWC1uDi13yRskuqAG+6U7TKE8enqaMzsLOEWmVyo6QpHoK0uWkeIVCZ3832trCw1csaXvvKRHmY3RMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HqhLufiP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726473798;
	bh=9FLz9BCBpfJL2Cw2Vx0upnfCIz2sxf3rvpWAMbgrU5k=;
	h=Date:From:To:Cc:Subject:From;
	b=HqhLufiPH9RywzYSliSZw+fYS/EdFIrGbl+6XwzmRp7ftV0LQCRN97UEaPx6lBQgZ
	 6hDaOHXHWSyy1Ig0PGhKa9DVtiv9YCzTDx5y+BUrHJnUgWJ8oKwpfsyce8L/zZdzeX
	 gtByphZ18dZDiO698Oci7iM2u1Y6JPEHEkbD9p3Sys6xrbgVaexMaMlspIjfGcK6TJ
	 0uRNK4AA4coWkYtn7hpSmOesLfGS5Le+6RRFFoNC4hcBFhLUBaIWN7MDyeiNOt5SxK
	 GjQCYGi16T2uWUV/Lj0jApAF4EB4f3IVyW1h9DVHzQy7JP/ieEoryyLhemW4FHc8S6
	 eKR0xJ9X+Ob/w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X6cqB0H95z4x8D;
	Mon, 16 Sep 2024 18:03:18 +1000 (AEST)
Date: Mon, 16 Sep 2024 18:03:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg
 <a.hindborg@kernel.org>, Andreas Hindborg <a.hindborg@samsung.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matthew Maurer <mmaurer@google.com>
Subject: linux-next: manual merge of the rust tree with Linus' tree
Message-ID: <20240916180316.4516a56d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Li8ts8txmt2sTzWfYMTh8+e";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Li8ts8txmt2sTzWfYMTh8+e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/Makefile

between commit:

  b8673d56935c ("rust: kbuild: fix export of bss symbols")

from Linus' tree and commit:

  53bd83d95bb0 ("rust: cfi: add support for CFI_CLANG with Rust")

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
index f168d2c98a15,dd76dc27d666..000000000000
--- a/rust/Makefile
+++ b/rust/Makefile
@@@ -305,7 -306,7 +306,7 @@@ $(obj)/bindings/bindings_helpers_genera
  quiet_cmd_exports =3D EXPORTS $@
        cmd_exports =3D \
  	$(NM) -p --defined-only $< \
- 		| awk '/ (T|R|D|B) / {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
 -		| awk '$$2~/(T|R|D)/ && $$3!~/__cfi/ {printf "EXPORT_SYMBOL_RUST_GPL(%s=
);\n",$$3}' > $@
++		| awk '$$2~/(T|R|D|B)/ && $$3!~/__cfi/ {printf "EXPORT_SYMBOL_RUST_GPL(=
%s);\n",$$3}' > $@
 =20
  $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
  	$(call if_changed,exports)

--Sig_/Li8ts8txmt2sTzWfYMTh8+e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbn5kQACgkQAVBC80lX
0GwzRQf+MaH8PId5toz7cTM5sQMHEVD5e24y+WU9ib27wQ8IBYsO2OSyRFELgytR
Se+6gEVNjwgH3Ast9ls/Bt8pScyiDA5uQMF7p1WNsL9mHpDr5N85wA+ikT32ktjH
Zqc48AuFfwr9UVQ1MJGSX+8CTpTt/AzVQvAIhh25t3Wc3blpBhWSj06tsdRII3Wu
Tkm9vus/IwEEfculP9Ss2Y6kPRYKhbGlQd6/xMotXDUQdqVDmdUIX7PQIXDN344R
KmTYFk6XY8ol2jQ3PdgxGTy3jALazj6E7nMnBG6Th6uJVketLCvJaxW6ZMQ81InV
75XvAL3Z1bcbS7oyMMM+IUkP+jOAQg==
=GUB3
-----END PGP SIGNATURE-----

--Sig_/Li8ts8txmt2sTzWfYMTh8+e--

