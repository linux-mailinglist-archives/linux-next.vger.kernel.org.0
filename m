Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD41345772
	for <lists+linux-next@lfdr.de>; Tue, 23 Mar 2021 06:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhCWFo3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Mar 2021 01:44:29 -0400
Received: from ozlabs.org ([203.11.71.1]:56463 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229761AbhCWFoA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Mar 2021 01:44:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F4Kzy1njmz9sRR;
        Tue, 23 Mar 2021 16:43:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616478238;
        bh=4XSqXJHq676yg7vz+Mv3J0OrOTjiRBEhu3rc8JNtR2Y=;
        h=Date:From:To:Cc:Subject:From;
        b=eQvZvWRU83Bb2bf8sgGs4SXY5HHve0UgWj0u5wVY5lJiVF91zOB1HVlP1YrTx7dVX
         M0k7mMm0IVTPiPrECfjjIes3QH8oW9LEjYV5nNXBtBxC0pKEW694JSVLgFIGcO7ynb
         E581PiAkzGdaiPQBprw70BlpZFVk7I7A+sEl9vJpgKqZ8t+r1oP2pDOshrnIe2UGvW
         h+ZkZCfAdhJjy6CPOq+7UxHSo0TWm1CwjaHOa1O4EbecBOiE+1pbjipD6cCw+Xo/6j
         /mqaVeMaqhnNd6IB3GuVhogHWRHDukvy2De/Wznl6WHYZz6qj2uGPX66V5sR926h0+
         QwVOeNWG0tBqw==
Date:   Tue, 23 Mar 2021 16:43:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20210323164356.2cbcfef4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mcM0RLUF/e667ZLvDTPqlKD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mcM0RLUF/e667ZLvDTPqlKD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

sound/soc/amd/acp-da7219-max98357a.c:684:28: warning: 'cz_rt5682_card' defi=
ned but not used [-Wunused-variable]
  684 | static struct snd_soc_card cz_rt5682_card =3D {
      |                            ^~~~~~~~~~~~~~
sound/soc/amd/acp-da7219-max98357a.c:671:28: warning: 'cz_card' defined but=
 not used [-Wunused-variable]
  671 | static struct snd_soc_card cz_card =3D {
      |                            ^~~~~~~

Introduced by commit

  7e71b48f9e27 ("ASoC: amd: Add support for RT5682 codec in machine driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/mcM0RLUF/e667ZLvDTPqlKD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBZgBwACgkQAVBC80lX
0Gz/QAgAjtXR0UV/+opQex46UaY5tJbeIiJyfP9/4Fi7QsPV/ZSyWUU0beIhRWa/
pvAe+UL59tnCYkotHAfLxFdlOUjqUCN+xSeE0UkvZhM36+OMhNekZ7Bh43jRqzrN
QM6DSfqbQU9S9WaqJ02gRW0HrgoTvejKwKz+P9JCI/tH9yEoDPLgl0loryrW+Nzt
8tnGsVqWfV7lo6KNYbFDirU5mYtcuiSn6co8V5WyKSp+S9S2zd6ZQWHtxbWf6LZ8
LrsmJRgImUa7x+mjdXGFTkRf6O296mlBm2gnqz1MkRsT/TtoAVCrFMZy6Ma9wvDY
rHwrFWqkw+o5LhRYmqrjd3Ygd734Wg==
=FVr6
-----END PGP SIGNATURE-----

--Sig_/mcM0RLUF/e667ZLvDTPqlKD--
