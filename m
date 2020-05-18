Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 271D11D702F
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 07:11:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgERFKh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 01:10:37 -0400
Received: from ozlabs.org ([203.11.71.1]:49029 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726357AbgERFKh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 May 2020 01:10:37 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49QRt13xznz9sT8;
        Mon, 18 May 2020 15:10:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589778635;
        bh=0h3w57Pp77i8mUOcndIQfvFacVXTqrNwKoWe4NKKQxg=;
        h=Date:From:To:Cc:Subject:From;
        b=sJ3rWW/L/UbX2cR1Cz6ACQeAoIIItDnpRoqpJqixD0RxZ3PcP4gxcmCma3ZODQNYe
         S1X/yEdNPYkr56hFzhP925HpJCDx02XVce1TgXZfjjCTgp3CuTRg9Z2JRmYNim4dZp
         JQIY87Il+00+OMYEGcFdpq856MZjgSc3YTngYYWamhJFV5v/MZk+alqdZ8uskQIf8x
         P07U4+3UsKKLdSElcinLAdfZNcTPQUZCui1+YIdyl244i7UFGod+6zsYnN3YFzw+eB
         phnCswHaYlfMYhaa/MuGb2ai0YYgNWfge9i9LXiyDRdMdi3tiqi8AxVJ5evBP4xkgJ
         VAMdfj99IUtTA==
Date:   Mon, 18 May 2020 15:10:32 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Borislav Petkov <bp@suse.de>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20200518151032.57d57052@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H7u=8lRjpqON5EppSwhwCen";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/H7u=8lRjpqON5EppSwhwCen
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/linux/compiler.h

between commit:

  a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")

from Linus' tree and commit:

  f670269a42bf ("x86: Fix early boot crash on gcc-10, next try")

from the tip tree.

I fixed it up (I just used Linus' tree version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/H7u=8lRjpqON5EppSwhwCen
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7CGMgACgkQAVBC80lX
0GzKywf/VUidhSnH61/iRzImozeV98/N0g6tdRRNMjHXAePrZsJkeJCu6XZ+RiFG
WQzlL3xpo60BbtU1EfVo1GC3pXy1ubie9M5ofSa+iZJOCIpQHZBehpY+XfucL7AH
KljNfBGYaJMoAHkGcabEahHxJSCgVRjlQvkdYI8oAQcHzUEV1sY0Mr+G3TZUYE5f
sN7bcrI7mJwiBF2UyJw3LmTSosZ+xUxUQPZjoQaTKVFEcEHQLuT6dPANlc37z3Uo
ph4fUp0t655i+Fvn4FR+RmSVz5n9dMdc0e6jyIKf4tGMrzKP9xQYzOI/BpjYZc1D
V9XBmga7po16CVWqhgluJmIup25dJQ==
=A0LR
-----END PGP SIGNATURE-----

--Sig_/H7u=8lRjpqON5EppSwhwCen--
