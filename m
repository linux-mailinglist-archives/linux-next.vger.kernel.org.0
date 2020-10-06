Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B94E2848E9
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 11:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgJFJAP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 05:00:15 -0400
Received: from ozlabs.org ([203.11.71.1]:34613 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725891AbgJFJAP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Oct 2020 05:00:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C5BHm6nJYz9sT6;
        Tue,  6 Oct 2020 20:00:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601974812;
        bh=8CfOUIbMt8fnTJfPAaJni1imQZSSTLb8IdHxm/8lC9A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EM5mBZ22SlHV3CHVixJkaN3v3ud9mmjXLADtHfAOEvwKw7p7+DCFrTjSJQKktY2Iz
         3v2N7Ldue/9u51p2lZ0RLyOpxeM2Gro17oot2pnj25rtDOk+pzC/ulC8TixhZZkCwG
         AS5UWYwHwwZ5ZBODbSL69s+T4HKqb+KnhoJQf3wVXBSdRsy0Gj7ArgfU0Omj8WJ8SQ
         Zkf+PeKurTftZGSJVbXz3axeeU3mILyI+qcQLrd9r8pGaV99ypbeQVE9jUJ7lIr9V3
         zAn2bUdsK8gA5hVi9I9lanz2WAJm8Cs/+5dkFJqWK44J0OfxmUwBMQSCMwIJSgkPSs
         m4jwhgVhidXPg==
Date:   Tue, 6 Oct 2020 20:00:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>, Greg KH <greg@kroah.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the extcon tree with the drm-misc
 tree
Message-ID: <20201006200003.1be00223@canb.auug.org.au>
In-Reply-To: <20200910141854.1d4b1b10@canb.auug.org.au>
References: <20200910141854.1d4b1b10@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HrwGoabrIGrrkf8jEjgNMeZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HrwGoabrIGrrkf8jEjgNMeZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 10 Sep 2020 14:18:54 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the extcon tree got a conflict in:
>=20
>   MAINTAINERS
>=20
> between commit:
>=20
>   f61249dddecc ("MAINTAINERS: Add entry for i.MX 8MQ DCSS driver")
>=20
> from the drm-misc tree and commit:
>=20
>   d0e3c25150dd ("MAINTAINERS: Add entry for NXP PTN5150A CC driver")
>=20
> from the extcon tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc MAINTAINERS
> index 623c53ab5bd5,da94c9b12f1b..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -12496,14 -12430,13 +12496,21 @@@ F:	drivers/iio/gyro/fxas21002c_core.
>   F:	drivers/iio/gyro/fxas21002c_i2c.c
>   F:	drivers/iio/gyro/fxas21002c_spi.c
>  =20
>  +NXP i.MX 8MQ DCSS DRIVER
>  +M:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
>  +R:	Lucas Stach <l.stach@pengutronix.de>
>  +L:	dri-devel@lists.freedesktop.org
>  +S:	Maintained
>  +F:	Documentation/devicetree/bindings/display/imx/nxp,imx8mq-dcss.yaml
>  +F:	drivers/gpu/drm/imx/dcss/
>  +
> + NXP PTN5150A CC LOGIC AND EXTCON DRIVER
> + M:	Krzysztof Kozlowski <krzk@kernel.org>
> + L:	linux-kernel@vger.kernel.org
> + S:	Maintained
> + F:	Documentation/devicetree/bindings/extcon/extcon-ptn5150.yaml
> + F:	drivers/extcon/extcon-ptn5150.c
> +=20
>   NXP SGTL5000 DRIVER
>   M:	Fabio Estevam <festevam@gmail.com>
>   L:	alsa-devel@alsa-project.org (moderated for non-subscribers)

This is now a conflict between the char-misc tree and the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/HrwGoabrIGrrkf8jEjgNMeZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl98MhMACgkQAVBC80lX
0GxtOQf/Qsg+ZvC10zGeMGUucLd6WO1c+qikncq8KpWaOiPfL+qcfJylSpDAwF26
soTu4wodcX1Mmz5jtKURs9tF4p25YmHN5C49v+1WVLlSznSS7a1qa5SUz4KIfyNz
PftRDbswJPE5V4L/G1TGreoK8dcsfF6/zjlBkAvHGxugfwn+1xAloWwzUIH53hiK
RIBPF1QLF9tpRyHNlSF0nGHFrjAyW98hhqapLze1Tgv95bb1w9Tuw/2HS+FODY54
BDE8irKOz+qBNoQ4rqsVumQQpQyB6nZnIeP6aLGH3rKey1zUCx9VJuck+OGuUCZw
arSyIx4vrOy5irLITAtJPU8nZXWeiw==
=EzTU
-----END PGP SIGNATURE-----

--Sig_/HrwGoabrIGrrkf8jEjgNMeZ--
