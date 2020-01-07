Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E410131DFC
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 04:31:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbgAGDbB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 22:31:01 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33051 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727514AbgAGDbB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jan 2020 22:31:01 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47sHw30p63z9sR1;
        Tue,  7 Jan 2020 14:30:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578367859;
        bh=6993BIh07vxyAedOONIsKsfnbaWEDrRa9leBR1Fs9M4=;
        h=Date:From:To:Cc:Subject:From;
        b=gb3odweQnXJOz2QMMmkjnZGK7ydArTSlTBPhPjJrocJ6w5FyGpLsPXewPEUS2JaZ/
         PazT7o5VJx3enroh9gKTzuVEuyqcqh+Jy13ozuZrrEFlnaunnbJX/Jm0F2EZH2KHbz
         jwgMP3vNh88oQDQknTfXo5v5FJljReG3KoDZsn/Yu1SxB1zF21k3pJ8wz7P0Csfvg+
         Nlky7wMH8OgOaPgLfe08xvGyLcMs/elO524np46IuR7IfrninVmk1IdImKblmbSEgl
         WWRAUlvA2NVzWXcMm0qZoIRnx/Pu1ziWy+Twy5awwpFzJPJGYmOtqRHxiXvGefilHX
         VsR3jCR7nvKiQ==
Date:   Tue, 7 Jan 2020 14:30:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: linux-next: build warnings after merge of the usb tree
Message-ID: <20200107143058.7f821056@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PcE5x2h7w/E2h5bHngXodX=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/PcE5x2h7w/E2h5bHngXodX=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (x86_64 allmodconfig)
produced these warnings:

WARNING: unmet direct dependencies detected for I2C_S3C2410
  Depends on [n]: I2C [=3Dy] && HAS_IOMEM [=3Dy] && HAVE_S3C2410_I2C [=3Dn]
  Selected by [m]:
  - PHY_EXYNOS5250_SATA [=3Dm] && (SOC_EXYNOS5250 || COMPILE_TEST [=3Dy]) &=
& HAS_IOMEM [=3Dy] && OF [=3Dy]

WARNING: unmet direct dependencies detected for I2C_S3C2410
  Depends on [n]: I2C [=3Dy] && HAS_IOMEM [=3Dy] && HAVE_S3C2410_I2C [=3Dn]
  Selected by [m]:
  - PHY_EXYNOS5250_SATA [=3Dm] && (SOC_EXYNOS5250 || COMPILE_TEST [=3Dy]) &=
& HAS_IOMEM [=3Dy] && OF [=3Dy]

WARNING: unmet direct dependencies detected for I2C_S3C2410
  Depends on [n]: I2C [=3Dy] && HAS_IOMEM [=3Dy] && HAVE_S3C2410_I2C [=3Dn]
  Selected by [m]:
  - PHY_EXYNOS5250_SATA [=3Dm] && (SOC_EXYNOS5250 || COMPILE_TEST [=3Dy]) &=
& HAS_IOMEM [=3Dy] && OF [=3Dy]

Introduced by commit

  203b7ee14d3a ("phy: Enable compile testing for some of drivers")

--=20
Cheers,
Stephen Rothwell

--Sig_/PcE5x2h7w/E2h5bHngXodX=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4T+3IACgkQAVBC80lX
0GwjbwgAkDAB/ZGIdZL2RmnirEFRJGqNlNLaqrty6enfwMRF/qjFAAEHHG8WRnen
hH6u0XyFir4k2C5IXL2/Oq4va6mbSOhqboo1Rd69RlbGhIPtucRaCr728Y6wsF/q
0UwoX/okxP9T/1E8Z516RvYtH8VV81ZlSTWavdrspGE4VHFN3MlZFjOlHm8torh1
6N+wNk4aDQ9jATw+BcqbPAV5wmHGau0LxHeAeaplcIzUJPdqx2mcpM31dWygNvD6
CL0KUapfMeOyVpScEoENZtNg4n+ZzM6OzQ7czzMjIU4Pql+5w+FRTFVSp0iKGRLU
ZMLACEnBP42VxRRIodSqa+aOftJ49w==
=vfp8
-----END PGP SIGNATURE-----

--Sig_/PcE5x2h7w/E2h5bHngXodX=--
