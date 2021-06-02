Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC773980B6
	for <lists+linux-next@lfdr.de>; Wed,  2 Jun 2021 07:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhFBFmt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Jun 2021 01:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbhFBFmt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Jun 2021 01:42:49 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07FBC061574;
        Tue,  1 Jun 2021 22:41:06 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FvyYm0Nlpz9s5R;
        Wed,  2 Jun 2021 15:41:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622612463;
        bh=kPeF2ypexQ5j7kpsHIFTGppjeBxQ/8AoFIpFe07ssak=;
        h=Date:From:To:Cc:Subject:From;
        b=kOWUWT8DwmNnNB8oEBdp6vsKHswrtko+Km/xqZbsmeRbIkSn9xgzEiODHu6P/jtZM
         EShreXHryfkcfZ7v2VVS9/uSMhJXdn+jJdap1TvkAodHcXib6fZDIqdFJRTujpJ/kS
         Q6n8pyEjQFgbcybSNe/mlxkQ1syRPtbGYfAN5/X4Kd2n5IRaSRQoyNC1Y8FBTgIpKy
         41O+j6+AnkeumL24li6odujShKXq8MTpZeuW4RHIqdP3GNDLBmKs/fDf1C2eKaHHv1
         TzWu16mVI1x9MTiuDBIhjcuFMRaeb5/VBVLuxG8C4Awgo0XmaJqU0GuBFvNzmy7DUk
         1r9DMeIGHEPcg==
Date:   Wed, 2 Jun 2021 15:40:57 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yue Hu <huyue2@yulong.com>
Subject: linux-next: manual merge of the akpm-current tree with the block
 tree
Message-ID: <20210602154057.409ca400@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//XGu7_NQ8de0/CpwNUas+sl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//XGu7_NQ8de0/CpwNUas+sl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  drivers/block/zram/zram_drv.h

between commit:

  a8698707a183 ("block: move bd_mutex to struct gendisk")

from the block tree and commit:

  53dc46e0dbcf ("zram: move backing_dev under macro CONFIG_ZRAM_WRITEBACK")

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

diff --cc drivers/block/zram/zram_drv.h
index 74c411911b6e,6e73dc3c2769..000000000000
--- a/drivers/block/zram/zram_drv.h
+++ b/drivers/block/zram/zram_drv.h
@@@ -112,9 -112,9 +112,9 @@@ struct zram=20
  	/*
  	 * zram is claimed so open request will be failed
  	 */
 -	bool claim; /* Protected by bdev->bd_mutex */
 +	bool claim; /* Protected by disk->open_mutex */
- 	struct file *backing_dev;
  #ifdef CONFIG_ZRAM_WRITEBACK
+ 	struct file *backing_dev;
  	spinlock_t wb_limit_lock;
  	bool wb_limit_enable;
  	u64 bd_wb_limit;

--Sig_//XGu7_NQ8de0/CpwNUas+sl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC3GekACgkQAVBC80lX
0GzSLQgAo9uW8F2mkELIJyN7bT+vLdiZGt9Tfje4mApZFyL4ZR/opoL+kwwaE5/m
dgZ3H+9df6PYsKokuPqyPEAz7MntWK5lpYQ9V1EEmb/X2Qr+mJcC4PsP6w4kJMeN
1c1lhE6wtTDsod9UT7qvbCIO7yCfqnk1H6z6iHlQTy+cEJsAVp5pTgLMXqz3pzBa
vgB0dlNeK2m5HwPVrKoUWn3Mk84Wsnd+juvZPXO0VFd3OM1jJMMhLcZCy3+qnTL3
adWfhU5d9w3lYIpq9BFHkhIKvYARcUfzdZFghziM1k0x8FxbT29rDT0QvLhB+VC/
CTs1TkbBdJtoShres3Ozih1NxiTThA==
=HL2K
-----END PGP SIGNATURE-----

--Sig_//XGu7_NQ8de0/CpwNUas+sl--
