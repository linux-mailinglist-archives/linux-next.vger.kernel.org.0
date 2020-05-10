Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903171CCEB5
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 01:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729255AbgEJXel (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 10 May 2020 19:34:41 -0400
Received: from ozlabs.org ([203.11.71.1]:45197 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729241AbgEJXel (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 May 2020 19:34:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49L0lg24Cdz9sNH;
        Mon, 11 May 2020 09:34:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589153679;
        bh=8T9qkH/YbS04zULylG0K8WV1jsYPzlgx4kHpJtOlj2k=;
        h=Date:From:To:Cc:Subject:From;
        b=fhv9huWdyvI1es2PDKBqbYSKtKsfpg+R4y+7hHuSRTakxz0bbP2sX4y39r2kZYyKN
         WfIqlrWsBzjiGS1f/pvYYgZRk0knV/ihl8rbGnbd8Cxm4Tst8Z3DOahUE5DSOPdapn
         Iu5BswlRWwQECz+bEOA3Ooqorj1O0L/s8MrMvfHZGN8wFge45GR0kDfhPXbsPfk2PZ
         2RQRu0RFPs/JvwZOJxWC5jZ0ctjMGg7buvoAR3ZcF+HxdsfF0GTOF3NfrcIC3V7E+O
         DS+/VQFMtCs3CQrlf3yi44gc6pkzB0QjI97gO6FIvaS7EP7J3LZr2vUzrGAu5wKZMU
         92T3sNKGGFN6g==
Date:   Mon, 11 May 2020 09:34:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Helge Deller <deller@gmx.de>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the parisc-hd tree with the kbuild tree
Message-ID: <20200511093437.5d0acdcb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yHGaHa9h5SZf5xhtTq6ujfv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yHGaHa9h5SZf5xhtTq6ujfv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the parisc-hd tree got a conflict in:

  arch/parisc/Makefile

between commit:

  a4e7db3c42bc ("parisc: suppress error messages for 'make clean'")

from the kbuild tree and commit:

  0d341e0ddb1a ("parisc: suppress error messages for 'make clean'")

from the parisc-hd tree.

I fixed it up (I used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/yHGaHa9h5SZf5xhtTq6ujfv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl64j40ACgkQAVBC80lX
0GxHKAf7BbavN26YSjG6EqlFtBImHn8OFgbEnAjqDQRPyDid++4A+hAFIp1ef7UZ
Kftfwrb9Wko5+HGmfF8EaJ8BVJ4K+60xzCsUcLxtRyxzhN/YL9fkjCZtvJLVBZqC
+r3JIeS02w+QRw5jrnzKNnSdvO00X094g/aIrlkNeAjyJz3aFMOEi9/L6V6O33RR
jUDFNnanigxrMQba1TZ5SiIdJ1L/3S5tjOKvK9Gv87qNGSb/CknHsNmg6150VVtW
Rkjprd3DK6zSqhzsARFMavZYF6Ip+kdvvdUxy7mxFnEHhgisWJtlk30+Eo/MrAop
zF/wnIbdgcmrttSi/3JatkYiAaBL1w==
=xpeu
-----END PGP SIGNATURE-----

--Sig_/yHGaHa9h5SZf5xhtTq6ujfv--
