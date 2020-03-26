Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1B6194B81
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 23:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgCZW1w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Mar 2020 18:27:52 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43717 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726260AbgCZW1v (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Mar 2020 18:27:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48pKPK1KNjz9sR4;
        Fri, 27 Mar 2020 09:27:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1585261669;
        bh=TTUfgK8iyycLNqBt/AiEmDKjm1TJOM+wT3Gze1ZAfoI=;
        h=Date:From:To:Cc:Subject:From;
        b=OBFeeCUk/cwaKUMd5zgGF1BMof6bjIeMzIguMLlyDQUAgtrQYbv7wQgcB2tW6AzkO
         Bc2qT6DLLdb5LleF8cZSIUnNxwaDEHdN5Nn2vbxKNjZBe9Tffd87OYb+SPPoGmu0mr
         AWBNfhD8GMhnQVQLUMWwsgWkrCOBF50UuhiR23So90sSt+kxM1GZ1soIFpj5IxKHog
         Ba3iKBpNxbhF84yVjQUyeXrt6SwLZB+yTFFtewWpAGuyk6uD7i+9Zek1bgQ8YgqnXQ
         PV1KQ1alBU53uPOABEEmzdztbRq+f6k3PMkf/IuBXP0JMLzDGVK45jl3u6gaOFfUT2
         u5BHSSZWbUx8g==
Date:   Fri, 27 Mar 2020 09:27:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, Corentin Labbe <clabbe@baylibre.com>
Subject: linux-next: manual merge of the tegra tree with the arm-soc tree
Message-ID: <20200327092741.1dbd3242@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Tjrk3Z.A=gzsIRzl_glEECC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Tjrk3Z.A=gzsIRzl_glEECC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tegra tree got conflicts in:

  drivers/phy/tegra/Kconfig
  drivers/phy/tegra/xusb.c

between commits:

  5a00c7c7604f ("phy: tegra: xusb: Add usb-role-switch support")
  23babe30fb45 ("phy: tegra: xusb: Add usb-phy support")
  d74ce0954cb2 ("phy: tegra: xusb: Add support to get companion USB 3 port")
  58e7bd08b569 ("phy: tegra: xusb: Add Tegra194 support")

from the arm-soc tree and commit:

  f67213cee2b3 ("phy: tegra: xusb: Add usb-role-switch support")
  e8f7d2f409a1 ("phy: tegra: xusb: Add usb-phy support")
  5a40fc4b934c ("phy: tegra: xusb: Add support to get companion USB 3 port")
  1ef535c6ba8e ("phy: tegra: xusb: Add Tegra194 support")

from the tegra tree.

These are slightly different patches (the latter has been rebased).
Also there are further commits affecting these files in the tegra tree.

I fixed it up (I just used the version from the tegra tree) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Tjrk3Z.A=gzsIRzl_glEECC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl59LF0ACgkQAVBC80lX
0GwyAQf+I5kTj3T8nDJGpq9RC07WHcKa32mVQgkMo2yk0xHSeyeD/pVxCFFUTAGM
Dbn3bOwyMiRP7eXlvvlMue8eIwqBa8iZefahef2i0CbV7nhKR8HLuvVJwspIilMP
IwA9rlKRT+ESRlP6c76oHbV43qSY6Bg1RtOLPw8CgqzcVFriItgDSbApN+VWvQSY
Fl8xpuqBhWajxLTjZULhQo/PpngggfPpTI2Z/PE2qBlh9HBQLAFYU/U2qcEaTah/
86h1R29S1m7VEuHlmzKmwyhB/Z8tt4zXRwhoN5ZdvLB9vXfrqT3HA015xZrPK12Y
/3jEJRBE5TZ4vM7QZ78S6h51LSEQsA==
=oWYQ
-----END PGP SIGNATURE-----

--Sig_/Tjrk3Z.A=gzsIRzl_glEECC--
