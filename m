Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9996F3D30BA
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 02:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbhGVXk5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Jul 2021 19:40:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50829 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232682AbhGVXk5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Jul 2021 19:40:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GW93Y3j36z9sRN;
        Fri, 23 Jul 2021 10:21:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626999690;
        bh=QVZhutB3ya+LYSZv7vxyfLMXu42kAtWhUyq07DbF+Ms=;
        h=Date:From:To:Cc:Subject:From;
        b=a/FWnu2xl2YHC/AhURrda7QSux7fYxURT8SeJKtW/Gn8AcJwHiq5khf4jmhKi4Bf5
         ejFljOgff438KQNhLD1ZQImYw4wptShgYxyJNIe7t/98TJGD2/CUBJ6qJO0j8/3+gY
         +FSzJlHIwrXe62T2pUQk/pF2tU7IPDUDrwpsmei7i0j0NDPwWveMJRh7j3XD3hxUOc
         ycX2hWjnkmvY6eXoi+3wISHvEwuHuE7fuTxpZ5UdhNMjN16d8yg9pKbzm0ftPzK6Hm
         xwxQuXoBRozBb9KY8D0gFeJcVx4po/0Wev1q8S8/MHl0iuRNE/y9qlO+XC08g+avqu
         ZvTLWJHA9oS/Q==
Date:   Fri, 23 Jul 2021 10:21:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Jan Kara <jack@suse.cz>
Cc:     Eric Biggers <ebiggers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the f2fs tree with the ext3 tree
Message-ID: <20210723102128.5fc92369@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vdNYD7N=8MiRqmM3Cs8RyB=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vdNYD7N=8MiRqmM3Cs8RyB=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the f2fs tree got a conflict in:

  fs/f2fs/file.c

between commit:

  edc6d01bad73 ("f2fs: Convert to using invalidate_lock")

from the ext3 tree and commit:

  5f2632fa1471 ("f2fs: reduce indentation in f2fs_file_write_iter()")

from the f2fs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/f2fs/file.c
index 1ff333755721,279252c7f7bc..000000000000
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@@ -4252,79 -4318,54 +4316,54 @@@ static ssize_t f2fs_file_write_iter(str
  	}
 =20
  	ret =3D generic_write_checks(iocb, from);
- 	if (ret > 0) {
- 		bool preallocated =3D false;
- 		size_t target_size =3D 0;
- 		int err;
-=20
- 		if (iov_iter_fault_in_readable(from, iov_iter_count(from)))
- 			set_inode_flag(inode, FI_NO_PREALLOC);
-=20
- 		if ((iocb->ki_flags & IOCB_NOWAIT)) {
- 			if (!f2fs_overwrite_io(inode, iocb->ki_pos,
- 						iov_iter_count(from)) ||
- 				f2fs_has_inline_data(inode) ||
- 				f2fs_force_buffered_io(inode, iocb, from)) {
- 				clear_inode_flag(inode, FI_NO_PREALLOC);
- 				inode_unlock(inode);
- 				ret =3D -EAGAIN;
- 				goto out;
- 			}
- 			goto write;
- 		}
-=20
- 		if (is_inode_flag_set(inode, FI_NO_PREALLOC))
- 			goto write;
+ 	if (ret <=3D 0)
+ 		goto out_unlock;
 =20
- 		if (iocb->ki_flags & IOCB_DIRECT) {
- 			/*
- 			 * Convert inline data for Direct I/O before entering
- 			 * f2fs_direct_IO().
- 			 */
- 			err =3D f2fs_convert_inline_inode(inode);
- 			if (err)
- 				goto out_err;
- 			/*
- 			 * If force_buffere_io() is true, we have to allocate
- 			 * blocks all the time, since f2fs_direct_IO will fall
- 			 * back to buffered IO.
- 			 */
- 			if (!f2fs_force_buffered_io(inode, iocb, from) &&
- 					allow_outplace_dio(inode, iocb, from))
- 				goto write;
+ 	if (iocb->ki_flags & IOCB_NOWAIT) {
+ 		if (!f2fs_overwrite_io(inode, iocb->ki_pos,
+ 				       iov_iter_count(from)) ||
+ 		    f2fs_has_inline_data(inode) ||
+ 		    f2fs_force_buffered_io(inode, iocb, from)) {
+ 			ret =3D -EAGAIN;
+ 			goto out_unlock;
  		}
- 		preallocated =3D true;
- 		target_size =3D iocb->ki_pos + iov_iter_count(from);
+ 	}
+ 	if (iocb->ki_flags & IOCB_DIRECT) {
+ 		/*
+ 		 * Convert inline data for Direct I/O before entering
+ 		 * f2fs_direct_IO().
+ 		 */
+ 		ret =3D f2fs_convert_inline_inode(inode);
+ 		if (ret)
+ 			goto out_unlock;
+ 	}
 =20
- 		err =3D f2fs_preallocate_blocks(iocb, from);
- 		if (err) {
- out_err:
- 			clear_inode_flag(inode, FI_NO_PREALLOC);
- 			inode_unlock(inode);
- 			ret =3D err;
- 			goto out;
- 		}
- write:
- 		ret =3D __generic_file_write_iter(iocb, from);
- 		clear_inode_flag(inode, FI_NO_PREALLOC);
+ 	/* Possibly preallocate the blocks for the write. */
+ 	target_size =3D iocb->ki_pos + iov_iter_count(from);
+ 	preallocated =3D f2fs_preallocate_blocks(iocb, from);
+ 	if (preallocated < 0) {
+ 		ret =3D preallocated;
+ 		goto out_unlock;
+ 	}
 =20
- 		/* if we couldn't write data, we should deallocate blocks. */
- 		if (preallocated && i_size_read(inode) < target_size) {
- 			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
- 			filemap_invalidate_lock(inode->i_mapping);
- 			f2fs_truncate(inode);
- 			filemap_invalidate_unlock(inode->i_mapping);
- 			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
- 		}
+ 	ret =3D __generic_file_write_iter(iocb, from);
 =20
- 		if (ret > 0)
- 			f2fs_update_iostat(F2FS_I_SB(inode), APP_WRITE_IO, ret);
+ 	/* Don't leave any preallocated blocks around past i_size. */
+ 	if (preallocated > 0 && inode->i_size < target_size) {
+ 		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 -		down_write(&F2FS_I(inode)->i_mmap_sem);
++		filemap_invalidate_lock(inode->i_mapping);
+ 		f2fs_truncate(inode);
 -		up_write(&F2FS_I(inode)->i_mmap_sem);
++		filemap_invalidate_unlock(inode->i_mapping);
+ 		up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
  	}
- unlock:
+ 	clear_inode_flag(inode, FI_PREALLOCATED_ALL);
+=20
+ 	if (ret > 0)
+ 		f2fs_update_iostat(F2FS_I_SB(inode), APP_WRITE_IO, ret);
+ out_unlock:
  	inode_unlock(inode);
  out:
- 	trace_f2fs_file_write_iter(inode, iocb->ki_pos,
- 					iov_iter_count(from), ret);
+ 	trace_f2fs_file_write_iter(inode, orig_pos, orig_count, ret);
  	if (ret > 0)
  		ret =3D generic_write_sync(iocb, ret);
  	return ret;

--Sig_/vdNYD7N=8MiRqmM3Cs8RyB=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD6C4gACgkQAVBC80lX
0Gz8CAf7BAW6NLfQF4SSpRLNMuecRDYGJldqGfVhORGVfX+xEMnlb8bYcPNHruhl
qW4013tcW1oWofulIwNLToIsIXjBY8qgGHs8TjlvP/6vs3QnSeqpvJDFCjKIJ78y
kBHyjGeaosPSblkXKPsCWErF404WijWHS1uchCwuOtv1YGSjtJuUEqdQlyG6p+G0
UsoFrn07Wo4k44J1xLfuTvWN5suwpBTWEonbG2tklLHl47NKFVpnwWtUmVV6SCHb
Ho8R+BPY1VZXKA4snSUaqJ2MgOWhYTd341zdvMcqF/CevF2fpqkSmC4CE7HwhKE1
5USUwToPSGl2fucadWM+ytTGJQcCNw==
=+VEq
-----END PGP SIGNATURE-----

--Sig_/vdNYD7N=8MiRqmM3Cs8RyB=--
