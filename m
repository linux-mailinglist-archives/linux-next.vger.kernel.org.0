Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CD527848F
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 11:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728143AbgIYJ5k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Sep 2020 05:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbgIYJ5k (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Sep 2020 05:57:40 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44719C0613CE;
        Fri, 25 Sep 2020 02:57:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ByS5F3rMZz9s0b;
        Fri, 25 Sep 2020 19:57:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601027858;
        bh=tPMRWdb0OBDO5hgFb+9yAZRW+VyTw7O2p362IBm44Wg=;
        h=Date:From:To:Cc:Subject:From;
        b=WN82z5SKNZsYz3nQAjfEfKBZpt0LflcCiKGkPuRAsfaDb8o+tUECZ6Oa/Wvt0x5TY
         IbD8/TxH31XBYDR2UM43zbX1zDSPytEl6p3gw9SrZW0cWISyKtcAzTUtIp39gU9zET
         JWIj4AXanykKXQRYwybVJ71z+vkmhkf9bVr5STonWsnPsQSAUAKhV+R+NJD9/2ewy3
         JVGgNIlsRx0lHOO9lcjgnigtRxvtfGjOBRha61e+1vTKNBPJKuegz2/TR5g5AKMmeK
         N4umIxuW4iS6iE+987EyvAtvjcO9hJbac3/MSTaZtM+FvyCnKMAI4Fu9QkLmo8/Tyv
         FB1OO1JNHiIeA==
Date:   Fri, 25 Sep 2020 19:57:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the akpm-current tree with the block
 tree
Message-ID: <20200925195736.05a66c23@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YB/fX9mEGPmjz3T/wEG8=Im";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YB/fX9mEGPmjz3T/wEG8=Im
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/page-writeback.c

between commit:

  1cb039f3dc16 ("bdi: replace BDI_CAP_STABLE_WRITES with a queue and a sb f=
lag")

from the block tree and commit:

  7a3714df632a ("mm/page-writeback: support tail pages in wait_for_stable_p=
age")

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

diff --cc mm/page-writeback.c
index 358d6f28c627,dac075e451d3..000000000000
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@@ -2849,7 -2849,8 +2849,8 @@@ EXPORT_SYMBOL_GPL(wait_on_page_writebac
   */
  void wait_for_stable_page(struct page *page)
  {
+ 	page =3D thp_head(page);
 -	if (bdi_cap_stable_pages_required(inode_to_bdi(page->mapping->host)))
 +	if (page->mapping->host->i_sb->s_iflags & SB_I_STABLE_WRITES)
  		wait_on_page_writeback(page);
  }
  EXPORT_SYMBOL_GPL(wait_for_stable_page);

--Sig_/YB/fX9mEGPmjz3T/wEG8=Im
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9tvxAACgkQAVBC80lX
0GwTswgAk6J3OSgexRa4Oj0Yd/j6fHSchuNR39ikZ8nDjV9twY3/tlP1yBcULIj6
uGzl39kmTbvPvaky8JclMf4dI33jFpyigzdMPtzU6G2qCxsgaclRMNSKDphQJKoy
1lC/1E2h5S9EBg4wjU976OswXMy6dLmsgkMLmGSGiiwU6z4sYKvx5Ur50Kn/n7LU
JPMb//TqSF9H5xC2fTVFGwc1s+PHVE0l3Gbo0vqdhcybobrYn/Z9q2/Hr9pGd7Z9
s9uP5qO1lEXDcHRWJjdB5OpKyPGL1DYsmnB+maufnhKyJq0622x+ASfzefnnmrT4
DhknUWIYHPhzt+4xlhqY1LKDBtIMqA==
=8E17
-----END PGP SIGNATURE-----

--Sig_/YB/fX9mEGPmjz3T/wEG8=Im--
