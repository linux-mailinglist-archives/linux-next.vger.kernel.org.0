Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 147E91ECBE4
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 10:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgFCIur (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 04:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726451AbgFCIun (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2020 04:50:43 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAC9C03E96E;
        Wed,  3 Jun 2020 01:50:43 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cN0b5HQQz9sTF;
        Wed,  3 Jun 2020 18:50:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591174240;
        bh=ypxXuxhmE/IJfGvEhAB6ejWn+h+LQ7qlNA/n52FNwPs=;
        h=Date:From:To:Cc:Subject:From;
        b=SD2VzNB8KrC0CfXvNG4YOsVYJojB3OEDVQ4Nnq9J6qqLKn24jPtP3HukEPx0f0dbU
         ixL3ftvJ/uWW0bs5gGQyRDmRzy53FbsxP/d/t0wRTJOd7D4l+roJR82jdFG6XaoBuV
         hL3GEJj7DyMkYFxwCcuwX+Gtt/NWFf9Pr4ORxnJVmWV3G3W5Q1JbIrCseOPLRJNQF1
         KyUVGkGsaB2pACrV377H8qW+1y76oBRyktpzPGRi1y5h6Vo6Y8+rQK402dkvAJs82X
         QKBn9T56tQRh7sV/EjAWUM4nZyBy6ZVXS1DHT7ZoB7lu6yBE8l0Kh88s8Fa/cGK//t
         ro+Hs9MNVr9zQ==
Date:   Wed, 3 Jun 2020 18:50:38 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm-current tree with the powerpc
 tree
Message-ID: <20200603185038.296b18ae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JVpjBD/_51l/pxzhVpktdsH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JVpjBD/_51l/pxzhVpktdsH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/powerpc/mm/ptdump/ptdump.c

between commit:

  6b789a26d7da ("powerpc/ptdump: Handle hugepd at PGD level")

from the powerpc tree and patch:

  "powerpc: add support for folded p4d page tables"

from the akpm-current tree.

Thanks to Michael Ellerman for an example resolution.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/mm/ptdump/ptdump.c
index 5fc880e30175,507cb9793b26..000000000000
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@@ -333,13 -304,13 +333,15 @@@ static void walk_pagetables(struct pg_s
  	 * the hash pagetable.
  	 */
  	for (i =3D pgd_index(addr); i < PTRS_PER_PGD; i++, pgd++, addr +=3D PGDI=
R_SIZE) {
- 		if (pgd_none(*pgd) || pgd_is_leaf(*pgd))
- 			note_page(st, addr, 1, pgd_val(*pgd), PGDIR_SIZE);
- 		else if (is_hugepd(__hugepd(pgd_val(*pgd))))
- 			walk_hugepd(st, (hugepd_t *)pgd, addr, PGDIR_SHIFT, 1);
+ 		p4d_t *p4d =3D p4d_offset(pgd, 0);
+=20
 -		if (!p4d_none(*p4d) && !p4d_is_leaf(*p4d))
++		if (p4d_none(*p4d) || p4d_is_leaf(*p4d))
++			note_page(st, addr, 1, p4d_val(*p4d), PGDIR_SIZE);
++		else if (is_hugepd(__hugepd(p4d_val(*p4d))))
++			walk_hugepd(st, (hugepd_t *)p4d, addr, PGDIR_SHIFT, 1);
 +		else
- 			/* pgd exists */
- 			walk_pud(st, pgd, addr);
+ 			/* p4d exists */
+ 			walk_pud(st, p4d, addr);
 -		else
 -			note_page(st, addr, 1, p4d_val(*p4d));
  	}
  }
 =20

--Sig_/JVpjBD/_51l/pxzhVpktdsH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XZF4ACgkQAVBC80lX
0Gzzqgf/aKsN72wqrZdqkF7zpAyZv0PGdINzp+V3ZgAyHyeGIafRw4B8B1bIFQ9x
OBnuT5uHRw3UNNCXQW6zA86kbmMnPNWjKl6sUb4WrOptUrgU56zJPsFdnKmLvNWt
AHnciEHVeSzaT+cdv1i8aYi2KytbtaW7XXzJjRgzxEvLBW53cFzTXtTlgJ623klH
l8u7kg2tdxFuxBGHQnKu7t0n67vZNJVlfyYoVvK5HaacRZyFAZYB8dwSddSNSjAn
EHr0THyMoCKkjcCDPSCsHb7bHSuuUTDExO/hL7terST2EgzXJEbq0fsii08syF+c
YyH8kx78oLG9wwFeih2FjUuAYgQP8w==
=AbW2
-----END PGP SIGNATURE-----

--Sig_/JVpjBD/_51l/pxzhVpktdsH--
