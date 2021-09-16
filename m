Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C1F40D6A0
	for <lists+linux-next@lfdr.de>; Thu, 16 Sep 2021 11:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235539AbhIPJyD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 05:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235852AbhIPJx7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Sep 2021 05:53:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFDF9C061574
        for <linux-next@vger.kernel.org>; Thu, 16 Sep 2021 02:52:38 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mQo4I-0000tI-2F; Thu, 16 Sep 2021 11:52:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mQo4E-0003jX-2O; Thu, 16 Sep 2021 11:52:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mQo4E-00084Q-1D; Thu, 16 Sep 2021 11:52:30 +0200
Date:   Thu, 16 Sep 2021 11:52:29 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Improvement suggestion for creation of next [Was: linux-next:
 manual merge of the dmaengine tree with the driver-core tree]
Message-ID: <20210916095229.cvsjr4wbro26gev7@pengutronix.de>
References: <20210723155354.082a62d8@canb.auug.org.au>
 <20210728071014.dkdvqmiw2lma6ooa@pengutronix.de>
 <20210916162740.3327df56@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4q5izlngyi7lxack"
Content-Disposition: inline
In-Reply-To: <20210916162740.3327df56@canb.auug.org.au>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--4q5izlngyi7lxack
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Stephen,

On Thu, Sep 16, 2021 at 04:27:40PM +1000, Stephen Rothwell wrote:
> [Sorry this took so long]

No problem. Thanks for picking up my suggestion (and not loosing it in
your mailbox).

> I prefer to fetch all the trees (and run my checking scripts across
> them independently of the merge/build cycle.  However, I have improved
> the merge commit messages (I think).  Please check out today's
> linux-next.

Looks great. Thanks.

> I have decided to remove the SHA1 from the message, as you
> can see that from what is merged anyway.

I understand that starting from tomorrow the short log will be shorter
for the merge commits.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4q5izlngyi7lxack
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFDE9oACgkQwfwUeK3K
7AkGiwgAg+Smsw36CajyKiZKN132GI4xDMz2/p6ea+vDvQ3fHYoTVOb0wVExpvul
C/4YOlE4sW5aHPGCIghonEgNvZ+VLH6JmfdefhPFOLuMdz7JHRrqRKKBV2f8Nw2E
2zcqQKt+mYx1yoIM+OkZZa3cykuB04RxbvYpFR8/eYpyinN5VheHfmnCLSl9TMm+
OlvLvgU/9ymBkudsM7RRlVQxK3zAWY/ctCIxxoAJbhOdw4ZwfzyjydC2Lx+ksle9
ZwLChRDoQcqbWg0Qwa8mzthce8v1Ut5zrefTfJSqHoZvu5f6IHNtpsm+yPnN2RCi
iHUe9fhT5G09rY90Z2Hhocghk4Rw8A==
=k/Mj
-----END PGP SIGNATURE-----

--4q5izlngyi7lxack--
