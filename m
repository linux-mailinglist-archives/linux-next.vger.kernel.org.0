Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3155E707D09
	for <lists+linux-next@lfdr.de>; Thu, 18 May 2023 11:37:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjERJhg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 May 2023 05:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229963AbjERJhf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 May 2023 05:37:35 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79691732
        for <linux-next@vger.kernel.org>; Thu, 18 May 2023 02:37:34 -0700 (PDT)
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1pza4Y-0007aE-Tw; Thu, 18 May 2023 11:37:22 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id 46D281C7B4B;
        Thu, 18 May 2023 09:37:20 +0000 (UTC)
Date:   Thu, 18 May 2023 11:37:19 +0200
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the net tree
Message-ID: <20230518-frying-duller-be47c537367b-mkl@pengutronix.de>
References: <20230518090634.6ec6b1e1@canb.auug.org.au>
 <20230517214200.33398f82@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="7qwbkht7sr25n5ca"
Content-Disposition: inline
In-Reply-To: <20230517214200.33398f82@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--7qwbkht7sr25n5ca
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17.05.2023 21:42:00, Jakub Kicinski wrote:
> On Thu, 18 May 2023 09:06:34 +1000 Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the net tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >=20
> > Error: arch/arm/boot/dts/stm32f746.dtsi:265.20-21 syntax error
> > FATAL ERROR: Unable to parse input tree
> > make[2]: *** [scripts/Makefile.lib:419: arch/arm/boot/dts/stm32f746-dis=
co.dtb] Error 1
> > Error: arch/arm/boot/dts/stm32f746.dtsi:265.20-21 syntax error
> > FATAL ERROR: Unable to parse input tree
> > make[2]: *** [scripts/Makefile.lib:419: arch/arm/boot/dts/stm32f769-dis=
co.dtb] Error 1
> > Error: arch/arm/boot/dts/stm32f746.dtsi:265.20-21 syntax error
> > FATAL ERROR: Unable to parse input tree
> >=20
> > Caused by commit
> >=20
> >   0920ccdf41e3 ("ARM: dts: stm32: add CAN support on stm32f746")
> >=20
> > I have used the net tree from next-20230517 for today.
>=20
> Dario, Marc, can we get an immediate fix for this?

Here you go:

| https://lore.kernel.org/all/20230518073241.1110453-1-mkl@pengutronix.de

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--7qwbkht7sr25n5ca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmRl8c0ACgkQvlAcSiqK
BOjNmQf+L2tpBHUm5pRCkEwVeAfaCydTw1pYWkB6SPzQKGO1ejkbuajs6uEr4YK1
Krn+MgMCscrbENxL5x02/WMzX6x3xBKMyLqadtr7w7gbRjzKEX8pSLXOuDGvPIee
xeF7kF8h/QMcfBVI13/KlIJu83Kz24nPAEqqfr3lhF3+8zui5+wntQGC1cGRIKVI
O+y0GwkH4fD3nrQ/4Vwu2j1Is70Zsrd3DGnCy9QBlcAuwV+ZSdQPukKVv162odLL
d61P59blCBZ5WoF+zZ2vrcjvJY5GyVsBJWx6UlWlW2X7/sflQ9ecA+BUyuHulXLg
JUnuY0Q7XiXRYBikd7FA6f0VwwL4GQ==
=t0LY
-----END PGP SIGNATURE-----

--7qwbkht7sr25n5ca--
