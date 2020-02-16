Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2E3816065B
	for <lists+linux-next@lfdr.de>; Sun, 16 Feb 2020 21:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgBPUex (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 Feb 2020 15:34:53 -0500
Received: from ozlabs.org ([203.11.71.1]:60357 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726036AbgBPUew (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 16 Feb 2020 15:34:52 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48LJkx3GX8z9sPK;
        Mon, 17 Feb 2020 07:34:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581885290;
        bh=w8Oi8BX+NW2dNlxxHJo0nw9fW3osVTqQ51DPnQO10PM=;
        h=Date:From:To:Cc:Subject:From;
        b=qdKqy80hhXHCU3ogX4JWGq0LUmbMGOmMFa+rLdunVMeMYgcksU78pRW+M0Q1ZGpeE
         Mfh/GlddKBtfYDrT+luAABU1OGcoF6vnpC3tJoHBegYki1KYEiPN+d/uKR9jWPUUc+
         6gInOiWajnANhkxOBrkVvbQQ+6a9LNX8O6FCK98awClQDkfWjD09TXCZTwOKJtxyuk
         GPA3XgOz7liaSlp8POMuHgpUxTtKjIxVk0jgkc3LEYjAfhHl96RPRgHqIuVTYkQzsH
         dliv5/wGoPikRolKbDSluTEdll2znrdp6d4xKOk1QPGSy/CfMF307wiIv8zsvd1Yo/
         q5Czt0WajeR+Q==
Date:   Mon, 17 Feb 2020 07:34:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Nicolas Ferre <nicolas.ferre@atmel.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: linux-next: Fixes tag needs some work in the at91 tree
Message-ID: <20200217073442.4f73edba@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wXL9kwiTqgk0rV/qnCD.uls";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wXL9kwiTqgk0rV/qnCD.uls
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  cc9d5c337684 ("ARM: at91: pm: use proper master clock register offset")

Fixes tag

  Fixes: fd2280a1829b ("ARM: at91: pm: initial PM support for SAM9X60")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 01c7031cfa73 ("ARM: at91: pm: initial PM support for SAM9X60")

--=20
Cheers,
Stephen Rothwell

--Sig_/wXL9kwiTqgk0rV/qnCD.uls
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5Jp2IACgkQAVBC80lX
0Gwb2Af+LZjS2cksMZRXEOousRIG/mz1adb8CjvHB5C7nZ8NPEhhZfhdbeSELdQf
a1NcagrmGGITA5vac7IaMiCH8BO6yPSIC4SjGwMw7yjhT1HBWvqV5qr1M3V7SdSZ
s5ip4II0Sgtofh4eXTXupOQOpLWDrErKLB9jn8pu+gx43iWG3yYRMYhQsTGfGEpw
MFupZyhRSWkjTk0j2BeBFxVbRlGyAUb1Un60sLwfHgQkwTxXHG5ly90T1pqG9y0R
YRO5Qo1asAP4OvwVJJWL6SPF9oEj0LCI/2nTxHW9+EeQV19odEPinpJMBy4Ux6+d
ahQ+N/cA9Seu9Hzb71G1PXCFCQ1Cog==
=HA1C
-----END PGP SIGNATURE-----

--Sig_/wXL9kwiTqgk0rV/qnCD.uls--
