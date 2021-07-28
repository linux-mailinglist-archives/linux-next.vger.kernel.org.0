Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F38A3D8897
	for <lists+linux-next@lfdr.de>; Wed, 28 Jul 2021 09:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234745AbhG1HKZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Jul 2021 03:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234303AbhG1HKX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Jul 2021 03:10:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF8EC061757
        for <linux-next@vger.kernel.org>; Wed, 28 Jul 2021 00:10:22 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1m8dhp-0004U6-53; Wed, 28 Jul 2021 09:10:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1m8dhm-000862-GI; Wed, 28 Jul 2021 09:10:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1m8dhm-0007YR-FR; Wed, 28 Jul 2021 09:10:14 +0200
Date:   Wed, 28 Jul 2021 09:10:14 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Improvement suggestion for creation of next [Was: linux-next: manual
 merge of the dmaengine tree with the driver-core tree]
Message-ID: <20210728071014.dkdvqmiw2lma6ooa@pengutronix.de>
References: <20210723155354.082a62d8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uj5lprban3ske425"
Content-Disposition: inline
In-Reply-To: <20210723155354.082a62d8@canb.auug.org.au>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--uj5lprban3ske425
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Stephen,

On Fri, Jul 23, 2021 at 03:53:54PM +1000, Stephen Rothwell wrote:
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

I intended to take a look at the resolution that Vinod pushed in his
tree. To find his tree and the right branch my approach in such a
situation is usually:

	uwe@taurus:~/gsrc/linux$ git name-rev d9e5481fca74
	d9e5481fca74 tags/next-20210722~22^2~2

so it was merged in tags/next-20210722~22, looking at that I see:

	uwe@taurus:~/gsrc/linux$ git show tags/next-20210722~22
	commit 65da974af6a0d913cde0cf59f517322bceac24a7
	...
	    Merge remote-tracking branch 'dmaengine/next'

and then I have to lookup what dmaengine/next means in next-20210722:

	uwe@taurus:~/gsrc/linux$ git show next-20210722 | grep dmaen
	...
	+dmaengine	git	git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengi=
ne.git#next
	...

You could save me the last step if you used

	git pull dmaengine next

instead of

	git merge dmaengine/next

because then the commit message of tags/next-20210722~22 would be:

	Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/vkoul=
/dmaengine.git

which is much more useful than

	Merge remote-tracking branch 'dmaengine/next'

=2E Otherwise the result should be the same (apart from fetching the
changes a tad later maybe).

Thanks for considering
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--uj5lprban3ske425
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmEBAtIACgkQwfwUeK3K
7AmiNQf6Avmc6SwBu6uW8mwFiL0mV/1hyiJPr4l5hYfl9FUFLgvhRb8xLec6f/5v
l3/ntN7qtDfaldSs9Z9VgyFLILwE1loLwYkRPw6j6cLpwGBZPPABRgB4Tfln3o1M
EPlhfo8ZCjHOzUgAh2kpvTrtspIkRfKIPZ1AlykGYDXU8eT5xk0T1FvWfmeAD8nD
s/IYcAFfxEI3iQXVLHe33+CTPjOVBQ0kiwZ6bhmSR59w90sF63TDY9I/4ipuVgU7
kL16LqmBF4THn2G1Y4BXp9bv1oDdxPEKxpgcVDckJMUkZd3/zqtQhT3k8/2eTKzO
QqKPDzyd5XXpgLMxGd8RYWm2isg2NQ==
=6czK
-----END PGP SIGNATURE-----

--uj5lprban3ske425--
