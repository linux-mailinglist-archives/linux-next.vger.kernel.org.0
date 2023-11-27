Return-Path: <linux-next+bounces-87-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EABF97F9E62
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 12:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 283B61C209D7
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 11:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E518199AD;
	Mon, 27 Nov 2023 11:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-next@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3124D135
	for <linux-next@vger.kernel.org>; Mon, 27 Nov 2023 03:17:57 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r7ZcT-0000NU-Id; Mon, 27 Nov 2023 12:17:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r7ZcS-00BvgE-8m; Mon, 27 Nov 2023 12:17:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r7ZcR-009IZy-Vj; Mon, 27 Nov 2023 12:17:39 +0100
Date: Mon, 27 Nov 2023 12:17:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
	PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tty tree with the powerpc tree
Message-ID: <20231127111739.ryvlgofx3b65z2hf@pengutronix.de>
References: <20231127114904.77f7efb6@canb.auug.org.au>
 <877cm34g0l.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4eyf7rezxjwurju5"
Content-Disposition: inline
In-Reply-To: <877cm34g0l.fsf@mail.lhotse>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org


--4eyf7rezxjwurju5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Nov 27, 2023 at 10:00:58PM +1100, Michael Ellerman wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > Hi all,
> >
> > Today's linux-next merge of the tty tree got a conflict in:
> >
> >   drivers/tty/hvc/hvc_console.h
> >
> > between commit:
> >
> >   c9e38dc90e1c ("tty: hvc: Make hvc_remove() return no value")
> >
> > from the powerpc tree and commit:
> >
> >   7f30c19caf94 ("tty: hvc: Make hvc_remove() return no value")
> >
> > from the tty tree.
> >
> > These are slightly different versions of the same patch.
>=20
> I'll drop it from my tree.

FTR: Regarding the slightly difference: The variant in the tty tree is
the better one. So nothing to do for Greg (or me) here.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4eyf7rezxjwurju5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVketMACgkQj4D7WH0S
/k6xOgf+NZ2fNHlxIPkzzXeqRV8tvyXxa1uBM2gugQRm+9VBIvNM9m/ywtsM3GKZ
OVSkXb4mWIp1QXXJodmlPBnAyv4+J568aKjSlAAZw3gxzNDJ4pLBTGCJo9L+U3WO
YThzKymrcwwsb9z/L7oL4IiH64KGtQj7uZ6rsuJZFT2zaBJRZJo+Q1VahvQHtakZ
aNo5NRhg2swXKhoAv0LDbxFY6ZmQVxKI6PmoLwzK0f8l8+SeE9fYtxr22minkWDA
48kV91gH/vgx9YjP8MJ1HzRxTssmvkUj6mHwBjz1Vxpd3GuCTK6sm1+Bmf8xnDof
bM0LSRRDZyR47GrqhtUchIMD0mEsTw==
=8Vol
-----END PGP SIGNATURE-----

--4eyf7rezxjwurju5--

