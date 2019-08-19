Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE1E091A81
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2019 02:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfHSAlp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Aug 2019 20:41:45 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:50081 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbfHSAlp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Aug 2019 20:41:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46BZqp0Wpfz9sMr;
        Mon, 19 Aug 2019 10:41:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566175302;
        bh=0AxrinXDdNSdrvINHciNLQO4jLLQ/y36k6c4hFlsz0o=;
        h=Date:From:To:Cc:Subject:From;
        b=J5zuSUK/NVlL8+oShuRQz+0Q3pmEb4r4qv5uIKXaccH13GBs9tMmG0n3mTgh8Vd+Y
         mZSOzht1fe//Ql+gkd4TNtpLdHuYXZD4logZkFWRXpnIVTXKRNNy9pZIJbHHGTfF3r
         wut/XkQjMW6ewrXL9ilfR0ssri9u3KTouU3/RIyEmixmVTLGSgnWBbyaOL+vUQd2p1
         X0DLH9j6sDSmy1QZ5Dy6MgU1sxtUcIkdldnwM7sjORKO6V2eZeSR5ZK7zalbZFt4Aq
         2OltTYLEmyYJV4HIY9s4aZs1U1XNpf/5o7RU41CjlJRoWZeDMpml7NfoLWqM5fcHHT
         9kLeo1la/NnEw==
Date:   Mon, 19 Aug 2019 10:41:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Eric Biggers <ebiggers@kernel.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Rosenberg <drosen@google.com>,
        Chao Yu <yuchao0@huawei.com>
Subject: linux-next: manual merge of the fsverity tree with the f2fs tree
Message-ID: <20190819104141.2bccdb6a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OWeYwwGT8CiCo+FyQUmZB2R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OWeYwwGT8CiCo+FyQUmZB2R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fsverity tree got a conflict in:

  fs/f2fs/file.c

between commits:

  d9a94abb3380 ("f2fs: support FS_IOC_{GET,SET}FSLABEL")
  546155f73637 ("f2fs: Support case-insensitive file name lookups")

from the f2fs tree and commit:

  95ae251fe828 ("f2fs: add fs-verity support")

from the fsverity tree.

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
index 32e2cf9d4b07,838bfeecbd86..000000000000
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@@ -1721,7 -1721,7 +1729,8 @@@ static const struct=20
  		FS_ENCRYPT_FL |		\
  		FS_INLINE_DATA_FL |	\
  		FS_NOCOW_FL |		\
- 		FS_CASEFOLD_FL)
++		FS_CASEFOLD_FL |	\
+ 		FS_VERITY_FL)
 =20
  #define F2FS_SETTABLE_FS_FL (		\
  		FS_SYNC_FL |		\
@@@ -3125,77 -3088,34 +3136,101 @@@ static int f2fs_ioc_resize_fs(struct fi
  	return ret;
  }
 =20
 +static int f2fs_get_volume_name(struct file *filp, unsigned long arg)
 +{
 +	struct inode *inode =3D file_inode(filp);
 +	struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
 +	char *vbuf;
 +	int count;
 +	int err =3D 0;
 +
 +	vbuf =3D f2fs_kzalloc(sbi, MAX_VOLUME_NAME, GFP_KERNEL);
 +	if (!vbuf)
 +		return -ENOMEM;
 +
 +	down_read(&sbi->sb_lock);
 +	count =3D utf16s_to_utf8s(sbi->raw_super->volume_name,
 +			ARRAY_SIZE(sbi->raw_super->volume_name),
 +			UTF16_LITTLE_ENDIAN, vbuf, MAX_VOLUME_NAME);
 +	up_read(&sbi->sb_lock);
 +
 +	if (copy_to_user((char __user *)arg, vbuf,
 +				min(FSLABEL_MAX, count)))
 +		err =3D -EFAULT;
 +
 +	kvfree(vbuf);
 +	return err;
 +}
 +
 +static int f2fs_set_volume_name(struct file *filp, unsigned long arg)
 +{
 +	struct inode *inode =3D file_inode(filp);
 +	struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
 +	char *vbuf;
 +	int err =3D 0;
 +
 +	if (!capable(CAP_SYS_ADMIN))
 +		return -EPERM;
 +
 +	vbuf =3D strndup_user((const char __user *)arg, FSLABEL_MAX);
 +	if (IS_ERR(vbuf))
 +		return PTR_ERR(vbuf);
 +
 +	err =3D mnt_want_write_file(filp);
 +	if (err)
 +		goto out;
 +
 +	down_write(&sbi->sb_lock);
 +
 +	memset(sbi->raw_super->volume_name, 0,
 +			sizeof(sbi->raw_super->volume_name));
 +	utf8s_to_utf16s(vbuf, strlen(vbuf), UTF16_LITTLE_ENDIAN,
 +			sbi->raw_super->volume_name,
 +			ARRAY_SIZE(sbi->raw_super->volume_name));
 +
 +	err =3D f2fs_commit_super(sbi, false);
 +
 +	up_write(&sbi->sb_lock);
 +
 +	mnt_drop_write_file(filp);
 +out:
 +	kfree(vbuf);
 +	return err;
 +}
 +
+ static int f2fs_ioc_enable_verity(struct file *filp, unsigned long arg)
+ {
+ 	struct inode *inode =3D file_inode(filp);
+=20
+ 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
+=20
+ 	if (!f2fs_sb_has_verity(F2FS_I_SB(inode))) {
+ 		f2fs_warn(F2FS_I_SB(inode),
+ 			  "Can't enable fs-verity on inode %lu: the verity feature is not enab=
led on this filesystem.\n",
+ 			  inode->i_ino);
+ 		return -EOPNOTSUPP;
+ 	}
+=20
+ 	return fsverity_ioctl_enable(filp, (const void __user *)arg);
+ }
+=20
+ static int f2fs_ioc_measure_verity(struct file *filp, unsigned long arg)
+ {
+ 	if (!f2fs_sb_has_verity(F2FS_I_SB(file_inode(filp))))
+ 		return -EOPNOTSUPP;
+=20
+ 	return fsverity_ioctl_measure(filp, (void __user *)arg);
+ }
+=20
  long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
  {
 +	int ret;
 +
  	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
  		return -EIO;
 +	ret =3D f2fs_is_checkpoint_ready(F2FS_I_SB(file_inode(filp)));
 +	if (ret)
 +		return ret;
 =20
  	switch (cmd) {
  	case F2FS_IOC_GETFLAGS:
@@@ -3260,10 -3170,10 +3295,14 @@@
  		return f2fs_ioc_precache_extents(filp, arg);
  	case F2FS_IOC_RESIZE_FS:
  		return f2fs_ioc_resize_fs(filp, arg);
 +	case F2FS_IOC_GET_VOLUME_NAME:
 +		return f2fs_get_volume_name(filp, arg);
 +	case F2FS_IOC_SET_VOLUME_NAME:
 +		return f2fs_set_volume_name(filp, arg);
+ 	case FS_IOC_ENABLE_VERITY:
+ 		return f2fs_ioc_enable_verity(filp, arg);
+ 	case FS_IOC_MEASURE_VERITY:
+ 		return f2fs_ioc_measure_verity(filp, arg);
  	default:
  		return -ENOTTY;
  	}
@@@ -3378,8 -3288,8 +3417,10 @@@ long f2fs_compat_ioctl(struct file *fil
  	case F2FS_IOC_SET_PIN_FILE:
  	case F2FS_IOC_PRECACHE_EXTENTS:
  	case F2FS_IOC_RESIZE_FS:
 +	case F2FS_IOC_GET_VOLUME_NAME:
 +	case F2FS_IOC_SET_VOLUME_NAME:
+ 	case FS_IOC_ENABLE_VERITY:
+ 	case FS_IOC_MEASURE_VERITY:
  		break;
  	default:
  		return -ENOIOCTLCMD;

--Sig_/OWeYwwGT8CiCo+FyQUmZB2R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Z8EUACgkQAVBC80lX
0Gyk/Af/W4yAPiU1F+Stodth0bHaU5UvbL+2h5yWigoA0peZNyVnoteuB4jmfkAp
i2nnxUYMT56e1sVv6AIvqNcnfy6JlqP3hkLceP/f9dteYhF0DZhbvLBdXIvTQjlz
FkQQH2wtG8pnTrt/nBDLY6UcHG1sYy+HY23KF8Wbjz7nkhStrbtW9SuFR0arZHv/
haqw1s3tm19UrqJb8teZ/WFw9EBI+UUez+QFS5vHkcmfjOFPdfEHFRaRNd0GFKpw
vY3QnKWSczoja6AaFhmCwMSlaxK+SnQ5l1gzbqWljoTxodakpXDj0jJzMExy2iuc
3zzojxgYCy/IIfbOEMNqchAH4IzL/g==
=hBDD
-----END PGP SIGNATURE-----

--Sig_/OWeYwwGT8CiCo+FyQUmZB2R--
