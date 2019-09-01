Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 450ECA4C43
	for <lists+linux-next@lfdr.de>; Sun,  1 Sep 2019 23:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729013AbfIAVU4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 1 Sep 2019 17:20:56 -0400
Received: from ozlabs.org ([203.11.71.1]:55105 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728991AbfIAVU4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 1 Sep 2019 17:20:56 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46M5jf39d6z9s00;
        Mon,  2 Sep 2019 07:20:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567372854;
        bh=tDVmR3ZZmGQF26QzwjWZxZCF+deQ5zRzlkxN/2ElPfM=;
        h=Date:From:To:Cc:Subject:From;
        b=OLa5oxGJUCwtCCvbp5EwPNoBNnurhOg4bEfsS6azHPcwOSY7r0sSBKdcYkJ2jVypi
         +D/L5b+jghcbDM8fmcgEQkcs8avS66zzbHcEquWdb7Nbn6pmCLGtS3fBBl8BAexB3e
         tLSIMI51FMe8MsnpCcrJENkukrZN83lUKeqR9/Q0lJUYeX9AaPZntEqgAavTf3XjXW
         rGBP4vJ+29ZrUoL6m6IYUflZ5j2etjI8t1g/jAF3UmqFlJYZyFAms8oo30Hdr4kBBE
         Mjg9Tg4xocEquWJI5/+29PgC58sRPBawuObkpogmarNV45/xiOX4kgXh2GHMoJjdrN
         zEez6gW0CmU6g==
Date:   Mon, 2 Sep 2019 07:20:54 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the qcom tree
Message-ID: <20190902072054.28530f73@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zgmaf=5.KbAg=IDxBWRu.EX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zgmaf=5.KbAg=IDxBWRu.EX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  fcee7de608a2 ("arm64: defconfig: Enable CPU clock drivers for Qualcomm ms=
m8916")
  162eeae200e0 ("ARM: qcom_defconfig: Add DRM_MSM to defconfigs with ARCH_Q=
COM")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/zgmaf=5.KbAg=IDxBWRu.EX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1sNjYACgkQAVBC80lX
0Gw/RQf/d8mLn39Nelb8aRhLAJVWubrXYie1paz5gPTU8HyQtxhXRUnld2xlU1Dk
nZSJA8W3uxUgjZYgW18FpHqObs6/cy0EL5Ah4NLJ4/riBMopBgme8EdIBNmKw9bC
25WL+b8vJo6g0tks2m3wjPDbNDs36PcmjLuQCUXFuMrSNDpTZMpQTKX7QTtACAmF
JKRgjC5bfOLJ+txIVp/6RUPaWYOLTs5oFj6kdgUEOFStrKCGiV7gYArJOyqp5kH3
fK4PD48j/FO62+BaGoQM8gwKP7ylucXJmkIHjFvSo7ba9qIbRO73ReDHZb01vwSJ
GdoJ3MytFY/34qv2s1wfGkBLY3yGoQ==
=euW7
-----END PGP SIGNATURE-----

--Sig_/zgmaf=5.KbAg=IDxBWRu.EX--
