Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A842CF166
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2019 05:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbfJHDob (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Oct 2019 23:44:31 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55701 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729772AbfJHDob (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Oct 2019 23:44:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46nNWc6p6vz9sN1;
        Tue,  8 Oct 2019 14:44:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570506269;
        bh=qVUvg5eUzi+xbVw93VditaCtDJH22M296dmyUJg5xss=;
        h=Date:From:To:Cc:Subject:From;
        b=Jv62sIcz58cn78k296RK/Dn1UlPyBD6Oxi2PQ+ApclHWCd/PAHEcr3EIrUaX9txvY
         QkHHk22k7KEIqKCYXqqzpr3BW9NnZW73dJIla8H1s247am/ERZeTlr7ffastTn5SAP
         bYnf/hboovWRnhZTWP7rpZHVUqxb0uu8OP+mJrx78ldIO1OTGwJEm1zd1C3sCKY1gg
         A30moEzMpwuBQ+95tel8ojzlXFSJ00o5wFi6x6fOaO2zA4imZG84PqwNLW7bMbtbKq
         CMaPxG6EVOjK2yv9hAJp9kQg6KfqPNERxh8UjZ64P+OXZpYtJnPny7/i+qKUv2NUMH
         N+ftxPHMw2NYg==
Date:   Tue, 8 Oct 2019 14:44:28 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Sasha Levin <sashal@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Branden Bonaby <brandonbonaby94@gmail.com>,
        Changbin Du <changbin.du@gmail.com>
Subject: linux-next: manual merge of the akpm tree with the hyperv tree
Message-ID: <20191008144428.49143860@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UOIwwKO65pwrsB6ikXZ4nzM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UOIwwKO65pwrsB6ikXZ4nzM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  lib/Kconfig.debug

between commit:

  54dc8d00a0be ("drivers: hv: vmbus: Introduce latency testing")

from the hyperv tree and patch:

  "kernel-hacking: create submenu for arch special debugging options"

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

diff --cc lib/Kconfig.debug
index 905ce80e6ac4,9a6d7e4955a5..000000000000
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@@ -2156,13 -2156,10 +2156,17 @@@ config DEBUG_AID_FOR_SYZBO
         help
           This option is intended for testing by syzbot.
 =20
+ menu "$(SRCARCH) Debugging"
+=20
  source "arch/$(SRCARCH)/Kconfig.debug"
 =20
+ endmenu
+=20
 +config HYPERV_TESTING
 +	bool "Microsoft Hyper-V driver testing"
 +	default n
 +	depends on HYPERV && DEBUG_FS
 +	help
 +	  Select this option to enable Hyper-V vmbus testing.
 +
  endmenu # Kernel hacking

--Sig_/UOIwwKO65pwrsB6ikXZ4nzM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2cBhwACgkQAVBC80lX
0Gw0nQf/Wtq8UKGSqCvqgIl4myoTYNWLxJNSuf8EQvioR5wo5GgNaA6MoKdNFaEC
fLF/iDPZrZTAOCE02g5ErVaqBBNnEMDhNnp3AGpslXivm4ZkLApv8WJl6+j8tWgC
8QXo3khnKsRZ3tWnDLBep9ngrXQtvo3wHYX4ibGGe/Owr8/voDR60aTbcAr1WOO5
eoXO7DI0QzJ7VibUNX3NTVRKiyUlXQP3U08anVEhhWUslJojZyExhX3dDtOhuUsT
Xf4d2HAr/33PoRqu3s/LfChI002rKLZwHuCrnwxbrs96aFOfsYHVoTbt8MZWNgOn
5jUHPCULDTYOi1Rxa0coZ3Ektddv8g==
=RXLL
-----END PGP SIGNATURE-----

--Sig_/UOIwwKO65pwrsB6ikXZ4nzM--
