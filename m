Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6889491A56
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2019 01:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbfHRX5I (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Aug 2019 19:57:08 -0400
Received: from ozlabs.org ([203.11.71.1]:44015 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbfHRX5I (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Aug 2019 19:57:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46BYrJ423pz9s7T;
        Mon, 19 Aug 2019 09:57:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566172624;
        bh=DBY3Me43aQS5AiZEeI3+hJGgdtBTQfLzmiBHLZzjHb0=;
        h=Date:From:To:Cc:Subject:From;
        b=QuRBSlRNooN54VSgzICN03DoQYIII2TwgJw/NsKiiMcUv3mSnYJb4c8haXxtv1mrs
         KysDi/9stOQ1CIOyikZT3UpisY4tAZUrP2TG2m1rI2N72xwG/4LuBLnwp0ETXnJreK
         50phVfbTJOfEKYN/ruUSjiLnHgX9VQZ+CItAqGbb9NOBWsjLdlcYk1nCF5+7ge5dOm
         PosbgJGjg72CGp4de76p0JcHacva2RjeR/TDO0o3vr/IuT32dl16Q1iTX7uaL4vrW5
         GPqCXqpN33r3O0DFG+NQ6RMm8rX4oGZCe9LwXNl+0MttNqXaL0zVOro/5ODV9DC9J2
         W9jzTvQ2/0+FQ==
Date:   Mon, 19 Aug 2019 09:56:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>, Eric Biggers <ebiggers@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the ext4 tree with the fscrypt tree
Message-ID: <20190819095644.41cea76a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u8BmtaXSSGaUI2G8PMxWJ7X";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/u8BmtaXSSGaUI2G8PMxWJ7X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ext4 tree got a conflict in:

  fs/ext4/ioctl.c

between commit:

  29b3692e6dbf ("ext4: wire up new fscrypt ioctls")

from the fscrypt tree and commits:

  b0c013e2928d ("ext4: add a new ioctl EXT4_IOC_CLEAR_ES_CACHE")
  1ad3ea6e0a69 ("ext4: add a new ioctl EXT4_IOC_GETSTATE")
  bb5835edcdf8 ("ext4: add new ioctl EXT4_IOC_GET_ES_CACHE")

from the ext4 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/ext4/ioctl.c
index fe5a4b13f939,d6242b7b8718..000000000000
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@@ -1115,31 -1183,33 +1183,58 @@@ resizefs_out
  	case EXT4_IOC_GET_ENCRYPTION_POLICY:
  		return fscrypt_ioctl_get_policy(filp, (void __user *)arg);
 =20
 +	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
 +		if (!ext4_has_feature_encrypt(sb))
 +			return -EOPNOTSUPP;
 +		return fscrypt_ioctl_get_policy_ex(filp, (void __user *)arg);
 +
 +	case FS_IOC_ADD_ENCRYPTION_KEY:
 +		if (!ext4_has_feature_encrypt(sb))
 +			return -EOPNOTSUPP;
 +		return fscrypt_ioctl_add_key(filp, (void __user *)arg);
 +
 +	case FS_IOC_REMOVE_ENCRYPTION_KEY:
 +		if (!ext4_has_feature_encrypt(sb))
 +			return -EOPNOTSUPP;
 +		return fscrypt_ioctl_remove_key(filp, (void __user *)arg);
 +
 +	case FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS:
 +		if (!ext4_has_feature_encrypt(sb))
 +			return -EOPNOTSUPP;
 +		return fscrypt_ioctl_remove_key_all_users(filp,
 +							  (void __user *)arg);
 +	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
 +		if (!ext4_has_feature_encrypt(sb))
 +			return -EOPNOTSUPP;
 +		return fscrypt_ioctl_get_key_status(filp, (void __user *)arg);
 +
+ 	case EXT4_IOC_CLEAR_ES_CACHE:
+ 	{
+ 		if (!inode_owner_or_capable(inode))
+ 			return -EACCES;
+ 		ext4_clear_inode_es(inode);
+ 		return 0;
+ 	}
+=20
+ 	case EXT4_IOC_GETSTATE:
+ 	{
+ 		__u32	state =3D 0;
+=20
+ 		if (ext4_test_inode_state(inode, EXT4_STATE_EXT_PRECACHED))
+ 			state |=3D EXT4_STATE_FLAG_EXT_PRECACHED;
+ 		if (ext4_test_inode_state(inode, EXT4_STATE_NEW))
+ 			state |=3D EXT4_STATE_FLAG_NEW;
+ 		if (ext4_test_inode_state(inode, EXT4_STATE_NEWENTRY))
+ 			state |=3D EXT4_STATE_FLAG_NEWENTRY;
+ 		if (ext4_test_inode_state(inode, EXT4_STATE_DA_ALLOC_CLOSE))
+ 			state |=3D EXT4_STATE_FLAG_DA_ALLOC_CLOSE;
+=20
+ 		return put_user(state, (__u32 __user *) arg);
+ 	}
+=20
+ 	case EXT4_IOC_GET_ES_CACHE:
+ 		return ext4_ioctl_get_es_cache(filp, arg);
+=20
  	case EXT4_IOC_FSGETXATTR:
  	{
  		struct fsxattr fa;
@@@ -1256,13 -1326,11 +1351,16 @@@ long ext4_compat_ioctl(struct file *fil
  	case EXT4_IOC_SET_ENCRYPTION_POLICY:
  	case EXT4_IOC_GET_ENCRYPTION_PWSALT:
  	case EXT4_IOC_GET_ENCRYPTION_POLICY:
 +	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
 +	case FS_IOC_ADD_ENCRYPTION_KEY:
 +	case FS_IOC_REMOVE_ENCRYPTION_KEY:
 +	case FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS:
 +	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
  	case EXT4_IOC_SHUTDOWN:
  	case FS_IOC_GETFSMAP:
+ 	case EXT4_IOC_CLEAR_ES_CACHE:
+ 	case EXT4_IOC_GETSTATE:
+ 	case EXT4_IOC_GET_ES_CACHE:
  		break;
  	default:
  		return -ENOIOCTLCMD;


--=20
Cheers,
Stephen Rothwell

--Sig_/u8BmtaXSSGaUI2G8PMxWJ7X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1Z5bwACgkQAVBC80lX
0GyAgQf/RgzNRBrQt2FBU84xUHXYQ0Yhw0D0ZHQ4e4Wp5X8vOdMJTA1k2XzrzhxQ
d9MdZ/tjELWuwrEFxfJRmuKprddgO1oUhT9fU5R/xPeyC3zOnzhiLlmbJfo28jBH
rlNGNVc0HzZbUrcPuFBOx2gc+hnSFfRVn34e3IM94EPP7XA2lH11w8NbVfTs55G2
WtTiOjmaAW9yDRo4N0fDAXudV5FB5+EpWXH71PxYveUL3TbzKhIX2XMTHhq78dIi
sYkCGmEi3Qmpcn6wrwU8AtdX/Kaoc+RbGrZEqQ5penwSMWYfisFGRwT+2Xsh8LzM
WPkegVZgwdc3C2QmT2v1ErcSqWcRSA==
=FqGK
-----END PGP SIGNATURE-----

--Sig_/u8BmtaXSSGaUI2G8PMxWJ7X--
