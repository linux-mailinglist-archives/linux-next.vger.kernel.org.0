Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A88B61DDF2D
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 07:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgEVFRt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 01:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgEVFRt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 May 2020 01:17:49 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6CCC061A0E;
        Thu, 21 May 2020 22:17:49 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49SvrT31pgz9sRW;
        Fri, 22 May 2020 15:17:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590124666;
        bh=faS4nLFZfFTVQGtxXn47idEsA6wHtJuwJj8xWrJUg3I=;
        h=Date:From:To:Cc:Subject:From;
        b=OPrHO9frmWfmFnL+UBxKH5VtTeChrP+LRXfXSccXX92h772IlR9psx3PpSDmCYJFI
         hT97stn/o8H/EYHmVT5jC8D0E2P1p+oof++k9QLug0kjKCf5dof5j24cEaMXi2PQnC
         ixkoNMpJQM7XFj6b+mNZr4F89g2tn4AsKxCKSfZI4O+iJjvw+q74ro8OACcxpMvwBB
         ZCY8zbW6PPw6iMkMhscE01RITYiZy2qI3c1iaqs/YAhyHMQyfCUrwd508ZKkjupjtn
         BSjCFz7Z22RMOhedV4KHlvQGubiEiMqUasl90H5EFAZBhrPpHC7//phVWG/v7LLgr3
         XOLM7ADcunjnQ==
Date:   Fri, 22 May 2020 15:17:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>
Subject: linux-next: manual merge of the device-mapper tree with the block
 tree
Message-ID: <20200522151743.5c3cdbbf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F=h_zdAYkN/C=9r=7aVTu2e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/F=h_zdAYkN/C=9r=7aVTu2e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the device-mapper tree got a conflict in:

  drivers/md/dm-zoned-metadata.c

between commit:

  c64644ce363b ("block: remove the error_sector argument to blkdev_issue_fl=
ush")

from the block tree and commit:

  bf28a3ba0986 ("dm zoned: store device in struct dmz_sb")

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

diff --cc drivers/md/dm-zoned-metadata.c
index bf2245370305,db0dc2b5d44d..000000000000
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@@ -659,9 -816,10 +816,10 @@@ static int dmz_write_sb(struct dmz_meta
  	sb->crc =3D 0;
  	sb->crc =3D cpu_to_le32(crc32_le(sb_gen, (unsigned char *)sb, DMZ_BLOCK_=
SIZE));
 =20
- 	ret =3D dmz_rdwr_block(zmd, REQ_OP_WRITE, block, mblk->page);
+ 	ret =3D dmz_rdwr_block(dev, REQ_OP_WRITE, zmd->sb[set].block,
+ 			     mblk->page);
  	if (ret =3D=3D 0)
- 		ret =3D blkdev_issue_flush(zmd->dev->bdev, GFP_NOIO);
 -		ret =3D blkdev_issue_flush(dev->bdev, GFP_NOIO, NULL);
++		ret =3D blkdev_issue_flush(dev->bdev, GFP_NOIO);
 =20
  	return ret;
  }
@@@ -703,7 -862,7 +862,7 @@@ static int dmz_write_dirty_mblocks(stru
 =20
  	/* Flush drive cache (this will also sync data) */
  	if (ret =3D=3D 0)
- 		ret =3D blkdev_issue_flush(zmd->dev->bdev, GFP_NOIO);
 -		ret =3D blkdev_issue_flush(dev->bdev, GFP_NOIO, NULL);
++		ret =3D blkdev_issue_flush(dev->bdev, GFP_NOIO);
 =20
  	return ret;
  }
@@@ -772,7 -933,7 +933,7 @@@ int dmz_flush_metadata(struct dmz_metad
 =20
  	/* If there are no dirty metadata blocks, just flush the device cache */
  	if (list_empty(&write_list)) {
- 		ret =3D blkdev_issue_flush(zmd->dev->bdev, GFP_NOIO);
 -		ret =3D blkdev_issue_flush(dev->bdev, GFP_NOIO, NULL);
++		ret =3D blkdev_issue_flush(dev->bdev, GFP_NOIO);
  		goto err;
  	}
 =20

--Sig_/F=h_zdAYkN/C=9r=7aVTu2e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7HYHcACgkQAVBC80lX
0GzQYAf/RA0QQH9qR/2M7JY9NJfYSPnDdqBa44exCQbx/k9vSlKK0Wvuuyt2dsmF
kC3E29mNGb67PfA4ZAQ75F98BYjf07xafRgkVIrCogYcMhwx3/EeMdfri8RCgYhq
9jQq0NkVTCFViqFff8Ae/VFUmFQsoGtCS9LZHp+XgM1XJdHusii7bzyPqkRmg1uQ
I/CbCDitdq0nAKaSRcq84eRNvh+8XJa9e3G8RI5B9nvUt7gQteOmdy4QLh0ODKcd
z3ubh3bgFBuO8hr6DJFw30lVzAUQ0iffWGzhOiG/E7AyGbdpz9wvaC2NxQVb3jBE
gDPRPtomd0LtAMYsHnBZFEeHBf7UiQ==
=HgIy
-----END PGP SIGNATURE-----

--Sig_/F=h_zdAYkN/C=9r=7aVTu2e--
