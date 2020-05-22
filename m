Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5C11DDF0E
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 06:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgEVE6z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 00:58:55 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35929 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726338AbgEVE6z (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 May 2020 00:58:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49SvQh69xKz9sSw;
        Fri, 22 May 2020 14:58:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590123533;
        bh=wuYb1sX37vHFVdmyCg4PaEL1k5oiP0hxC6qXjytIdmk=;
        h=Date:From:To:Cc:Subject:From;
        b=OLb77ixay1fhSslwQCM486sCBoDdGT2ItQfr/DNeVOia0rRGOMc2BvCW9+Tgb5BYW
         RKBby7HTAY8RhiUqhhlL7xTb55HXMRouKCz8ut5n9Z528hQCKCWI4oAkwQwUFoGihI
         WIU9uZGf92V0NSHaCLuMFvFFgNFhS7+6T/IFX8BWr5fO+pLy+hNLnfsDmi4WygD6AK
         ae7wL9ODtsUJxkiIGmgSfm+qokAj2Ctf+TcUwJ6Bjsj6V3I+MQq7IDNeQU+2hFEZ2M
         LtMfo5tVp5CNLcHjMi18gYK0Nz/C5SJ52jFlTI9FRBu2LVmmdQS8SRcu90hgvx/KuR
         158CRbmbDF/zA==
Date:   Fri, 22 May 2020 14:58:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>,
        "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Martijn Coenen <maco@android.com>
Subject: linux-next: manual merge of the block tree with the djw-vfs tree
Message-ID: <20200522145848.38cdcf54@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MMnPKzbj/uTil22hI.HFc+/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/MMnPKzbj/uTil22hI.HFc+/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  drivers/block/loop.c

between commit:

  efbe3c2493d2 ("fs: Remove unneeded IS_DAX() check in io_is_direct()")

from the djw-vfs tree and commit:

  3448914e8cc5 ("loop: Add LOOP_CONFIGURE ioctl")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/block/loop.c
index 14372df0f354,a565c5aafa52..000000000000
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@@ -1022,21 -1146,20 +1146,21 @@@ static int loop_configure(struct loop_d
  	lo->old_gfp_mask =3D mapping_gfp_mask(mapping);
  	mapping_set_gfp_mask(mapping, lo->old_gfp_mask & ~(__GFP_IO|__GFP_FS));
 =20
- 	if (!(lo_flags & LO_FLAGS_READ_ONLY) && file->f_op->fsync)
+ 	if (!(lo->lo_flags & LO_FLAGS_READ_ONLY) && file->f_op->fsync)
  		blk_queue_write_cache(lo->lo_queue, true, false);
 =20
- 	if ((lo->lo_backing_file->f_flags & O_DIRECT) && inode->i_sb->s_bdev) {
+ 	if (config->block_size)
+ 		bsize =3D config->block_size;
 -	else if (io_is_direct(lo->lo_backing_file) && inode->i_sb->s_bdev)
++	else if ((lo->lo_backing_file->f_flags & O_DIRECT) &&
++		 inode->i_sb->s_bdev)
  		/* In case of direct I/O, match underlying block size */
- 		unsigned short bsize =3D bdev_logical_block_size(
- 			inode->i_sb->s_bdev);
+ 		bsize =3D bdev_logical_block_size(inode->i_sb->s_bdev);
+ 	else
+ 		bsize =3D 512;
 =20
- 		blk_queue_logical_block_size(lo->lo_queue, bsize);
- 		blk_queue_physical_block_size(lo->lo_queue, bsize);
- 		blk_queue_io_min(lo->lo_queue, bsize);
- 	}
+ 	blk_queue_logical_block_size(lo->lo_queue, bsize);
+ 	blk_queue_physical_block_size(lo->lo_queue, bsize);
+ 	blk_queue_io_min(lo->lo_queue, bsize);
 =20
  	loop_update_rotational(lo);
  	loop_update_dio(lo);

--Sig_/MMnPKzbj/uTil22hI.HFc+/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7HXAgACgkQAVBC80lX
0GzeFAf/fY5J5fcK8zcIFdxuKQ+uNvac1S9vL3mhcOClQeS1LoUcgBDNsXLlRVbq
UECXDRuSzs1u78/unXBOn8Prqa8AxUcKk8rl34tYgU0pPkFxeQOSrwQzrUqKpyaw
xNSoGzKpSUfdvYgkmzayhrp3mfN1H++8ApqSyue6jgrwyB3M0icZ+DLLra7mEqdb
gsgpPxFh8YDCLjgt1aaygKFL75vCVZfcaU41tfzq9cOiD3HcZPvon9gIl+1zjT5h
3i4TSQbucbJA0cSeu22Ws50S3sonYi+uOQnuvg2W++uYxfMyatGPoUGsfC1g+u6L
QbR2ly1rqIUrZKA2qxp2pkTNlgA2Ug==
=zrFK
-----END PGP SIGNATURE-----

--Sig_/MMnPKzbj/uTil22hI.HFc+/--
