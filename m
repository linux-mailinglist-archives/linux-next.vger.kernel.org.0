Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CABD96C2E
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 00:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730786AbfHTW1S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 18:27:18 -0400
Received: from ozlabs.org ([203.11.71.1]:35839 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728283AbfHTW1R (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 18:27:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Clll0jlhz9s7T;
        Wed, 21 Aug 2019 08:27:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1566340035;
        bh=YHmiY4oHs8VboygG9tS/lHbmnP3VSnHPNXivhP1XRpU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=I2TASIW/ZQylu5zADDN8kWYBD3v3sd0A1zYjhDhGq/cxYG027XIWLnB/c/dxjGz05
         UUiK8fa5+fVaRfOr9+UJS1nN/7lIsQ5RiN7yGOTHcPXu+FxBiCdta8v9wxo35HH04t
         9rKwL8f0hhsyo1j3R2V6mNMzHCvqUfu78z2VS6skldjyVnm1wjE3SWZeT8QwyLCCqC
         iBqrR7bYrDTZGXoZD2eX7wOItwQICMfOyvoE/EA1Cjq4OPun+OPghGe3EbF9L2SiK5
         nQKH+sSsQWW001tVLThyJMDRLc5PnJuFx81qhMEoR0mYlqIrlV5ZOm79t/tdFSQ0lG
         w/cBXUCCY9azQ==
Date:   Wed, 21 Aug 2019 08:27:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: Re: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20190821082714.3a7b1a5c@canb.auug.org.au>
In-Reply-To: <20190821070452.212c8ea7@canb.auug.org.au>
References: <20190821070452.212c8ea7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VG1ROhmSy.5qm+EpI1_81uh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VG1ROhmSy.5qm+EpI1_81uh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

These actually relate to the sound-asoc-fixes tree.

On Wed, 21 Aug 2019 07:04:52 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> In commit
>=20
>   0f6fc97501b7 ("ASoC: mchp-i2s-mcc: Wait for RX/TX RDY only if controlle=
r is running")
>=20
> Fixes tag
>=20
>   Fixes: 7e0cdf545a55 ("ASoC: mchp-i2s-mcc: add driver for I2SC Multi-Cha=
nnel Controller")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
>=20
> Did you mean
>=20
> Fixes: b87d37d0231f ("ASoC: mchp-i2s-mcc: add driver for I2SC Multi-Chann=
el Controller")
>=20
> In commit
>=20
>   988b59467b2b ("ASoC: mchp-i2s-mcc: Fix unprepare of GCLK")
>=20
> Fixes tag
>=20
>   Fixes: 7e0cdf545a55 ("ASoC: mchp-i2s-mcc: add driver for I2SC Multi-Cha=
nnel Controller")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
>=20
> Did you mean
>=20
> Fixes: b87d37d0231f ("ASoC: mchp-i2s-mcc: add driver for I2SC Multi-Chann=
el Controller")

--=20
Cheers,
Stephen Rothwell

--Sig_/VG1ROhmSy.5qm+EpI1_81uh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1cc8IACgkQAVBC80lX
0GxpCgf/Tg9pJ/wzxj7rK72JSpgsh0ZCYZWIadUq+0hk9dzbm49JxL1d+/7ZV6+L
LTw9WgmPeEUDAbKOWnSE9sEX/sex8C/Fuaa6RUM7+I4zfHVaEdYAKEIhSDlAEWzM
gFPyvk5dtGkXoIGdBqulw81JJ9F4B6C5MWQX2f7haK04GJmCWac10uQug6nkjTpn
Sg2Fkdkie/RVT0VmYUANG4P0JtXnGNUPQIQBftVm7mCIS520zvT9NsxUU0IZgtQe
9z06WdhHFLnAYHXzxupQjS1nAfKdvDSIjRmh/wyoQuJSh/GPZ+x4A4Vo3Tw862sr
GP0z+5rync9kykj2kpp2r1jWfupnwQ==
=6Eqo
-----END PGP SIGNATURE-----

--Sig_/VG1ROhmSy.5qm+EpI1_81uh--
