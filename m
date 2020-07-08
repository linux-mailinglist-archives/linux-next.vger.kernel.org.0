Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84FBA217DD2
	for <lists+linux-next@lfdr.de>; Wed,  8 Jul 2020 06:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725320AbgGHEAj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Jul 2020 00:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbgGHEAj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 8 Jul 2020 00:00:39 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF8F3C061755;
        Tue,  7 Jul 2020 21:00:38 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1lvm5swFz9sDX;
        Wed,  8 Jul 2020 14:00:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594180837;
        bh=957lItIZvTN4WdtL2grsL+l3U2VsYqTD4EPR4QpH2Mg=;
        h=Date:From:To:Cc:Subject:From;
        b=L7IQNKIEuIpbayFYboM++tHCPO2ZH+n1F+FS482LCNgEw9snMXqRkkJRXTgeZIwFW
         f1cduBTQI/Gt+HhcE5L9IWDk/pZvQ6h5A3tPmhrXgthcHttuFqpPyH0Tod3f5bslK/
         i8ZH1tlWMdJZqTlC4ylqpVT0MxgyFVEKQWWpXLPFycEX+TdsaWcLI/0Si4TJgU0E0P
         u9nITqWV2Hqf+ZtF/rFGOt8Whmu0yRstTDwYYYzgriFA09/JwpAL5wmj9BsO39fMpJ
         H+UmkOktQvorEfIuMPhGr0DAmjBb39OmV3Am8aTWM7XUSjOuB2BLIICHKMZ8CQPOuX
         GpFNFsS2OjkoA==
Date:   Wed, 8 Jul 2020 14:00:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     James Morris <jmorris@namei.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Colascione <dancol@google.com>
Subject: linux-next: build failure after merge of the security tree
Message-ID: <20200708140034.546298ff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zDb+9f7ZhEmpt+otwEEbNfE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zDb+9f7ZhEmpt+otwEEbNfE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the security tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/anon_inodes.c: In function 'anon_inode_make_secure_inode':
fs/anon_inodes.c:70:10: error: implicit declaration of function 'security_i=
node_init_security_anon'; did you mean 'security_inode_init_security'? [-We=
rror=3Dimplicit-function-declaration]
   70 |  error =3D security_inode_init_security_anon(
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |          security_inode_init_security

Caused by commit

  2749d3f84a70 ("Add a new LSM-supporting anonymous inode interface")

# CONFIG_SECURITY is not set

Also, the explicit include of linux/security.h is missing ...

I have added the following patch for today.

=46rom b2bae25c9b715e06f7e802ec7b51cfbfec046e6c Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 8 Jul 2020 13:43:01 +1000
Subject: [PATCH] fix up for "Add a new LSM-supporting anonymous inode inter=
face"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/anon_inodes.c         | 1 +
 include/linux/security.h | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/fs/anon_inodes.c b/fs/anon_inodes.c
index f87f221167cf..25d92c64411e 100644
--- a/fs/anon_inodes.c
+++ b/fs/anon_inodes.c
@@ -21,6 +21,7 @@
 #include <linux/magic.h>
 #include <linux/anon_inodes.h>
 #include <linux/pseudo_fs.h>
+#include <linux/security.h>
=20
 #include <linux/uaccess.h>
=20
diff --git a/include/linux/security.h b/include/linux/security.h
index 95c133a8f8bb..7c6b3dcf4721 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -735,6 +735,13 @@ static inline int security_inode_init_security(struct =
inode *inode,
 	return 0;
 }
=20
+static inline int security_inode_init_security_anon(struct inode *inode,
+						    const struct qstr *name,
+						    const struct inode *context_inode)
+{
+	return 0;
+}
+
 static inline int security_old_inode_init_security(struct inode *inode,
 						   struct inode *dir,
 						   const struct qstr *qstr,
--=20
2.27.0

--=20
Cheers,
Stephen Rothwell

--Sig_/zDb+9f7ZhEmpt+otwEEbNfE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8FROMACgkQAVBC80lX
0Gzv5AgAgWD26XxBoAT0UcACCiPs+D1K3oaksBZ78PvNYac49YTdSSTGvXMRjBht
ruIfQQSxuI9AF8i90iVPY6FFyi9mDTsW1d24ejFdTsGGPxHc06/oojnVISN7nSOp
F2WUoHEveRFRW0Z3iFhkBcizA1qg/oZxI3kggyUridfEpZxrAnl1v6N3M1oA+nrg
LxEgcWj9AUfUKq4Yj9rbRzQNcmiF5YPMcTOJDy+WV2DM5J9940CW0fMtodW18xi5
lFx2MSwQtkE9j+CQ8c4ckbt+MBq2LPjq0ei1pyzz14948E4U3ghOk9S/AjPzyBhS
lltPMqNPkVJ1nQOClBST0BYMdi6lzw==
=6fi3
-----END PGP SIGNATURE-----

--Sig_/zDb+9f7ZhEmpt+otwEEbNfE--
