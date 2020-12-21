Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334A32E029F
	for <lists+linux-next@lfdr.de>; Mon, 21 Dec 2020 23:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725844AbgLUWvv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Dec 2020 17:51:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgLUWvu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Dec 2020 17:51:50 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB9CC0613D6;
        Mon, 21 Dec 2020 14:51:10 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D0F7R5FLFz9sWH;
        Tue, 22 Dec 2020 09:50:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608591066;
        bh=6xPzRAQXdDApEOJWr3T6xV88/sXEE5EXW2eSYvyhSr4=;
        h=Date:From:To:Cc:Subject:From;
        b=JJJGmdgorOPNL+N3HDq5TKD1NbH1HbEO9MN0N9QUzx1fn3AEz17VlmkVXQRrE2Rpz
         hZ0ABjYX53atoYqKeCas/6n3Wwp2tA+xFSciL9RDu6BzGEFAkvN9tVkH9pKMBjO1H0
         z++F+FgUdeUvI8m4cKW95+5I7GNspUfH/PVY77EjT1YDZnPO4zkMGnT9PFUT3nkJQ0
         pBmTK04mQ1RsnluFOWCklmv7ivFTGW9emJLLblT928sql/vIssXvK04kDCFeklZ41R
         vFAvNDLJzUjZjLYSyBSBs7t3bBYCcoUSrE6TRxs+cD4oqVpdS1bShJ5WXcURPdxrDU
         /Zd8OHWBiJTwA==
Date:   Tue, 22 Dec 2020 09:50:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
Cc:     Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the device-mapper tree with Linus' tree
Message-ID: <20201222095056.7a5ac0a0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1hjKq4_sqX5jOYA24bkoski";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1hjKq4_sqX5jOYA24bkoski
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the device-mapper tree got a conflict in:

  drivers/md/dm-table.c

between commit:

  4e7b5671c6a8 ("block: remove i_bdev")

from Linus' tree and commit:

  05a876e9a2a8 ("dm table: avoid filesystem lookup in dm_get_dev_t()")

from the device-mapper tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/md/dm-table.c
index 188f41287f18,299a256fb409..000000000000
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@@ -347,9 -347,22 +347,15 @@@ static int upgrade_mode(struct dm_dev_i
  dev_t dm_get_dev_t(const char *path)
  {
  	dev_t dev;
 -	struct block_device *bdev;
+ 	unsigned int maj, min;
 =20
+ 	if (sscanf(path, "%u:%u", &maj, &min) =3D=3D 2) {
+ 		dev =3D MKDEV(maj, min);
+ 		if (maj =3D=3D MAJOR(dev) && min =3D=3D MINOR(dev))
+ 			return dev;
+ 	}
 -	bdev =3D lookup_bdev(path);
 -	if (IS_ERR(bdev))
 +	if (lookup_bdev(path, &dev))
  		dev =3D name_to_dev_t(path);
 -	else {
 -		dev =3D bdev->bd_dev;
 -		bdput(bdev);
 -	}
 -
  	return dev;
  }
  EXPORT_SYMBOL_GPL(dm_get_dev_t);

--Sig_/1hjKq4_sqX5jOYA24bkoski
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/hJtAACgkQAVBC80lX
0GzmUwf/e9aBL8Ro43OYacVWsrwjwnkPbUnJjVUypj52UU+F9PdTQcVjl+WcU4Nn
fdBzTcQ0/C94lKIbqfZ2kF/Uz7ENsOF6VQct4Bwjp5ESLBknvPg3QhVTZ0SgBZ5l
3mDsDcr2RmRwENXeveAET33AEmxnhVEPBZUr7PF+Xodqurxo+xxN+sWfQqTasDiP
Wz+Qr5SuF7q21iZsj0x5v1VcugkIzKZHiBUH6ASHuZKmnhoGs/fvwBsyidxHq2pT
HntCZOPVJeO7NWHcJFM5E/Og/aywsNmDJkq8xushyBWF8RKEWFLY+a2ZG6aI1NR/
WQdmaNm+bZaSmBoAQx2bUdc7kGrCBw==
=bvMi
-----END PGP SIGNATURE-----

--Sig_/1hjKq4_sqX5jOYA24bkoski--
