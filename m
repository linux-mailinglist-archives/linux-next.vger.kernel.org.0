Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F5730584C
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 11:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235702AbhA0KY5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 05:24:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S314113AbhAZXBX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jan 2021 18:01:23 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77BB0C061573;
        Tue, 26 Jan 2021 15:00:42 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQMdz75lKz9sVs;
        Wed, 27 Jan 2021 10:00:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611702040;
        bh=uj6BXrMfCRtLVphjvZUedMhazXjoD4M1lHDCfld0vd8=;
        h=Date:From:To:Cc:Subject:From;
        b=TeqHUAhPWhT3cDPGTCUbQ68y9cNlwLuSNUmIw44UBnd3W+hksYm2OczWI4ICA67lT
         0e2ZHj49FgfYqE35gHx8W1GzxUmuQfzMXJLyGY6KM39Q33NC2TLFtgp/bBPHgGrmvQ
         OgIgxkf90wlcF9Wiq5cyQ7lEEt+iCY9NRaRzVUb7bpbbSG2NahesHeUoNpoqkvVp7h
         EC0xY95YPGzkR5K5owUlLyOvQm4jeJ22Ye6EK/NZaqDORqtUI6TZWC+N+oPKNlXaXY
         /zKXWP8h2actqVqu/xnb8bOge30TUpiwavTKiCfoUJtCTMwR/+7Nx5/oi5x7V0OSUO
         NCK72oQlKEd4Q==
Date:   Wed, 27 Jan 2021 10:00:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the fscache tree with the pidfd tree
Message-ID: <20210127100038.1d04e444@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o1pPZ0R_Cs.wsiYsyiFWkP1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/o1pPZ0R_Cs.wsiYsyiFWkP1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fscache tree got a conflict in:

  include/linux/fs.h

between commit:

  ba73d98745be ("namei: handle idmapped mounts in may_*() helpers")

from the pidfd tree and commit:

  0de0bdfa19fa ("vfs: Export rw_verify_area() for use by cachefiles")

from the fscache tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/fs.h
index 7762d3d75230,493804856ab3..000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -2839,22 -2756,11 +2839,23 @@@ static inline int bmap(struct inode *in
  }
  #endif
 =20
 -extern int notify_change(struct dentry *, struct iattr *, struct inode **=
);
 -extern int inode_permission(struct inode *, int);
 -extern int generic_permission(struct inode *, int);
 -extern int __check_sticky(struct inode *dir, struct inode *inode);
 +int notify_change(struct user_namespace *, struct dentry *,
 +		  struct iattr *, struct inode **);
 +int inode_permission(struct user_namespace *, struct inode *, int);
 +int generic_permission(struct user_namespace *, struct inode *, int);
 +static inline int file_permission(struct file *file, int mask)
 +{
 +	return inode_permission(file_mnt_user_ns(file),
 +				file_inode(file), mask);
 +}
 +static inline int path_permission(const struct path *path, int mask)
 +{
 +	return inode_permission(mnt_user_ns(path->mnt),
 +				d_inode(path->dentry), mask);
 +}
 +int __check_sticky(struct user_namespace *mnt_userns, struct inode *dir,
 +		   struct inode *inode);
+ extern int rw_verify_area(int, struct file *, const loff_t *, size_t);
 =20
  static inline bool execute_ok(struct inode *inode)
  {

--Sig_/o1pPZ0R_Cs.wsiYsyiFWkP1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQnxYACgkQAVBC80lX
0Gz8zAf8CUJDtteYC9fjMlr4cZZhmV93k89gqGSAw9h6iUoMh7G0fj3/3NOy6rUl
JJeuEMsxxotCO14ePRsIpzGRaI6zPi8genXVmnKtu6zRcPm2PoUZkakyAOIHaxr5
/TW+5eITlLOuI0SGRKP0bA+iYXx8hyXroiAwYPJv+6N/4kevfaAC5Z7DAe2vFGxA
RGf5ezzKrUL61OFdW/nlQjisDiKHbgkOAn0TBBRzlkOrTc78U8tNSJUGTOd1aI7e
IAgs8jelE/mcu1TE8YLaZhoH+kobFTHQWHWOoUhBwi68QJV5EQimrP4A/O9aaKGv
W1f+88KWwTEIDgJfGrJ35U9/wytx8A==
=xbu9
-----END PGP SIGNATURE-----

--Sig_/o1pPZ0R_Cs.wsiYsyiFWkP1--
