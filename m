Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870C82FC84D
	for <lists+linux-next@lfdr.de>; Wed, 20 Jan 2021 03:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbhATCwB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Jan 2021 21:52:01 -0500
Received: from ozlabs.org ([203.11.71.1]:44951 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389319AbhATCvw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Jan 2021 21:51:52 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DL9592S4qz9sT6;
        Wed, 20 Jan 2021 13:51:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611111070;
        bh=KYQS50n3y3cRlH1E84hrtuV0rgyq0oaC9QjarMvSyBY=;
        h=Date:From:To:Cc:Subject:From;
        b=tT0jATI7Ij3NA1MIT0ZAokJY8b3i5cyBp4Ax8B+n2hMFTmKT4bfMdb8XE12nbjqxu
         CEeApskWYnqGIjhRIaRzkDzmf2Rdt8XzIYDytNaBTcZd8ZlXXtiPvbtHeRpxhl4OMA
         c3Vqu1VlI3oYkhAogIgdt3vGrWPAWarQ7/YuxZMtesrPz6c8jkmoc9v+tBgjTOmLeF
         +DMb6fjj2D1Q6PBL7NDNaPCqiyu0O3jz1+dXWDCQqy/PKl3D2/eB3lxaiSqnR8lD+y
         ws6DGks9IvLPeCAZRQmFhnOZycqgLOHHA8j/RrnBTQRTuJewYGTo3/xKEEuuhcYs2M
         KKWQX5wTERG+Q==
Date:   Wed, 20 Jan 2021 13:51:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Thierry Reding <treding@nvidia.com>
Subject: linux-next: manual merge of the gpio-brgl tree with the
 gpio-brgl-fixes tree
Message-ID: <20210120135108.1adf9f3c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/51Ia8OStNxyNh6erQHRIhGs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/51Ia8OStNxyNh6erQHRIhGs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  drivers/gpio/Kconfig

between commit:

  298d75c9b188 ("gpio: tegra: Add missing dependencies")

from the gpio-brgl-fixes tree and commit:

  355ef6bb005f ("gpio: tegra: Add dependency on GPIOLIB_IRQCHIP")

from the gpio-brgl tree.

I fixed it up (the former is just a superset of the latter) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/51Ia8OStNxyNh6erQHRIhGs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAHmpwACgkQAVBC80lX
0Gx23AgAjZUGDymYaDJ+gFQSCjkjnUB2bdaGbzK6OSghH3XJf1rNYFNCYgJq0cu9
mWFZdD+gNs1CyEUf5Qr5Y4X3omz37qxO7EUSKPvGEosQnN6SwwsE1uIOz6ed3HfR
jNZKvmRsRpB/hZ/98RgQ90JdJnosGaFJcYHtvX8h8tGChPaPk3tpBRMZV71e9dRl
KYjMoieeqtdRdwU0TrsM9fEkyg7ubtY8OxOzll0JsNrgLvmHzaEhVogcWPZT6L3z
y/5jTRDEqs51990/uoc8DMfYCZcpD/Fy8HvQDlbGVglLLNe3B6tCqIdoHLFWRP3z
dRROWMRsK5UTbT7aplfseaX5MQ5m3Q==
=93Ka
-----END PGP SIGNATURE-----

--Sig_/51Ia8OStNxyNh6erQHRIhGs--
