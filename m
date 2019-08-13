Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3C3D8BB84
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 16:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbfHMO2p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 10:28:45 -0400
Received: from ozlabs.org ([203.11.71.1]:43087 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729496AbfHMO2m (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 10:28:42 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 467FSk6gMhz9sN1;
        Wed, 14 Aug 2019 00:28:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1565706520;
        bh=ACE+9ye8XX94fLyYzZSFwCW0VwuWvHwCQooSP/F/dgA=;
        h=Date:From:To:Cc:Subject:From;
        b=QuEotmz3ddb1SAqTbT/1noT8q4953fVbA6IR3DZF9nlzqSon4Opid/AVKjcLuFrGt
         W3LeFDjcH1DyNW7chYSCr4ZD9qSUzdaBJ0tgS169qtmZy2IPkbunv5eqwVC1/Z9P5c
         nIlhKcM7YFPKitGRZ0ujJ+JDhl3HPMs6oAPE4bsj97bp2+6dVQID2AGFIB3VraP8G1
         kFvi1PgipJRC3kOt/+bGxgOBh4lk7VUNZda8Do7EhdV3LzJMKONdkdLnUypvXryn0i
         qt7CJZAlDcb3W0/yf4DBbIUmCCj5LCiCUIrmp8lrmiJ+nBOmoF/+YLOuaUrpQDb6ob
         j6TxFnSTPHu+g==
Date:   Wed, 14 Aug 2019 00:28:36 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>
Subject: linux-next: Fixes tags need some work in the arm-soc tree
Message-ID: <20190814002836.4b6aa14b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kz85xgv1foK0yj0LRJkbu.m";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kz85xgv1foK0yj0LRJkbu.m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  4f0f89dd9060 ("ARM: dts: stm32: add pwm cells to stm32f746")

Fixes tag

  Fixes: 9bd7b77af8e4 ("ARM: dts: stm32: add Timers driver for stm32f746

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  289459737869 ("ARM: dts: stm32: add pwm cells to stm32f429")

Fixes tag

  Fixes: c0e14fc712d9 ("ARM: dts: stm32: add Timers driver for stm32f429

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  493e84c5dc4d ("ARM: dts: stm32: add missing vdda-supply to adc on stm32h7=
43i-eval")

Fixes tag

  Fixes: 090992a9ca54 ("ARM: dts: stm32: enable ADC on stm32h743i-eval

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  1425d00aff01 ("ARM: dts: stm32: add missing vdda-supply to adc on stm3242=
9i-eval")

Fixes tag

  Fixes: 7465d81191a1 ("ARM: dts: stm32: enable ADC on stm32f429i-eval

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  bb06b54721fb ("ARM: dts: stm32: remove fixed regulator unit address on st=
m32429i-eval")

Fixes tag

  Fixes: 7465d81191a1 ("ARM: dts: stm32: enable ADC on stm32f429i-eval

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.  Also, please
keep them with the rest of the other tags.

--=20
Cheers,
Stephen Rothwell

--Sig_/kz85xgv1foK0yj0LRJkbu.m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1SyRQACgkQAVBC80lX
0GzZDwf+IsrJGu+m4VjHCnQut8LJ5UjoXaH00xOp7YoLUwH3HrpZUoK3LioqIoXO
yZqQHgRSdjSZCvb3CfAzMKHks9CjbMHPzd6YMzMg06c2oRHvzk8Yhhjg4Pe+s8uG
q1J/L9QC4w9dchq44h0bjgXMe5EQcvgeCvLk9INrbX3Tj1lgYHq3wGHaytMba8vI
6Y90Mhy+0F5RnzRM5+NU8PizWeigM0P1qUpMbvPc41YNknE/uD+qrFYqYad/XJxn
NQhRiLJFJLewtIOvNMdzwrjAFEmANR+yi34Ut+UrOZC60cNhW1jw/oc3qcMnY/kL
/BHY681uQ2Vnn1R3PcnRdKwu1snuWA==
=fN5O
-----END PGP SIGNATURE-----

--Sig_/kz85xgv1foK0yj0LRJkbu.m--
