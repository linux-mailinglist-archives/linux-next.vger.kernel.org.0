Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDB24015D5
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 06:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236014AbhIFEuJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 00:50:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48919 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234014AbhIFEuJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Sep 2021 00:50:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630903744;
        bh=78zzJ+lBdY0MZBoHVtbHL5EFczeRhPrpoq01ds+rkJ8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mcTDt1qEWXrRifBmls+QXsN/4EqCA2JyFCnKhKXafIWZF9qvxMcCgaY0gYbU6FIW9
         VSfJPss6ZtoWDURbvxsYsAFhRcpiUHjFGy2TwukMhSy7mqdDy51CtVZUDp9tJpG6EZ
         /klr8aQVNwyYpcUBsT0e6NNVR26EUxaPGtCs3UHv7XesjTguLra48ZlYqu5pN8t4wB
         XvSIOrF9Uzjz6f60McK67/cxdmssyrPlDD6xZxLnbNv6YjeKB0DRBLegYm9aMwT7dK
         LF5qYogx8i7G9peF1NGB0WWBJOI3sby9sISWYNwDwL0FohnNr9/L94qXPaUVi0gfNF
         v99CHr5WCI7+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H2wsW21pNz9sRN;
        Mon,  6 Sep 2021 14:49:03 +1000 (AEST)
Date:   Mon, 6 Sep 2021 14:49:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Jan Kara <jack@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 folio tree
Message-ID: <20210906144902.23482d47@canb.auug.org.au>
In-Reply-To: <20210721160228.176a31c9@canb.auug.org.au>
References: <20210721160228.176a31c9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Y+EkoL/XlpkDsgKGzAgHMar";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Y+EkoL/XlpkDsgKGzAgHMar
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 21 Jul 2021 16:02:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   mm/page-writeback.c
>=20
> between commits:
>=20
>   7cfa3de8ce5d ("mm/writeback: Add __folio_end_writeback()")
>   e8fc4f61a3e3 ("mm/writeback: Add folio_start_writeback()")
>=20
> from the folio tree and commit:
>=20
>   4dd7a4fe8321 ("writeback: track number of inodes under writeback")
>=20
> from the akpm-current tree.
>=20
> Willy, thanks for the resolution.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc mm/page-writeback.c
> index c2987f05c944,57b98ea365e2..000000000000
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@@ -2751,17 -2739,34 +2763,35 @@@ bool folio_clear_dirty_for_io(struct fo
>   		unlocked_inode_to_wb_end(inode, &cookie);
>   		return ret;
>   	}
>  -	return TestClearPageDirty(page);
>  +	return folio_test_clear_dirty(folio);
>   }
>  -EXPORT_SYMBOL(clear_page_dirty_for_io);
>  +EXPORT_SYMBOL(folio_clear_dirty_for_io);
>  =20
> + static void wb_inode_writeback_start(struct bdi_writeback *wb)
> + {
> + 	atomic_inc(&wb->writeback_inodes);
> + }
> +=20
> + static void wb_inode_writeback_end(struct bdi_writeback *wb)
> + {
> + 	atomic_dec(&wb->writeback_inodes);
> + 	/*
> + 	 * Make sure estimate of writeback throughput gets updated after
> + 	 * writeback completed. We delay the update by BANDWIDTH_INTERVAL
> + 	 * (which is the interval other bandwidth updates use for batching) so
> + 	 * that if multiple inodes end writeback at a similar time, they get
> + 	 * batched into one bandwidth update.
> + 	 */
> + 	queue_delayed_work(bdi_wq, &wb->bw_dwork, BANDWIDTH_INTERVAL);
> + }
> +=20
>  -int test_clear_page_writeback(struct page *page)
>  +bool __folio_end_writeback(struct folio *folio)
>   {
>  -	struct address_space *mapping =3D page_mapping(page);
>  -	int ret;
>  +	long nr =3D folio_nr_pages(folio);
>  +	struct address_space *mapping =3D folio_mapping(folio);
>  +	bool ret;
>  =20
>  -	lock_page_memcg(page);
>  +	folio_memcg_lock(folio);
>   	if (mapping && mapping_use_writeback_tags(mapping)) {
>   		struct inode *inode =3D mapping->host;
>   		struct backing_dev_info *bdi =3D inode_to_bdi(inode);
> @@@ -2775,8 -2780,11 +2805,11 @@@
>   			if (bdi->capabilities & BDI_CAP_WRITEBACK_ACCT) {
>   				struct bdi_writeback *wb =3D inode_to_wb(inode);
>  =20
>  -				dec_wb_stat(wb, WB_WRITEBACK);
>  -				__wb_writeout_inc(wb);
>  +				wb_stat_mod(wb, WB_WRITEBACK, -nr);
>  +				__wb_writeout_add(wb, nr);
> + 				if (!mapping_tagged(mapping,
> + 						    PAGECACHE_TAG_WRITEBACK))
> + 					wb_inode_writeback_end(wb);
>   			}
>   		}
>  =20
> @@@ -2821,14 -2827,18 +2854,18 @@@ bool __folio_start_writeback(struct fol
>   						   PAGECACHE_TAG_WRITEBACK);
>  =20
>   			xas_set_mark(&xas, PAGECACHE_TAG_WRITEBACK);
> - 			if (bdi->capabilities & BDI_CAP_WRITEBACK_ACCT)
> - 				wb_stat_mod(inode_to_wb(inode), WB_WRITEBACK,
> - 						nr);
> + 			if (bdi->capabilities & BDI_CAP_WRITEBACK_ACCT) {
> + 				struct bdi_writeback *wb =3D inode_to_wb(inode);
> +=20
>  -				inc_wb_stat(wb, WB_WRITEBACK);
> ++				wb_stat_mod(wb, WB_WRITEBACK, nr);
> + 				if (!on_wblist)
> + 					wb_inode_writeback_start(wb);
> + 			}
>  =20
>   			/*
>  -			 * We can come through here when swapping anonymous
>  -			 * pages, so we don't necessarily have an inode to track
>  -			 * for sync.
>  +			 * We can come through here when swapping
>  +			 * anonymous folios, so we don't necessarily
>  +			 * have an inode to track for sync.
>   			 */
>   			if (mapping->host && !on_wblist)
>   				sb_mark_inode_writeback(mapping->host);

This is now a conflict between the folio tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Y+EkoL/XlpkDsgKGzAgHMar
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE1nb4ACgkQAVBC80lX
0GyeiwgAk0zMe7B3c9OQO63IcVQ4lzA8pQK6ISRUnz+oGw/FXGJNwBPcfmbuvcCW
ZDJBEVOr6iq8RLV1iAgiaoi1Fbj6IHRBZtf3sd0O33Szc5x8kp1QTuUTCpDHb5IZ
vMfYqZN+Yibm6yrIBcsyybGvetFGLa0unJoJunPna4DRJNEQ2DJqCmVowuPOVlu6
3QSbxVPAbdo7rrZ/dstlr2Kra903gOEJA1dfVklo1MKMW93M6xxf78EDXRhbpOMk
f3vqIo15qbfuF86KwVTPg/sV0zsS7XoO0EvIY3OPRJybnYSYpcpndiBItNqQ8QS3
W8oDIGjvzXipsy3n82SmCx6ScxSKoA==
=vtuJ
-----END PGP SIGNATURE-----

--Sig_/Y+EkoL/XlpkDsgKGzAgHMar--
