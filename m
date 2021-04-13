Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E7B35DA8E
	for <lists+linux-next@lfdr.de>; Tue, 13 Apr 2021 10:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhDMJAB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Apr 2021 05:00:01 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37577 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229602AbhDMJAA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Apr 2021 05:00:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FKKL265Ypz9sVb;
        Tue, 13 Apr 2021 18:59:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618304379;
        bh=VKtSIaZlN6zQgB77gsMfonlemjizw1ElaXso+Si9YOE=;
        h=Date:From:To:Cc:Subject:From;
        b=ZeIiuNgY4qlzWmMk4wrp33AyrrXfrBG4+k9tv+TQx2uALBjtk6qqlnlC4LId8MRD2
         J3xorn/N00x0PhHMPNi+loGrLwfFlxw2v3euF6DgPbJyvvsFTaus5uU8WueT2tUMcO
         qWj7q3mK4XlrtHIqLuVXyeLjqxSdRMwpF7l29PDOHLLEqtgJ4IBP/1S2+Czsb/lBgN
         8/FXvAFbR/Faztk3bHT6YXFoydRtWFt5YOfsbrKlzzrqjxb7KJiq3dncmOs8DTqh+o
         7uQG6uEWUtO/v9sKtGdH+wO2Htuqnur72zK4n809J8yWt5aK3oQEpeVF12ZUoHqH1K
         vuhLfWEIkfVbA==
Date:   Tue, 13 Apr 2021 18:59:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Andrey Konovalov <andreyknvl@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Message-ID: <20210413185936.5095cb11@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tVdMoat4DynxqT9aEq/GMUk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/tVdMoat4DynxqT9aEq/GMUk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/test_kasan.c

between commits:

  2603f8a78dfb ("kasan: Add KASAN mode kernel parameter")
  e80a76aa1a91 ("kasan, arm64: tests supports for HW_TAGS async mode")

from the arm64 tree and commit:

  c616ba7e0d63 ("kasan: detect false-positives in tests")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc lib/test_kasan.c
index 785e724ce0d8,bf9225002a7e..000000000000
--- a/lib/test_kasan.c
+++ b/lib/test_kasan.c
@@@ -78,33 -83,30 +83,35 @@@ static void kasan_test_exit(struct kuni
   * fields, it can reorder or optimize away the accesses to those fields.
   * Use READ/WRITE_ONCE() for the accesses and compiler barriers around the
   * expression to prevent that.
+  *
+  * In between KUNIT_EXPECT_KASAN_FAIL checks, fail_data.report_found is k=
ept as
+  * false. This allows detecting KASAN reports that happen outside of the =
checks
+  * by asserting !fail_data.report_found at the start of KUNIT_EXPECT_KASA=
N_FAIL
+  * and in kasan_test_exit.
   */
- #define KUNIT_EXPECT_KASAN_FAIL(test, expression) do {		\
- 	if (IS_ENABLED(CONFIG_KASAN_HW_TAGS) &&			\
- 	    !kasan_async_mode_enabled())			\
- 		migrate_disable();				\
- 	WRITE_ONCE(fail_data.report_expected, true);		\
- 	WRITE_ONCE(fail_data.report_found, false);		\
- 	kunit_add_named_resource(test,				\
- 				NULL,				\
- 				NULL,				\
- 				&resource,			\
- 				"kasan_data", &fail_data);	\
- 	barrier();						\
- 	expression;						\
- 	barrier();						\
- 	if (kasan_async_mode_enabled())				\
- 		kasan_force_async_fault();			\
- 	barrier();						\
- 	KUNIT_EXPECT_EQ(test,					\
- 			READ_ONCE(fail_data.report_expected),	\
- 			READ_ONCE(fail_data.report_found));	\
- 	if (IS_ENABLED(CONFIG_KASAN_HW_TAGS) &&			\
- 	    !kasan_async_mode_enabled()) {			\
- 		if (READ_ONCE(fail_data.report_found))		\
- 			kasan_enable_tagging_sync();		\
- 		migrate_enable();				\
- 	}							\
+ #define KUNIT_EXPECT_KASAN_FAIL(test, expression) do {			\
 -	if (IS_ENABLED(CONFIG_KASAN_HW_TAGS))				\
++	if (IS_ENABLED(CONFIG_KASAN_HW_TAGS) &&				\
++	    !kasan_async_mode_enabled())				\
+ 		migrate_disable();					\
+ 	KUNIT_EXPECT_FALSE(test, READ_ONCE(fail_data.report_found));	\
+ 	WRITE_ONCE(fail_data.report_expected, true);			\
+ 	barrier();							\
+ 	expression;							\
+ 	barrier();							\
++	if (kasan_async_mode_enabled())					\
++		kasan_force_async_fault();				\
++	barrier();							\
+ 	KUNIT_EXPECT_EQ(test,						\
+ 			READ_ONCE(fail_data.report_expected),		\
+ 			READ_ONCE(fail_data.report_found));		\
 -	if (IS_ENABLED(CONFIG_KASAN_HW_TAGS)) {				\
++	if (IS_ENABLED(CONFIG_KASAN_HW_TAGS) &&				\
++	    !kasan_async_mode_enabled()) {				\
+ 		if (READ_ONCE(fail_data.report_found))			\
 -			kasan_enable_tagging();				\
++			kasan_enable_tagging_sync();			\
+ 		migrate_enable();					\
+ 	}								\
+ 	WRITE_ONCE(fail_data.report_found, false);			\
+ 	WRITE_ONCE(fail_data.report_expected, false);			\
  } while (0)
 =20
  #define KASAN_TEST_NEEDS_CONFIG_ON(test, config) do {			\

--Sig_/tVdMoat4DynxqT9aEq/GMUk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB1XXgACgkQAVBC80lX
0GyHlgf/YsCKthj/vtus/O+bZc4LIYI5YqZS84vgnRe+l6nWQSh/xJaEyAJ3xzL4
z5ZmDBs0Prb9vBC5Opi7i6m5pEUjLmZ7HH48u3Q5BDxbwwpiqw92ycTEZarxdsiL
WlwKToxHG7hUS9Y7mHM0GTI+y3S2Li/nAsdyF9RZpzIFPkskznW21spSu4pnd+km
zG9x6QJAOUWGF6R4hWfGd9Jv856KvbJ46AZtc134DaCGShsu0kkPOglAZkDQPX18
CZzcCFxxffFtZ7UZ2d/jsWzD+tORHnm+Y/uRlLM96BGxu42rQ6VAqogaYOrtUCss
LATtY7ADZMHzfTXbUc26a0XBkc6BfQ==
=gmbd
-----END PGP SIGNATURE-----

--Sig_/tVdMoat4DynxqT9aEq/GMUk--
