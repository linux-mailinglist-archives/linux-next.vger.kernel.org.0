Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C46F0271D0B
	for <lists+linux-next@lfdr.de>; Mon, 21 Sep 2020 10:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgIUIEF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Sep 2020 04:04:05 -0400
Received: from ozlabs.org ([203.11.71.1]:49579 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726475AbgIUID7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Sep 2020 04:03:59 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bvxlw2NPFz9sVM;
        Mon, 21 Sep 2020 18:03:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600675436;
        bh=q0F6idTpwc+Dm6dwxWE7RZeQQGaT5vBD1szhy4qsIDM=;
        h=Date:From:To:Cc:Subject:From;
        b=vKNGwmy+i7PN7EClC1cPrAfznDuBBdBZyoZmq6graDUQxFhGOP1NlQoGlPIzj9rPZ
         BI8nNJUq7WXr370EeUw0R8K0EFloy6kjgTcSsxw1uX6/3bulixdIdqtNGGEuH+JKuE
         bi9bKtI9taYveWcLudProgk4Lx0IEb0uM+yNSOlppMfgAbhebbHxSd7Mb3cydIheNf
         j0nEatlus9OQUgnwwj1ZtCEMPJY+v6qojXZGSLER77btSUt5pYbRRM6T8a0yq+9Mfx
         OKAUIj0ShoTr8725FEwCyOv7CcsQvAkcXqPX8Sfg26ShMGhi6q3zygQ8c7IrNA+n9f
         xyXqEzpfoepeg==
Date:   Mon, 21 Sep 2020 18:03:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Mike Rapoport <rppt@linux.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Message-ID: <20200921180353.421484e8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FB/FyPYpIBh1H2M2TEO3gze";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/FB/FyPYpIBh1H2M2TEO3gze
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,


Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm64/mm/mmu.c

between commit:

  0178dc761368 ("arm64: mte: Use Normal Tagged attributes for the linear ma=
p")

from the arm64 tree and commit:

  8e19cbb9528f ("arch, drivers: replace for_each_membock() with for_each_me=
m_range()")

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

diff --cc arch/arm64/mm/mmu.c
index 087a844b4d26,64211436629d..000000000000
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@@ -493,21 -483,10 +494,15 @@@ static void __init map_mem(pgd_t *pgdp
  #endif
 =20
  	/* map all the memory banks */
- 	for_each_memblock(memory, reg) {
- 		phys_addr_t start =3D reg->base;
- 		phys_addr_t end =3D start + reg->size;
-=20
+ 	for_each_mem_range(i, &start, &end) {
  		if (start >=3D end)
  			break;
- 		if (memblock_is_nomap(reg))
- 			continue;
-=20
 -		__map_memblock(pgdp, start, end, PAGE_KERNEL, flags);
 +		/*
 +		 * The linear map must allow allocation tags reading/writing
 +		 * if MTE is present. Otherwise, it has the same attributes as
 +		 * PAGE_KERNEL.
 +		 */
 +		__map_memblock(pgdp, start, end, PAGE_KERNEL_TAGGED, flags);
  	}
 =20
  	/*

--Sig_/FB/FyPYpIBh1H2M2TEO3gze
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9oXmkACgkQAVBC80lX
0Gz7Zwf+NRQXl32XFQTnt0Tki9LEvDg9BAUrZi5+tlVgeSCZCk/o1gnohNfHYMjd
mwPl3ISaPpE8bn2K35SS7xRIJ1Yom2vOq5Etxpz8684EKJ3C+MCA/5NYlpdgr32q
qSc+E810vXQhCy5wNC0ufvsi1IWhTUTIGGshu0GkJDnko0TkEsAxPG2L0tA1Tagn
zMQEg4GuuPsZXL96X8n6NplUXW6GJ3eQkCy9ciwnNZeP7O0RUx+UrjKoOgG4k+mK
WnK7XU22/DBwwjlehBAeoaA9F9zsXQFpznNzNQxIGPJHtImLjWLnVFAoqQW9N/YY
FeEU7Tp+bVsTrIeMhslLHNsXpPR5cw==
=kwfM
-----END PGP SIGNATURE-----

--Sig_/FB/FyPYpIBh1H2M2TEO3gze--
