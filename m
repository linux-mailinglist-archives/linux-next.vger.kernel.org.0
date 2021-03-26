Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196F5349D78
	for <lists+linux-next@lfdr.de>; Fri, 26 Mar 2021 01:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbhCZAJY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Mar 2021 20:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhCZAJN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Mar 2021 20:09:13 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5594CC06174A;
        Thu, 25 Mar 2021 17:09:13 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F62QF5qkjz9sVS;
        Fri, 26 Mar 2021 11:09:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616717350;
        bh=ZBeexDAFxKAAoQxf63ZF06+EPY4JetBWBnMNUNqWZXI=;
        h=Date:From:To:Cc:Subject:From;
        b=ORFCyRBAxir7+Lkr3Otk7mvUTx685mmBSDok/kgKhE5/ZWcPd+jZdCnsSGPXJdsXY
         m48J0O2fwLaY7GhzFGQ6fX4XgAVLSvfJw0du08omu6AZd8h0ZF00CE/dvJk8AXfJ+j
         bO1mVorvcZ2ljLugAXvNP50d9hPaSSdDNnquJfWANIJhzg6yj9+ynKtWTBc5ietFmq
         axGOX4LG8NpxezE3b0OBJWJlviyduR5pGXdoKvG8G1bAm9/kIbp7uNOOHfo0lnypqV
         aTOpmCiGsh+SCC2IzA5Dl6Em/6tSEF5fGvNMILwr9BzUogAVjHfjWAP2UduQuoEheQ
         ZBr1HrqvO4zBA==
Date:   Fri, 26 Mar 2021 11:09:06 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>,
        Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Steve French <stfrench@microsoft.com>
Subject: linux-next: manual merge of the vfs tree with the cifs tree
Message-ID: <20210326110906.401d4b9c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2UQcJwWTJp_fSt7vaSdkPCN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2UQcJwWTJp_fSt7vaSdkPCN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/cifs/file.c

between commit:

  4c7b707d72f5 ("cifs: revalidate mapping when we open files for SMB1 POSIX=
")

from the cifs tree and commit:

  4d66952a2032 ("cifs: have cifs_fattr_to_inode() refuse to change type on =
live inode")

from the vfs tree.

I fixed it up (I thknk - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/cifs/file.c
index 042e24aad410,78266f0e0595..000000000000
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@@ -165,8 -165,7 +165,8 @@@ int cifs_posix_open(char *full_path, st
  			goto posix_open_ret;
  		}
  	} else {
 +		cifs_revalidate_mapping(*pinode);
- 		cifs_fattr_to_inode(*pinode, &fattr);
+ 		rc =3D cifs_fattr_to_inode(*pinode, &fattr);
  	}
 =20
  posix_open_ret:

--Sig_/2UQcJwWTJp_fSt7vaSdkPCN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBdJiIACgkQAVBC80lX
0GxodwgAhk3Njs6Rod5vmElaNF1bZY6VWo09ax+DWV6oFe9aUdBxSx/U3ZUnzntP
/+lFOPGyr2DcA5jfNELysDp9XuCNUeVszPhIsHNR6nOaH3jaWzFQmwuHEA6bZvYS
/QfC3LqxrWOe5R9kzRtlVjFCiDkIqPgse8y0x0AIiYjjoe/tiPBecgWH4Pwwgrv1
bjqFfAFBvJ1kXB65f6thgFztqQAczdTa2EBjoBFcD0UhAGjJ/jZrcVSCD7NGjGiy
HaPHtlNrSEJvrL4qtUPZMzCNVh2ZgdPeOH4E7qO8JhGQ5LYJ94anMIrJ5oAGFdiy
XyHSoINKBbIG09lX8+VOiMTfJtl0cQ==
=vXpm
-----END PGP SIGNATURE-----

--Sig_/2UQcJwWTJp_fSt7vaSdkPCN--
