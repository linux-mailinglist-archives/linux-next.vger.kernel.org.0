Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74DB010A876
	for <lists+linux-next@lfdr.de>; Wed, 27 Nov 2019 03:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725940AbfK0CBq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Nov 2019 21:01:46 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56329 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725883AbfK0CBq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Nov 2019 21:01:46 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47N3sx5l1dz9sSc;
        Wed, 27 Nov 2019 13:01:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574820103;
        bh=cy9A3E8oTFi0nOn+OkeRW0ppPDDn/IuuVGvqFC6oZWI=;
        h=Date:From:To:Cc:Subject:From;
        b=lR1n2OUMsIdhMdiQU0iQrJdGz4khJvlm7+5h+faaVwEb/nSjij8bgEvsthnGaFxmN
         WY8TkTJi6wSbRgw2ILuNIS5xccwkcu6oYZfbfftjhv9XVOKcVtjckpaY5WDp8+QcIi
         klyf5Cdd6ymfXmh7u3w5Mu7WNxQN5tm8nv8Hq/k8BH7NlaIhobP5u854F9OrHYGO9J
         G6y9TCsA2d32++z+kmongGw0FgeVOwaVHCIavR8NmIxV8nFFm0cI35/I1Gpd8r5T5J
         ObH/r1jnWMMDzHIAMcIMcvs8NI86lN/3HJ8jnxCiTwqqgPDPi/iMedHgGVhYMWSvkZ
         Ng2C2TOz9mnvQ==
Date:   Wed, 27 Nov 2019 13:01:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Safonov <dima@arista.com>
Subject: linux-next: manual merge of the y2038 tree with the tip tree
Message-ID: <20191127130139.0b16375c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F+E.qrgZ3.i=Z3aqEuBAa0K";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/F+E.qrgZ3.i=Z3aqEuBAa0K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the y2038 tree got a conflict in:

  kernel/time/time.c

between commit:

  7b8474466ed9 ("time: Zero the upper 32-bits in __kernel_timespec on 32-bi=
t")

from the tip tree and commit:

  3ca47e958a64 ("y2038: remove CONFIG_64BIT_TIME")

from the y2038 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/time/time.c
index 4d434dad6ebc,58e312e7380f..000000000000
--- a/kernel/time/time.c
+++ b/kernel/time/time.c
@@@ -884,8 -879,7 +882,7 @@@ int get_timespec64(struct timespec64 *t
  	ts->tv_sec =3D kts.tv_sec;
 =20
  	/* Zero out the padding for 32 bit systems or in compat mode */
- 	if (IS_ENABLED(CONFIG_64BIT_TIME) && (!IS_ENABLED(CONFIG_64BIT) ||
- 					      in_compat_syscall()))
 -	if (in_compat_syscall())
++	if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
  		kts.tv_nsec &=3D 0xFFFFFFFFUL;
 =20
  	ts->tv_nsec =3D kts.tv_nsec;

--Sig_/F+E.qrgZ3.i=Z3aqEuBAa0K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3d2QMACgkQAVBC80lX
0Gy+2wf9Hz9gIvHa5mX4rJBnTrWt2lj92Pr1lv5dsS6VZ77Z9N1BV6C3BGtuhKZn
7tCrXbaQxc4akNVxZscif4jHudkGLway93r8FyIO9Lk1TPWLF+kPdx4YiICYVh3G
X3jVP9J56S4NT41aKLyk+T4sUCTxSMoCaPStOa9yflitB+rkS6OO+tRaVD415aYF
NqaHpmleXABWKNrdykhYzpE+jryMNw49mqeDTRqTNeYcGbt0m+nnHD5kOr7QUCbe
2fiZVg7jjy6YVpN8mApTiWDtuqWT8dxi4Uk5bUqru2WO7j6ihGXDKJHa4F0/OJIv
WcUdoaCsk2EgHSyDre8R1b/Zqr5a6Q==
=ksJO
-----END PGP SIGNATURE-----

--Sig_/F+E.qrgZ3.i=Z3aqEuBAa0K--
