Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303D92181B0
	for <lists+linux-next@lfdr.de>; Wed,  8 Jul 2020 09:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725446AbgGHHsx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jul 2020 03:48:53 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59525 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgGHHsx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Jul 2020 03:48:53 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1rz65Qqxz9s1x;
        Wed,  8 Jul 2020 17:48:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594194531;
        bh=OjgZUHAmueWQEFkZkgyauhtaE/8xJdQ/vOjw8B1aDBk=;
        h=Date:From:To:Cc:Subject:From;
        b=sXH21J65Qj7tNdNfUG/gS3IQP19UMun80NpdXkZ6V0frCJpPUnsgQjCx4imlQ1Vf+
         VBFZX8UjA64TXJeY0T/XUNUaeZiRh4cDUesMgMJ8osFGx1v1cmc9nKM+/ZFuSykxMa
         K3E7YEXuoZvk5d4MkRsA0IZkKMHb9MUeJX9HIM0FAqke/cKFVeeSvaD/FAqI4Z0ZXM
         cz1eH0fEJcWkSnpy0QGMRpxRE+AdmLuf6vCFld48+3KMf0PDoGuAFkkAF/tDenHRVF
         uqUsgDjCl1Jq0AOz2nq18QKnBCYsV0USL5YVqlxne37h0NQAJ9eChUbew6yzcO5ooj
         7YRycHphJvWVA==
Date:   Wed, 8 Jul 2020 17:48:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>, David Sterba <dsterba@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: linux-next: manual merge of the set_fs tree with the btrfs tree
Message-ID: <20200708174850.7d664e11@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0jW6s63NHg=grO/GT/tVjTh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0jW6s63NHg=grO/GT/tVjTh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the set_fs tree got a conflict in:

  fs/btrfs/file.c

between commit:

  8d628ca164a3 ("btrfs: switch to iomap_dio_rw() for dio")

from the btrfs tree and commit:

  343f02a47b7e ("fs: default to generic_file_splice_read for files having -=
>read_iter")

from the set_fs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/file.c
index 5dcd61b121cc,322cc65902d1..000000000000
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@@ -3541,27 -3504,9 +3541,26 @@@ static int btrfs_file_open(struct inod
  	return generic_file_open(inode, filp);
  }
 =20
 +static ssize_t btrfs_file_read_iter(struct kiocb *iocb, struct iov_iter *=
to)
 +{
 +	ssize_t ret =3D 0;
 +
 +	if (iocb->ki_flags & IOCB_DIRECT) {
 +		struct inode *inode =3D file_inode(iocb->ki_filp);
 +
 +		inode_lock_shared(inode);
 +		ret =3D btrfs_direct_IO(iocb, to);
 +		inode_unlock_shared(inode);
 +		if (ret < 0)
 +			return ret;
 +	}
 +
 +	return generic_file_buffered_read(iocb, to, ret);
 +}
 +
  const struct file_operations btrfs_file_operations =3D {
  	.llseek		=3D btrfs_file_llseek,
 -	.read_iter      =3D generic_file_read_iter,
 +	.read_iter      =3D btrfs_file_read_iter,
- 	.splice_read	=3D generic_file_splice_read,
  	.write_iter	=3D btrfs_file_write_iter,
  	.mmap		=3D btrfs_file_mmap,
  	.open		=3D btrfs_file_open,

--Sig_/0jW6s63NHg=grO/GT/tVjTh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8FemIACgkQAVBC80lX
0GxqJAf/ZgEM4WrcPWIDU5EeNA8SOTMtWVv3jzRuYVb/UZDJ2kfG3Qp8oxAojYM1
nH/BeRkV/leJz2X/S7/1WX5Cl08zpR+hLqY51/seSin67H/Mv0EvWKeZ3ArtH06M
F0NBWUiXzmdG+TZ4yd2k+mBEJP10K2jTszTg8ACehAj4cSzUI85LNhsOnCwlMIOT
WXwupMiXTYVWx6rwPxc4eB4Zhq5yB6eU3EpHHkH3vZF00CyQYglD7+t6z/l7XIl9
StHfWIiM5NAkRNc7Qqfes2U55JUsKa2+N2reVM3dJ13gP27xMGkCYoNAD+eUvxxs
6RkQPijZQFBUk6TitKXXhVGQPml6zQ==
=86pj
-----END PGP SIGNATURE-----

--Sig_/0jW6s63NHg=grO/GT/tVjTh--
