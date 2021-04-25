Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB7136A5D9
	for <lists+linux-next@lfdr.de>; Sun, 25 Apr 2021 10:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhDYIpQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 25 Apr 2021 04:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhDYIpP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 25 Apr 2021 04:45:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 188D3C061756
        for <linux-next@vger.kernel.org>; Sun, 25 Apr 2021 01:44:36 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1laaNT-00025b-UY; Sun, 25 Apr 2021 10:44:31 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1laaNR-0008QD-Fd; Sun, 25 Apr 2021 10:44:29 +0200
Date:   Sun, 25 Apr 2021 10:44:26 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the pwm tree
Message-ID: <20210425084426.uxzfnkkxhcvblzjt@pengutronix.de>
References: <20210425131557.5eab8265@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="afsagho32ileb2cb"
Content-Disposition: inline
In-Reply-To: <20210425131557.5eab8265@canb.auug.org.au>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--afsagho32ileb2cb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Sun, Apr 25, 2021 at 01:15:57PM +1000, Stephen Rothwell wrote:
> In commit
>=20
>   30d0031bd7ca ("pwm: Reword docs about pwm_apply_state()")
>=20
> Fixes tag
>=20
>   Fixes: 539ed98e2bd3 ("pwm: Clarify documentation about pwm_get_state()")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
>=20
> I could not easily find which commit you meant.

This is my fault. The commit I meant is:

	1a7a6e8072ea ("pwm: Clarify which state pwm_get_state() returns")

Best regards and thanks for your attention,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--afsagho32ileb2cb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmCFK+cACgkQwfwUeK3K
7AlV0Qf/edI2C8ghD4pNs8HMAdAvZAw1btWnsXyhURId8CaBGm7E/FrMblji+XkY
pSvOUUWwgoLna9lPcX740fBHvlSb5JtxqPNrP3qiIc2mNiXgf4oY7pNPCS7tldTx
9fN06Y5TN7k1EU5Wx2tc6IDndQSjOK95O0P6i4RhJ2MnoD1h5p4G3U+RS8stseeU
rpP2+Lsgrk36bfx2eUlx808ZHVmwZOPJwqdSGxUz4l22u3KV7HlvAi1y/A3rWAuP
DVz7r2S4dbIk+iUaRhXCvImX3ZNpLQ8bdHAjO4VMP6pwRYIG8RZz5ZHlRwzD0CxX
yMvT+4E+GVrSnLUYi9z04Buof15V0A==
=iUUj
-----END PGP SIGNATURE-----

--afsagho32ileb2cb--
