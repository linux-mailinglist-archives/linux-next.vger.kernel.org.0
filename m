Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08A852AB10D
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 07:01:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729192AbgKIGBF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Nov 2020 01:01:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728951AbgKIGBF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Nov 2020 01:01:05 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD2FC0613CF;
        Sun,  8 Nov 2020 22:01:05 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CV0j773Nrz9s0b;
        Mon,  9 Nov 2020 17:00:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604901661;
        bh=Trpddkr5TEGyIElEB2ATZpjULhHxqrFRZrIQyzuu0QE=;
        h=Date:From:To:Cc:Subject:From;
        b=nRnJQy2dS/cTK37gIzaHUsBHZeHl5ejOX9scIjD/w9aDZVnq/wr2RWNyBc4TAVhpk
         +gVxjqmR79/nvG7cC5lq5YH5+D9iiYkGv/sIPp8FxuXK29l2Gpzb9hvsbhr1P3WbJz
         N/DYigeoxTgMzns8eqgUrw4tMuIm6wP1gtsz4jPikkGj+MYHRmtRR9R5YilLE2bX7w
         mFQUluepUPkrWm0YbISlOAdPzHg6MZMhyrldU2PrmmhEv7R8+uynkGzTHPyxpXvZZr
         I+NnlJ0x7L7jnvRjAAirVmeIEjPWgH8qtFqEsfzhTWnN9rXLmizWLyJduvJ5VpaO3R
         ce7R5snVKGQZA==
Date:   Mon, 9 Nov 2020 17:00:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Message-ID: <20201109170043.58986880@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Sd.KtiMYOMj.cT.V_1CNbap";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Sd.KtiMYOMj.cT.V_1CNbap
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arc/Kconfig

between commit:

  39cac191ff37 ("arc/mm/highmem: Use generic kmap atomic implementation")

from the tip tree and commit:

  b41c56d2a9e6 ("arc: use FLATMEM with freeing of unused memory map instead=
 of DISCONTIGMEM")

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

diff --cc arch/arc/Kconfig
index 1a1ee5c4c2e7,c874f8ab0341..000000000000
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@@ -505,8 -507,7 +506,8 @@@ config LINUX_RAM_BAS
 =20
  config HIGHMEM
  	bool "High Memory Support"
- 	select ARCH_DISCONTIGMEM_ENABLE
+ 	select HAVE_ARCH_PFN_VALID
 +	select KMAP_LOCAL
  	help
  	  With ARC 2G:2G address split, only upper 2G is directly addressable by
  	  kernel. Enable this to potentially allow access to rest of 2G and PAE

--Sig_/Sd.KtiMYOMj.cT.V_1CNbap
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+o2wsACgkQAVBC80lX
0GxcuQgAjWeh1upCcTkPEQ4h6ONzTIUDWD4B7//udYjipr90FnD3vc6cv7Q03+sR
zHsxJFCVhceIaQ/CM0BefvSQcTs3mmNqUuWm2fxLY16Qdqc/u5ULD+xM4MSxNubM
LXS5UYNsjNdl01xdTAt+duxPVLKsD70DNiWKDxhIB72fmtPGJFBahqF3A25vrylN
Ag2eTWSnNvOHk+WpOpTQ0LHWEdIDRbbKivpdAKSaEkRaGvXxFhL9kVL8/JrEH+oy
68FjXLdCwoNNO0QNxpN9irwlkqe4rWmHdn4nZrRXR0Y8jIlKimfwvocHlovNFTtj
jDbBkQEXucD/VyLkhbzD8FdEcXp2gQ==
=fZ0U
-----END PGP SIGNATURE-----

--Sig_/Sd.KtiMYOMj.cT.V_1CNbap--
