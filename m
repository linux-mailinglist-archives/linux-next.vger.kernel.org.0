Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2CBB229913
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 15:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgGVNQJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 09:16:09 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57692 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgGVNQJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 09:16:09 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F3AE11C0BD8; Wed, 22 Jul 2020 15:16:06 +0200 (CEST)
Date:   Wed, 22 Jul 2020 15:15:51 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: linux-next: Fixes tag needs some work in the leds tree
Message-ID: <20200722131551.xnqpzztu3gcl62uo@duo.ucw.cz>
References: <20200722083337.067e1445@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6na2yacq6szf7iew"
Content-Disposition: inline
In-Reply-To: <20200722083337.067e1445@canb.auug.org.au>
User-Agent: NeoMutt/20180716
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--6na2yacq6szf7iew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-07-22 08:33:37, Stephen Rothwell wrote:
> Hi all,
>=20
> In commit
>=20
>   347b711870ab ("leds: multicolor: Fix camel case in documentation")
>=20
> Fixes tag
>=20
>   Fixes: f5a6eb5c5e38 ("leds: multicolor: Introduce a multicolor class de=
finition")

Thanks, I squashed the commits together and force-pushed.

Best regards,
									Pavel


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6na2yacq6szf7iew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXxg8BwAKCRAw5/Bqldv6
8oFEAJ4+9mdzZJD0j7J169GU/Hy/E45QdACZAcNPhzrgfqcL2TnLImYbwFA0Qg4=
=uj/M
-----END PGP SIGNATURE-----

--6na2yacq6szf7iew--
