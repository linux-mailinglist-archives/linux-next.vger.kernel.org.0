Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E580131C36
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 00:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgAFXTu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 18:19:50 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58183 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726599AbgAFXTu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jan 2020 18:19:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47sBLC4TvJz9sR0;
        Tue,  7 Jan 2020 10:19:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578352788;
        bh=twYwekdnzLNpnUWdd/Q17/cXiGtuXMj4Jl1sdEh5On8=;
        h=Date:From:To:Cc:Subject:From;
        b=SF6lNuDUotbHcN6u2tlPdNqfXci7fW2ld+Jq7+ODzG+ORJbKM5UnTLV3W6DyKWxZN
         cEqX1ONEI/Qut+ob0MQppKDhHPyNImrOHgycunoSlaXmyame+R29xDMTkQUoTbZjor
         h1X/Iv1HkhML3yD0ciPRg2PCxoIGP+XIw9ot700jeyrHtAHM/GjWrXwmiSSKTmSDte
         wUyIIb/1pmGUpwCDr9ri0SmV3T1iO+iW8jbmhA6XJSjSi0EpZc3fbqwjiVmV2S7t5Q
         x7XWRvv2LRUIVy2pDGGnUBe7HqP36tkzYprWV9rpKItej78VH9+H4jxiyds4KG+wyy
         ZhZsfEaUeURlw==
Date:   Tue, 7 Jan 2020 10:19:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Chao Yu <yuchao0@huawei.com>
Subject: linux-next: manual merge of the iomap tree with the f2fs tree
Message-ID: <20200107101946.0b505f6a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/88=2A+8hqq+KPYxXOFwO6yr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/88=2A+8hqq+KPYxXOFwO6yr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iomap tree got a conflict in:

  fs/f2fs/file.c

between commits:

  bdf032992489 ("f2fs: call f2fs_balance_fs outside of locked page")
  df4d07124128 ("f2fs: support data compression")

from the f2fs tree and commit:

  4a58d8158f6d ("fs: Fix page_mkwrite off-by-one errors")

from the iomap tree.

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
index bde5612f37f5,0e77b2e6f873..000000000000
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@@ -50,9 -50,8 +50,10 @@@ static vm_fault_t f2fs_vm_page_mkwrite(
  	struct page *page =3D vmf->page;
  	struct inode *inode =3D file_inode(vmf->vma->vm_file);
  	struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
 -	struct dnode_of_data dn =3D { .node_changed =3D false };
 -	int offset, err;
 +	struct dnode_of_data dn;
 +	bool need_alloc =3D true;
 +	int err =3D 0;
++	int offset;
 =20
  	if (unlikely(f2fs_cp_error(sbi))) {
  		err =3D -EIO;
@@@ -88,25 -70,24 +89,26 @@@
  	file_update_time(vmf->vma->vm_file);
  	down_read(&F2FS_I(inode)->i_mmap_sem);
  	lock_page(page);
- 	if (unlikely(page->mapping !=3D inode->i_mapping ||
- 			page_offset(page) > i_size_read(inode) ||
- 			!PageUptodate(page))) {
+ 	err =3D -EFAULT;
+ 	if (likely(PageUptodate(page)))
+ 		err =3D page_mkwrite_check_truncate(page, inode);
+ 	if (unlikely(err < 0)) {
  		unlock_page(page);
- 		err =3D -EFAULT;
  		goto out_sem;
  	}
+ 	offset =3D err;
 =20
 -	/* block allocation */
 -	__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
 -	set_new_dnode(&dn, inode, NULL, NULL, 0);
 -	err =3D f2fs_get_block(&dn, page->index);
 -	f2fs_put_dnode(&dn);
 -	__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
 -	if (err) {
 -		unlock_page(page);
 -		goto out_sem;
 +	if (need_alloc) {
 +		/* block allocation */
 +		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
 +		set_new_dnode(&dn, inode, NULL, NULL, 0);
 +		err =3D f2fs_get_block(&dn, page->index);
 +		f2fs_put_dnode(&dn);
 +		__do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
 +		if (err) {
 +			unlock_page(page);
 +			goto out_sem;
 +		}
  	}
 =20
  	/* fill the page */

--Sig_/88=2A+8hqq+KPYxXOFwO6yr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4TwJIACgkQAVBC80lX
0GxcqQf+PtiMC//7S+3bLMapvJwsIA2MWxvCuTlZ7oKf/TYgNYtUctHd2mBGwRjR
aBR34dAysLT8nfmcu8NEPar9ff106qigxZ2TkX3Xa3v4hh5pPa26mwEchbiKdCm2
XfhetTR0ZOh4Mev+9SB/aVsyHcoYaQ3RC1dvUvHJKR8nJx5Ui9SYLOt+2MMdr2hY
GE1sv4wvaevXsDqZNBv3WT0uZ8IsYRRMbyO3GhNjTIr7dkgctFF2XoyBSU7hz0n/
5ZDolmHPGwiBdbSI7ydmVYZMag8loleVU5S/fZjZG1I+cro99s2c7HyyBcvSyqMM
9jDbsHPWzykGKaZUulN0A7BETi1GLQ==
=cK1e
-----END PGP SIGNATURE-----

--Sig_/88=2A+8hqq+KPYxXOFwO6yr--
