Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3AF02CDFA9
	for <lists+linux-next@lfdr.de>; Thu,  3 Dec 2020 21:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729144AbgLCUYS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Dec 2020 15:24:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728950AbgLCUYS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2020 15:24:18 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A030FC061A4F;
        Thu,  3 Dec 2020 12:23:37 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cn6jd5NXbz9sSs;
        Fri,  4 Dec 2020 07:23:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607027014;
        bh=S4Di3epBinyGt3NiNCab6L/0tCFJDA/C5HkNwOc+4dQ=;
        h=Date:From:To:Cc:Subject:From;
        b=YinlsqJL9TTYpA44cbACj5VSK3y4dFUZgd8pVQN5v/HPkaGjieNu+4MDWundAthR5
         q/XBmAMRvbMd3AQRUQCfXPTVBkjLfwJuyXAjZri7hDYjHlzTQNcBhhtilw/WS31X5t
         lTDgCsZfh0Tba8+SKZInuakSv7AneQPRkomHDd/0ZK6pAgPzVvuL+XUja1kX4c/8OD
         Si4A7wsUo96QgYsDtdThD+q0tfIzfIUNrz884YSiiYsYVLmvCyK9nNCVZ8vwHuelRB
         w4x8334M77uZZJOQY5jzEAyEP1jpsfhFDsXhgK1MsZC4CXtixX7scBBp3Q1XWO39cd
         wJtIXA3IZQBwQ==
Date:   Fri, 4 Dec 2020 07:23:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Nicolas Ferre <nicolas.ferre@atmel.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Cc:     Claudiu Beznea <claudiu.beznea@microchip.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the at91 tree
Message-ID: <20201204072332.07154d06@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wAE=l5ljwdKnGiqvnWmhm72";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/wAE=l5ljwdKnGiqvnWmhm72
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d45879c1307f ("ARM: dts: at91: sam9x60ek: remove bypass property")

Fixes tag

  Fixes: 720329e86a463 ("ARM: dts: at91: sam9x60: add device tree for soc a=
nd board")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant:

Fixes: 1e5f532c2737 ("ARM: dts: at91: sam9x60: add device tree for soc and =
board")

--=20
Cheers,
Stephen Rothwell

--Sig_/wAE=l5ljwdKnGiqvnWmhm72
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/JSUQACgkQAVBC80lX
0Gy37Qf9FNoxz92n/w6E4w5hkc/F7kiwO6WLZz+bi68/mFogiUhLMhLb9ku+Svr2
S32QZVXO7aNvV/IGvLq+zuCeZ+wDQpUc3DmhHoY99goLV7YiZfwlEo0ko/oqXVdO
PTjjFI/LseVq4wCpCI4ntKevq8gScp3Mxi9CUvYUm74MwXzHAQdqraRiFK00np4R
9bVT9aHMXTDPcJkEB4g6aJ4BThWV12ucFo0uB/9I6da3tUA/mZhcHI4jdDHxl9c7
PLWcqovRNrxLQY1VxYekYum7e5V9I+rf1zzlfMD2P/KiGT6PorrYPPeCBF8OyjU3
93/54sv6abCo6xfRS49H90PrEX49Kg==
=z+cx
-----END PGP SIGNATURE-----

--Sig_/wAE=l5ljwdKnGiqvnWmhm72--
