Return-Path: <linux-next+bounces-742-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE9182CA77
	for <lists+linux-next@lfdr.de>; Sat, 13 Jan 2024 08:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEF4C1F22D4E
	for <lists+linux-next@lfdr.de>; Sat, 13 Jan 2024 07:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82709168C2;
	Sat, 13 Jan 2024 07:55:03 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686C214293
	for <linux-next@vger.kernel.org>; Sat, 13 Jan 2024 07:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rOYr2-0007Jb-HG; Sat, 13 Jan 2024 08:54:56 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rOYr1-002Jxi-6g; Sat, 13 Jan 2024 08:54:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rOYr1-008l1t-0O;
	Sat, 13 Jan 2024 08:54:55 +0100
Date: Sat, 13 Jan 2024 08:54:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, kernel@pengutronix.de, 
	Thierry Reding <thierry.reding@gmail.com>
Subject: New location for the pwm tree
Message-ID: <or6a5skoqw6d34bon273rwr245mioklxeclh5wf3u77gjbi7kh@dl7l3xveehwd>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7a5m7m7fcwkxugjr"
Content-Disposition: inline
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org


--7a5m7m7fcwkxugjr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Stephen,

now that commit 7afc0e7f681e ("MAINTAINERS: pwm: Thierry steps down, Uwe
takes over") is in Linus Torvalds's tree, can you please update the
location of the pwm tree from

	git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git=
#for-next

to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git#pwm/for=
-next

?

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7a5m7m7fcwkxugjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWiQcwACgkQj4D7WH0S
/k6juwf/QGdj6ajk9Gog3hXyj2RS8C5ubLmtl7FGotjqmVdTleOb3Dq/aHWSsKiM
nWl4LkhbMRuAsOAiOkOkm6xMciwAhl48B06nOfpHZb+yJ5bGBbFk0FMh+3/j9BM/
f6kNYM6O5EqCwHP2aeehWBEwgU++lbkC/FSX8kmckZi+Vexw/bT4hOkMb6wCCHYs
nBGU91oXy/ndOFFwcDZL6CF+j8QgBhRrwSQH76M1kZ7HkTuHdFu6I7TB1jjCD291
zldlQvbAZH4qdxIlQGr5em+XfL+7Ao+Ms4GTwwME/t7QVulcIPFttUfdvGy6Ee+J
hRFxAXkXDbAZrZ0uIoa/eGSvYUty3A==
=guHM
-----END PGP SIGNATURE-----

--7a5m7m7fcwkxugjr--

