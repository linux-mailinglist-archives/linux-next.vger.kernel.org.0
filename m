Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FB1357E33
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 10:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbhDHIfY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 04:35:24 -0400
Received: from mout.gmx.net ([212.227.17.22]:50305 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229652AbhDHIfX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 8 Apr 2021 04:35:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1617870907;
        bh=uzHYbFOvZvvGw8WEkVI0Q2jgK9pmSKjFhVTelBm1lpc=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=GqJdnPpqQZNKeJOf6oK3loLUF0HKv1sydxgO7qgwF4LzX1JDXb/g6SbKsmp5oip7a
         FueH0/2mXdalQcIXqtJbb4kxQHvm4AJAsJ5EuF7nALgY8xNjW1Xw6Sb6+OPMsxln0f
         HwHgliwBsB+iOqJpEeZbb8OgjS271NbWhOpT6SvE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8GQy-1lhSvJ2e5g-014AS6; Thu, 08
 Apr 2021 10:35:05 +0200
Date:   Thu, 8 Apr 2021 10:35:03 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the irqchip tree
Message-ID: <YG7AN/viDzjyncYl@latitude>
References: <20210408163528.180240af@canb.auug.org.au>
 <8171969ffe92eed0013fe3900ba0526f@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zhDIOHgF8wkNlzxA"
Content-Disposition: inline
In-Reply-To: <8171969ffe92eed0013fe3900ba0526f@kernel.org>
X-Provags-ID: V03:K1:CjHRl6ytnXzcipoOWBuXn1ErNO7r4Y8HE9YDi/TsOVQyfZ7uTac
 w3hV3s2H7k+wwRtP4Wpx1ZpUi/xXEBqiXnCzEKyZo3mK/v3LTm5z8dlUSn3DK6Ts8eFrNOx
 KWU/un1N90NAS+C73/S8NGCeQYTQpp/+DsUOsy7VotUeGafDU49ODfPEbwHaj81uC/DcXJw
 9yBsmgL0AVrv3s8kciPRA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:e9W4oIEl7UY=:pEfGfLAghvNLD1O8cODkBz
 w5zc15quKRXkTj5/B3yXI+ymldLeqE/3NyxhJhr4spb9M/iRJ94u7GpK8dK+ONNFfP4pkGPRn
 QGDPrELoQUH9xuL17gFCOYcGOL6I4TQlgx5mcGqErEyqfWmPYnYcW5TxbJQwTNsoCB7FCObb6
 WxwILwl/yMOk0wgsWipcfgEVrdqQoj6mK8Vpb2PAEXAi7qOYQ170O8oi10cT0D2TOHoOPS9Rd
 HOsX0G24JBvt82w+bodDXlcuoDIgH7TCLos+IE58cfUvWsaEeo2ZH4771lb/lfrPtYpcLJqP7
 ucRxHWQF/OY/brWrrZoei8I1vWJXTX4cVQfkQ+SDkElUwHIFjKGm9+yVJhHlSLHyZImw6abRe
 9ROuASQW1ibhv+5gMvfQkyIbrVYyeE5nCBXjesuzKyo+0jdZP0/AHQQU45PeRJQ7yXmReNMh9
 gSI6K6w/T4T1EQMyfoZsXsGbt84xF8CstarGx8LkSDTQTYxCSR4I2h0sgaAeKXC4hGXC+DK6n
 +x3WW1YLaOv9f7Obm19dDYWKYBRwNL5eH6dq/GIRp3xyUvkcj6hQ70L6HO6iQDxfMPAVBz1Rp
 ILDjMJA9Nf34p6URNC/6FWjY5ayWsIaTl6exb49upY9Gj8tZJDxkeO0c6l4A+oUcQ2cidgB82
 ugLIKAtZdbZNnuNGQHBLdFzrEZJAN+SKWw42qx1JVsPuhpuh1oowGeaMlCTC70AbDOKfgp63l
 0nWA1A8biOKE1nZOWLitAOrI3321iUkzFrDIotgDzVDT39VzQ4LjuTQTQ9m+HUd/XZTOU9OYU
 bw2FajeWuVy3/h9d1ew4LXwq1PxVe8kLXFgEevkB9/zSwTlgA+A1/bPxUWRJreBTEaWA+bU7J
 CWi1Y4r46mByI1ReTp6l+2GalDLIdaa8ZHnM07c5V9I+XR/rygeinq/J9Kmmf6c+xrPwE/r3m
 9dbqarkbCyWloiTmUFdHWjLYrzW4kKCbrcYjnhJQtyHh75AEITNQsx56CHW3FtGKqNCtVQk3w
 9DUUYSB1Ou+cQlxz4rxBdxV1Jkokeq+2lHtDBOH0T2ha5uktV3ZGg45BnH0cgESeE6epYGgZA
 d83KMyH2eT45MseATXooiMwD0vLRi51lSQXBnyzFHsZO33Qzs/AHboxaU0eD2Bwmc7EOaA7oL
 OZfd2xwUWQcUmk3U52L7n46upDyMpE2qBX5EYG8pFBWx2086pj6xFj2GjFaCssjiI3gHXd5Em
 p0opktitK0WLkIOpG
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--zhDIOHgF8wkNlzxA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 08:56:18AM +0100, Marc Zyngier wrote:
> Hi Stephen,
>=20
> On 2021-04-08 07:35, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the irqchip tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/irqchip/irq-wpcm450-aic.c:9:10: fatal error: asm/exception.h:
> > No such file or directory
> >     9 | #include <asm/exception.h>
> >       |          ^~~~~~~~~~~~~~~~~
> >=20
> > Caused by commit
> >=20
> >   fead4dd49663 ("irqchip: Add driver for WPCM450 interrupt controller")
> >=20
> > I have used the irqchip tree from next-20210407 for today.
>=20
> Thanks for the heads up. I guess that's the effect of COMPILE_TEST
> which was apparently not very well tested... I'll drop it from Kconfig.

Right, sorry about that.

> Jonathan, feel free to submit something re-enabling COMPILE_TEST once
> you've worked out the missing dependencies.

I used __exception_irq_entry from asm/exception.h, like other irqchip
drivers for ARM. This macro is only defined in arch/arm and arch/arm64.
So, AFAICS, there is no right set of dependencies for COMPILE_TEST.


Jonathan

--zhDIOHgF8wkNlzxA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBuwDAACgkQCDBEmo7z
X9vETQ/7BQAvfOoQkwIFnPj1vTYTRTgohe40PB2gU9JIkj8VEtM2V6H53SsNzl58
yGLGo0oz0EZYZgz2VT4orN1HuWpJ5Cy/WUVadf+KOry/XmNun8MoHHFolTX53ym3
OwBinTyXGnEMLIZGeF2lEVPIIRf9KZNqcl5DqG/oX9kZC0QTgfg3Mau/FSDnW/Lu
RlU5sKVSqq8w+IwcPN220DpTxSREbzhFXAa+khG6liAqR1V3GJgCFfyuKyf2/4M8
0HizHPYDmVcv9XNIrL4Shs4Jnzxve0yun1LL291JUPE0V+IzKN9QB8JiRQUEMyYq
q7BuPuW1IZ9esP15At39Qb4ueqPDrJVW2kv/+RMjbmy22/yamvxrW1rkfCVSMhTR
wT8GtaS5oxmxuEw+vDk7Dhht4UULPdZD9d20e37CEHMzj7gOOgjHcgmKbeWfq065
9B5ckhwS0OdmwmYaHGv67mIsx1/P0njfPa4nGfFBJtTpA76VKGROKym6g3+eqblj
a6kZ+sV21Ogm/l/IutYQVHhBTDaYW+p53uWYOuxjyke4JpfHZi2rFSCF/Xc3mc3s
E54v5e43A+Djs0kVe6o0oXsyq3SarTuguAkpjRIJAg4GpKUCvgEU7MnbdT9gcpVP
eUOi4Np6sRCzG7PEQNA10fr7/KaBZgoBRjcNOA9fs0UQysgWNCs=
=5k/O
-----END PGP SIGNATURE-----

--zhDIOHgF8wkNlzxA--
