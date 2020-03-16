Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D31318645C
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 06:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729622AbgCPFQE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 01:16:04 -0400
Received: from ozlabs.org ([203.11.71.1]:55573 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729536AbgCPFQE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 16 Mar 2020 01:16:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48gkzN5yj7z9sPR;
        Mon, 16 Mar 2020 16:16:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584335761;
        bh=ne8widqpB0YTpGojiSmKxEjgpJNxgIxVAi0uoqIn7qI=;
        h=Date:From:To:Cc:Subject:From;
        b=X/B0ndRlOgw0inc/V2enEUsgij0Rz9XPF0UULOH8dxP7HxI4Sao72hCBmM9D+y96Z
         UjZn4hpwrkp/ip3UJur6QcudOdXTpyNeOEyhoRi1ZJ+ykkq12+3SFHlnrPA5SNK5od
         IdZqu2Zjw1D8mTP4Dsp0qW6/qab+6v7pHLND/7MpLPc3NlG9C9rU+uuEdwauJyVzI2
         OgwrlARhzn5PKHLmVPYskS4LR3vfXyNKO6i8ITBOb5vzDpHVDLOguxHiBs5BjlFOvW
         q+oufKest1qGaAiRxAsBACvTDv1XWhI0bCPXHv+h6DxYhJVKBBV0lv0VF4Mi00h6+m
         GZiaiQczZRu9Q==
Date:   Mon, 16 Mar 2020 16:15:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ran Bi <ran.bi@mediatek.com>
Subject: linux-next: build failure after merge of the rtc tree
Message-ID: <20200316161558.438c7d8b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rm8O9DsQOe1Jpo87kaInry5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rm8O9DsQOe1Jpo87kaInry5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/rtc/rtc-mt2712.c: In function 'mt2712_rtc_set_alarm':
drivers/rtc/rtc-mt2712.c:235:6: warning: unused variable 'irqen' [-Wunused-=
variable]
  235 |  u16 irqen;
      |      ^~~~~
drivers/rtc/rtc-mt2712.c: At top level:
drivers/rtc/rtc-mt2712.c:409:1: error: expected ',' or ';' before 'static'
  409 | static struct platform_driver mt2712_rtc_driver =3D {
      | ^~~~~~
In file included from drivers/rtc/rtc-mt2712.c:14:
drivers/rtc/rtc-mt2712.c: In function 'mt2712_rtc_driver_init':
drivers/rtc/rtc-mt2712.c:418:24: error: 'mt2712_rtc_driver' undeclared (fir=
st use in this function); did you mean 'mt2712_rtc_probe'?
  418 | module_platform_driver(mt2712_rtc_driver);
      |                        ^~~~~~~~~~~~~~~~~
include/linux/platform_device.h:214:29: note: in definition of macro 'platf=
orm_driver_register'
  214 |  __platform_driver_register(drv, THIS_MODULE)
      |                             ^~~
include/linux/platform_device.h:244:2: note: in expansion of macro 'module_=
driver'
  244 |  module_driver(__platform_driver, platform_driver_register, \
      |  ^~~~~~~~~~~~~
drivers/rtc/rtc-mt2712.c:418:1: note: in expansion of macro 'module_platfor=
m_driver'
  418 | module_platform_driver(mt2712_rtc_driver);
      | ^~~~~~~~~~~~~~~~~~~~~~
drivers/rtc/rtc-mt2712.c:418:24: note: each undeclared identifier is report=
ed only once for each function it appears in
  418 | module_platform_driver(mt2712_rtc_driver);
      |                        ^~~~~~~~~~~~~~~~~
include/linux/platform_device.h:214:29: note: in definition of macro 'platf=
orm_driver_register'
  214 |  __platform_driver_register(drv, THIS_MODULE)
      |                             ^~~
include/linux/platform_device.h:244:2: note: in expansion of macro 'module_=
driver'
  244 |  module_driver(__platform_driver, platform_driver_register, \
      |  ^~~~~~~~~~~~~
drivers/rtc/rtc-mt2712.c:418:1: note: in expansion of macro 'module_platfor=
m_driver'
  418 | module_platform_driver(mt2712_rtc_driver);
      | ^~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/device.h:31,
                 from include/linux/platform_device.h:13,
                 from drivers/rtc/rtc-mt2712.c:14:
drivers/rtc/rtc-mt2712.c: In function 'mt2712_rtc_driver_exit':
drivers/rtc/rtc-mt2712.c:418:24: error: 'mt2712_rtc_driver' undeclared (fir=
st use in this function); did you mean 'mt2712_rtc_probe'?
  418 | module_platform_driver(mt2712_rtc_driver);
      |                        ^~~~~~~~~~~~~~~~~
include/linux/device/driver.h:266:17: note: in definition of macro 'module_=
driver'
  266 |  __unregister(&(__driver) , ##__VA_ARGS__); \
      |                 ^~~~~~~~
drivers/rtc/rtc-mt2712.c:418:1: note: in expansion of macro 'module_platfor=
m_driver'
  418 | module_platform_driver(mt2712_rtc_driver);
      | ^~~~~~~~~~~~~~~~~~~~~~
drivers/rtc/rtc-mt2712.c: In function 'mt2712_rtc_driver_init':
drivers/rtc/rtc-mt2712.c:418:1: warning: control reaches end of non-void fu=
nction [-Wreturn-type]
  418 | module_platform_driver(mt2712_rtc_driver);
      | ^~~~~~~~~~~~~~~~~~~~~~
At top level:
drivers/rtc/rtc-mt2712.c:312:12: warning: 'mt2712_rtc_probe' defined but no=
t used [-Wunused-function]
  312 | static int mt2712_rtc_probe(struct platform_device *pdev)
      |            ^~~~~~~~~~~~~~~~

Caused by commit

  00c36d73171b ("rtc: add support for the MediaTek MT2712 RTC")

I have used the version from next-20200313 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/rm8O9DsQOe1Jpo87kaInry5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5vC44ACgkQAVBC80lX
0GySCAf9HVA8LQvxAlrLgmr1lybrFZAcE9YxZh0nILbgs3nDwnx1uuItaU1n+w6n
Vw36LqVLlFdvqLtldgpq8BtrlnwOWQcAlJsfpReGuTGx8Tlp8m+aAnT9p6BhAoOo
s1+adcdyLXXanXvyyIx9ZKS11t56glPhOazKTt4G9oHGPWkHrqdCi0iZvJJNkxYy
Wg32sGxfdV4pOoM13X9Tgv5HgbfAbKK1Q8jh90xuwOUbrJ41LW+1g73D5VR/0lcQ
Alv7nFJJjhPD40/AxDQw+QaExb1P8Nlndq0K//lXZVUaeZfSxDZ1drt+F0Tzbcq+
xakVbr0uFdD21eARs1VDcAKKYI8bxg==
=GXeH
-----END PGP SIGNATURE-----

--Sig_/rm8O9DsQOe1Jpo87kaInry5--
