Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B628A2F6E8A
	for <lists+linux-next@lfdr.de>; Thu, 14 Jan 2021 23:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730563AbhANWse (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Jan 2021 17:48:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:58980 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729214AbhANWse (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Jan 2021 17:48:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E587C23435;
        Thu, 14 Jan 2021 22:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610664474;
        bh=Zbt+b/4SRKiOKRnFI9Unxzdtq1Iw8LTV3SmgBxJPwss=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E/IYEnKEKSrPk4ZCAzJL1g08pSIZZseTZtBvkoHwFdye/EZcYRLlQojBphHR9GGuZ
         SSZxo9J7MgV/x7DbRX8UjqNNH4um9pyFQU18w6AWxWxi3PSxjCLVuGoGxLx6JiPPe0
         5NCIRUZjBWktbzvOheoxBj2o6GbMuD5LAlnTTVOEYuFzJ2VXyE/bepSg7JYlQjy39b
         07syRxcOXBIIq0iNYaJUhxHoqwGWHwHK5tiKEMyLa8hx3psZx1k25CFSQZYN17n3UT
         fLw2ex+8sgXsuXM8imqa6grJ9qRdVkybf0E+huYcI2gqlJ6wUIRQvis2GLUshc/JnQ
         F8uoihU3Hx+Yg==
Received: by earth.universe (Postfix, from userid 1000)
        id 465783C0C94; Thu, 14 Jan 2021 23:47:52 +0100 (CET)
Date:   Thu, 14 Jan 2021 23:47:52 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tags need some work in the battery tree
Message-ID: <20210114224752.4ohn7zmrcyde474n@earth.universe>
References: <20210115092301.4c1f4893@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="chlntbt3zn7zpxyp"
Content-Disposition: inline
In-Reply-To: <20210115092301.4c1f4893@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--chlntbt3zn7zpxyp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, Jan 15, 2021 at 09:23:01AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> In commit
>=20
>   c339b3aec780 ("power: supply: cpcap-battery: Fix missing power_supply_p=
ut()")
>=20
> Fixes tag
>=20
>   Fixes: b0134cc14b9 ("power: supply: cpcap-battery: Fix handling of lowe=
red charger voltage")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
>=20
> Maybe you meant
>=20
> Fixes: 8b0134cc14b9 ("power: supply: cpcap-battery: Fix handling of lower=
ed charger voltage")
>=20
> In commit
>=20
>   efa32492629a ("power: supply: cpcap-charger: Fix missing power_supply_p=
ut()")
>=20
> Fixes tag
>=20
>   Fixes: 688ea049233 ("power: supply: cpcap-charger: Allow changing const=
ant charge voltage")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist
>=20
> Maybe you meant
>=20
> Fixes: 5688ea049233 ("power: supply: cpcap-charger: Allow changing consta=
nt charge voltage")

Thanks for the report. I fixed up the Fixes tags using your
recommendations. Obviously Tony had a problem with copying
the first character of the shortened hash :)

-- Sebastian

--chlntbt3zn7zpxyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmAAyhgACgkQ2O7X88g7
+pqXExAAnRctWeXmH3VPf810wCzMLwUyHAymjHE+K31yusNyE3pLT4WrrRDCMHh3
1rYrZsdwXtUnV4KO9G8qx4I7VsupLfdphM2D604YAR9PPCUm3UyRbAZ0lvA0O/dq
7mlon3fEVIa/mt/Ciu37QRYAFxi2F5kppWMSci3lifXy7UM8bLEVB4bT3se9xDAU
O2Ihop4uqN/ZOIQcyrn59P8hsbJ8iSLBSdkpVeifaJWyJKw7zIRCMm9qimNPFxQu
2L65b8yB4g+1upioPgsy85hL3eILXQWZ1q8mz6mNi8+WoHdfFKfW9pRQDByOO4KM
J7r2RYu0NjUDxCvjkJ9am4h4rlIsycZWeTRBjdEKWp6RUeFNwIx2iNqahzCc6dmt
6INpP6TzX7E5QF8lHilkJSams0vIDlVcylA8Nf2elR1SaJXYi3EAHfg8+F8quW9V
ls3nLbFZJ4z7JU96t5tEM8x0wtJiMQBoAiOR2D5NEZPl56Ikx4zuuxTVKutYtW/H
pbH2d9fMV31DQiFc8or2D9atc9HR41UsRswqKcyHTm0H4ccDjbO6RDQE8/hsFGEc
P3K0V443iSlozehXDxu5TRp7iWZF4WOYgPhdvE9FYetF22abzZKOdk6OIEPNw4Jq
7x/3fRSKEZTEWHyrqFy7aJHFErqbmrDs1UCEbVRNK+Es0Q7blRk=
=vLci
-----END PGP SIGNATURE-----

--chlntbt3zn7zpxyp--
