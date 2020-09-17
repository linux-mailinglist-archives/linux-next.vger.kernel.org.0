Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC3F326D73D
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 10:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgIQI5i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 04:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgIQI5h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Sep 2020 04:57:37 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD77C06174A;
        Thu, 17 Sep 2020 01:57:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BsW7Z2M8fz9sSC;
        Thu, 17 Sep 2020 18:57:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600333050;
        bh=x+1vU5s/qiYCUF+IZF2QwlxWyd8G1Gbr/+jRFDRLYsQ=;
        h=Date:From:To:Cc:Subject:From;
        b=hIpHaiHjARQMG9yODevuXD3saGCjTXzTfRhk1DdtHGusBJMlkuFIStPOnaw8YVF42
         QXb2IYOzKa0yvxAgfn4GzWmUtUI/kVxeshowDOTN8AWizwm28DZd7ZRikTqPJ5DRxd
         2153q1PVAwjM4Uiy6J470i148Y0ERQU2TpiMPm645dFjG5vZ7jEweswMhui4wdGef/
         hm3sTUmjxanSU05jyVviyLLwwUf/xzxxK9kwjGnC/1j0JQ4yw24OVz/CZTQjGl8zrR
         nWWfFRQwiJHiKKMvIHLOmjHseXabNFKPYPrxxQ7tZUyiEwXSZM0fP8wKDjPsMaUC17
         t24uqqPFB1GZQ==
Date:   Thu, 17 Sep 2020 18:57:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Mike Rapoport <rppt@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the powerpc
 tree
Message-ID: <20200917185729.7911e2b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h=lzTyWsgBMheYWQVF1XVyg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/h=lzTyWsgBMheYWQVF1XVyg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/powerpc/mm/kasan/kasan_init_32.c

between commit:

  4c42dc5c69a8 ("powerpc/kasan: Fix CONFIG_KASAN_VMALLOC for 8xx")

from the powerpc tree and commit:

  76713c119a9d ("arch, drivers: replace for_each_membock() with for_each_me=
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

diff --cc arch/powerpc/mm/kasan/kasan_init_32.c
index 929716ea21e9,26fda3203320..000000000000
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@@ -137,12 -138,12 +137,12 @@@ void __init kasan_mmu_init(void
 =20
  void __init kasan_init(void)
  {
- 	struct memblock_region *reg;
+ 	phys_addr_t base, end;
 +	int ret;
+ 	u64 i;
 =20
- 	for_each_memblock(memory, reg) {
- 		phys_addr_t base =3D reg->base;
- 		phys_addr_t top =3D min(base + reg->size, total_lowmem);
+ 	for_each_mem_range(i, &base, &end) {
+ 		phys_addr_t top =3D min(end, total_lowmem);
 -		int ret;
 =20
  		if (base >=3D top)
  			continue;

--Sig_/h=lzTyWsgBMheYWQVF1XVyg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9jJPkACgkQAVBC80lX
0GzX1Qf/WyTnkTqyUByLSsUHq60F3H+M30drzVVUeJ62iEtD/O42AYpwitbMsJTf
QHZNYbop7aCBXjmPTbSg93xiV/npJz71eFbbwYxjdWG2WNcRHT6TEKtFzqdkmI7d
or+2qYkq14sYkqm1jv3+8dLBmKBS2lGZ0XCdrnQKk4NmwtcLo443o5TGZZhxl7Ee
sfRK7oxl3ESYSVPUL7B/uBC59Iwkr0f7WhTQ6lKZLDXMZLKXOQ2AoNL9RwAI21D6
7yakCPtax05i0aJl4FJEuOGuP32pgJmdxvqFK4WemEoOXrXK6CUDBr7IE5e7jliO
/2U/kf7dDag+gQL9tklDqdHkkL/NUQ==
=f7B6
-----END PGP SIGNATURE-----

--Sig_/h=lzTyWsgBMheYWQVF1XVyg--
