Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07376351121
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 10:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbhDAIu3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Apr 2021 04:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbhDAIt6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Apr 2021 04:49:58 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38061C0613E6
        for <linux-next@vger.kernel.org>; Thu,  1 Apr 2021 01:49:58 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mkl@pengutronix.de>)
        id 1lRt1X-0008O6-Vb; Thu, 01 Apr 2021 10:49:56 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:f580:87bc:d400:3432:3a72:abbc:cd9])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        (Authenticated sender: mkl-all@blackshift.org)
        by smtp.blackshift.org (Postfix) with ESMTPSA id C9F796058E9;
        Thu,  1 Apr 2021 08:49:54 +0000 (UTC)
Date:   Thu, 1 Apr 2021 10:49:53 +0200
From:   Marc Kleine-Budde <mkl@pengutronix.de>
To:     coverity-bot <keescook@chromium.org>
Cc:     Torin Cooper-Bennun <torin@maxiluxsystems.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: m_can_receive_skb(): Error handling issues
Message-ID: <20210401084953.pnjwlufbgguxiw57@pengutronix.de>
References: <202103311500.C1214192BE@keescook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="edtivsr4t2xnceyp"
Content-Disposition: inline
In-Reply-To: <202103311500.C1214192BE@keescook>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--edtivsr4t2xnceyp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 31.03.2021 15:00:00, coverity-bot wrote:
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20210331 as part of the linux-next scan proj=
ect:
> https://scan.coverity.com/projects/linux-next-weekly-scan
>=20
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
>=20
>   None
>     1be37d3b0414 ("can: m_can: fix periph RX path: use rx-offload to ensu=
re skbs are sent from softirq context")
>=20
> Coverity reported the following:
>=20
> *** CID 1503583:  Error handling issues  (CHECKED_RETURN)
> /drivers/net/can/m_can/m_can.c: 470 in m_can_receive_skb()
> 464     */
> 465     static void m_can_receive_skb(struct m_can_classdev *cdev,
> 466     			      struct sk_buff *skb,
> 467     			      u32 timestamp)
> 468     {
> 469     	if (cdev->is_peripheral)
> vvv     CID 1503583:  Error handling issues  (CHECKED_RETURN)
> vvv     Calling "can_rx_offload_queue_sorted" without checking return val=
ue (as is done elsewhere 7 out of 8 times).
> 470     		can_rx_offload_queue_sorted(&cdev->offload, skb, timestamp);
> 471     	else
> 472     		netif_receive_skb(skb);
> 473     }
> 474
> 475     static void m_can_read_fifo(struct net_device *dev, u32 rxfs)
>=20
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):

Excellent bug report! I've send a patch:

https://lore.kernel.org/linux-can/20210401084515.1455013-1-mkl@pengutronix.=
de/

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--edtivsr4t2xnceyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmBliS8ACgkQqclaivrt
76nBtwf8DneaBjatKlaCT2sKKb6lMTb3sy1ugYoNgFPmjZcpJ/YPeQK8eLluA25a
QzXk5ua7qOLH4CDucJqd1HFlwAUUjGrOctEZDBVOD1qLTwcekMHiejPYlG9DZWL6
UnMQE1mV48DcF+jLaVBZ1YkPWz6l0u4gyRTk6MOTy5zE2jEKCmBHCXhmGB7DBBQd
kk3CJU9VcG3Z0MUn1Epfslf4RbDbC9QuCdy70oLFRddJQYgPPCnojTTvl0YCCM1g
SGGH+hrk4HsQ/nDgdK3C/3i1WC6V8OAqBI4Ho/mWRZ06vKRXJqldxxzpPGcPCpyj
wvltmjnodbZZQ5iW/4mjGo/hEjHi7g==
=S9tU
-----END PGP SIGNATURE-----

--edtivsr4t2xnceyp--
