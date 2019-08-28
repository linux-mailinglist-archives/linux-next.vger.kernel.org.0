Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B16AA0CFE
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2019 23:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbfH1Vzl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 17:55:41 -0400
Received: from ozlabs.org ([203.11.71.1]:34413 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727103AbfH1Vzk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Aug 2019 17:55:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46JfgY6xPMz9sN4;
        Thu, 29 Aug 2019 07:55:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567029338;
        bh=trV+YGvYxNvB9BN+5qQZbtfhppivJU4cFdm0cDK2+rI=;
        h=Date:From:To:Cc:Subject:From;
        b=jndXLe5FjeSEkRjdoULkyHRs40O6jzy/1gv+zySqhMHPo56/IUUWPduUfgmD267jV
         dg23MSc5wU35nhNVI3NOVWeBu7Aw6lDa/FGx53rolllkjK79GWvEfdm6mBE/30ebCu
         si2tOf5BIfM/aZO4wflvM/PoSyGPsxwUPjiDxxuqKZpr5NZCUTU79/8PYcGGSHbZiQ
         H9+0iF9SZpmOsja+bCpUvMMcxilqyJnKm7F5BQhU5sFdEd5LfXwEIjtHOx/XDPSsWS
         IoUJRgd7rvWhyZYjNWmA1oQ6tGEFshmgwWvwVJOm5+mfPrdKF542aD6tPV/19ED4ep
         23BWBWx3zsz9Q==
Date:   Thu, 29 Aug 2019 07:55:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Subject: linux-next: Fixes tags need some work in the mmc-fixes tree
Message-ID: <20190829075530.6fb7341c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LLJXSgfWPEA/X.PWOIp2sfa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LLJXSgfWPEA/X.PWOIp2sfa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f93be8a7a366 ("mmc: sdhci-sprd: clear the UHS-I modes read from registers=
")

Fixes tag

  Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  218258427ce0 ("mms: sdhci-sprd: add SDHCI_QUIRK_BROKEN_CARD_DETECTION")

Fixes tag

  Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  1236e62ef8de ("mmc: sdhci-sprd: add SDHCI_QUIRK2_PRESET_VALUE_BROKEN")

Fixes tag

  Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  8180519b1be0 ("mmc: sdhci-sprd: add get_ro hook function")

Fixes tag

  Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  b4e4296cc206 ("mmc: sdhci-sprd: fixed incorrect clock divider")

Fixes tag

  Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more tha one line - even if the line
is more than 80 characters.

--=20
Cheers,
Stephen Rothwell

--Sig_/LLJXSgfWPEA/X.PWOIp2sfa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1m+FIACgkQAVBC80lX
0GyFQwgAgLkGu03CvO/syIVoC1fL7M2HVBIxP6yEF4I4GpW42kfTQ1NLT1weKlt7
TPLWU2y/smCNKxzs5Z+phI4qO1z4eB1oN5zKSRLjzxwGYwIqHpgcphuPev5/XNoy
0WZL7O6oMUxRjPGPcTnCF8Kl5Fr2R1IfIVmS0CY8cu6S3buITRNC3+jYNMWPiMQW
sJGBneMrEQqQ43sK3cOWsIoNoEWxuCMidX00yZM/lthpWjpI90FExQDjPNOQ1jcK
k+fzfA9qKTSo8N4AtVVDyVsfX0YSstfbQsSZH+kXEf54GfPQmobsY02+aN96i5OM
D0vEQsO46VUVCT+y94ImOgjWQO0p1w==
=JjJ1
-----END PGP SIGNATURE-----

--Sig_/LLJXSgfWPEA/X.PWOIp2sfa--
