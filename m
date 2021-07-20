Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9D03CF547
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 09:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbhGTGpP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 02:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231645AbhGTGpE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2021 02:45:04 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9EEC061574;
        Tue, 20 Jul 2021 00:25:42 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GTVcL6lLTz9sSs;
        Tue, 20 Jul 2021 17:25:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626765939;
        bh=t+27JaNOd1oJLgG4CpeSNUAdL729H9bkIaCkGNjSr+0=;
        h=Date:From:To:Cc:Subject:From;
        b=U00+YCio+Y/79KQlMNUbm3qjR9N04Y03MvhG8vtXBW/q8UpEGNAzO9fhDU4hDsdra
         2yC1/vrv/weeXcNJSEEoV/tRvL2OAFurzxGMkAsyzK1Mnrl7mRoeTGajS+q4+etUSD
         hHFyB3GfDiLU3QXUcdfok6U3e0pq5ubpk+mF1XaN464AAlPHEaePPc1nad1eIyfjXc
         /EIdJKcuH/M8VuujNGLrKj4mvdzjiOkWsJnurEm9QINp1/gKvVWrI8Amvd9jg5Taml
         ADPgCWW0vcq4qlh91qs1LLjG6mka9dW+DjNrJnhI3HaEh+dmMStPs7UrgTEH1kNsRF
         Pvig7V+Y6LXkA==
Date:   Tue, 20 Jul 2021 17:25:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the qcom tree
Message-ID: <20210720172537.1831573c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H13Uu83jVE2mngmEZK92yoC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/H13Uu83jVE2mngmEZK92yoC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d550173b0071 ("arm64: dts: qcom: sm8250: fix usb2 qmp phy node")

Fixes tag

  Fixes: be0624b99042 ("arm64: dts: qcom: sm8250: Add USB and PHY device no=
des")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 46a6f297d7dd ("arm64: dts: qcom: sm8250: Add USB and PHY device node=
s")

--=20
Cheers,
Stephen Rothwell

--Sig_/H13Uu83jVE2mngmEZK92yoC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD2enEACgkQAVBC80lX
0GzF3wgAh6L4uQc/Wk3uf160g4/HTch3gcqsY0atWKNW3S4ivkQLGtLlbVCEJ5La
UyITNQGW73R+Ig45Q3mGmY9WUyzIezws/MeZ3rcw41A0+HOuSCdya7uRgtiD0i8g
JIMnRQhmmFTCOPNmctzsz0cjwuN04UwyVoLZUZzj/NC/Ixn9X6lhE2KlbJ5DHEIj
XBPvb1uMNmP/IViriZDT44fDDqWUmKW085N7ZXZ15fEJmG9pEKEIJd32ZR7BixsQ
Z2zX2sC7jQS3j3VgoeCghgcaBFtw7G63r/4IEN9kWdjyyt8dMZhI3tOhEfDd7JSB
TrhF2xbQUDz1ldeu1rXIfxOvgZxSGA==
=tuDq
-----END PGP SIGNATURE-----

--Sig_/H13Uu83jVE2mngmEZK92yoC--
