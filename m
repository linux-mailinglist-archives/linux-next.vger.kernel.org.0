Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E8D2C3643
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 02:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgKYBeB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Nov 2020 20:34:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbgKYBeB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Nov 2020 20:34:01 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96DC7C0613D4;
        Tue, 24 Nov 2020 17:34:00 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cgk1t0pGQz9sRK;
        Wed, 25 Nov 2020 12:33:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606268036;
        bh=AWtRg8TumvQihE/WyzTXYZtvD9YcdKbFYVNmhBEpn1w=;
        h=Date:From:To:Cc:Subject:From;
        b=MJIa4GYPiLQAHPU5M07/XpHw9XtfylubXLGaRRZ5NDnNyA2VflfQ3KCfi48KIxMH9
         R7vgJTFGgYISqaWioUx1SUi7zqDO/+HA+TgNG0qKzDvSBicVKK7b4tzGUxRODTdaDw
         gfFvUesBcWGUrXyPh5wW5RVfXD+x03wAcA52t+oLPM9hG24TMAbZ1BZ3LRQrymndUG
         Akn9eNgghwamsUOC9Z3Uzr4SiHAyYXjlH52W4CXj+6sF8f7BEK/hofXT1/5eXQRouN
         G4hBZfRgY2akixN9xbLP3mbCID+mGBkaGaxpGrMmTwlSPP3d8hFS7osX4K4iSV0uQC
         TvH5Qm3W3Q1eA==
Date:   Wed, 25 Nov 2020 12:33:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Maxime Ripard <maxime@cerno.tech>, Christoph Hellwig <hch@lst.de>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rdma tree with the arm-soc tree
Message-ID: <20201125123351.16954b02@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bfMy2K.YtjQ=qTc/ptdtmWe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/bfMy2K.YtjQ=qTc/ptdtmWe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  include/linux/dma-mapping.h

between commit:

  16fee29b0735 ("dma-mapping: remove the dma_direct_set_offset export")

from the arm-soc tree and commit:

  172292be01db ("dma-mapping: remove dma_virt_ops")

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/dma-mapping.h
index 199d85285246,2aaed35b556d..000000000000
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@@ -558,6 -558,11 +558,4 @@@ static inline int dma_mmap_wc(struct de
  #define dma_unmap_len_set(PTR, LEN_NAME, VAL)    do { } while (0)
  #endif
 =20
- extern const struct dma_map_ops dma_virt_ops;
 -/*
 - * Legacy interface to set up the dma offset map.  Drivers really should =
not
 - * actually use it, but we have a few legacy cases left.
 - */
 -int dma_direct_set_offset(struct device *dev, phys_addr_t cpu_start,
 -		dma_addr_t dma_start, u64 size);
--
  #endif /* _LINUX_DMA_MAPPING_H */

--Sig_/bfMy2K.YtjQ=qTc/ptdtmWe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+9tH8ACgkQAVBC80lX
0GwsuQf+LRWaNr+QF+EYHAWRZVUyaFa/Ly0ucbRfzavNZDh8HtZRkvH9uJpWCSNZ
6j/zK7WQ+A20YSJVjDHMu4EIsChaUKOJraTiiMHwiYk3nFgpR1HccoBE/MH4qPcl
61cm4fE4w/gB5TyUajlZF0yBpvZuR5LgsBwcFSiwY9yY+hhKHsWP/FgNSFN/nCby
AFkwHaekHOWX/Ma1daUaDkUZoca6y061FLgYPU35O4lFXMNWAeg1Z0WBecmZwgtd
zM7QW8MYW39Ht9YtOfz+dyrbHPsSrOwxJAZ644dMRPCc11aBfRGhqGlfLIotMCEl
FntRx5l+5dPFQdtj046TUQ8v0sv9zQ==
=wPSm
-----END PGP SIGNATURE-----

--Sig_/bfMy2K.YtjQ=qTc/ptdtmWe--
