Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 237A43021E0
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 06:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbhAYFdw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 00:33:52 -0500
Received: from ozlabs.org ([203.11.71.1]:58113 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbhAYFdr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Jan 2021 00:33:47 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPJRX2yj9z9sVS;
        Mon, 25 Jan 2021 16:32:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611552778;
        bh=LDP1P4Y4arjOIv8CLf0WIRuU5TVAbV+bDlPfSmRS6fw=;
        h=Date:From:To:Cc:Subject:From;
        b=XEEFB/DQCsdF8Aq1SsbhLxYdZunCTABDmCkTFjGsIaa/4IGMWhn729tm1iDl3t3Ct
         4+FvuipCGbE6XI0Kwi+J6OdujrnKiwt/jGxTXaIg4ZHFSfXDlPQtoABJ3FtTtnLnBd
         2vXNN9C49pgvNQvPtFvMMCeOSe1NpkF+uAzBpNwfh8t9CJBqDZ0IF47VmZPhIss876
         JPO0GDR0ya1QWWuv3QpHVkD7584iXWAqWA7XYhKpy+o3hfMvw55MMcTyCiWinxzj/9
         OQZRpwtV+J/qy0/3bldvNs5UqZaFlVS6dxEezFzRQXMMlSbV3Xu6bbwCG6NIhRGtfK
         vvFmX91tYY9bA==
Date:   Mon, 25 Jan 2021 16:32:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Chao Yu <chao@kernel.org>, Chao Yu <yuchao0@huawei.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the pidfd tree with the f2fs tree
Message-ID: <20210125163255.1a87bba4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fQO7W_vCdECXo+XrIFtm=um";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fQO7W_vCdECXo+XrIFtm=um
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  fs/f2fs/acl.c

between commit:

  7cf2e6173b2d ("f2fs: enhance to update i_mode and acl atomically in f2fs_=
setattr()")

from the f2fs tree and commit:

  e65ce2a50cf6 ("acl: handle idmapped mounts")

from the pidfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/f2fs/acl.c
index 732ec10e7890,a19e86c9adac..000000000000
--- a/fs/f2fs/acl.c
+++ b/fs/f2fs/acl.c
@@@ -200,27 -200,6 +200,27 @@@ struct posix_acl *f2fs_get_acl(struct i
  	return __f2fs_get_acl(inode, type, NULL);
  }
 =20
 +static int f2fs_acl_update_mode(struct inode *inode, umode_t *mode_p,
 +			  struct posix_acl **acl)
 +{
 +	umode_t mode =3D inode->i_mode;
 +	int error;
 +
 +	if (is_inode_flag_set(inode, FI_ACL_MODE))
 +		mode =3D F2FS_I(inode)->i_acl_mode;
 +
 +	error =3D posix_acl_equiv_mode(*acl, &mode);
 +	if (error < 0)
 +		return error;
 +	if (error =3D=3D 0)
 +		*acl =3D NULL;
- 	if (!in_group_p(inode->i_gid) &&
- 	    !capable_wrt_inode_uidgid(inode, CAP_FSETID))
++	if (!in_group_p(i_gid_into_mnt(&init_user_ns, inode)) &&
++	    !capable_wrt_inode_uidgid(&init_user_ns, inode, CAP_FSETID))
 +		mode &=3D ~S_ISGID;
 +	*mode_p =3D mode;
 +	return 0;
 +}
 +
  static int __f2fs_set_acl(struct inode *inode, int type,
  			struct posix_acl *acl, struct page *ipage)
  {

--Sig_/fQO7W_vCdECXo+XrIFtm=um
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOWAcACgkQAVBC80lX
0GzRtwf/Yi1STB+vnCtjLTj3cGXMcOpYwn/1/Q5CZsLhChrXTtrE11zuq0CZKGvQ
ZBIhJmaKUqE5aoZzKut8FLKIwI9F/5u1WDK1hgay7eNhNcSh9olOY7e2oLtEQbL6
znEhJ3tupx8vz68xrkWogOXqM4rbXYIyo+3a4QMEy/xRth1zi1wCAeS/Bh41KD5K
jaMjLUbmNA/SV/udVlbmrA46Tmhap4RoUkhV3pclGzqIfI9LtEoKP2cIlHNxqWCh
6nyygnvaRtcGvi6AKzzKIDRlk7GMcCkJZ1s1/VyTWmcje27VjWxRUwI+tAu8J+Vt
9zB86MR+yfW2psdOPRCFGecO+xY9yw==
=DNRt
-----END PGP SIGNATURE-----

--Sig_/fQO7W_vCdECXo+XrIFtm=um--
