Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC17368DE2
	for <lists+linux-next@lfdr.de>; Fri, 23 Apr 2021 09:24:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241042AbhDWHYf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Apr 2021 03:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241165AbhDWHYd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Apr 2021 03:24:33 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF85C061756;
        Fri, 23 Apr 2021 00:23:57 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FRQkw1mKKz9sWK;
        Fri, 23 Apr 2021 17:23:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1619162634;
        bh=mDSRs4+3iPEyJAKkBiIv+W4TmlD0xECuv0lW1u3XeiM=;
        h=Date:From:To:Cc:Subject:From;
        b=HvyNiarUwsFe+167YVKwcBnmF2poXgQY4EL4/6kwWvLO5Yeg+XzkmsxTRb/LnJMOF
         b/0Hw1V2P6ndrH+4IuqeezHncC7KuuNJQGC2msn/vyYyDqTVd2yWjl2a7iCoJCIGgU
         Dg6Z1fp3xpzxn0vVhvr4E2zB8HbDZf1EqMkRRzYHVkwMJ4slt63bwZitqbkzXBD03D
         POKzpohiLyHHTDuW6mlOBE1WmCjgtsDgEek6fCl23h4c/2t/VH3hmej1CAPxCwDf51
         GZ1nhdprSsniYDmz9KlNxlsKqRwPKvlyF/rriB7TTzvZe660yrMLC38xfdEQGsY2pW
         pAjn+yjQsEMWQ==
Date:   Fri, 23 Apr 2021 17:23:51 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc:     Jesper Dangaard Brouer <brouer@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Mel Gorman <mgorman@techsingularity.net>
Subject: linux-next: manual merge of the akpm-current tree with the
 arc-current tree
Message-ID: <20210423172351.4e3d194b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fr=4dr_nSKP_h.7QceCVhCC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fr=4dr_nSKP_h.7QceCVhCC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  net/core/page_pool.c

between commit:

  004f078a57d3 ("mm: Fix struct page layout on 32-bit systems")

from the arc-current tree and commit:

  8fdd71a69f19 ("net: page_pool: refactor dma_map into own function page_po=
ol_dma_map")

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

diff --cc net/core/page_pool.c
index f014fd8c19a6,9ec1aa9640ad..000000000000
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@@ -224,11 -192,10 +194,10 @@@ static bool page_pool_dma_map(struct pa
  	dma =3D dma_map_page_attrs(pool->p.dev, page, 0,
  				 (PAGE_SIZE << pool->p.order),
  				 pool->p.dma_dir, DMA_ATTR_SKIP_CPU_SYNC);
- 	if (dma_mapping_error(pool->p.dev, dma)) {
- 		put_page(page);
- 		return NULL;
- 	}
+ 	if (dma_mapping_error(pool->p.dev, dma))
+ 		return false;
+=20
 -	page->dma_addr =3D dma;
 +	page_pool_set_dma_addr(page, dma);
 =20
  	if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
  		page_pool_dma_sync_for_device(pool, page, pool->p.max_len);

--Sig_/fr=4dr_nSKP_h.7QceCVhCC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCCdgcACgkQAVBC80lX
0Gxd+Qf/fE0F3C20Q0Gh2N8r160GKZbSzU4iCf7hSQ6REtqKjJMKiaHELXSUxLbN
yWx0WZ2o8r45lO4PQB0GMQKh2Mv8KWDzCZEAvvBWzCAYkFg8s5NA6Vqwbaiuk8Gg
ssknG29OcUcnWdqcCaZqY+Zd91nh26TU/Erza74RPEHuv6hl3SZtWFmIEta1s7DF
avDaNazDpL78amVaq90lCiWURP2+Kid8RGYbxTPf7SKM/KySCUuZwVVYVJ+vuW9l
A4iSviZoYaX20izcWVJJ1dMWzu7oGQe/hjeR9ThN8EKp1i5Oro3OBwH4k69/puiu
Ctuob8+whEfsCczggybAAaZKG/XCow==
=qH94
-----END PGP SIGNATURE-----

--Sig_/fr=4dr_nSKP_h.7QceCVhCC--
