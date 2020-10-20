Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20AF729454D
	for <lists+linux-next@lfdr.de>; Wed, 21 Oct 2020 01:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439224AbgJTXEC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Oct 2020 19:04:02 -0400
Received: from ozlabs.org ([203.11.71.1]:38767 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439217AbgJTXEC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Oct 2020 19:04:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CG8M33y0mz9sRk;
        Wed, 21 Oct 2020 10:03:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603235039;
        bh=ucBkhbc2QZYezfUb6IxgSjp9LdpAPyKnmG1uc5B5SbI=;
        h=Date:From:To:Cc:Subject:From;
        b=retTMo5WjfuhCiQSSNsaMTcAuQmgNUb9EMURXd7tZaOaNsGZnFWOaFZNOhxxlX21q
         2YLOZT1GH14dRe68pvGMAqsGvbvUEk94EI5T8WSdd7AAAchmea+Pa2LKCV0Tpy80VC
         ryJsqgfML2+yWcUBa1+5mmf3ZxQYK6jB1VZimeZrR5HIp9oeE4MHMf3lb8quS9TrkL
         cuyhqJ1zzjIDi+WhQmfdQc7cA4NtJe2/50LrJ2HM2fZLP62//qrOL3uVAGipN1tbqA
         +gJWXfYcEsO7BiEHhRSV/zRlZUfhEAHewul1SiwGrww4gCfYk5UYAZ6LyJuX6ibzGV
         ch6c2ARa89mFg==
Date:   Wed, 21 Oct 2020 10:03:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Eric Biggers <ebiggers@google.com>,
        Harshad Shirwadkar <harshadshirwadkar@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ext4 tree with Linus' tree
Message-ID: <20201021100358.1ef28ca2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fb=A/YYEr08PPCFLUEA//_v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fb=A/YYEr08PPCFLUEA//_v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ext4 tree got a conflict in:

  fs/ext4/ialloc.c

between commits:

  177cc0e71008 ("ext4: factor out ext4_xattr_credits_for_new_inode()")
  02ce5316afc8 ("ext4: use fscrypt_prepare_new_inode() and fscrypt_set_cont=
ext()")

from Linus' tree and commit:

  44059e503b03 ("ext4: fast commit recovery path")

from the ext4 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/ext4/ialloc.c
index 698ca4a4db5f,2400a8200435..000000000000
--- a/fs/ext4/ialloc.c
+++ b/fs/ext4/ialloc.c
@@@ -742,53 -746,122 +746,169 @@@ not_found
  	return 1;
  }
 =20
 +static int ext4_xattr_credits_for_new_inode(struct inode *dir, mode_t mod=
e,
 +					    bool encrypt)
 +{
 +	struct super_block *sb =3D dir->i_sb;
 +	int nblocks =3D 0;
 +#ifdef CONFIG_EXT4_FS_POSIX_ACL
 +	struct posix_acl *p =3D get_acl(dir, ACL_TYPE_DEFAULT);
 +
 +	if (IS_ERR(p))
 +		return PTR_ERR(p);
 +	if (p) {
 +		int acl_size =3D p->a_count * sizeof(ext4_acl_entry);
 +
 +		nblocks +=3D (S_ISDIR(mode) ? 2 : 1) *
 +			__ext4_xattr_set_credits(sb, NULL /* inode */,
 +						 NULL /* block_bh */, acl_size,
 +						 true /* is_create */);
 +		posix_acl_release(p);
 +	}
 +#endif
 +
 +#ifdef CONFIG_SECURITY
 +	{
 +		int num_security_xattrs =3D 1;
 +
 +#ifdef CONFIG_INTEGRITY
 +		num_security_xattrs++;
 +#endif
 +		/*
 +		 * We assume that security xattrs are never more than 1k.
 +		 * In practice they are under 128 bytes.
 +		 */
 +		nblocks +=3D num_security_xattrs *
 +			__ext4_xattr_set_credits(sb, NULL /* inode */,
 +						 NULL /* block_bh */, 1024,
 +						 true /* is_create */);
 +	}
 +#endif
 +	if (encrypt)
 +		nblocks +=3D __ext4_xattr_set_credits(sb,
 +						    NULL /* inode */,
 +						    NULL /* block_bh */,
 +						    FSCRYPT_SET_CONTEXT_MAX_SIZE,
 +						    true /* is_create */);
 +	return nblocks;
 +}
 +
+ int ext4_mark_inode_used(struct super_block *sb, int ino)
+ {
+ 	unsigned long max_ino =3D le32_to_cpu(EXT4_SB(sb)->s_es->s_inodes_count);
+ 	struct buffer_head *inode_bitmap_bh =3D NULL, *group_desc_bh =3D NULL;
+ 	struct ext4_group_desc *gdp;
+ 	ext4_group_t group;
+ 	int bit;
+ 	int err =3D -EFSCORRUPTED;
+=20
+ 	if (ino < EXT4_FIRST_INO(sb) || ino > max_ino)
+ 		goto out;
+=20
+ 	group =3D (ino - 1) / EXT4_INODES_PER_GROUP(sb);
+ 	bit =3D (ino - 1) % EXT4_INODES_PER_GROUP(sb);
+ 	inode_bitmap_bh =3D ext4_read_inode_bitmap(sb, group);
+ 	if (IS_ERR(inode_bitmap_bh))
+ 		return PTR_ERR(inode_bitmap_bh);
+=20
+ 	if (ext4_test_bit(bit, inode_bitmap_bh->b_data)) {
+ 		err =3D 0;
+ 		goto out;
+ 	}
+=20
+ 	gdp =3D ext4_get_group_desc(sb, group, &group_desc_bh);
+ 	if (!gdp || !group_desc_bh) {
+ 		err =3D -EINVAL;
+ 		goto out;
+ 	}
+=20
+ 	ext4_set_bit(bit, inode_bitmap_bh->b_data);
+=20
+ 	BUFFER_TRACE(inode_bitmap_bh, "call ext4_handle_dirty_metadata");
+ 	err =3D ext4_handle_dirty_metadata(NULL, NULL, inode_bitmap_bh);
+ 	if (err) {
+ 		ext4_std_error(sb, err);
+ 		goto out;
+ 	}
+ 	err =3D sync_dirty_buffer(inode_bitmap_bh);
+ 	if (err) {
+ 		ext4_std_error(sb, err);
+ 		goto out;
+ 	}
+=20
+ 	/* We may have to initialize the block bitmap if it isn't already */
+ 	if (ext4_has_group_desc_csum(sb) &&
+ 	    gdp->bg_flags & cpu_to_le16(EXT4_BG_BLOCK_UNINIT)) {
+ 		struct buffer_head *block_bitmap_bh;
+=20
+ 		block_bitmap_bh =3D ext4_read_block_bitmap(sb, group);
+ 		if (IS_ERR(block_bitmap_bh)) {
+ 			err =3D PTR_ERR(block_bitmap_bh);
+ 			goto out;
+ 		}
+=20
+ 		BUFFER_TRACE(block_bitmap_bh, "dirty block bitmap");
+ 		err =3D ext4_handle_dirty_metadata(NULL, NULL, block_bitmap_bh);
+ 		sync_dirty_buffer(block_bitmap_bh);
+=20
+ 		/* recheck and clear flag under lock if we still need to */
+ 		ext4_lock_group(sb, group);
+ 		if (ext4_has_group_desc_csum(sb) &&
+ 		    (gdp->bg_flags & cpu_to_le16(EXT4_BG_BLOCK_UNINIT))) {
+ 			gdp->bg_flags &=3D cpu_to_le16(~EXT4_BG_BLOCK_UNINIT);
+ 			ext4_free_group_clusters_set(sb, gdp,
+ 				ext4_free_clusters_after_init(sb, group, gdp));
+ 			ext4_block_bitmap_csum_set(sb, group, gdp,
+ 						   block_bitmap_bh);
+ 			ext4_group_desc_csum_set(sb, group, gdp);
+ 		}
+ 		ext4_unlock_group(sb, group);
+ 		brelse(block_bitmap_bh);
+=20
+ 		if (err) {
+ 			ext4_std_error(sb, err);
+ 			goto out;
+ 		}
+ 	}
+=20
+ 	/* Update the relevant bg descriptor fields */
+ 	if (ext4_has_group_desc_csum(sb)) {
+ 		int free;
+=20
+ 		ext4_lock_group(sb, group); /* while we modify the bg desc */
+ 		free =3D EXT4_INODES_PER_GROUP(sb) -
+ 			ext4_itable_unused_count(sb, gdp);
+ 		if (gdp->bg_flags & cpu_to_le16(EXT4_BG_INODE_UNINIT)) {
+ 			gdp->bg_flags &=3D cpu_to_le16(~EXT4_BG_INODE_UNINIT);
+ 			free =3D 0;
+ 		}
+=20
+ 		/*
+ 		 * Check the relative inode number against the last used
+ 		 * relative inode number in this group. if it is greater
+ 		 * we need to update the bg_itable_unused count
+ 		 */
+ 		if (bit >=3D free)
+ 			ext4_itable_unused_set(sb, gdp,
+ 					(EXT4_INODES_PER_GROUP(sb) - bit - 1));
+ 	} else {
+ 		ext4_lock_group(sb, group);
+ 	}
+=20
+ 	ext4_free_inodes_set(sb, gdp, ext4_free_inodes_count(sb, gdp) - 1);
+ 	if (ext4_has_group_desc_csum(sb)) {
+ 		ext4_inode_bitmap_csum_set(sb, group, gdp, inode_bitmap_bh,
+ 					   EXT4_INODES_PER_GROUP(sb) / 8);
+ 		ext4_group_desc_csum_set(sb, group, gdp);
+ 	}
+=20
+ 	ext4_unlock_group(sb, group);
+ 	err =3D ext4_handle_dirty_metadata(NULL, NULL, group_desc_bh);
+ 	sync_dirty_buffer(group_desc_bh);
+ out:
+ 	return err;
+ }
+=20
  /*
   * There are two policies for allocating an inode.  If the new inode is
   * a directory, then a forward search is made for a block group with both
@@@ -818,8 -891,8 +938,8 @@@ struct inode *__ext4_new_inode(handle_
  	struct inode *ret;
  	ext4_group_t i;
  	ext4_group_t flex_group;
- 	struct ext4_group_info *grp;
+ 	struct ext4_group_info *grp =3D NULL;
 -	int encrypt =3D 0;
 +	bool encrypt =3D false;
 =20
  	/* Cannot create files in a deleted directory */
  	if (!dir || !dir->i_nlink)

--Sig_/fb=A/YYEr08PPCFLUEA//_v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+PbN4ACgkQAVBC80lX
0Gya4Qf8DPeqmPDbX86nzXi2BOg9Om92NNVHg7Gl2sLPiBMMsagB0vQvKmOa8pro
P4cx6gWNWxXB0BuwDW21VRZdyuZ50Vy2z+EkuJnU00AI1cZg+M6fesaE0JMJx4KH
CATGHTxG5yegHl+mm5fnuldvjEm0q1u1w9XRSLfz/yrD4N5Dm/L8tbahRYOUXz7i
gwXs4YuHCRb2wWf/wRTm3GIbHxtIzjebxMiRHuRW4MnOKEp21RJF7iE/Ug+it00b
HGnRqnovr+RyggfgEL9ozxwdjwKG7P3s1cSYmpb7K0YJTIu2KjSF29OUo0YU7JHn
Vs4pDEjSdZC6luQrTLVRATPfwM/Rlg==
=VIFr
-----END PGP SIGNATURE-----

--Sig_/fb=A/YYEr08PPCFLUEA//_v--
