Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5820F314E97
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 13:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbhBIMDD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 07:03:03 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33975 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229611AbhBIMBA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Feb 2021 07:01:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DZhKV4W3xz9sW2;
        Tue,  9 Feb 2021 23:00:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612872015;
        bh=23qX09X79yp5J6UvlLalEpFKqO8aBwetHQLw2foXEeg=;
        h=Date:From:To:Cc:Subject:From;
        b=jHM5VcZitwYtxpDjOKtVwVd9LVZMEXM73OL0VHPHtT0Gf6MIuMG2jQLn3pqu3qMVX
         hn0G4pmHDltnf/C6jaK934Wt2DkNIHPYuPKDT0e42bzx+b/jO+Z15MGoNKnqyno47M
         otT9qb7Lt7Muv98Lppt6XElteREt7wAiJ5eVZdtItBaWp8cRMvuDD3/bWE7V6uSXUY
         KEfICuUYAAWYadEKQXuNylZT9jgK6/2rAfV1BxdoFXTNQy5qbIwcPvnJSCxLAf34vt
         5eyMorDRT10WBHbMx8TXJHTIY5+7BQU3BaHuKyARQX9gRSMexMwC1BLoLe/O0+aUDn
         SVSbwbQHGdMRQ==
Date:   Tue, 9 Feb 2021 23:00:12 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the clk tree
Message-ID: <20210209230012.7887a91b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ru2Rglr0IGoqrtyhVn.6jBz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ru2Rglr0IGoqrtyhVn.6jBz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  af5782442538 ("clk: meson: axg: Remove MIPI enable clock gate")
  001cad0d3a15 ("clk: meson-axg: remove CLKID_MIPI_ENABLE")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/ru2Rglr0IGoqrtyhVn.6jBz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAieUwACgkQAVBC80lX
0Gxznwf/SbIyKaPla4zy+F7l9QphYIhiU02U6VVLyqh8rnZitLV/fFOt60l7iodO
20tfqa+wWS3c7z/Q/GDYuhvUPi5mhPqSTF6mLQpHks5QWqRhpeQsFyIQ02uqM0qN
qc2hi9104f/5Q23bSvOl7BpfX/7boz9SPyxwHtDJOQJCzfAqo9uWZcd8RBbJWmmt
cJmaHkCHvgilXFMi+hPCqWV6UBci5yGbYnbAsxwOAuDaI/QvVaRDMDjrmoIN1GpE
UBsAL8s7iwCDeHQ1C1DEm9bOvQ7RUynZeHe83ZODRZahSVWCwbCtP3TxkfdthoTg
c++D5iNvuIANhDAfCso9xvWTwKkqlg==
=EUhu
-----END PGP SIGNATURE-----

--Sig_/ru2Rglr0IGoqrtyhVn.6jBz--
