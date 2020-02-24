Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A53C516B405
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2020 23:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727400AbgBXWaM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Feb 2020 17:30:12 -0500
Received: from ozlabs.org ([203.11.71.1]:54985 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727219AbgBXWaM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Feb 2020 17:30:12 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48RGwK3FrSz9sP7;
        Tue, 25 Feb 2020 09:30:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1582583409;
        bh=YqjsKcT7QahB9d6Z7sHWYSG3nQR6rx+V6NbzlQpVkWQ=;
        h=Date:From:To:Cc:Subject:From;
        b=Q/Gc0u4IdrKwQwxnEJ8PWze+PD9PLYtwPFIO1GWOlVR4RUyKfJGDtRhseqWWuEy0b
         JwQFSZ2tKDX2CB/AgOC4mkuWDMUNFDC6w5Va2TOE9jqKrJ+iwPxIWkHmZMynSqQJC6
         byJKAbJXEOs8qrrS8DIzsHbaDiFiwjDALeBULiVRsaPOUgTUQmp0uzE1mmQTTHpm9h
         JPJNRMtCz08qCXpFETGbyNnGcJu+lJWuTfp8Yh8i32iPvHANGSb8AhwP1x99C2vO6O
         liiEcNnEERnGTp4xQ0eHqh3xSXhdgGLd8tqlZkablP/tvMrkOElL4PEFeS5Y8UXyH0
         Ak4cCM/DCY+Ew==
Date:   Tue, 25 Feb 2020 09:30:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20200225093008.4297eb92@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.y99IrUKs_BDnSgNO=K1ggT";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.y99IrUKs_BDnSgNO=K1ggT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1c5312308c96 ("ASoC: soc-pcm/soc-compress: don't use snd_soc_dapm_stream_=
stop()")

Fixes tag

  Fixes: commit b0edff42360ab4 ("ASoC: soc-pcm/soc-compress: use snd_soc_da=
pm_stream_stop() for SND_SOC_DAPM_STREAM_STOP")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/.y99IrUKs_BDnSgNO=K1ggT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5UTnAACgkQAVBC80lX
0GxX8Qf/cJUOoZBsxqZi/fCY6whi6CweNst/DcNGOQkzspyFhmCKCfRyvwuLQ5M0
+0G+QH11T6VasuqEo3wIFUh37Qg9glC1g4ff6cVl6Bs4deK/sWylXzjWfVIKgFrL
FOuVSkTzyT2cmbYgyIkOzoXwTEJk1Gjk3X0DdA+cuN9dmtKD9qcPTVYa6DGEVwAs
khtsLWd/BdoabRKRl3azyZG8fpwtV0lyyVd9W5BSdiZE+/+omy4AfnhEZp9iyKxs
krzqXAUvIaLTL0OiB7crmJJ9VzCmpa5zLwsKlz8my9ZztuIII1d4N1N94axjlYp3
I46AWlM/FWQRJf80MnCYFhwMEkxWGA==
=qhTh
-----END PGP SIGNATURE-----

--Sig_/.y99IrUKs_BDnSgNO=K1ggT--
