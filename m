Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 294E345D463
	for <lists+linux-next@lfdr.de>; Thu, 25 Nov 2021 06:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235317AbhKYFoP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Nov 2021 00:44:15 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:42373 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232169AbhKYFmP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Nov 2021 00:42:15 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4J06BH1y25z4xbs;
        Thu, 25 Nov 2021 16:39:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637818743;
        bh=mGmqV9fNZ9W5jFeC/Rezztr6KtZ/RfhqyWXyOdRutJg=;
        h=Date:From:To:Cc:Subject:From;
        b=uXVHX/vFalAVdvUBPXabQup/t2D1uLQinUEUqGofefBlfNS9+2NvoIBBFEq2OPzhg
         /KHArA+ENmuxaHLUqgL9NhBnLAMRpTJfI+ODpRqz3jJlnXuAl3VM1qhhZeOtY1JG5y
         aGKTS1D7LuQkKgUDnG4mgC2IjgFFIWd/xjjyaq2L6P3ydvgQBDX3ujOjET0gKZoQVc
         aOFMJLZhFudSxTejQLUkTWfjm00z+pRA5iHae99EhNqCOxLjliEoVibG5iDbiMuNBX
         J/AZJOLPUL584U+sW8mv1O8/HHj2SP3EyZbY4iuEkNfBWasBR0G4cNt18/6czhw5Nt
         N76kcmo+DK62A==
Date:   Thu, 25 Nov 2021 16:39:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ksmbd tree
Message-ID: <20211125163902.46d47238@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a9uJV6hizNB1TA4J.cd.XBW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a9uJV6hizNB1TA4J.cd.XBW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  a48fe999b8a6 ("ksmbd: fix memleak in get_file_stream_info()")
  43e65dbd9ace ("ksmbd: contain default data stream even if xattr is empty")
  b8d4e5a1a063 ("ksmbd: downgrade addition info error msg to debug in smb2_=
get_info_sec()")
  b7783e56d8dd ("docs: filesystem: cifs: ksmbd: Fix small layout issues")
  240a60f0d025 ("ksmbd: Fix an error handling path in 'smb2_sess_setup()'")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/a9uJV6hizNB1TA4J.cd.XBW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGfIXYACgkQAVBC80lX
0GzMzgf+PC2AUVxbZFbpKJjhRwJe2cjZsduyM+coWzSNoA82iHQnEyWFxgcTRUcW
bDolHvgaD4l0o8YdDp02LwxHumxG+B4Kzbuyz91nugcHjsTIL3B2VawYkeDh8jxq
sVdG/uE/mqICh9ydf89fcfP02lnywKQDIB1hJ57cQU/1zTej3b5gcmN8jdUW/jRK
LPpX8EoyYQz1qBF1wboV4ePpjssF5Nv/nfP+fwVgIqaWLSVbXDYuEw7t77NsEpma
5yV1T7DZRrGVx9ke7rKbGu4Y+iPpCNVHxIuoJsneYND3RppEac8un+xbAMDpi1Qy
i0X9HKpia8lIvk2u/84DpogBJz+6jw==
=FhQd
-----END PGP SIGNATURE-----

--Sig_/a9uJV6hizNB1TA4J.cd.XBW--
