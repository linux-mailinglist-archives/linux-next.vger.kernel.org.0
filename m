Return-Path: <linux-next+bounces-2867-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA2E92B16A
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 09:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A7C5283D42
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 07:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B3913211E;
	Tue,  9 Jul 2024 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="s42YhSu2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223FB143752;
	Tue,  9 Jul 2024 07:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720511025; cv=none; b=p7hI4nnQJAOjKbdjKYt8fTPe4TfxHqSwaeBMu4spn3Bw/VdQY/nNp0zAms3J/UEkegPxjld/ZLKS4+vfdNY4QZ70Ke2TOVxe7c9teipT/c8V7sm9yl+6Dw09N0VKEdsr+SO1K7B2w8I9THq/z8lAHRYBtBRvd/sUfEIAvKoWv9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720511025; c=relaxed/simple;
	bh=dr7l3t+GjKMDnDuiYasmDuc9Qrrjr+5nnYrK+/4137Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qhs0RuOMu1sVtDofVClrkrqcTkI2LpAe0GjzGzLHvjVoU8jZ1ftRxt0dLiLNTXm3gpPyy4BfkZjKmuEfkqyhu1gZZzU0ILeJ1OCuld04H6fiPf/m5KmXWFGy3mci9EygvBfzZA98XBHcGoJjf5cBV1GG3e5Yi8iD4FSQQX62CSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=s42YhSu2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720511021;
	bh=o9VUrZTwSxcIukPrWAGUJ9E0ASY1OK2NhB+cQqKDHHM=;
	h=Date:From:To:Cc:Subject:From;
	b=s42YhSu2BtzzHurrB0fD3leQYO5KzNFamh/v7Tnpe3T0wppC2gLPV9+wkM7NQyMGz
	 KvbJhqrZb1o9OCURLKSzKEFBlUOJgsJpfqi6Fuwy1yPM+isz2a1OlBgiMev/hne1H1
	 87j4YsPGok0YeOQIu4noQeTl/1vm/HhVYvrCy5PvgG/iBV9OYfzuJe1nt1wGyqV2b9
	 1G9lg5CdAPqiX39YwGmgSi0iPpnBqWwoj48Mrs7gWpinq8sZdbGJLZtAw4I//xsfbS
	 P0HYoPUAEl+UYwqcCeKEn4gAx5tXBjcuCjikxGVW/1BXPLDkb8U6y3I+Dfl66vyEu+
	 kPYZ+b9Df4xxQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJCfP39Q7z4w2R;
	Tue,  9 Jul 2024 17:43:41 +1000 (AEST)
Date: Tue, 9 Jul 2024 17:43:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Donet Tom <donettom@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Ritesh Harjani (IBM)"
 <ritesh.list@gmail.com>
Subject: linux-next: manual merge of the random tree with the mm-stable tree
Message-ID: <20240709174340.5c03c2b9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MmvR/cmc7U=7=PRedTMJjZb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MmvR/cmc7U=7=PRedTMJjZb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the random tree got a conflict in:

  tools/testing/selftests/mm/Makefile

between commit:

  3a103b5315b7 ("selftest: mm: Test if hugepage does not get leaked during =
__bio_release_pages()")

from the mm-stable tree and commit:

  94beef29e110 ("mm: add MAP_DROPPABLE for designating always lazily freeab=
le mappings")

from the random tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/mm/Makefile
index e1aa09ddaa3d,e3e5740e13e1..000000000000
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@@ -75,7 -73,7 +75,8 @@@ TEST_GEN_FILES +=3D ksm_functional_test
  TEST_GEN_FILES +=3D mdwe_test
  TEST_GEN_FILES +=3D hugetlb_fault_after_madv
  TEST_GEN_FILES +=3D hugetlb_madv_vs_map
 +TEST_GEN_FILES +=3D hugetlb_dio
+ TEST_GEN_FILES +=3D droppable
 =20
  ifneq ($(ARCH),arm64)
  TEST_GEN_FILES +=3D soft-dirty

--Sig_/MmvR/cmc7U=7=PRedTMJjZb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM6iwACgkQAVBC80lX
0GzQ0Qf8D5iZvMUXOim4h+wk5dm9lHbdnosCIMex9sPYFogb+B8L5JFi8rNQ3R+N
RJrVWK8G/gcEh3dtx7/VV1FpURnjs0AKDvJbYHVTSRbrfbKhAcoeZEvzf3eXNv6i
9Gf/hrOznL+Fs0ZIkt1UwgIgCHHctZNura+Tt80LlSa3fRe1ybGeQ5eMP68AsMnV
siS9me/dpizAbMnJluRxwWLbhT86tXBehR6UNI2F+5x4Q/AUSclEuh/aSQGtDSzp
19v7cJXh50Ggx8ANyDtdJWlxktpQ7B4wrZOoMT3Sya8+9yhSOcvdxGCiuhiKBQ6W
1mR1+GF/nNUtOxwe72xMb5OFvNWC9w==
=Ea6t
-----END PGP SIGNATURE-----

--Sig_/MmvR/cmc7U=7=PRedTMJjZb--

