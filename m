Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565151DB254
	for <lists+linux-next@lfdr.de>; Wed, 20 May 2020 13:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgETLwq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 May 2020 07:52:46 -0400
Received: from ozlabs.org ([203.11.71.1]:58213 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726224AbgETLwq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 May 2020 07:52:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Rrj80h6yz9sT6;
        Wed, 20 May 2020 21:52:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589975564;
        bh=dkYzEuVrClOCCcQdMSH5L/ddPgJpv4IKAVe7ASX/8eA=;
        h=Date:From:To:Cc:Subject:From;
        b=kdkVPyHg+eVM81Co/VNI+kDXuTpTdKNdSIZhmLeUl4Vx0Kn23knTilCd1KDkUt9EO
         i1lGDB46HZQVc7JevJN7FM3hxga90N4jh18D3JPPQM2YESceay/aNpEiy5I7nQeUG5
         4KTljRtb7OJJB+RSAJaI3zIS5YQVSQk8V70B2xeU6otqCwUhiqjYotMvsqJLmPOc5Y
         PjKR/kJBcK/nep7BlG4ng1yLpqzHchBC94MuiDSFnFV0EanskWeKSwkLCzaIbIfnKc
         RIrmyvUeJSx2xwoc8ZcT1/FasPAQnWe575aW45LhB1/fRifvtCXxH9UKt76YlSBMB5
         LmctYYo3DdOrg==
Date:   Wed, 20 May 2020 21:52:42 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb tree
Message-ID: <20200520215242.1e6b7caf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K=Yt0Ac_CCMak+_QH.42Qi=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/K=Yt0Ac_CCMak+_QH.42Qi=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  de99280b2640 ("media: atomisp: add a notice about possible leak resources=
")

Fixes tag

  Fixes: 88b03de5d705 ("media: atomisp: Add some ACPI detection info")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: ea073ef04fb3 ("media: atomisp: Add some ACPI detection info")

--=20
Cheers,
Stephen Rothwell

--Sig_/K=Yt0Ac_CCMak+_QH.42Qi=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7FGgoACgkQAVBC80lX
0GzC1gf/RGHdaoDpfWuEcTYhHFcSQYuZ0nhBV4ld17of7daK4gtJGdO0VQnKiL6l
GSXPwa08uku9z9s2uStr5B52OfUruEl20DoU5LjZLz/DoX3Etyr/m062MAvaeBPs
yLijH9Wn7Aa5D+OAtWrx7yzrFmbnXD4H+95BpMm2jlydiBMvR2ioI1AMZ3TiP9Uy
TMLdQE2GU3mHwaXjtOkUF8M/Xykhr+TIy+tBv7FL7ar777G9APdfF4cAhrfXq74y
uKRE4r4j4kr/XSfd+1jyvMW2AXplVaCsC3NK+CIriRmba0Jo+Bv3nUwVQYf5VxPZ
4XJ3cc6jmVK5/dpChf32/qW8czpQ8A==
=KobR
-----END PGP SIGNATURE-----

--Sig_/K=Yt0Ac_CCMak+_QH.42Qi=--
