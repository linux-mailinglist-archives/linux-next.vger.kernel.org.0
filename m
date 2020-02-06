Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12069154EC7
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2020 23:14:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgBFWOX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Feb 2020 17:14:23 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55721 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727441AbgBFWOX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 6 Feb 2020 17:14:23 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48DCQN6Gm2z9sRR;
        Fri,  7 Feb 2020 09:14:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581027260;
        bh=A8ZkmoXRk52v2YSgwclUIU3fxx5CAge0vR2/vjgapwQ=;
        h=Date:From:To:Cc:Subject:From;
        b=GmJwhs+VtDRhJz6vn51njO9UOKEZXEeEZBDh4MFJFiwXZ/CqfM1nVtmQKOJoxt68e
         6baZM+XG1kz3stSx3gfRRzkTWI+Gbfy41ela0X5K8cEJ/uc9qihhK6faTooN+6cDSJ
         qj/cFZV2wFfSHHbpvYCSAxQJ8Xsbz/IRgSKK704JOdsylBAPFleiw/MacpXjT1EqVX
         nAmA1GN4/RWBp9XPUoHBfXGJ/93aqjW7UVvv+xQVieSny3iyIzIHmnTKFTiDNlZ/ek
         0JE++hfYebgPr/AF6XSaDXw7y4qE9HszV93sAY9NPQipLKBNfwYI6qHahT0JGkb5qc
         TQ9fUI8PH8MEw==
Date:   Fri, 7 Feb 2020 09:14:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>,
        Miklos Szeredi <miklos@szeredi.hu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        zhengbin <zhengbin13@huawei.com>
Subject: linux-next: manual merge of the vfs tree with the fuse tree
Message-ID: <20200207091420.7a01cf4b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NimPq_aa3RhVoJVZdgT6mys";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NimPq_aa3RhVoJVZdgT6mys
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/fuse/inode.c

between commit:

  cabdb4fa2f66 ("fuse: use true,false for bool variable")

from the fuse tree and commit:

  76c50219b279 ("fuse: switch to use errorfc() et.al.")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/fuse/inode.c
index 77fef29ebe4f,557611dc2d46..000000000000
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@@ -499,23 -494,23 +494,23 @@@ static int fuse_parse_param(struct fs_c
 =20
  	case OPT_ROOTMODE:
  		if (!fuse_valid_type(result.uint_32))
- 			return invalf(fc, "fuse: Invalid rootmode");
+ 			return invalfc(fc, "Invalid rootmode");
  		ctx->rootmode =3D result.uint_32;
 -		ctx->rootmode_present =3D 1;
 +		ctx->rootmode_present =3D true;
  		break;
 =20
  	case OPT_USER_ID:
  		ctx->user_id =3D make_kuid(fc->user_ns, result.uint_32);
  		if (!uid_valid(ctx->user_id))
- 			return invalf(fc, "fuse: Invalid user_id");
+ 			return invalfc(fc, "Invalid user_id");
 -		ctx->user_id_present =3D 1;
 +		ctx->user_id_present =3D true;
  		break;
 =20
  	case OPT_GROUP_ID:
  		ctx->group_id =3D make_kgid(fc->user_ns, result.uint_32);
  		if (!gid_valid(ctx->group_id))
- 			return invalf(fc, "fuse: Invalid group_id");
+ 			return invalfc(fc, "Invalid group_id");
 -		ctx->group_id_present =3D 1;
 +		ctx->group_id_present =3D true;
  		break;
 =20
  	case OPT_DEFAULT_PERMISSIONS:

--Sig_/NimPq_aa3RhVoJVZdgT6mys
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl48j7wACgkQAVBC80lX
0GwTqwf/Ra+DuKCaCFeOB/Qag645dJEQWR/OayhGkAd7WP+2EumT/7DaDZYrbcN7
Jf0Wvp2kLXTAF2j7qhZ9MKQ24FURxqJbQKQHfnjDH4II/PqV2V9BUYEbLfjFieWm
l3hgRfAnOFL+BSzdm2S6lRsSLras4dODIR74/7/r4CBT+CmMH1nz9VAkBGUzVbgi
QygVU4grO+DjTYqRNGyo28nZlMob0bJ+lL3UR+Uj+8ETfZfdoy/Y9Woviu1L6rFw
ETMJIfaYU7CIepXxPBRW9agSUEZyMqA7ftZRXU4W/GdtDP+EIHLqMqV/AxJWz9Cd
tI6Jbty7fTEcgaFmsB980FJo0uKnlA==
=rM/r
-----END PGP SIGNATURE-----

--Sig_/NimPq_aa3RhVoJVZdgT6mys--
