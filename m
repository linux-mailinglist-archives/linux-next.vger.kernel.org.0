Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECF027A537
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 03:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgI1Bbh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Sep 2020 21:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726328AbgI1Bbh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 27 Sep 2020 21:31:37 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84BF0C0613CE;
        Sun, 27 Sep 2020 18:31:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C04kB4NN4z9sSG;
        Mon, 28 Sep 2020 11:31:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601256706;
        bh=nXvmOhQ6bKJ67BWsNvPj5hQv02XA1HY0pCCgQotsPtA=;
        h=Date:From:To:Cc:Subject:From;
        b=aTiOu0gQ96qUaB/1DdyTMBrUBUVg9ovSBD9IcEQOFRlbVyzol8Ymy2mvaqggJGxCy
         VZgXzSgGIbNGrovFLbEYAA8tIbLrjY7tN8Gg9PZqoEXGohGxSijTvthr/lLh8rn0SE
         KsIUfg1sjDWeWJ8pHIEXn99ZXQ8xHs2lDRNVBXKbh6lRd6DzvdUV95uyOXMPouSUl4
         YE1Kq+ElsF9TYsKU0rL20cCWXiN5ptRLRG9GH74ZQ4gbyCsTcchRBr4EWAVE69Z012
         4wHeWZDlUMvghpQehnfbKVYXyIvqre5P/3Vtdol2CjtE0hirrupqvpG2pPWB1/y/pW
         PkV91qkxdVylg==
Date:   Mon, 28 Sep 2020 11:31:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs tree
Message-ID: <20200928113142.0e38a8e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qheVJ7xcKeWdDoC54_An1fZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/qheVJ7xcKeWdDoC54_An1fZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from arch/arm/include/asm/atomic.h:11,
                 from include/linux/atomic.h:7,
                 from include/linux/crypto.h:15,
                 from include/crypto/hash.h:11,
                 from lib/iov_iter.c:2:
lib/iov_iter.c: In function 'copy_compat_iovec_from_user':
lib/iov_iter.c:1665:29: error: invalid use of undefined type 'struct compat=
_iovec'
 1665 |   unsafe_get_user(len, &uiov[i].iov_len, uaccess_end);
      |                             ^
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^
include/linux/uaccess.h:370:32: note: in expansion of macro 'unsafe_op_wrap'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                ^~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:238:3: note: in expansion of macro '__get_us=
er_check'
  238 |   __get_user_check(x, p);     \
      |   ^~~~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:296:28: note: in expansion of macro 'get_use=
r'
  296 | #define __get_user(x, ptr) get_user(x, ptr)
      |                            ^~~~~~~~
include/linux/uaccess.h:370:47: note: in expansion of macro '__get_user'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                               ^~~~~~~~~~
lib/iov_iter.c:1665:3: note: in expansion of macro 'unsafe_get_user'
 1665 |   unsafe_get_user(len, &uiov[i].iov_len, uaccess_end);
      |   ^~~~~~~~~~~~~~~
lib/iov_iter.c:1665:32: error: invalid use of undefined type 'const struct =
compat_iovec'
 1665 |   unsafe_get_user(len, &uiov[i].iov_len, uaccess_end);
      |                                ^
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^
include/linux/uaccess.h:370:32: note: in expansion of macro 'unsafe_op_wrap'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                ^~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:238:3: note: in expansion of macro '__get_us=
er_check'
  238 |   __get_user_check(x, p);     \
      |   ^~~~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:296:28: note: in expansion of macro 'get_use=
r'
  296 | #define __get_user(x, ptr) get_user(x, ptr)
      |                            ^~~~~~~~
include/linux/uaccess.h:370:47: note: in expansion of macro '__get_user'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                               ^~~~~~~~~~
lib/iov_iter.c:1665:3: note: in expansion of macro 'unsafe_get_user'
 1665 |   unsafe_get_user(len, &uiov[i].iov_len, uaccess_end);
      |   ^~~~~~~~~~~~~~~
lib/iov_iter.c:1665:29: error: invalid use of undefined type 'struct compat=
_iovec'
 1665 |   unsafe_get_user(len, &uiov[i].iov_len, uaccess_end);
      |                             ^
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^
include/linux/uaccess.h:370:32: note: in expansion of macro 'unsafe_op_wrap'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                ^~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:238:3: note: in expansion of macro '__get_us=
er_check'
  238 |   __get_user_check(x, p);     \
      |   ^~~~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:296:28: note: in expansion of macro 'get_use=
r'
  296 | #define __get_user(x, ptr) get_user(x, ptr)
      |                            ^~~~~~~~
include/linux/uaccess.h:370:47: note: in expansion of macro '__get_user'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                               ^~~~~~~~~~
lib/iov_iter.c:1665:3: note: in expansion of macro 'unsafe_get_user'
 1665 |   unsafe_get_user(len, &uiov[i].iov_len, uaccess_end);
      |   ^~~~~~~~~~~~~~~
lib/iov_iter.c:1665:32: error: invalid use of undefined type 'const struct =
compat_iovec'
 1665 |   unsafe_get_user(len, &uiov[i].iov_len, uaccess_end);
      |                                ^
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^
include/linux/uaccess.h:370:32: note: in expansion of macro 'unsafe_op_wrap'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                ^~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:238:3: note: in expansion of macro '__get_us=
er_check'
  238 |   __get_user_check(x, p);     \
      |   ^~~~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:296:28: note: in expansion of macro 'get_use=
r'
  296 | #define __get_user(x, ptr) get_user(x, ptr)
      |                            ^~~~~~~~
include/linux/uaccess.h:370:47: note: in expansion of macro '__get_user'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                               ^~~~~~~~~~
lib/iov_iter.c:1665:3: note: in expansion of macro 'unsafe_get_user'
 1665 |   unsafe_get_user(len, &uiov[i].iov_len, uaccess_end);
      |   ^~~~~~~~~~~~~~~
lib/iov_iter.c:1665:29: error: invalid use of undefined type 'struct compat=
_iovec'
 1665 |   unsafe_get_user(len, &uiov[i].iov_len, uaccess_end);
      |                             ^
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^
include/linux/uaccess.h:370:32: note: in expansion of macro 'unsafe_op_wrap'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                ^~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:238:3: note: in expansion of macro '__get_us=
er_check'
  238 |   __get_user_check(x, p);     \
      |   ^~~~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:296:28: note: in expansion of macro 'get_use=
r'
  296 | #define __get_user(x, ptr) get_user(x, ptr)
      |                            ^~~~~~~~
include/linux/uaccess.h:370:47: note: in expansion of macro '__get_user'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                               ^~~~~~~~~~
lib/iov_iter.c:1665:3: note: in expansion of macro 'unsafe_get_user'
 1665 |   unsafe_get_user(len, &uiov[i].iov_len, uaccess_end);
      |   ^~~~~~~~~~~~~~~
lib/iov_iter.c:1665:32: error: invalid use of undefined type 'const struct =
compat_iovec'
 1665 |   unsafe_get_user(len, &uiov[i].iov_len, uaccess_end);
      |                                ^
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^
include/linux/uaccess.h:370:32: note: in expansion of macro 'unsafe_op_wrap'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                ^~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:238:3: note: in expansion of macro '__get_us=
er_check'
  238 |   __get_user_check(x, p);     \
      |   ^~~~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:296:28: note: in expansion of macro 'get_use=
r'
  296 | #define __get_user(x, ptr) get_user(x, ptr)
      |                            ^~~~~~~~
include/linux/uaccess.h:370:47: note: in expansion of macro '__get_user'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                               ^~~~~~~~~~
lib/iov_iter.c:1665:3: note: in expansion of macro 'unsafe_get_user'
 1665 |   unsafe_get_user(len, &uiov[i].iov_len, uaccess_end);
      |   ^~~~~~~~~~~~~~~
lib/iov_iter.c:1666:29: error: invalid use of undefined type 'struct compat=
_iovec'
 1666 |   unsafe_get_user(buf, &uiov[i].iov_base, uaccess_end);
      |                             ^
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^
include/linux/uaccess.h:370:32: note: in expansion of macro 'unsafe_op_wrap'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                ^~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:238:3: note: in expansion of macro '__get_us=
er_check'
  238 |   __get_user_check(x, p);     \
      |   ^~~~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:296:28: note: in expansion of macro 'get_use=
r'
  296 | #define __get_user(x, ptr) get_user(x, ptr)
      |                            ^~~~~~~~
include/linux/uaccess.h:370:47: note: in expansion of macro '__get_user'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                               ^~~~~~~~~~
lib/iov_iter.c:1666:3: note: in expansion of macro 'unsafe_get_user'
 1666 |   unsafe_get_user(buf, &uiov[i].iov_base, uaccess_end);
      |   ^~~~~~~~~~~~~~~
lib/iov_iter.c:1666:32: error: invalid use of undefined type 'const struct =
compat_iovec'
 1666 |   unsafe_get_user(buf, &uiov[i].iov_base, uaccess_end);
      |                                ^
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^
include/linux/uaccess.h:370:32: note: in expansion of macro 'unsafe_op_wrap'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                ^~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:238:3: note: in expansion of macro '__get_us=
er_check'
  238 |   __get_user_check(x, p);     \
      |   ^~~~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:296:28: note: in expansion of macro 'get_use=
r'
  296 | #define __get_user(x, ptr) get_user(x, ptr)
      |                            ^~~~~~~~
include/linux/uaccess.h:370:47: note: in expansion of macro '__get_user'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                               ^~~~~~~~~~
lib/iov_iter.c:1666:3: note: in expansion of macro 'unsafe_get_user'
 1666 |   unsafe_get_user(buf, &uiov[i].iov_base, uaccess_end);
      |   ^~~~~~~~~~~~~~~
lib/iov_iter.c:1666:29: error: invalid use of undefined type 'struct compat=
_iovec'
 1666 |   unsafe_get_user(buf, &uiov[i].iov_base, uaccess_end);
      |                             ^
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^
include/linux/uaccess.h:370:32: note: in expansion of macro 'unsafe_op_wrap'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                ^~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:238:3: note: in expansion of macro '__get_us=
er_check'
  238 |   __get_user_check(x, p);     \
      |   ^~~~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:296:28: note: in expansion of macro 'get_use=
r'
  296 | #define __get_user(x, ptr) get_user(x, ptr)
      |                            ^~~~~~~~
include/linux/uaccess.h:370:47: note: in expansion of macro '__get_user'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                               ^~~~~~~~~~
lib/iov_iter.c:1666:3: note: in expansion of macro 'unsafe_get_user'
 1666 |   unsafe_get_user(buf, &uiov[i].iov_base, uaccess_end);
      |   ^~~~~~~~~~~~~~~
lib/iov_iter.c:1666:32: error: invalid use of undefined type 'const struct =
compat_iovec'
 1666 |   unsafe_get_user(buf, &uiov[i].iov_base, uaccess_end);
      |                                ^
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^
include/linux/uaccess.h:370:32: note: in expansion of macro 'unsafe_op_wrap'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                ^~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:238:3: note: in expansion of macro '__get_us=
er_check'
  238 |   __get_user_check(x, p);     \
      |   ^~~~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:296:28: note: in expansion of macro 'get_use=
r'
  296 | #define __get_user(x, ptr) get_user(x, ptr)
      |                            ^~~~~~~~
include/linux/uaccess.h:370:47: note: in expansion of macro '__get_user'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                               ^~~~~~~~~~
lib/iov_iter.c:1666:3: note: in expansion of macro 'unsafe_get_user'
 1666 |   unsafe_get_user(buf, &uiov[i].iov_base, uaccess_end);
      |   ^~~~~~~~~~~~~~~
lib/iov_iter.c:1666:29: error: invalid use of undefined type 'struct compat=
_iovec'
 1666 |   unsafe_get_user(buf, &uiov[i].iov_base, uaccess_end);
      |                             ^
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^
include/linux/uaccess.h:370:32: note: in expansion of macro 'unsafe_op_wrap'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                ^~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:238:3: note: in expansion of macro '__get_us=
er_check'
  238 |   __get_user_check(x, p);     \
      |   ^~~~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:296:28: note: in expansion of macro 'get_use=
r'
  296 | #define __get_user(x, ptr) get_user(x, ptr)
      |                            ^~~~~~~~
include/linux/uaccess.h:370:47: note: in expansion of macro '__get_user'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                               ^~~~~~~~~~
lib/iov_iter.c:1666:3: note: in expansion of macro 'unsafe_get_user'
 1666 |   unsafe_get_user(buf, &uiov[i].iov_base, uaccess_end);
      |   ^~~~~~~~~~~~~~~
lib/iov_iter.c:1666:32: error: invalid use of undefined type 'const struct =
compat_iovec'
 1666 |   unsafe_get_user(buf, &uiov[i].iov_base, uaccess_end);
      |                                ^
include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
   78 | # define unlikely(x) __builtin_expect(!!(x), 0)
      |                                          ^
include/linux/uaccess.h:370:32: note: in expansion of macro 'unsafe_op_wrap'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                ^~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:238:3: note: in expansion of macro '__get_us=
er_check'
  238 |   __get_user_check(x, p);     \
      |   ^~~~~~~~~~~~~~~~
arch/arm/include/asm/uaccess.h:296:28: note: in expansion of macro 'get_use=
r'
  296 | #define __get_user(x, ptr) get_user(x, ptr)
      |                            ^~~~~~~~
include/linux/uaccess.h:370:47: note: in expansion of macro '__get_user'
  370 | #define unsafe_get_user(x,p,e) unsafe_op_wrap(__get_user(x,p),e)
      |                                               ^~~~~~~~~~
lib/iov_iter.c:1666:3: note: in expansion of macro 'unsafe_get_user'
 1666 |   unsafe_get_user(buf, &uiov[i].iov_base, uaccess_end);
      |   ^~~~~~~~~~~~~~~

Caused by commit

  99dc3a9dd6ca ("iov_iter: refactor rw_copy_check_uvector and import_iovec")

CONFIG_COMAPT is not set for this build ...

I have added the following hack patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 28 Sep 2020 11:25:57 +1000
Subject: [PATCH] iov_iter: fix build when CONFIG_COMPAT is not set

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 lib/iov_iter.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 8a8e25f8e3e8..5892f4c40291 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1648,6 +1648,7 @@ const void *dup_iter(struct iov_iter *new, struct iov=
_iter *old, gfp_t flags)
 }
 EXPORT_SYMBOL(dup_iter);
=20
+#ifdef CONFIG_COMPAT
 static int copy_compat_iovec_from_user(struct iovec *iov,
 		const struct iovec __user *uvec, unsigned long nr_segs)
 {
@@ -1679,7 +1680,8 @@ static int copy_compat_iovec_from_user(struct iovec *=
iov,
 	user_access_end();
 	return ret;
 }
-	=09
+#endif /* CONFIG_COMPAT */
+
 static int copy_iovec_from_user(struct iovec *iov,
 		const struct iovec __user *uvec, unsigned long nr_segs)
 {
@@ -1717,9 +1719,11 @@ struct iovec *iovec_from_user(const struct iovec __u=
ser *uvec,
 			return ERR_PTR(-ENOMEM);
 	}
=20
+#ifdef CONFIG_COMPAT
 	if (compat)
 		ret =3D copy_compat_iovec_from_user(iov, uvec, nr_segs);
 	else
+#endif
 		ret =3D copy_iovec_from_user(iov, uvec, nr_segs);
 	if (ret) {
 		if (iov !=3D fast_iov)
--=20
2.28.0

--=20
Cheers,
Stephen Rothwell

--Sig_/qheVJ7xcKeWdDoC54_An1fZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9xPP4ACgkQAVBC80lX
0GzDeAf/azPMUS6TKIx8m9cDbPLiiZXrU0ZaoOBdG0FGVISoxUjPpt7PygnLOgsr
AA/sQ8cSWIaqhjRIItcAuRHKDrfd+wDw4uqPJEfCdnF+kS3dBtXU26QHfIjtqUAg
16s+ZhL3KZVbjPQqIKv8k4wd14pAACPGjjZrJUBlvibKBdbcP9PHNfFlf6TvE3rT
/571otfW/rtZ9d7lx2Aqf5Pa1WgdI4ZxdweFBFOfWMWsu1zFxv1OS9OrGokR+JyH
afu9bNqFQ8rJ6q3WBKq+9x/TR4OJhKopEhVGFGQontt+5+L1hne7Chwl0i97k1WG
KUz01iEqohKwIO5hmA4kID2Bqm+JXg==
=6uo4
-----END PGP SIGNATURE-----

--Sig_/qheVJ7xcKeWdDoC54_An1fZ--
