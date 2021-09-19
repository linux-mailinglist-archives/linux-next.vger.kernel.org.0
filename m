Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0F5410DA9
	for <lists+linux-next@lfdr.de>; Mon, 20 Sep 2021 00:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbhISWph (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Sep 2021 18:45:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35395 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230007AbhISWph (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Sep 2021 18:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632091449;
        bh=azW0vTWeXjKrp+nWcpcWoQH0dQ4Zj2LkwPHFkRLJUEA=;
        h=Date:From:To:Cc:Subject:From;
        b=poi7YlRxYGa5XISYPb0qQPxUI+MhTagpWePVKzQEfwKnEgheTcI9TWUmhXH9lyItu
         gVa7CEmFZxRMIq3X2Pb+hupfTDvcnZjLaXYJtQ2mWHUu9eI3ikiFzFRIELzhjla186
         TQho6Aqpdb9bpWNsGqdsjJhEmL91cjJG3ZsbkMVuA1xILZUAKpsbk8HCdGvslfFg3A
         0qjXvwFHNTqMk45xzoSnQ6v6swd+TGz9z0FsbtSav7npNBMzu/sT2FLuk2UgpAnNrE
         9bHdcMs3qxCO2DbtC9dCAEKnr4HLcLkRDCgRLDKI7Cc8+4hJEWVGwKrvr6zQL6KLKZ
         B0HnZKTfksBBg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HCN612Jj5z9sW5;
        Mon, 20 Sep 2021 08:44:09 +1000 (AEST)
Date:   Mon, 20 Sep 2021 08:44:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the spi-fixes tree with Linus' tree
Message-ID: <20210920084408.4c93f5a1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DwFuqR+d6yJTJJqRrDGl3MD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DwFuqR+d6yJTJJqRrDGl3MD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the spi-fixes tree got a conflict in:

  drivers/spi/spi-tegra20-slink.c

between commit:

  efafec27c565 ("spi: Fix tegra20 build with CONFIG_PM=3Dn")

from the origin tree and commit:

  2bab94090b01 ("spi: tegra20-slink: Declare runtime suspend and resume fun=
ctions conditionally")

from the spi-fixes tree.

I fixed it up (I just used the letter version as that has been in
linux-next for 10 days already) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

Mark, maybe fixes need to move on to Linus a bit faster?

--=20
Cheers,
Stephen Rothwell

--Sig_/DwFuqR+d6yJTJJqRrDGl3MD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFHvTgACgkQAVBC80lX
0GzmMAf/YK3TpOTyiy/Ha7o3ONjQ71Rxvw5TgCBbu5R+hVY5+IJAf9atqZPXgfR3
sP050uVoRBFVVney4luiPlSM4tmoXCAeIYsqDIqvPufn3f157T5eLx1qtcZ4tTAY
fc89Ks5zkzHO7PqYRRFiAY4LrkeCEVvsD8kRii8IGi+2Q9xL/3BcAXy62wvxyaz4
Tr3VwRPHDzhpqcgBuLWe5Q9+3pleT7lplFVotE/cu+NZ3bY+I8L367aKIU9qszkp
Pczk1bcgNvoyXJG6yfckUuh6vzBaHaDTwFjYSmBgwWtmJpKjgiHgVp9S0su04YFQ
BcbQCRsEZaA7xyBrrWGKNeSM+djQvw==
=BfFW
-----END PGP SIGNATURE-----

--Sig_/DwFuqR+d6yJTJJqRrDGl3MD--
