Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9CD51DDDA3
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 05:06:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgEVDGX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 May 2020 23:06:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38115 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727024AbgEVDGX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 21 May 2020 23:06:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Srwr6QCBz9sT2;
        Fri, 22 May 2020 13:06:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590116781;
        bh=vg7OdzOYZ/E6oXtQWwdzM9LqQMPJbWG89AiKb4R9r98=;
        h=Date:From:To:Cc:Subject:From;
        b=mY8BwFJrydn7BYW17jU1FgItYfdiKhaB/KAcFMTfynpMV16ExnPEEDo3Jv6BG4l6C
         /2eJxNY0aPxwFPbIRJV2vY7L+ObCOBXIakTb6R8WRnyMMEjzEEkWTDhIXxJLYX/Ylx
         A33XsC+/vrkGoMlXcTmEANA7X4CoxgBbL7e6ISWzzhy9la/J7KlfonNKEAcb4Z3bXu
         Gj/QxfRFn6KSZDHnu4JDHKwWcvmAs2L38/GwWnIPuY+KHVpckKuZ9tdj6iq/4ZMaUg
         fMuz4OCrRvy8Y2ppNkRl/IMcF62ZXHyXPztlZMT1KUQPAgVZb1Qp+FnG/4v479R/J2
         TKtdBbjw9e4pQ==
Date:   Fri, 22 May 2020 13:06:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: manual merge of the jc_docs tree with the ext4 tree
Message-ID: <20200522130616.5fd7054c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yC1rBzc8PUGH8SFAA_zrQAr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yC1rBzc8PUGH8SFAA_zrQAr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/filesystems/fiemap.rst

between commit:

  469581d9e5c9 ("fs: move fiemap range validation into the file systems ins=
tances")

from the ext4 tree and commit:

  e6f7df74ec1a ("docs: filesystems: convert fiemap.txt to ReST")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/filesystems/fiemap.rst
index 35c8571eccb6,2a572e7edc08..000000000000
--- a/Documentation/filesystems/fiemap.rst
+++ b/Documentation/filesystems/fiemap.rst
@@@ -203,10 -206,9 +206,10 @@@ EINTR once fatal signal received
 =20
 =20
  Flag checking should be done at the beginning of the ->fiemap callback vi=
a the
- fiemap_prep() helper:
 -fiemap_check_flags() helper::
++fiemap_prep() helper::
 =20
- int fiemap_prep(struct inode *inode, struct fiemap_extent_info *fieinfo,
- 		u64 start, u64 *len, u32 supported_flags);
 -  int fiemap_check_flags(struct fiemap_extent_info *fieinfo, u32 fs_flags=
);
++  int fiemap_prep(struct inode *inode, struct fiemap_extent_info *fieinfo,
++		  u64 start, u64 *len, u32 supported_flags);
 =20
  The struct fieinfo should be passed in as received from ioctl_fiemap(). T=
he
  set of fiemap flags which the fs understands should be passed via fs_flag=
s. If

--Sig_/yC1rBzc8PUGH8SFAA_zrQAr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7HQagACgkQAVBC80lX
0Gx4XQgAgxHLlooqcAUKDPVQanDE5h82ReFmCdKIjUk/BdlCSja9Yh2O5NfxXGCj
B/M7AXr1J+UOhPKEho21atYhY8Paomr3oOOE+OFHr1yueZBZ+bs3mNbPdDh2iuBP
C7V7ZNuJIkrfygLi84AlVxx2k8q9ce1RJg0Xg8hJ9UB26t0vR2fBV3tBMZrGjTBp
LJBMScv9/sesUuUSDQyW7m9SrNynlE+w5Z2OcMfZfsFiRWVixYA42XfMoaRU9j3H
vBDg9L8G24NufHqi3uMLgwg+Fc93FGbfC5nwW+tbWXAeqbdyptM1wIDvVshnmvK/
J9eWVCEWChi91dVyd707XhEKZzPsRA==
=R4id
-----END PGP SIGNATURE-----

--Sig_/yC1rBzc8PUGH8SFAA_zrQAr--
