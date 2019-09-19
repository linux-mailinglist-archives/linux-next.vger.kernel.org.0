Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 466E4B78A7
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 13:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388688AbfISLoX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 07:44:23 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:53142 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388482AbfISLoX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Sep 2019 07:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Da5FiItdeCzmu3cyfuKDHkOkHNCwW6x89LvMmSWMsX4=; b=RQPNYeWa17Wsbv3uvrG373jNu
        ZpW2//okLjNXnA/s68m01EmYSUYvgUptyBaDQkpbnc62kKO/yLl9c0cT7o7YvqvfUDEpTBTfCM0Uo
        7PJRe+40zuhuza98IEsbFlA7tCnsBHoXZdi9T3NLIu4PuR9L/Nl517QAiRNJyyQq3ZnmA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAurC-0002LO-54; Thu, 19 Sep 2019 11:44:18 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 6D9F62742939; Thu, 19 Sep 2019 12:44:17 +0100 (BST)
Date:   Thu, 19 Sep 2019 12:44:17 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Theodore Ts'o <tytso@mit.edu>, Eric Biggers <ebiggers@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the ext4 tree with Linus' tree
Message-ID: <20190919114417.GD3642@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Content-Disposition: inline
X-Cookie: I'll be Grateful when they're Dead.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ext4 tree got a conflict in:

  fs/ext4/ioctl.c

between commit:

  29b3692e6dbf8226 ("ext4: wire up new fscrypt ioctls")

=66rom Linus' tree and commits:

  bb5835edcdf8bf7 ("ext4: add new ioctl EXT4_IOC_GET_ES_CACHE")
  1ad3ea6e0a694b0 ("ext4: add a new ioctl EXT4_IOC_GETSTATE")

=66rom the ext4 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/ext4/ioctl.c
index 5444d49cbf09d,d6242b7b87182..0000000000000
--- a/fs/ext4/ioctl.c
+++ b/fs/ext4/ioctl.c
@@@ -1113,35 -1181,35 +1181,62 @@@ resizefs_out
  #endif
  	}
  	case EXT4_IOC_GET_ENCRYPTION_POLICY:
 +		if (!ext4_has_feature_encrypt(sb))
 +			return -EOPNOTSUPP;
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
@@@ -1269,15 -1326,11 +1364,18 @@@ long ext4_compat_ioctl(struct file *fil
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
 +	case FS_IOC_ENABLE_VERITY:
 +	case FS_IOC_MEASURE_VERITY:
+ 	case EXT4_IOC_CLEAR_ES_CACHE:
+ 	case EXT4_IOC_GETSTATE:
+ 	case EXT4_IOC_GET_ES_CACHE:
  		break;
  	default:
  		return -ENOIOCTLCMD;

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2DahAACgkQJNaLcl1U
h9DkmAf/YXj+0ZN5JQVw5MxOcVgNUi/zYDpAoK1rKxDl/Kj1WTPLS2XP7U/ntXXF
oemCiIQ7RJ2UJHVPNKjojvzwdHzHx1jR4+F3fNQ37G0PR+bz9ptN9lr+xXzLltki
WRBamc1M+9fJq/wyTjBqqQhfE1Fu7uwu1Bxr+g1cy3jKnQyKfOIKyuEh/hztWFpM
zw3bgxG3k1L1uFB9u+SLX27vV4ejTE9kewuoRvgNtsP7J2LPYWbi5rFAnbSTeNbL
7NJpirLodjz1sNJ2Rv/G045kAge2U6Zg/t0soSFQZa0/mo530g91jvYhec9JvAnj
ZhSPG/sXqKr5fllOnWwG6UkX5FYJbg==
=Ns1H
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--
