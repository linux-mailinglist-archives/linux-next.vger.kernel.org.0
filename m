Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA369277BAE
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 00:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgIXWjB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 18:39:01 -0400
Received: from ozlabs.org ([203.11.71.1]:40537 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgIXWjB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Sep 2020 18:39:01 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4By92B5QkQz9sSn;
        Fri, 25 Sep 2020 08:38:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600987138;
        bh=kadkOUpwKGrePI52vKQEzQiWl968rSeT5Epb0WiDNso=;
        h=Date:From:To:Cc:Subject:From;
        b=khPIWLPW4hMpaotHWRkXRC4f2ZIr2U+fYIXDMf+UBFHz14dZIZUr09/AKCALo7O2O
         Wi1UtceXzHMoiOoqNhAyV8cKPyCcuF/2DtRTPnmO42krPzeTU/Kh+QlGDliDXlaNqr
         1sgDi6ZyqD+nyi9WnXJaME82cI2AxsL7PNBvFw7Hoi07CC0YmQ54xKXPSVqS829vdd
         PcxLOZqs6kKgc6rqcXnA3ISGaH9jFtBF1muwDJiPqfnyL+h6WeWLpkq9p85zU7o/Cf
         7VebaXHvD595jUooWN78d1JSNYITbdbOC/rXSiNhhIHL3n/AaH+9+rnPm+wQfi/G5+
         G/6XPtJpMc7bA==
Date:   Fri, 25 Sep 2020 08:38:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Xiao Ni <xni@redhat.com>, Song Liu <songliubraving@fb.com>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20200925083856.5faf2e20@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7bKwZ81ftCE09MDkWTdOOQb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7bKwZ81ftCE09MDkWTdOOQb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  10988d55ae96 ("md/raid10: Change the return type of raid10_handle_discard=
 to int")

Fixes tag

  fixes: 8f694215ae4c (md/raid10: improve raid10 discard request)

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 828d14fd7a6c ("md/raid10: improve raid10 discard request")

--=20
Cheers,
Stephen Rothwell

--Sig_/7bKwZ81ftCE09MDkWTdOOQb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9tIAAACgkQAVBC80lX
0GxMDwgAj0jdyjo0gCGpoW+kFQ4JFi5HP3dzsaMRsvglaRNCKk3WN0yTIEF1ZnHG
InQQ0rl+AoKl0mJjdyuSHjCLyzZawCmxz2e5Y3fgbutKFjYBv7yU+UtYpkJS0pDZ
8LHhdXLhCQ5qE7IXcUlSbxuibzT9TVbTe/UUA9m9wS7jvG6jW6zzqJ0w5KHhMcRn
yc7zFseVx3munHxaI44SFG1Hkd1d4y1NMY9kiAGHuWHeBb1AiAVkSSVj9A2UFb5M
8I2Gpw9LmTId4WW2Bu2b7/7FM/7MlAR5KieKMxRPQXhelOWT8h68TiXobhsy02Fx
nlxcSr6iwE4CuTgOgOQBxbrqPPbl5Q==
=LXE8
-----END PGP SIGNATURE-----

--Sig_/7bKwZ81ftCE09MDkWTdOOQb--
