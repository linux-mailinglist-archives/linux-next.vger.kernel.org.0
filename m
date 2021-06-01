Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6207396DDC
	for <lists+linux-next@lfdr.de>; Tue,  1 Jun 2021 09:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbhFAHWK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Jun 2021 03:22:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44443 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231139AbhFAHWJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Jun 2021 03:22:09 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FvNpz0kSDz9sXV;
        Tue,  1 Jun 2021 17:20:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1622532027;
        bh=vSPFwYTSyy8uGwvWPLsAncKjeMHLbE36dH7SBYq5r08=;
        h=Date:From:To:Cc:Subject:From;
        b=g+ypeyWw8z785wwoKlyHdU9jMb8Xv3JroTWBEgMuN5cOTBA2bBg+5zfVdqcdxto7T
         LFYinNWEyrAshJzCd8NRk2t4Y6534CBMBDjd6A1dfN5iv4ggQsJ17hUxhXwPbUQwAH
         zbZ+hLjicRfi0JYQILd7yBRe1hIMpp0ufuNt9d72GFXcBLFTcT5XYS/zdkKt5fuesU
         mgsJe+c2bj3Lle327sJM9wPVqymFEyKvJEyvaqFN6vNZG2iVtocmBE4zb8fmiDHo0c
         Kd41qV3YnkMDNfE5dtBuyg9kLLobHQThRG0G0VhRUETDm8OkqcbDSlZI87XNDfPeTJ
         BARd95Co/DP8Q==
Date:   Tue, 1 Jun 2021 17:20:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        "William A. Kennington III" <wak@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning from Linus' tree
Message-ID: <20210601172026.6bc0a96f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TBHOz9iDGQy7R2cqo9taHUD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TBHOz9iDGQy7R2cqo9taHUD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

When building Linus' tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/spi/spi.h:671: warning: Function parameter or member 'devm_al=
located' not described in 'spi_controller'

Introduced by commit

  794aaf01444d ("spi: Fix use-after-free with devm_spi_alloc_*")

This has been around for a while (at least v5.13-rc1 and next-20210409).
Sorry I did not report it earlier.

--=20
Cheers,
Stephen Rothwell

--Sig_/TBHOz9iDGQy7R2cqo9taHUD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmC137oACgkQAVBC80lX
0Gzx/Af+Pzdr9f2TExl4wBrL6Hs8C/f9vfSS4Fa3mjwGausdhKPXmwg6D5V/gjw6
eXAM9yPrJP4vjSo5hV+gVTaUKYncypI8/Ge4rHUYD7C1upeeFA0Qn6Uf5J2SKx9v
VXrhO7zIBrhcc111g3RQWzFDEpvtrYw1NFC3tNKLrPIeHFdHQBJhvtFmUOjtWywr
PR3vJ47t/mOTs7phTL5rKN81F8Q/UX04PkxryQPgb2ykIwNvUa1dlRYtmSXQZ7kN
6XyOBwOcj8h4ugzW1iQQkAAk0Hp976svYheFAG46Eq3YqJ7EPv7sGaZiNubeZpkX
La0aaS3aP2JZuLDhALy+qIDCI02rrg==
=ubjd
-----END PGP SIGNATURE-----

--Sig_/TBHOz9iDGQy7R2cqo9taHUD--
