Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22F03D0892
	for <lists+linux-next@lfdr.de>; Wed, 21 Jul 2021 08:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbhGUFWK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Jul 2021 01:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhGUFV6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jul 2021 01:21:58 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390FEC061574;
        Tue, 20 Jul 2021 23:02:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GV4jy1sKyz9sWX;
        Wed, 21 Jul 2021 16:02:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626847350;
        bh=8hVKcObG1uG5ImM6YAu362aWi5k5Z9pejvw+yjxvdNQ=;
        h=Date:From:To:Cc:Subject:From;
        b=pNABsTziAlcMtGwpR6CMe2M3ZeKxr+oEcLjupyubennBxSLs7qrw6EononS38GSne
         3SCvTQBLiMQ31QQC6rxYlIDYEySeVPsGa+03hogvqB6qf19RTIXzkU1/RWtcek3hcG
         YcB01sUyMtFBR/gmNmmlRjF4yFTt4hOCO0/XhF7jLKOv6qWzB0Nt4wMPUjlfJXPCZw
         yTKY4Rv2BkptWNshGryIDmL/uiK2xFPGIyDpCbe/Vb1qNoe2NsADQ2uUDk4QZZ5IlR
         pyGYLDKVHTnLcHn/V5nlA9y5DHR5/hYuhbmoeonPcILID9AIYySI6e0pnYqfNcxr18
         tI9vHR3BvCh/w==
Date:   Wed, 21 Jul 2021 16:02:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the folio
 tree
Message-ID: <20210721160228.176a31c9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vjw8z3SUDYKthg9knYn67x5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vjw8z3SUDYKthg9knYn67x5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/page-writeback.c

between commits:

  7cfa3de8ce5d ("mm/writeback: Add __folio_end_writeback()")
  e8fc4f61a3e3 ("mm/writeback: Add folio_start_writeback()")

from the folio tree and commit:

  4dd7a4fe8321 ("writeback: track number of inodes under writeback")

from the akpm-current tree.

Willy, thanks for the resolution.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/page-writeback.c
index c2987f05c944,57b98ea365e2..000000000000
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@@ -2751,17 -2739,34 +2763,35 @@@ bool folio_clear_dirty_for_io(struct fo
  		unlocked_inode_to_wb_end(inode, &cookie);
  		return ret;
  	}
 -	return TestClearPageDirty(page);
 +	return folio_test_clear_dirty(folio);
  }
 -EXPORT_SYMBOL(clear_page_dirty_for_io);
 +EXPORT_SYMBOL(folio_clear_dirty_for_io);
 =20
+ static void wb_inode_writeback_start(struct bdi_writeback *wb)
+ {
+ 	atomic_inc(&wb->writeback_inodes);
+ }
+=20
+ static void wb_inode_writeback_end(struct bdi_writeback *wb)
+ {
+ 	atomic_dec(&wb->writeback_inodes);
+ 	/*
+ 	 * Make sure estimate of writeback throughput gets updated after
+ 	 * writeback completed. We delay the update by BANDWIDTH_INTERVAL
+ 	 * (which is the interval other bandwidth updates use for batching) so
+ 	 * that if multiple inodes end writeback at a similar time, they get
+ 	 * batched into one bandwidth update.
+ 	 */
+ 	queue_delayed_work(bdi_wq, &wb->bw_dwork, BANDWIDTH_INTERVAL);
+ }
+=20
 -int test_clear_page_writeback(struct page *page)
 +bool __folio_end_writeback(struct folio *folio)
  {
 -	struct address_space *mapping =3D page_mapping(page);
 -	int ret;
 +	long nr =3D folio_nr_pages(folio);
 +	struct address_space *mapping =3D folio_mapping(folio);
 +	bool ret;
 =20
 -	lock_page_memcg(page);
 +	folio_memcg_lock(folio);
  	if (mapping && mapping_use_writeback_tags(mapping)) {
  		struct inode *inode =3D mapping->host;
  		struct backing_dev_info *bdi =3D inode_to_bdi(inode);
@@@ -2775,8 -2780,11 +2805,11 @@@
  			if (bdi->capabilities & BDI_CAP_WRITEBACK_ACCT) {
  				struct bdi_writeback *wb =3D inode_to_wb(inode);
 =20
 -				dec_wb_stat(wb, WB_WRITEBACK);
 -				__wb_writeout_inc(wb);
 +				wb_stat_mod(wb, WB_WRITEBACK, -nr);
 +				__wb_writeout_add(wb, nr);
+ 				if (!mapping_tagged(mapping,
+ 						    PAGECACHE_TAG_WRITEBACK))
+ 					wb_inode_writeback_end(wb);
  			}
  		}
 =20
@@@ -2821,14 -2827,18 +2854,18 @@@ bool __folio_start_writeback(struct fol
  						   PAGECACHE_TAG_WRITEBACK);
 =20
  			xas_set_mark(&xas, PAGECACHE_TAG_WRITEBACK);
- 			if (bdi->capabilities & BDI_CAP_WRITEBACK_ACCT)
- 				wb_stat_mod(inode_to_wb(inode), WB_WRITEBACK,
- 						nr);
+ 			if (bdi->capabilities & BDI_CAP_WRITEBACK_ACCT) {
+ 				struct bdi_writeback *wb =3D inode_to_wb(inode);
+=20
 -				inc_wb_stat(wb, WB_WRITEBACK);
++				wb_stat_mod(wb, WB_WRITEBACK, nr);
+ 				if (!on_wblist)
+ 					wb_inode_writeback_start(wb);
+ 			}
 =20
  			/*
 -			 * We can come through here when swapping anonymous
 -			 * pages, so we don't necessarily have an inode to track
 -			 * for sync.
 +			 * We can come through here when swapping
 +			 * anonymous folios, so we don't necessarily
 +			 * have an inode to track for sync.
  			 */
  			if (mapping->host && !on_wblist)
  				sb_mark_inode_writeback(mapping->host);

--Sig_/vjw8z3SUDYKthg9knYn67x5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD3uHQACgkQAVBC80lX
0Gz6Jgf+OP6aPK3Agbrw1ldp6JY+uN9YSRSbxNBeJjZWz58lDpFAfpYJlaWMQrk4
bcXh/VcMlhyBNmxCVoeN70zYmQWaUmTmLXw1G8r/A63dFSxfN1Ab3W1pVA+OpzqA
BVhycR/FNBGMDkbMQ0S4eaTADGTzrdPbVq2VaOzCu97YE7uHc/AuavP34ywiERQj
Hw3sQZIYdpu+6XjxpuD2Q6fR9OB64/LI/JaV+2vu9JL3OQR02m1s6FPcFmMsGQqG
4gHXYSJy54WlPpmbiJxkkTTXfEcIH3hr0vyO9sM4MYNP6EpglOOBgE2a23Gsmhet
DviOPf1a1hQtH5F1xqdqWnWx6PM7PA==
=hHO7
-----END PGP SIGNATURE-----

--Sig_/vjw8z3SUDYKthg9knYn67x5--
