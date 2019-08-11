Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1E9B894DB
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 01:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfHKXTj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Aug 2019 19:19:39 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37111 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbfHKXTj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Aug 2019 19:19:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 466FLH4JJnz9s00;
        Mon, 12 Aug 2019 09:19:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565565576;
        bh=wPCT2WTXBYyy3JKuYxFMQHhR5bJiR/Hp9VAWzW6jjzg=;
        h=Date:From:To:Cc:Subject:From;
        b=R2zaZwASExQ1Nersrcwb0xEbPQxTYvs40IR7Kp0Wl+jF1AXX2Qldv+s+hfLz3zc64
         sN53aDoMoeB1pIYsbbdnr2bnJ4J0UoI6YbCy8c0hWidqV6PQYT/Sk87qBAVshWy9Ek
         8evSN8r0+ZvtswyThgtZOjCezHr/UrDC3YsBAZhZEFAmUNHoeDE5toISZvJ8h7lPhj
         peMf3KcXTZxgBA0A1zlVKTNWdNH+iIS3tXWl7UBcirWTP/MGv2/kkSEd7MyHeARfZ7
         N0atEe7dmEaNIuVAcZQ0Bm/SrkvsL4/hWskQu2TwZEv/W48my/UEggLV1atpErSvuL
         I0t3Io4baE7lA==
Date:   Mon, 12 Aug 2019 09:19:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Paul Burton <paul.burton@mips.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: linux-next: manual merge of the mips tree with Linus' tree
Message-ID: <20190812091915.6ce11ea7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YELST0//HVa5J11uvx0/NHc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YELST0//HVa5J11uvx0/NHc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  Documentation/index.rst

between commit:

  08a69058c02f ("docs: power: add it to to the main documentation index")

from Linus' tree and commit:

  97689a1a3fda ("doc: Add doc for the Ingenic TCU hardware")

from the mips tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/index.rst
index 2df5a3da563c,87214feda41f..000000000000
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@@ -145,7 -143,7 +145,8 @@@ implementation
     arm64/index
     ia64/index
     m68k/index
+    mips/index
 +   powerpc/index
     riscv/index
     s390/index
     sh/index

--Sig_/YELST0//HVa5J11uvx0/NHc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1QonMACgkQAVBC80lX
0GxbQgf/Sql0Ef+sJWJQLwaqXLG1aYx1sLNgM5WunCV/I9VkullGEeD69w6tEfEJ
hH0VcYtONbCV8/5O2nBcusBzeTP/y9QmQ206H0FORA9ARrB9Sq+XJANoPGkWhXG0
0h9bxZJp6WNSb1MFdPK0CNaTf6/gD5aDAM3Vs/estDs8rfOGBjK/NxqT+zQ8L75s
FcH5ggQLlXUS4kiMLWPS/NeWyLLCka8g1Gpy78gDMPQWHY+G39NH+goqOOdTucZ0
lPSBY0aiM2H6IVSwhSOEPVYySICRhSDNUNSKGk8o9kjYIwnvSsYC4y5v1KBZGF96
Nmx2PkIQsLpa0MNwZKTdAOw0S10/Yg==
=ZsZr
-----END PGP SIGNATURE-----

--Sig_/YELST0//HVa5J11uvx0/NHc--
