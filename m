Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDA32C9D1A
	for <lists+linux-next@lfdr.de>; Tue,  1 Dec 2020 10:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389705AbgLAJS6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Dec 2020 04:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390575AbgLAJSz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2020 04:18:55 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7B6C0613CF;
        Tue,  1 Dec 2020 01:18:15 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Clc2r05pcz9sVk;
        Tue,  1 Dec 2020 20:18:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606814293;
        bh=5zJ9IuqI4gLBzisy31CtAwLvFcCEejz2ewdPwr5ZIXc=;
        h=Date:From:To:Cc:Subject:From;
        b=XSoRTh+EHwvFZY78Bf2irWcrLekZ2C+PGMrccxGEqnd85wF9DEVmI4kJG5cc9SQqD
         s5ZfS+62iYm+R9Ney8uoxuEemKkMGPyjsV/JAD0ESElLAe7/Kt5nnQdOLvz2mt9BP+
         AAYJFpkwb25isMoCDhkCNl6VzsXdOVzV181sX9JChIdnr53bI48oQYHcDvbAsehYKb
         3tmNS2cRqTwhuYELoQpJw3+3tMIrqVwOuAEOznWh4q65iOU0FhL6jXsWVI+ws0J6bG
         YuQiJrcEpu0SfIJHp5RiFGMw27Qjz8YrMB0QUqO5l107VlCKPBaJ0/sl3BqTHtoiYi
         /yPpRKftEN26A==
Date:   Tue, 1 Dec 2020 20:18:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Andrew Klychkov <andrew.a.klychkov@gmail.com>,
        Andrew Klychkov <andrew.a.klyckov@gmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the akpm tree with the jc_docs tree
Message-ID: <20201201201811.72273de8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ik6Kq09lnXxTrI8ZCP38H7.";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ik6Kq09lnXxTrI8ZCP38H7.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  Documentation/dev-tools/kasan.rst

between commit:

  1a37e18bd4b9 ("Documentation: fix typos in dev-tools/kasan.rst")

from the jc_docs tree and commit:

  bb26c2574ff9 ("kasan: update documentation")

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/dev-tools/kasan.rst
index 6d9abe57feaa,0d5d77919b1a..000000000000
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@@ -357,37 -410,30 +410,30 @@@ Or, if one of the tests failed:
 =20
          not ok 1 - kasan
 =20
- (1) Loadable Module
- ~~~~~~~~~~~~~~~~~~~~
+=20
+ There are a few ways to run KUnit-compatible KASAN tests.
+=20
+ 1. Loadable module
+ ~~~~~~~~~~~~~~~~~~
 =20
  With ``CONFIG_KUNIT`` enabled, ``CONFIG_KASAN_KUNIT_TEST`` can be built as
- a loadable module and run on any architecture that supports KASAN
- using something like insmod or modprobe. The module is called ``test_kasa=
n``.
+ a loadable module and run on any architecture that supports KASAN by load=
ing
+ the module with insmod or modprobe. The module is called ``test_kasan``.
 =20
- (2) Built-In
- ~~~~~~~~~~~~~
+ 2. Built-In
+ ~~~~~~~~~~~
 =20
  With ``CONFIG_KUNIT`` built-in, ``CONFIG_KASAN_KUNIT_TEST`` can be built-=
in
- on any architecture that supports KASAN. These and any other KUnit
- tests enabled will run and print the results at boot as a late-init
- call.
 -on any architecure that supports KASAN. These and any other KUnit tests e=
nabled
++on any architecture that supports KASAN. These and any other KUnit tests =
enabled
+ will run and print the results at boot as a late-init call.
 =20
- (3) Using kunit_tool
- ~~~~~~~~~~~~~~~~~~~~~
+ 3. Using kunit_tool
+ ~~~~~~~~~~~~~~~~~~~
 =20
- With ``CONFIG_KUNIT`` and ``CONFIG_KASAN_KUNIT_TEST`` built-in, we can al=
so
- use kunit_tool to see the results of these along with other KUnit
- tests in a more readable way. This will not print the KASAN reports
- of tests that passed. Use `KUnit documentation <https://www.kernel.org/do=
c/html/latest/dev-tools/kunit/index.html>`_ for more up-to-date
- information on kunit_tool.
+ With ``CONFIG_KUNIT`` and ``CONFIG_KASAN_KUNIT_TEST`` built-in, it's also
+ possible use ``kunit_tool`` to see the results of these and other KUnit t=
ests
+ in a more readable way. This will not print the KASAN reports of the test=
s that
+ passed. Use `KUnit documentation <https://www.kernel.org/doc/html/latest/=
dev-tools/kunit/index.html>`_
+ for more up-to-date information on ``kunit_tool``.
 =20
  .. _KUnit: https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.h=
tml
-=20
- ``CONFIG_TEST_KASAN_MODULE`` is a set of KASAN tests that could not be
- converted to KUnit. These tests can be run only as a module with
- ``CONFIG_TEST_KASAN_MODULE`` built as a loadable module and
- ``CONFIG_KASAN`` built-in. The type of error expected and the
- function being run is printed before the expression expected to give
- an error. Then the error is printed, if found, and that test
- should be interpreted to pass only if the error was the one expected
- by the test.

--Sig_/Ik6Kq09lnXxTrI8ZCP38H7.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/GClMACgkQAVBC80lX
0GyGYAgAoBoLHvFv49xYYr413PvNhwnQYZX5kt2A6owS0+uNuuSPNB7jwMnryNUH
oXc1viN/bXp+JfDOZ4MumELIG31lf+5qCHQrFv49015Lp4Lxh3V6sw+hy9OsiVaZ
mpD/R3bRU1z2EN0kprEzufh+vO09egZUCxhMMrEoonGYXSCrtz3mKKigCGDU06o6
Va/trUCpvATjLIYmNYI/BBox42gp9uFPF47mTdSg50IlrRwpnkmwpPd2cwUzlNSJ
tYpDZyNBsQWW2IDJ1ulDG+CdCR1ol/bJ6F+M7ch0xzKNca9/LzCPGaJF0yPI8385
Bsx5MkMw8LTnZlmHvOXx7D+N/s74TQ==
=180w
-----END PGP SIGNATURE-----

--Sig_/Ik6Kq09lnXxTrI8ZCP38H7.--
