Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22BE34CB81
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 10:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234387AbhC2IsN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 04:48:13 -0400
Received: from ozlabs.org ([203.11.71.1]:54175 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235684AbhC2Ir1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 Mar 2021 04:47:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F85mm4qKLz9rx6;
        Mon, 29 Mar 2021 19:47:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617007643;
        bh=Yy4Jv0lgMuevs5rME1V/gSiGVpt0yOIbgdrJF0Z0mQY=;
        h=Date:From:To:Cc:Subject:From;
        b=NS3PsRVcy7pVHMzbUCU3RX37+mBETtMce0XOSY0mSuxn5WkYP3GX90aHohwIdpO46
         tRS+I8UeN696EHlTbJ4F611nyk/f/c2RHihEBmf9jdc6Qnmo0y3/q5Sq5pEMwmdnA+
         lFEBTWmAp1yVPUFkoGplLEwA+KVVPGSBDNXToenn9+8IPNAsKVpaHh0nwC6LdQHrce
         xuEqC2TMbmpZlpX7FJh7gFpeJw7DIsaVXo+Zn1OOeeNogR3U0UzjZBBXLokCbxq9ll
         bkjUNS6zgbBhefuo1p6qSwk3bPo28q+b3ize83icZIc8XTfY5vgtcaosyHJBTl2po9
         XCFO1m+YA6qzQ==
Date:   Mon, 29 Mar 2021 19:47:19 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the
 gpio-brgl tree
Message-ID: <20210329194719.6d37fe53@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6eEAtdzjwwt1OKLzJ_n4M5r";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6eEAtdzjwwt1OKLzJ_n4M5r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/bitmap.h

between commit:

  f7d5fbad07a4 ("lib: bitmap: order includes alphabetically")

from the gpio-brgl tree and commit:

  f3b90426c407 ("kernel.h: drop inclusion in bitmap.h")

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

diff --cc include/linux/bitmap.h
index 73d039476fa4,6cbcd9d9edd2..000000000000
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@@ -4,12 -4,11 +4,13 @@@
 =20
  #ifndef __ASSEMBLY__
 =20
+ #include <linux/align.h>
 -#include <linux/types.h>
  #include <linux/bitops.h>
- #include <linux/kernel.h>
+ #include <linux/limits.h>
  #include <linux/string.h>
 +#include <linux/types.h>
 +
 +struct device;
 =20
  /*
   * bitmaps provide bit arrays that consume one or more unsigned

--Sig_/6eEAtdzjwwt1OKLzJ_n4M5r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBhlBcACgkQAVBC80lX
0Gw0jQf/RPy8yXnVgrMFvd+titglbPPdIy6w0Cp3VMB7yy9ZnvLy7HcKuOqGUzRo
WpVJTptY/XddbMqpWDrixRmL7L0VgZGtxEKZBJoKxak9EjEg15OL9bLp/RIE29xD
A19MR9Zuml1oGkTqx8N0KhVh5nADOYmhqo86XWuvsAKbSOiV+wP6GfAN7Fp0qRnJ
ryc19j36LckCCmXLJkWUCPh4h+od9UhS0iBQ/F/Hg19nhuEBrEHoxmrttbnx8jRK
bWuLBZlxaQ5aemrPhwN7ikyDHB/V0U7giHwthBUW9emSRRflZAghmhxKFdXL5RYs
f2PwlgpxcL1hxo1jbXJfRc9VRPB/ng==
=SC3k
-----END PGP SIGNATURE-----

--Sig_/6eEAtdzjwwt1OKLzJ_n4M5r--
