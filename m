Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F33321CA83F
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 12:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgEHKWY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 May 2020 06:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726750AbgEHKWY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2020 06:22:24 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE45C05BD43;
        Fri,  8 May 2020 03:22:23 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49JRGN5tpbz9sRf;
        Fri,  8 May 2020 20:22:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588933341;
        bh=0eP6U+NWK0xCwg5huvpFDX9P9MaHXUOvW79JeY6HvRY=;
        h=Date:From:To:Cc:Subject:From;
        b=n/5n/GKGGCsZdI4upKuvZCEou+MpCKkdSqV1mA54dEnbVlIOuyiOs2AX+tcp5exdc
         401m+LJkSJnKtyYCGWlSIo/KHDG7v/c8JLGreZmYB5u5vVNVdF5ZwKDUao26RGhEZJ
         /OqrgHyyZyLuXrM8CuQrp9HnjN8UjSi7qFhrVu2QnkyI7hOpvvRwwyvoVMuisTGel7
         EpY3Kb9ek0KflnY6UvkRjspUgU+ebzSpKm+BuUMjAgqxkA3Zp2zJrHKaWPXm9I1Bw1
         SryKvC/JcdX/D45TFPwTiUegqxIxuGlrRwoKmfjqRYFcNEiyvK/o3QBKQP+KC6SxFt
         YDhohpfhqPEUA==
Date:   Fri, 8 May 2020 20:22:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Sandipan Das <sandipan@linux.ibm.com>
Subject: linux-next: manual merge of the akpm-current tree with the hmm tree
Message-ID: <20200508202217.4e5b9442@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iOmcVrOf7YhC3l4oDlRuo/9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iOmcVrOf7YhC3l4oDlRuo/9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  tools/testing/selftests/vm/Makefile

between commit:

  b0d449922eb8 ("mm/hmm/test: add selftests for HMM")

from the hmm tree and commit:

  3a07caa68f66 ("selftests: vm: pkeys: fix multilib builds for x86")

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

diff --cc tools/testing/selftests/vm/Makefile
index c6eb5305a0f6,d7eae41be628..000000000000
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@@ -34,8 -58,55 +59,57 @@@ TEST_FILES :=3D test_vmalloc.s
  KSFT_KHDR_INSTALL :=3D 1
  include ../lib.mk
 =20
+ ifeq ($(ARCH),x86_64)
+ BINARIES_32 :=3D $(patsubst %,$(OUTPUT)/%,$(BINARIES_32))
+ BINARIES_64 :=3D $(patsubst %,$(OUTPUT)/%,$(BINARIES_64))
+=20
+ define gen-target-rule-32
+ $(1) $(1)_32: $(OUTPUT)/$(1)_32
+ .PHONY: $(1) $(1)_32
+ endef
+=20
+ define gen-target-rule-64
+ $(1) $(1)_64: $(OUTPUT)/$(1)_64
+ .PHONY: $(1) $(1)_64
+ endef
+=20
+ ifeq ($(CAN_BUILD_I386),1)
+ $(BINARIES_32): CFLAGS +=3D -m32
+ $(BINARIES_32): LDLIBS +=3D -lrt -ldl -lm
+ $(BINARIES_32): %_32: %.c
+ 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
+ $(foreach t,$(TARGETS),$(eval $(call gen-target-rule-32,$(t))))
+ endif
+=20
+ ifeq ($(CAN_BUILD_X86_64),1)
+ $(BINARIES_64): CFLAGS +=3D -m64
+ $(BINARIES_64): LDLIBS +=3D -lrt -ldl
+ $(BINARIES_64): %_64: %.c
+ 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
+ $(foreach t,$(TARGETS),$(eval $(call gen-target-rule-64,$(t))))
+ endif
+=20
+ # x86_64 users should be encouraged to install 32-bit libraries
+ ifeq ($(CAN_BUILD_I386)$(CAN_BUILD_X86_64),01)
+ all: warn_32bit_failure
+=20
+ warn_32bit_failure:
+ 	@echo "Warning: you seem to have a broken 32-bit build" 2>&1;		\
+ 	echo  "environment. This will reduce test coverage of 64-bit" 2>&1;	\
+ 	echo  "kernels. If you are using a Debian-like distribution," 2>&1;	\
+ 	echo  "try:"; 2>&1;							\
+ 	echo  "";								\
+ 	echo  "  apt-get install gcc-multilib libc6-i386 libc6-dev-i386";	\
+ 	echo  "";								\
+ 	echo  "If you are using a Fedora-like distribution, try:";		\
+ 	echo  "";								\
+ 	echo  "  yum install glibc-devel.*i686";				\
+ 	exit 0;
+ endif
+ endif
+=20
 +$(OUTPUT)/hmm-tests: LDLIBS +=3D -lhugetlbfs -lpthread
 +
  $(OUTPUT)/userfaultfd: LDLIBS +=3D -lpthread
 =20
  $(OUTPUT)/mlock-random-test: LDLIBS +=3D -lcap

--Sig_/iOmcVrOf7YhC3l4oDlRuo/9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl61MtkACgkQAVBC80lX
0Gw3qgf+ORbO3azVXtR8qyfH3XIufSQI+LSOmdlh6sLbHMSrZTaQF/dww/JzxYjt
2O6dkaT77oYyk0rELeL1H3NG/BRCZqZrbf4MmOn8DjgrBLjEEr/jbBn3d79Xs57z
PiheQC95xeWrQsW5YwWv/AjSHEJRCUfjZx7YZY01Q1ResrhqVRuiROI9G6zIPg8L
hgbv4z9A8BDeOlyVqqN18nAA2oT+a9I0GN+8dCqQI+dwobs8u5vozIn2HLEctAlZ
sVISSdQt8buVd1q50CEFdovstbgVoBC7Jh+IHLOhOQZ7DaiuWwGoU2Y8g/C+q3RD
wWQkJWZPcX4kVZ2kh1WsYCqkxfGFZA==
=O108
-----END PGP SIGNATURE-----

--Sig_/iOmcVrOf7YhC3l4oDlRuo/9--
