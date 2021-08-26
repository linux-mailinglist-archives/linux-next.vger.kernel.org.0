Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3103D3F90D2
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 01:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243722AbhHZXDa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Aug 2021 19:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243728AbhHZXDa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Aug 2021 19:03:30 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398A8C061757;
        Thu, 26 Aug 2021 16:02:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwdfN5V8Fz9sRf;
        Fri, 27 Aug 2021 09:02:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630018958;
        bh=ZELkEOQKHl9DpFrRqkIlZ9IIPILPiWW5GsJaWDSlFCY=;
        h=Date:From:To:Cc:Subject:From;
        b=dep8UZFmCkdgJgsEJ828AeO/kMbcaEy/h5XmqL3VrbB8uOHnfP9Hot97I/koOA6Mz
         XW2H7dVKIh53sMxkpqTOm32sI/oe8toR+b8OVz+r2j1LRggWOoglI9osVts9Y1dj6Y
         LOvvXNUBtbKjC+vtu7ozUR/Ep6v7JbQnp1L5SCv6ROGT7S7aiJImUAr3xv12lph6Wd
         f7B3YiP0x0WInI26y0V/eKGm4Xg8k1k8nMVU2H6JDH2MRWDVZ37RCYmbSFKbVidTPM
         Y8QgxX16Zw+pfNhW/bTHnZWDDIyQkXdQd9RQCQAIxg1i5kGGuVzC0iePJnVh6T+gwH
         8+FDvDWkNykIQ==
Date:   Fri, 27 Aug 2021 09:02:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Richard Weinberger <richard@nod.at>, Arnd Bergmann <arnd@arndb.de>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the uml tree with the asm-generic tree
Message-ID: <20210827090234.7aca7a2a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3fij2OaEp0EYbkfYpvl/pkp";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3fij2OaEp0EYbkfYpvl/pkp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the uml tree got a conflict in:

  arch/um/kernel/skas/uaccess.c

between commit:

  f27180dd63e1 ("asm-generic/uaccess.h: remove __strncpy_from_user/__strnle=
n_user")

from the asm-generic tree and commit:

  043f5d3ffaf6 ("um: Remove set_fs")

from the uml tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/um/kernel/skas/uaccess.c
index a509be911026,dda2439ab550..000000000000
--- a/arch/um/kernel/skas/uaccess.c
+++ b/arch/um/kernel/skas/uaccess.c
@@@ -194,14 -184,6 +184,9 @@@ long strncpy_from_user(char *dst, cons
  	long n;
  	char *ptr =3D dst;
 =20
 +	if (!access_ok(src, 1))
 +		return -EFAULT;
 +
- 	if (uaccess_kernel()) {
- 		strncpy(dst, (__force void *) src, count);
- 		return strnlen(dst, count);
- 	}
-=20
  	n =3D buffer_op((unsigned long) src, count, 0, strncpy_chunk_from_user,
  		      &ptr);
  	if (n !=3D 0)
@@@ -243,12 -220,6 +223,9 @@@ long strnlen_user(const char __user *st
  {
  	int count =3D 0, n;
 =20
 +	if (!access_ok(str, 1))
 +		return -EFAULT;
 +
- 	if (uaccess_kernel())
- 		return strnlen((__force char*)str, len) + 1;
-=20
  	n =3D buffer_op((unsigned long) str, len, 0, strnlen_chunk, &count);
  	if (n =3D=3D 0)
  		return count + 1;

--Sig_/3fij2OaEp0EYbkfYpvl/pkp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEoHYsACgkQAVBC80lX
0Gzplgf/cXXx4PI5BxROoicssgtM4dqc9yOJfm3As6+Bq03pUBNebhGnsBnSR3QO
Cf6/76WvBreMsjurs3j2alj4JVP6EbiEah/77qe7sOmP1jiS5d+ffGCviyQ/OCcX
pHg53srBED1ueE7kiHalqu1sVD6q4L5YvKzTxzyuSzLx0tcUNtNL+CBfsdOha9Du
koa1S4CU6m4wtBq2p7tjJKNxGHeX8rheUFtNUzc52O0ZWt5i1PcPyseOxxB9zI3/
A4aTOCCcyMgftPdLyHrhcTHn0hSqctyxr4jdQQNT+SXv2LUZw/VCFWwLMRSacB/6
Z8vmyToIGrIdk44d2BrC4vghV64KJA==
=vu1X
-----END PGP SIGNATURE-----

--Sig_/3fij2OaEp0EYbkfYpvl/pkp--
