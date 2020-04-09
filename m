Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47FDB1A308E
	for <lists+linux-next@lfdr.de>; Thu,  9 Apr 2020 09:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgDIH6W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Apr 2020 03:58:22 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53052 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgDIH6W (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Apr 2020 03:58:22 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 58DD41C55CF; Thu,  9 Apr 2020 09:58:21 +0200 (CEST)
Date:   Thu, 9 Apr 2020 09:58:20 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Subject: Re: linux-next: manual merge of the leds tree with Linus' tree
Message-ID: <20200409075820.GA2414@amd.ucw.cz>
References: <20200409131252.2dfde0b7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <20200409131252.2dfde0b7@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Today's linux-next merge of the leds tree got a conflict in:
>=20
>   drivers/leds/Makefile
>=20
> between commit:
>=20
>   457386350e6a ("leds: sort Makefile entries")
>=20
> from Linus' tree and commit:
>=20
>   3953d1908b2c ("From: Marek Beh=FAn <marek.behun@nic.cz>")
>   53cb3df9dd2d ("Sort Makefile entries to reduce risk of rejects.")
>=20
> from the leds tree.
>=20
> I fixed it up (I used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
> BTW, commit 3953d1908b2c clearly did not get applied correctly :-(

Um, sorry about that. My tree got merged to Linus, so for-next is now
for-next-next and I need to empty it.

Best regards,
									Pavel


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXo7VnAAKCRAw5/Bqldv6
8sxeAKDAPr0fwbVzQxim0lnNx1hwXqyj8wCfe6tpHj3PNAbhu2do5IEpy7DwnvA=
=Rfml
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
