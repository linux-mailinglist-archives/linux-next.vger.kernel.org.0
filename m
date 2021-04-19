Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 564383638E4
	for <lists+linux-next@lfdr.de>; Mon, 19 Apr 2021 02:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235636AbhDSAyQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Apr 2021 20:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbhDSAyQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 18 Apr 2021 20:54:16 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6A4CC06174A;
        Sun, 18 Apr 2021 17:53:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FNpGc0Mfsz9vDw;
        Mon, 19 Apr 2021 10:53:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618793624;
        bh=gcEq8KQj8GS+rVW/x0Sxy9+65d2IDmrXQPJwa2A836k=;
        h=Date:From:To:Cc:Subject:From;
        b=O0pjd/twioHN2xNLFrpjeCAPd1o1/9vyAjD7caRYZjRumxjCU7I+txhql7eFhieM2
         xwmWqSzZ3JfvXWuBtLEEVIFDgRFiNOeQB/BXpZms5XFEaQA/yWiAP8mI7FzS++GtqR
         wij56JuJueTHrisC/6+rSg0q21HAbCpBzB/hDpFhEdgF2yeWljbMgJQ1q4xn6NUmq7
         oKYpzYAhpfkxrdsF4M/V6GbCg++R9l+so6xyBphyrDqCMKIfjbfgJUBhB1kw2WNgme
         nt5SN/u3xjUc6z79xxZTsGKoRwuIXwaZw8gcFWlmk8y/CG8y/wmEouvNwOv5naKqxy
         pbi31uGGB0xVw==
Date:   Mon, 19 Apr 2021 10:53:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Jack Qiu <jack.qiu@huawei.com>, Jia Yang <jiayang5@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Yi Zhuang <zhuangyi1@huawei.com>
Subject: linux-next: manual merge of the vfs tree with the f2fs tree
Message-ID: <20210419105343.0323daf3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gYwy+IUGgmercHIWfNjiLNi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gYwy+IUGgmercHIWfNjiLNi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/f2fs/namei.c

between commit:

  5f029c045c94 ("f2fs: clean up build warnings")

from the f2fs tree and commit:

  80e5d1ff5d5f ("useful constants: struct qstr for ".."")

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

diff --cc fs/f2fs/namei.c
index 405d85dbf9f1,377c6b161b23..000000000000
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@@ -416,10 -416,8 +416,9 @@@ out
 =20
  struct dentry *f2fs_get_parent(struct dentry *child)
  {
- 	struct qstr dotdot =3D QSTR_INIT("..", 2);
  	struct page *page;
- 	unsigned long ino =3D f2fs_inode_by_name(d_inode(child), &dotdot, &page);
+ 	unsigned long ino =3D f2fs_inode_by_name(d_inode(child), &dotdot_name, &=
page);
 +
  	if (!ino) {
  		if (IS_ERR(page))
  			return ERR_CAST(page);

--Sig_/gYwy+IUGgmercHIWfNjiLNi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB81JcACgkQAVBC80lX
0Gwl3Qf/aekSGtNRYUXnkNf6OC/shiXjj28YkJKsps5dYjgVLg/BJWyRP25+8yVO
Ox2sCx8dHfIZQ8pzXmV/01cZ7B+JN01u0uFe/kYGAnLydYixyzcN0sWAjllBQHuJ
89kGgAIZznIttq93wcjmxFfrsp8SyJZN6cl2k7ngHvs+8sw2W0j4j9yJV7S1DTVw
14EpbXSnLJxGoH+eLoWib2kbCk/9G/VKnKoNKxShHiy20uLKF4s9wZGZ0SCgAsVC
mIBLokfes5gYcWtpUxkowolVXWvHyBgOL/EdyVjsFR2WYLy1aXucgqQl6mfrCXu/
PZf6GEaJpbiDtIZE/zeBLHMleYNkGw==
=fW4H
-----END PGP SIGNATURE-----

--Sig_/gYwy+IUGgmercHIWfNjiLNi--
