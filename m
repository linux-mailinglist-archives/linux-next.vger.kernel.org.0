Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E8C1E722B
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 03:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390951AbgE2BpH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 21:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390874AbgE2BpF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2020 21:45:05 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5FA8C08C5C6;
        Thu, 28 May 2020 18:45:05 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Y6nq087Mz9sSn;
        Fri, 29 May 2020 11:45:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590716704;
        bh=h4vJZgFee/MXNSDGQ4ODQIQmSoScMbYL0iBi3itUrwI=;
        h=Date:From:To:Cc:Subject:From;
        b=rYft3AShZWLY7MawRm5M222CgZBSO0vefHWC32SxFcDYbHHWSSfknaj7GQXfq0R5p
         ejVMcszm1XI3DTe64Bqt62Pkkkm57bZntK1Jrvcu+YW5PCHavVmq6rjmGrZlxW8Mu1
         0A0rMqcAX4j0FFiU6nmozpLjEjE+SfF1nY7asVjHFmsXWiR3ZL6l8Xie7G1L0hPP6a
         V6qlAXZpCahujin7bnw5Zh7ma1p8kjFApcbttlmtKHTscLki4B6QtulCWdhvmtroE0
         mj3tlQZKSOheo47ZN+IBrFqDZ2yL2Jj7/2N+hyx2IldGj+n3YarviblWJGVNo2U99R
         MCFMnfIzzd1Yg==
Date:   Fri, 29 May 2020 11:45:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>, Gao Xiang <xiang@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chengguang Xu <cgxu519@mykernel.net>,
        Chao Yu <yuchao0@huawei.com>
Subject: linux-next: manual merge of the vfs tree with the erofs tree
Message-ID: <20200529114501.3e2ecc14@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z74xrQrbvp5h_sbapgXd8tL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/z74xrQrbvp5h_sbapgXd8tL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/erofs/super.c

between commit:

  e7cda1ee94f4 ("erofs: code cleanup by removing ifdef macro surrounding")

from the erofs tree and commit:

  91a7c5e1d30e ("erofs: convert to use the new mount fs_context api")

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

diff --cc fs/erofs/super.c
index 8e46d204a0c2,2c0bad903fa6..000000000000
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@@ -408,16 -365,12 +365,9 @@@ static int erofs_fc_fill_super(struct s
  	sb->s_time_gran =3D 1;
 =20
  	sb->s_op =3D &erofs_sops;
 -
 -#ifdef CONFIG_EROFS_FS_XATTR
  	sb->s_xattr =3D erofs_xattr_handlers;
 -#endif
 =20
- 	/* set erofs default mount options */
- 	erofs_default_options(sbi);
-=20
- 	err =3D erofs_parse_options(sb, data);
- 	if (err)
- 		return err;
-=20
- 	if (test_opt(sbi, POSIX_ACL))
+ 	if (test_opt(ctx, POSIX_ACL))
  		sb->s_flags |=3D SB_POSIXACL;
  	else
  		sb->s_flags &=3D ~SB_POSIXACL;

--Sig_/z74xrQrbvp5h_sbapgXd8tL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7QaR0ACgkQAVBC80lX
0Gwrhwf/ZjTrTgKdAXlYzQ+AOUeQbEz7HycDiRovgoThHNin3QA2DfY1ZAqWJtsV
UypgpUIdTIis4PSPNasciEbau5EvsnknmD9qm8sw72gVddiHGgIGTZ+7GgloBjtH
pBuOrUtVhoqj6dOnEJTUDvbg6pYqpc3hAfGC41HXEWTABh3XzEe2SUdpSaXXO/ZV
bHnUciuV0AD2dFXDPZZZ3fBGXpjhy5Ivt3RblbveUAxyxqzPVu8Q/M6apB+jHiFT
+Icz2V1GKTiqpGwDzBfnRA+057Wvt+o8uRoDv7yl2a63xxxEQseQZYkvPYWIVDV0
Y79PuiWfnB1ptcOb6UlPE1TcR2o+IA==
=+11A
-----END PGP SIGNATURE-----

--Sig_/z74xrQrbvp5h_sbapgXd8tL--
