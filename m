Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92D3DF0E0E
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 06:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725294AbfKFFDg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 00:03:36 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50479 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbfKFFDg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 6 Nov 2019 00:03:36 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 477DvS1hrHz9sPF;
        Wed,  6 Nov 2019 16:03:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573016613;
        bh=MdD6/XCrITz84UvHjAMMlm2DKaTOIlnNL24y+pFhAa0=;
        h=Date:From:To:Cc:Subject:From;
        b=Yy2IJLOfyLXzCIgVUmoQFaiZXtutzV6Q/qFrwaxaGaRAnkciV057MtG02kfYnoah6
         JVeqcHXj5t7L7pblwmxXKO4XUzhuEJ5qpXBqKheOEgqwsIHyl2REJwhbyoGUyhMaxe
         zAMemqfzUeMJVvWWWX8i4es5xwE2c6qngNgYag77NCwRy1SCS8q5n+yTffwZ9SU7Yk
         YRQdjZE0/RyrwIIafAJqRq1e0T6G0aKzUPFJyTExJn4HqT133bcuB81PFZYKjfuSkE
         OKci6LuCoL2TGGJb4CZQez4E79BUJFLS6X2YAfkfI7m+1m6av7pxr2amRkUak4F05w
         Jru+wpUznRYrg==
Date:   Wed, 6 Nov 2019 16:03:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>
Subject: linux-next: manual merge of the kspp tree with the tip tree
Message-ID: <20191106160331.016b2521@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PJf3dd9n9+QwGxmYo4m+6=U";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PJf3dd9n9+QwGxmYo4m+6=U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  arch/x86/kernel/fpu/xstate.c

between commit:

  446e693ca30b ("x86/fpu: Use XFEATURE_FP/SSE enum values instead of hardco=
ded numbers")

from the tip tree and commit:

  ec2f877856e0 ("treewide: Use sizeof_member() macro")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/kernel/fpu/xstate.c
index 319be936c348,023b0a28e13b..000000000000
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@@ -254,13 -254,10 +254,13 @@@ static void __init setup_xstate_feature
  	 * in the fixed offsets in the xsave area in either compacted form
  	 * or standard form.
  	 */
 -	xstate_offsets[0] =3D 0;
 -	xstate_sizes[0] =3D offsetof(struct fxregs_state, xmm_space);
 -	xstate_offsets[1] =3D xstate_sizes[0];
 -	xstate_sizes[1] =3D sizeof_member(struct fxregs_state, xmm_space);
 +	xstate_offsets[XFEATURE_FP]	=3D 0;
 +	xstate_sizes[XFEATURE_FP]	=3D offsetof(struct fxregs_state,
 +						   xmm_space);
 +
 +	xstate_offsets[XFEATURE_SSE]	=3D xstate_sizes[XFEATURE_FP];
- 	xstate_sizes[XFEATURE_SSE]	=3D FIELD_SIZEOF(struct fxregs_state,
- 						       xmm_space);
++	xstate_sizes[XFEATURE_SSE]	=3D sizeof_member(struct fxregs_state,
++							xmm_space);
 =20
  	for (i =3D FIRST_EXTENDED_XFEATURE; i < XFEATURE_MAX; i++) {
  		if (!xfeature_enabled(i))

--Sig_/PJf3dd9n9+QwGxmYo4m+6=U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3CVCMACgkQAVBC80lX
0GxEEAf/a3/xA9E9jpoa6PZE9i9aEcfPCqHhoaVVPXXFUWwD584mg3tO/ala5wrd
SlwLlLN8JrofrAC7TJxjHk7jq6oEW8nT7Ulzb3L8Hjq20rDW4szJhDFZAQGs4cKW
aNp0aj8XSfb9VvoVWk8GSx/TYcL66+oeckJB+DWP7J0Kbvy8P5CbFU7se59aD/bC
OO+CBlBJuRFjALnYYHhaD8qZNLmXkJjZr43DQ4dzba8RyRJdE9YystEIgVvWuBOd
It9APqMIQJyHwntuKEF3YK/wbhIoS3GsC3HfKc9rBvT/GIeVA5QIy1+AXp+fn8CU
CzDsORCZAeV6x+m67YIVXeWWYtRUYA==
=cs12
-----END PGP SIGNATURE-----

--Sig_/PJf3dd9n9+QwGxmYo4m+6=U--
