Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C962F6E82
	for <lists+linux-next@lfdr.de>; Thu, 14 Jan 2021 23:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730701AbhANWqB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Jan 2021 17:46:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:58760 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730660AbhANWqA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Jan 2021 17:46:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3E3623435;
        Thu, 14 Jan 2021 22:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610664320;
        bh=IBGkG3CnkOtbMmVWZtUacB2eKWvCsPvXkLU7ce8QxyI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GcB+SBqjgTzwqRUqiVczurF6zNoO+M4GyxGqLhtNKcL/6YeETnJ5il5ulWzbsE8KT
         lUopkz0GlFK2kk90LrXtrZMTOMAM+o1liQwCFDVTDjl+Q9Oj7a+c8VKJPgKCAPNwI5
         aFBYu8R/ZQ/g4GX6q290OtuYu2yICe8LT8WXv6Hts5ZrU4k90y+1ycPPlDUJMyVGMV
         OUbFZwipTwgCaw8qPV4j/Vgx3qTNcMiCD+Na+p9lkMNpsoZ7Skc8CJZaXpgejvdNCv
         MGMS89cFv/Rqtcd94w6rr81LySJge30fjh2yzdnM+Dnp0zz31ZCtpg+1oVpHmn0WiP
         b3RuGgjJODpZw==
Received: by earth.universe (Postfix, from userid 1000)
        id B7FD53C0C94; Thu, 14 Jan 2021 23:45:17 +0100 (CET)
Date:   Thu, 14 Jan 2021 23:45:17 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ricardo Rivera-Matos <r-rivera-matos@ti.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the battery tree
Message-ID: <20210114224517.wkeuujwbxr4j5mjo@earth.universe>
References: <20210115063935.30edd44a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cha6musilkoi7xkf"
Content-Disposition: inline
In-Reply-To: <20210115063935.30edd44a@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--cha6musilkoi7xkf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, Jan 15, 2021 at 06:39:35AM +1100, Stephen Rothwell wrote:
> In commit
>=20
>   e1cc2d7d3868 ("power: supply: bq256xx: Fix BQ256XX_NUM_WD_VAL and bq256=
xx_watchdog_time[] overrun")
>=20
> Fixes tag
>=20
>   Fixes: 32e4978bb92 ("power: supply: bq256xx: Introduce the BQ256XX char=
ger driver")
>=20
> has these problem(s):
>=20
>   - SHA1 should be at least 12 digits long
>=20
> Probably not worth rebasing to fix.
>=20
> Can be fixed in the future by setting core.abbrev to 12 (or more) or (for
> git v2.11 or later) just making sure it is not set (or set to "auto").

Thanks for the report. I rebased and fixed this up, since there were
also Tony's incorrect fixes Tags.

-- Sebastian

--cha6musilkoi7xkf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmAAyX0ACgkQ2O7X88g7
+pqKxw/+IhHyNmtsd7uoot3xuz1IoPgaMDdrIZno3BzIuGwmK6W40rec91YYCLLx
p6Ub4hJV9GdsAZGSkaWuTo3uxOqAhzn5YC4sPZMH06r/0JeNk3bGB/LI1D/10tmk
iJ1XtPqKcDoXIAJxkRODnScXCqQt2uX/PN+t62JKGuwXCO6cdWvsCYmFmuvNvLc+
zji6/n6SIHAMghXClrG7yolvDRUBYB36xKDacnSP7NzDPW/Vl8sN6UEQb6uveNHb
ea4xX2W7qWGQ4HiyAOVyj1s8eHHA9nWLMkDgtAItkU8xvcCEFVzDwBvgdvDjhyV0
qIR2CkPXuKOVVtRAj4QM6ci2v63F6DxQ751yqzuyRzKVhLKxxkvqVsuy0AlMaTxL
lYvvY9HuTm98BJricr6sbetcGQnMW4sezgSD4ZyBlztxIq2MD8xRu7jWMXAdcoy1
kcuh613Hfuzr/RryFomSTJd3zocv4A6twJPgY3DXZcwQ5iESZ6L6qxAqynwDCTyf
HAmrfDAzBLI17DA2DDSzNVPgCACE4QfP7n46qoy1tYsViwd5PLy7+GnFUJLtTLX9
/MQcsAcfl+O2yQadeXzaxN8FUVBIEHQGAXITaQ6iLRFccesHxpVAQA6qoOlA6oWE
8LBGo/41ByhCvAdbwE7UWw5LVUxoJyX917QwaqtjBXp1Hawh8tI=
=Dlei
-----END PGP SIGNATURE-----

--cha6musilkoi7xkf--
