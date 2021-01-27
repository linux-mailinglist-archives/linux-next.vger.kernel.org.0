Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA3B9305A3B
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 12:47:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237160AbhA0Lqt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 06:46:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234189AbhA0Loj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2021 06:44:39 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A59FC061574;
        Wed, 27 Jan 2021 03:43:57 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQhZc4rjCz9sVn;
        Wed, 27 Jan 2021 22:43:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611747833;
        bh=tcnGzuwBPDoxl75YFW6S22VO0qdePNURHS1pblHw7mA=;
        h=Date:From:To:Cc:Subject:From;
        b=r6Emgf0OtOukzXrfsI0HC4BvltbGV0d5NdpIvdqX3mwPx2N7wRqP2SeTqAHyDTbti
         bOdJZfdQJ68twwP+wbyUVOfdAGeLsH7xtJR97xwcrR1Dl5YNA10SdS3hQrHvoKLP/Y
         5EfZ8oDcDkai1zPi17o1boG5rt13uiLjuhZU0vY1XGk/QoD5wniSj+wd+dXSqwy7iz
         PJyJz9VWt1JG9mvCSpDQ/XcX0I+5rv8vzHZF6jmGDQEuZGjBbrldtZJUgEJSwQcSDX
         kwO852/v4zYe/svnvqZngHfdsKRovqAeJXPXHcAvBHIjuXopUrcaGjMzmt4v2UMpTT
         nEC20BrtbM7Bg==
Date:   Wed, 27 Jan 2021 22:43:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miaohe Lin <linmiaohe@huawei.com>
Subject: linux-next: manual merge of the akpm-current tree with the pidfd
 tree
Message-ID: <20210127224351.486fd977@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0Qle1JKigF6Fw.QS9r+Wv_8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0Qle1JKigF6Fw.QS9r+Wv_8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/hugetlbfs/inode.c

between commit:

  2f221d6f7b88 ("attr: handle idmapped mounts")

from the pidfd tree and commit:

  57d3629b7a9a ("hugetlbfs: remove useless BUG_ON(!inode) in hugetlbfs_seta=
ttr()")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/hugetlbfs/inode.c
index c5c32eb59498,ca9e25427f2d..000000000000
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@@ -760,9 -766,7 +767,7 @@@ static int hugetlbfs_setattr(struct use
  	unsigned int ia_valid =3D attr->ia_valid;
  	struct hugetlbfs_inode_info *info =3D HUGETLBFS_I(inode);
 =20
- 	BUG_ON(!inode);
-=20
 -	error =3D setattr_prepare(dentry, attr);
 +	error =3D setattr_prepare(&init_user_ns, dentry, attr);
  	if (error)
  		return error;
 =20

--Sig_/0Qle1JKigF6Fw.QS9r+Wv_8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmARUfcACgkQAVBC80lX
0GwYGQf+OWsT4aPV7MArkXB5/KnLQoYnpt+UU2P8zbytn9A8u6qT5iIbbL8vXL1S
aLSgGVTk4ptWDk4tbYaO+Pg0hup+cxKo8rDBBKObcO19JryagaNavFsGd44OqVd4
n4EnNsYAyJq70BzJnrpPGQI4XChFWVbOy3I/0p3nU9LJ0VxOTq4Jb/tnUVi/CdTI
n9TzWyUxH8PZ2GavFCuv0kdNjteMrjz87FOAaeYoptE2/EL0xTrgATCPenhAdw+d
IxSpSrNp+fNiMusf+bbKIIQ+6+614eyOUrSuJvc0TQsvI/6EWKhirAOajthNqUiG
84IBvp/oVjWY8RpQJ0BXf21KUQ3erw==
=a4AN
-----END PGP SIGNATURE-----

--Sig_/0Qle1JKigF6Fw.QS9r+Wv_8--
