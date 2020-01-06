Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37825131098
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 11:32:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgAFKcg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 05:32:36 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:57604 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgAFKcg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jan 2020 05:32:36 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 453461C24DF; Mon,  6 Jan 2020 11:32:34 +0100 (CET)
Date:   Mon, 6 Jan 2020 11:32:33 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds tree
Message-ID: <20200106103233.GA32426@amd>
References: <20200106142116.538320e1@canb.auug.org.au>
 <20200106093129.GA13043@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <20200106093129.GA13043@bogon.m.sigxcpu.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > After merging the leds tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/leds/leds-lm3692x.c: In function 'lm3692x_max_brightness':
> > drivers/leds/leds-lm3692x.c:355:9: error: 'struct lm3692x_led' has no m=
ember named 'brightness_ctrl'
> >   355 |  if (led->brightness_ctrl & LM3692X_MAP_MODE_EXP) {
> >       |         ^~
>=20
> That's a result of a patch from the mid of the series not being applied.
> 'leds: lm3692x: Allow to configure brigthness mode' introduces that
> struct member.
>=20
> > drivers/leds/leds-lm3692x.c: In function 'lm3692x_probe_dt':
> > drivers/leds/leds-lm3692x.c:437:61: error: 'max_cur' undeclared (first =
use in this function)
> >   437 |  ret =3D fwnode_property_read_u32(child, "led-max-microamp", &m=
ax_cur);
> >       |                                                             ^~~=
~~~~
>=20
> That somehow got lost during merge of this commit:
>=20
>     https://lore.kernel.org/linux-leds/5826b77d42521595e93d01d53475a8881c=
ad1875.1578134779.git.agx@sigxcpu.org/T/#u
>=20
> Pavel, shall i send a patch to fix that up or should we rather try to
> get the rest of the series in in the right order? Resetting linux-next
> back to cffd61a5c7755546154539dcd7f36590e91e002f for the moment?

I kept just three patches from the series, and pushed the result.

Could I get the rest of the series, minus the "exponential" stuff, on
top of that?

Sorry for the confusion,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl4TDMEACgkQMOfwapXb+vL64wCfRJPB1iLMtc8RUuhSxUtEGFgt
564AnRHYHbKyJo38vncOvSVzW8HKgXo7
=y6cg
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
