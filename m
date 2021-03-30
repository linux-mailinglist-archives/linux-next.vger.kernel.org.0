Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59B3234E229
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 09:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhC3H2K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 03:28:10 -0400
Received: from ozlabs.org ([203.11.71.1]:34379 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231359AbhC3H2D (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 30 Mar 2021 03:28:03 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F8gyl6CmWz9sRf;
        Tue, 30 Mar 2021 18:27:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617089281;
        bh=/G7ZzEGKsPGLDyrdy2yxhE32CVnbJacKmgPMeJP30Tw=;
        h=Date:From:To:Cc:Subject:From;
        b=pSlvvp7j5zp+40ltL17ceFMnFEKgdjgHI9H/EAN3nTPyoy7St2o0ecPF809w1Fo5r
         0nSbgJHoChC5eZ6tEhpsADnpcysDhsIkf7LY3zGNGDgBmIrqeCmR53cVv0q+x9Edg8
         UKD/PIYXON4UxPZtXVRFXN+50GfjJHLw+UEeOqov9Xp7A/mc/MWwWOBxm4Zva9/FYs
         T+vpa8pZgGg19ZPfNxsepyJ6X5AnoN3CGVHDmw6JerY5Jg8wW2GHx55uIt7SgGIixO
         cYK9x609R+oWY9RNdhqpqzRjHGT1DnSf14DJkQRGZKtdeA/7xw/mAliSFrBaynf5S8
         FenYLeGFE9Jsg==
Date:   Tue, 30 Mar 2021 18:27:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20210330182758.3a28068f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/26ocgYej/4A8Ri24jtMfEDv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/26ocgYej/4A8Ri24jtMfEDv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/hwmon/bpa-rs600.rst: WARNING: document isn't included in any =
toctree

Introduced by commit

  9a8210575cde ("hwmon: (pmbus) Add driver for BluTek BPA-RS600")

--=20
Cheers,
Stephen Rothwell

--Sig_/26ocgYej/4A8Ri24jtMfEDv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBi0v4ACgkQAVBC80lX
0Gwvwgf/Z4HRTwmP/BG0a5H8RHqPWprsTR3L09u8EuyRNTR/VJ8FsqVcwgGf2ex+
JfBWuqYx64ikqPoH63KkW5GfrJfmDGBthCh23LyhbHEXuPls2mIdAWdNUZfgO8lb
mNbvldSAWSKLHEPomjSfqiNB66B46aqVD1OvdEyGXrFOypll4giS9bwAXhxP2Klk
J/oE6GT26KmytHZ1ZJc32yrKnTkqNdLgJkcTRg3lqejgEyhwKp+ZQ19RL9lP53eR
In+Wuh0TmMxRqdSML1dZsU1cZ/prsFlE4GFnr63fzYGXJpNA8dtULYwz9jl4H4oq
blk2UHsvXsKbSFwILGoIpz7K0VldXw==
=Sc2r
-----END PGP SIGNATURE-----

--Sig_/26ocgYej/4A8Ri24jtMfEDv--
