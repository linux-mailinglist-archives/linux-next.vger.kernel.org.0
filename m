Return-Path: <linux-next+bounces-5817-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 212A3A64AA7
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 11:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E11373B843F
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 10:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23627238164;
	Mon, 17 Mar 2025 10:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="C4bLramU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5AA238146;
	Mon, 17 Mar 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742208001; cv=none; b=hEU+N3R3C/YvE6JYuzLOspxs2FoYWfDyMfcL+nCPsrVniBBvehfyzgK9kUGmpniFtws77hiKihpFEr3e0uJQIRzxbtCUGcE35Z9q9BXjkZaP2w9UaMv1e1JdBYsClcAaFRvHHQWGRfzMgGtrVK6WQcZ9+Ag3rX4qvN8WrueY82A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742208001; c=relaxed/simple;
	bh=kuaeieyGks1neK56oaQRuwcEzGtCSERfAvBXVCCzd9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qdKk3DhfsHvBcVcskWtDnsre1I/rCSiVWPDPQ60fPPLzKEX9j89vhlFJuI29P1q051DDiCowi5pYN3hjTksYX60h5EzJ8zGMHjzyoR889BEuUUI8uHHrvhAOg9iSeWxCpEmvVNJ6lzgiTAFYaJZ6DyGDAy8T6krDhfKS4Hm0k0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=C4bLramU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742207994;
	bh=oMkgyTBxX6S1bu3dvbjIlLhUbd7vNobhAbq9SBT9jGQ=;
	h=Date:From:To:Cc:Subject:From;
	b=C4bLramUZXtpcK5NYv4REpvRHVaqb8kfL8v3emxa36IKa8jBAj+QiKQV8um1p5r9n
	 DuxZUx/TMZzgwXSQtAtcmyQ3jmyzuxdXrQZtUNu7lKaBkQshCkxb2xNW/f3BUa7lSb
	 KeHkA78Krs4TSVDwp7f7jAqmgtD+eQCKFcP3utCf0pjPoOL1uaAoJYzW9kwI68am08
	 44eSptHVrR84jMxJEzglrhrW87ZnhZmTxJ1xFXoMPXM6KuP9SW6wAVN9j8WfLdNrIe
	 4kEo9bT7rQhfjsZj/2qnGc/14jnBB4vpyMNj9EI3e2Uhe2E+QloA1Kwq4MuUCSxA6k
	 kXKpGdQeCk38A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGWgt1vNTz4x8W;
	Mon, 17 Mar 2025 21:39:54 +1100 (AEDT)
Date: Mon, 17 Mar 2025 21:39:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Brendan Higgins <brendanhiggins@google.com>
Cc: Sergio =?UTF-8?B?R29uesOhbGV6?= Collado <sergio.collado@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>
Subject: linux-next: manual merge of the kspp tree with the kunit-next and
 mm trees
Message-ID: <20250317213953.01ca90e9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X0vvp6GkZImaay8FbdTAEcl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/X0vvp6GkZImaay8FbdTAEcl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  lib/Makefile

between commits:

  62f3802332ed ("vdso: add generic time data storage")

from the mm-unstable branch of the mm tree,

  c104c16073b7 ("Kunit to check the longest symbol length")

from the kunit-next tree and commit:

  db6fe4d61ece ("lib: Move KUnit tests into tests/ subdirectory")

from the kspp tree.

I fixed it up (see below and added a merge fix patch) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 17 Mar 2025 21:35:42 +1100
Subject: [PATCH] fix up 2 for "lib: Move KUnit tests into tests/ subdirecto=
ry"

interacting with commit

  c104c16073b7 ("Kunit to check the longest symbol length")

from the kunit-next tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 lib/tests/Makefile                     | 2 ++
 lib/{ =3D> tests}/longest_symbol_kunit.c | 0
 2 files changed, 2 insertions(+)
 rename lib/{ =3D> tests}/longest_symbol_kunit.c (100%)

diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index a434c7cb733a..f2c3c4f74608 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -20,6 +20,8 @@ CFLAGS_test_fprobe.o +=3D $(CC_FLAGS_FTRACE)
 obj-$(CONFIG_FPROBE_SANITY_TEST) +=3D test_fprobe.o
 obj-$(CONFIG_HASHTABLE_KUNIT_TEST) +=3D hashtable_test.o
 obj-$(CONFIG_HASH_KUNIT_TEST) +=3D test_hash.o
+CFLAGS_longest_symbol_kunit.o +=3D $(call cc-disable-warning, missing-prot=
otypes)
+obj-$(CONFIG_LONGEST_SYM_KUNIT_TEST) +=3D longest_symbol_kunit.o
 obj-$(CONFIG_TEST_IOV_ITER) +=3D kunit_iov_iter.o
 obj-$(CONFIG_IS_SIGNED_TYPE_KUNIT_TEST) +=3D is_signed_type_kunit.o
 obj-$(CONFIG_KPROBES_SANITY_TEST) +=3D test_kprobes.o
diff --git a/lib/longest_symbol_kunit.c b/lib/tests/longest_symbol_kunit.c
similarity index 100%
rename from lib/longest_symbol_kunit.c
rename to lib/tests/longest_symbol_kunit.c
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

diff --cc lib/Makefile
index 651811f5d677,89b8a4bce108..000000000000
--- a/lib/Makefile
+++ b/lib/Makefile
@@@ -131,7 -119,7 +118,7 @@@ endi
  obj-$(CONFIG_DEBUG_INFO_REDUCED) +=3D debug_info.o
  CFLAGS_debug_info.o +=3D $(call cc-option, -femit-struct-debug-detailed=
=3Dany)
 =20
- obj-y +=3D math/ crypto/ vdso/
 -obj-y +=3D math/ crypto/ tests/
++obj-y +=3D math/ crypto/ vdso/ tests/
 =20
  obj-$(CONFIG_GENERIC_IOMAP) +=3D iomap.o
  obj-$(CONFIG_HAS_IOMEM) +=3D iomap_copy.o devres.o

--Sig_/X0vvp6GkZImaay8FbdTAEcl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfX+/kACgkQAVBC80lX
0Gxgwgf/b9uVpH6DELKYKwUiZOddCqHmijwyy53jqMhAGFrv3dLi9BretJ8S1w3a
auOfWMFLDrOiWJhm22yIxnMeXPZtgG2AoeSTikG3QXxdVEo8sQ7J6XOWiW398H3O
T/sxX1Y5HJxC25EC66FbrnQxsnzRzZ+UXjnHuD/l/2jp5S4w4mADMYRPYVqHY/85
r7ve+6IT/ezoQ42QSMwd2aiqrDqBpn8h2ThYq7hckgnOn+6xigMoG8p9JUfaTBvc
NeEndZL69udT23O4jmReI0yuzJLlLjz2HmyRmZtIWA4UHWnrLc3c4RoQ0fGl8THF
ZaBukr2pA9byVMnfiKqhp5RA4AJj8g==
=47UG
-----END PGP SIGNATURE-----

--Sig_/X0vvp6GkZImaay8FbdTAEcl--

