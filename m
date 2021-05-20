Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3513738B95D
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 00:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbhETWFl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 May 2021 18:05:41 -0400
Received: from ozlabs.org ([203.11.71.1]:54107 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230270AbhETWFl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 20 May 2021 18:05:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FmP0K4WBBz9sWT;
        Fri, 21 May 2021 08:04:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621548258;
        bh=tacn0wKrndtqdX/zPJAl23s908up6JxuUaxcbUv3+vg=;
        h=Date:From:To:Cc:Subject:From;
        b=L8W/TLJxuYFJR+u6oNr8ofba9d19hsik2bRofx2WTYoEXcy7MYblt44GlyUY5U79r
         H+BRoVCqsymkEDLS/Nvyo6Mx+M+akaUVyKSliEizkSVWPzU30tjkjMH+qXvBBD1Br0
         TWkQ5h6sl/1GSjfh6EdVtIovnMssOEcrt1z0AaYN4zT81dd5afL+G/ueujnWiVngEq
         WwlJxgQpDnuFHU6mBLo24bScfK2x0umeXVFEcpZe9JZPAcHy4dDmqiUzwz8PU1m31s
         MvzU+SedorGPK9RAc/p3mClsIqJzvVowL71NoSi394bdifBh9bnWPHTUwiDMYV5n9V
         RxG8BFramidxw==
Date:   Fri, 21 May 2021 08:04:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "J. Bruce Fields" <bfields@fieldses.org>
Cc:     Olga Kornievskaia <kolga@netapp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the nfsd tree
Message-ID: <20210521080416.45f06cb8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P_yzFh3+qjJpYhM5+/f5bOb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P_yzFh3+qjJpYhM5+/f5bOb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ff78b9442926 ("NFSD add vfs_fsync after async copy is done")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/P_yzFh3+qjJpYhM5+/f5bOb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCm3OAACgkQAVBC80lX
0Gyu5Af+Lx0cE8ah64xiTPpTB+ViZ8S4VBwCuXNtcWBf83b/Crl5faZNSrxGWV++
jn3W4k9Ie1pULhShMGvefmNK+Bo2vJ+r5iAexmI3rF5RlxOUPlewW+7Q0JeIdbD6
+pIB/7dctMK77MVAvtGxgh/6Cj2BH9yF0Zze6hAHc5lpwuXZS5SAorsK3uBOzZs3
XjVOT7CvqaEVY9sMaZ9U1LqIBTUIpmkKE/2eC5V3N/vELtENLSHv6S89wjpIHDMV
IK7ruK32/b5yE0Cg00ZD0grw9liQ9Rjv2YGXSvitZ4VW+TFrfz/TF0TxX8fCizmR
9Ha0XBhgqvH7Wa+F/eJasZWZeruRRA==
=nkZ6
-----END PGP SIGNATURE-----

--Sig_/P_yzFh3+qjJpYhM5+/f5bOb--
