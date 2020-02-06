Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B165154E66
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2020 22:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgBFVy0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Feb 2020 16:54:26 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:44365 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726765AbgBFVy0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 6 Feb 2020 16:54:26 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48DBzM4lLTz9sRR;
        Fri,  7 Feb 2020 08:54:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581026064;
        bh=mYPH9Gb///76EYDph8C/CQOz+b+iGKWGaTFGPWS/7xE=;
        h=Date:From:To:Cc:Subject:From;
        b=Uqjk/2hSTJuEGe126WD6P/BvPEm6kCMYLq/r7k93qS4IdRsqmTdsQAE4WDNBjvBBE
         mVmfSPWdVsgfBqN4pwGoGhmkQIbN8ve8XCSI5yxWdPM69ZwnKjrlmYKKfKL1AtH3uq
         yCOvens0+ssJYLV3n/zeSlmIRVwWc/frO4zHI4NJEZgxNITFj6dN3C+tq8tZZn3K1K
         kBhiIM2zkIfrUt63jPzWm7t/LqcI+mX0qAjCGL2Z0yLvFOz7fCmKzzkHVQHk2Zto0i
         Epv/QC06oAZ5VOXCgtV7Sgh3wAwl1RZ5tURsWKySKgGOZZFeE01z/U/RuxpHiemtAO
         K8a/1jqCFN/Gw==
Date:   Fri, 7 Feb 2020 08:54:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: linux-next: manual merge of the fuse tree with Linus' tree
Message-ID: <20200207085416.3f35cd31@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Gof7_0U0_/LST=cfJTV12UL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Gof7_0U0_/LST=cfJTV12UL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fuse tree got a conflict in:

  Documentation/filesystems/index.rst

between commit:

  77ce1a47ebca ("docs: filesystems: add overlayfs to index.rst")

from Linus' tree and commit:

  8ab13bca428b ("Documentation: filesystems: convert fuse to RST")

from the fuse tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Gof7_0U0_/LST=cfJTV12UL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl48iwgACgkQAVBC80lX
0GyFpggAglhBWXFhhwTbkMaD+VvnVQWaBvQgeX7KMLwfROH1wKI+UtghSMSyoS02
5fTQwg1sp4skRRr4FdNbnMzZrrElToeyiXh6Eo0s8U3ZWd5VMBNdxTpUZuBtODzZ
yxsGIpNYTac7QRSodBz9OULuKrCewnS8yYOAORVj2DOvJICswcTMxkh/EPYWoBUD
7SzyldrQicisbrMECI0pRc3kjXwrx/otuLcsbIGQfYs6kO0q1Zj7YdG7gq8gq6J5
lxydi0gkdC2duZL6klFIDrOkJi9/xt+IKydqhhocCTAvlG8b1i8p/FVl4RhUio/A
XMc7MA3JJHNiFUWaH1oN8pdPqwaxPQ==
=bKAe
-----END PGP SIGNATURE-----

--Sig_/Gof7_0U0_/LST=cfJTV12UL--
