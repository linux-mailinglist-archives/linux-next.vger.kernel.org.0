Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328D1271838
	for <lists+linux-next@lfdr.de>; Sun, 20 Sep 2020 23:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgITVh3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 20 Sep 2020 17:37:29 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:48400 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgITVh2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 20 Sep 2020 17:37:28 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 92A311C0B7A; Sun, 20 Sep 2020 23:37:25 +0200 (CEST)
Date:   Sun, 20 Sep 2020 23:37:25 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the leds tree
Message-ID: <20200920213725.GA31397@duo.ucw.cz>
References: <20200921061638.28bb1ff3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline
In-Reply-To: <20200921061638.28bb1ff3@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

>   258a8388d0ec ("leds: ns2: use struct led_init_data when registering")
>   d444232bbbdd ("leds: ns2: remove unneeded variable")
>   29c44f2b51a8 ("leds: ns2: register LED immediately after parsing DT pro=
perties")
>   925533c5a040 ("leds: ns2: cosmetic change: use helper variable")
>   47f1fb852be2 ("leds: ns2: cosmetic change")
>   a2ca4110ffc9 ("leds: ns2: cosmetic variable rename")
>   2d55e2a22ef0 ("leds: ns2: cosmetic structure rename")
>   51822355a756 ("leds: ns2: use devres API for getting GPIO descriptors")
>   e6367d0d57cb ("leds: ns2: move parsing of one LED into separate functio=
n")
>   a5c8eb177993 ("leds: ns2: support OF probing only, forget platdata")
>   820a7e98dbc3 ("leds: ns2: alloc simple array instead of struct ns2_led_=
priv")
>   5943b5ceb7f2 ("leds: ns2: use devres LED registering function")
>=20
> are missing a Signed-off-by from their committer.

Thanks for heads-up. Fixed and force-pushed.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2fLlQAKCRAw5/Bqldv6
8vXVAKDBfeOh+8fBDg3Hcs4cjhdExeZMgwCgqrUwjTV99N0eKQLNKdmhhHgCeR0=
=YD5H
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
