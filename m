Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB652D9535
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 10:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgLNJWX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 04:22:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgLNJVy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 04:21:54 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59956C0613CF;
        Mon, 14 Dec 2020 01:21:14 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvbVD21Dpz9sSf;
        Mon, 14 Dec 2020 20:21:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607937670;
        bh=wHjNKhy3pOXUqbQey4VI9/5o6XXbucGmpEfpFrZRHz4=;
        h=Date:From:To:Cc:Subject:From;
        b=pwoyInxZmXeKv9hqzFvFdQeqE1AALan7VJVQtT/sCiRfy78r/qNH55TrZQoSvvMn0
         eXrS/50dn/sYJsIbdVYgFsYswhUUeht+hIW5LuG8xbxFhhecse8cb3k/uYh8C1kuPc
         MuARBXZqfX6fGpAFIkyRdLJ95KTUo+lTLc8dVbRCzOr/kp61OG4f9IJWaLpGToPUDk
         z3X+F8YOtL595RGpgGeNxTXA/ahWiBDvOO/tEqe1Q4AxzuFT6M8D8/5A1nAHL4/txw
         +8Gz9h6XRTGU7o3Jj0KaUhfRilaUohpWBE+WIOMWa86xZdFLpnZoegyyZtKgSsdrjD
         JDZsTteYaicmQ==
Date:   Mon, 14 Dec 2020 20:21:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the risc-v
 tree
Message-ID: <20201214202107.66932c18@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/58.r08aEAzyJEhr4XiuKaJp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/58.r08aEAzyJEhr4XiuKaJp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/Makefile

between commit:

  527701eda5f1 ("lib: Add a generic version of devmem_is_allowed()")

from the risc-v tree and commits:

  8250e121c672 ("lib/list_kunit: follow new file name convention for KUnit =
tests")
  17bf776cf09a ("lib/linear_ranges_kunit: follow new file name convention f=
or KUnit tests")
  23fa4e39ee62 ("lib/bits_kunit: follow new file name convention for KUnit =
tests")
  1987f84faec6 ("lib/cmdline_kunit: add a new test suite for cmdline API")

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

diff --cc lib/Makefile
index bcedd691ef63,dc623561ef9d..000000000000
--- a/lib/Makefile
+++ b/lib/Makefile
@@@ -350,8 -350,7 +350,9 @@@ obj-$(CONFIG_PLDMFW) +=3D pldmfw
 =20
  # KUnit tests
  obj-$(CONFIG_BITFIELD_KUNIT) +=3D bitfield_kunit.o
- obj-$(CONFIG_LIST_KUNIT_TEST) +=3D list-test.o
- obj-$(CONFIG_LINEAR_RANGES_TEST) +=3D test_linear_ranges.o
- obj-$(CONFIG_BITS_TEST) +=3D test_bits.o
+ obj-$(CONFIG_BITS_TEST) +=3D bits_kunit.o
+ obj-$(CONFIG_CMDLINE_KUNIT_TEST) +=3D cmdline_kunit.o
+ obj-$(CONFIG_LINEAR_RANGES_TEST) +=3D linear_ranges_kunit.o
+ obj-$(CONFIG_LIST_KUNIT_TEST) +=3D list_kunit.o
 +
 +obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) +=3D devmem_is_allowed.o

--Sig_/58.r08aEAzyJEhr4XiuKaJp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XLoMACgkQAVBC80lX
0GxgBAf+IcFxcI9cMyTHKaPCJWINSaoPI5tNHB4st3D1Crc7SnfSKa51H/rZcwkq
zGRwvwAYWAZM2zlfyNYyXX57lqo65K8dxUB9t3G888C8nIvkN6+yxb2ZCHMic4I+
W3npIcO0MGDGuokIDu1n3qEaHTRrnODTttSpgBWPJX8/aAT4hzxWljpHPMREsR5o
QxbOAEmcWuW4wretKzDiHR0SXAH3hCP2u44NUe658u8xNENSUF2sUBAotmNLU6e3
R5asjrsKJzC+tN5hCeT/v50/V/5AJQnEMM4PlQSbQn8VatWxF0PiMFIYgaiO6a03
ggKE/81FzVhyk8kViQu1LVCaukITqA==
=NBgQ
-----END PGP SIGNATURE-----

--Sig_/58.r08aEAzyJEhr4XiuKaJp--
