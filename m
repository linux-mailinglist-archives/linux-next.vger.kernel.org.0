Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09FAF3D3785
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 11:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbhGWIgX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Jul 2021 04:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234651AbhGWIgW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Jul 2021 04:36:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80EB7C061757
        for <linux-next@vger.kernel.org>; Fri, 23 Jul 2021 02:16:56 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1m6rIV-0006rm-Hg; Fri, 23 Jul 2021 11:16:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1m6rIP-00043Y-Re; Fri, 23 Jul 2021 11:16:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1m6rIP-0007YL-Qa; Fri, 23 Jul 2021 11:16:41 +0200
Date:   Fri, 23 Jul 2021 11:16:41 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Vinod Koul <vkoul@kernel.org>, Greg KH <greg@kroah.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the dmaengine tree with the
 driver-core tree
Message-ID: <20210723091641.zse42sotjt2pqiif@pengutronix.de>
References: <20210723155354.082a62d8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fr5d5cyat2qyc4gs"
Content-Disposition: inline
In-Reply-To: <20210723155354.082a62d8@canb.auug.org.au>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--fr5d5cyat2qyc4gs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jul 23, 2021 at 03:53:54PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the dmaengine tree got a conflict in:
>=20
>   drivers/dma/idxd/sysfs.c
>=20
> between commit:
>=20
>   fc7a6209d571 ("bus: Make remove callback return void")
>=20
> from the driver-core tree and commit:
>=20
>   d9e5481fca74 ("dmaengine: dsa: move dsa_bus_type out of idxd driver to =
standalone")
>=20
> from the dmaengine tree.

Greg provided a tag for this case at

	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/=
bus_remove_return_void-5.15

=2E Vinod might want to rebase on top of this or merge it into his tree
with Stephen's conflict resolution.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fr5d5cyat2qyc4gs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmD6iPcACgkQwfwUeK3K
7Am9PAf8DT64/bN05JlJzWdHDafV5UAYyevkebDweEgpAByiBeWNPjO1rMX68kK9
8C4y7FM3HAZquL7yIrbXDULKcU2i/XwIs1UgkbT269v1b0Mb+wbyk6tYYIKita3M
8rLC6khp1lzyuJT5vNeTYh3jMRC+IHQXNXmD4E+JY1JarAXB9A93xn7wLVUlNTYX
/dGop5FL68mUEv3TKxdLOw8lwcrMyfY+l0VsahkIDfUFEz/QAbZXTN4EofUWxfyY
hDHu/Z/bjnW2d0XT/l6QBFShZT5RzLMba9Bad3soFTIsITGj1ba6ux9ZPH30B+F/
o0ksFs48CsLpTtniaoIwlihKT/T9/Q==
=6Rbt
-----END PGP SIGNATURE-----

--fr5d5cyat2qyc4gs--
