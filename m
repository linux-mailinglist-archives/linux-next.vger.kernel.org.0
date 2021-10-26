Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21AA43AD95
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 09:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232736AbhJZH43 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 03:56:29 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60885 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232728AbhJZH42 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 03:56:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hdkbv24mhz4xZ1;
        Tue, 26 Oct 2021 18:54:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635234843;
        bh=DfEcpTKMzGA6+9Xt31G0w+rWEEDRTl4jgialkuca2nI=;
        h=Date:From:To:Cc:Subject:From;
        b=OBCht/2CzjmPSK9YFU+jSojkCtqQrviSjofSgbr5f6WxkkeB7/qBVgDoTATUuBeB9
         7HTHe+roc4K7lA3DTysvTN2b4f7RyDlmtYCURncARlv4HqMmr8AcZBiVoqdJm03+Qc
         4/xRiuG0JE5UZFnT33jHLJr2OdLtt++ikUUiLcl5WCpNmE26YP/+6i4tIwb75FWwuW
         Lj4TsWRWaSZgYvRoYkCLR8h3uUg5cXycBca3eQfKbCiSdI+SUBdOttVx/YEBqpkE2g
         b1QwnubQlEcp9qPW3xDqUrBV40UW3Gh0lBeHE/N9ns57Im/KeyylazXcRXLrBlFrcW
         6B4DvbiDdJHmw==
Date:   Tue, 26 Oct 2021 18:54:02 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20211026185402.083db715@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hdm=nH35fYdGGAn7aoOYNBz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hdm=nH35fYdGGAn7aoOYNBz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

WARNING: unmet direct dependencies detected for SND_SOC_AMD_MACH_COMMON
  Depends on [n]: SOUND [=3Dy] && !UML && SND [=3Dy] && SND_SOC [=3Dy] && X=
86 && PCI [=3Dy] && I2C [=3Dy]
  Selected by [y]:
  - SND_SOC_AMD_LEGACY_MACH [=3Dy] && SOUND [=3Dy] && !UML && SND [=3Dy] &&=
 SND_SOC [=3Dy]
  - SND_SOC_AMD_SOF_MACH [=3Dy] && SOUND [=3Dy] && !UML && SND [=3Dy] && SN=
D_SOC [=3Dy]

Presuambly introduced by commit

  9d8a7be88b33 ("ASoC: amd: acp: Add legacy sound card support for Chrome a=
udio")

--=20
Cheers,
Stephen Rothwell

--Sig_/hdm=nH35fYdGGAn7aoOYNBz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF3tBoACgkQAVBC80lX
0GzFXQf9FqzHMXaemS2yiVH+OHkKLDJG3UIlEeMKKbfidqs46zOOU00B2eMdtMCU
QP21NLIaVqf8tPdQ/+TLZncEUd8UyZ2/SG+a2UZpjbeMzqQFiIGS9MmqyuX55Mis
sQUsKR4/n3Wnsjj7rWAu1q22Qt5l38rh5VWL+wDgiUaWKXDmEKEs8DFG+N0c96Ly
HiqK3FXnrBy/qvAddZJkOV0ITzMfICOjLTG7LbvuWVugAw+r4L/EforpRSrh8FJb
Y6rtRtj0Ud7ohXChVn/1UPoIcUfNfHwMejiNfAsJ/d3g6RbUZUDTjwHyZlNbleOm
IMM+8XHS6RkriV/wghejrLkW5YEDqg==
=5aDA
-----END PGP SIGNATURE-----

--Sig_/hdm=nH35fYdGGAn7aoOYNBz--
