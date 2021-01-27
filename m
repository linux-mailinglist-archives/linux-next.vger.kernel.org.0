Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E996530573F
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 10:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbhA0Jpj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 04:45:39 -0500
Received: from ozlabs.org ([203.11.71.1]:43053 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231140AbhA0JmO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Jan 2021 04:42:14 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQdsP580rz9sVr;
        Wed, 27 Jan 2021 20:41:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611740490;
        bh=gbCxXC/9cZ2rCTAjdXLQuLBZccJtX7Qa5BmPKnZH7WQ=;
        h=Date:From:To:Cc:Subject:From;
        b=ixYFn0Hy4b5BlTm4Ags7Eoc2F/pTRcF+FtudoAKU4s8lLmVafZeSfBpSS+Y/gLw3P
         3uCzm5HynrzP9EH8ezTa3XmSHv6V1e1ngA8ZjdNEK8rX0JI+y5YaOgyRp/6NRIHiWk
         UKw14LwIKsSulbEv8FbOy09xcT/Uo6+UfdJuzauxoJPyIEJxW3PAD0imw3AftPiIsx
         gm91PDSeTymnUW3pet0ksFYdadCbPpTCdGuvxuiGDFen5FMM3ztRsGtnV+tsLgxwCG
         P2zcuzrxz9Qjh8RSmfLiqLNT1VV8vyUT2y/mzQ50XGelfAjIzX480XKyJKNXoEApUk
         gb3cvo49ngHMA==
Date:   Wed, 27 Jan 2021 20:41:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Chanho Park <chanho61.park@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20210127204126.484d8f0a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ij63wwrJNJq70tk8tdZLIrr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ij63wwrJNJq70tk8tdZLIrr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/wait.h:9,
                 from include/linux/pid.h:6,
                 from include/linux/sched.h:14,
                 from include/linux/ratelimit.h:6,
                 from include/linux/dev_printk.h:16,
                 from include/linux/device.h:15,
                 from drivers/pinctrl/samsung/pinctrl-s3c64xx.c:14:
drivers/pinctrl/samsung/pinctrl-s3c64xx.c: In function 's3c64xx_irq_set_fun=
ction':
drivers/pinctrl/samsung/pinctrl-s3c64xx.c:289:20: error: passing argument 1=
 of 'spinlock_check' from incompatible pointer type [-Werror=3Dincompatible=
-pointer-types]
  289 |  spin_lock_irqsave(&bank->slock, flags);
      |                    ^~~~~~~~~~~~
      |                    |
      |                    raw_spinlock_t * {aka struct raw_spinlock *}
include/linux/spinlock.h:252:34: note: in definition of macro 'raw_spin_loc=
k_irqsave'
  252 |   flags =3D _raw_spin_lock_irqsave(lock); \
      |                                  ^~~~
drivers/pinctrl/samsung/pinctrl-s3c64xx.c:289:2: note: in expansion of macr=
o 'spin_lock_irqsave'
  289 |  spin_lock_irqsave(&bank->slock, flags);
      |  ^~~~~~~~~~~~~~~~~
In file included from include/linux/wait.h:9,
                 from include/linux/pid.h:6,
                 from include/linux/sched.h:14,
                 from include/linux/ratelimit.h:6,
                 from include/linux/dev_printk.h:16,
                 from include/linux/device.h:15,
                 from drivers/pinctrl/samsung/pinctrl-s3c64xx.c:14:
include/linux/spinlock.h:327:67: note: expected 'spinlock_t *' {aka 'struct=
 spinlock *'} but argument is of type 'raw_spinlock_t *' {aka 'struct raw_s=
pinlock *'}
  327 | static __always_inline raw_spinlock_t *spinlock_check(spinlock_t *l=
ock)
      |                                                       ~~~~~~~~~~~~^=
~~~
drivers/pinctrl/samsung/pinctrl-s3c64xx.c:296:25: error: passing argument 1=
 of 'spin_unlock_irqrestore' from incompatible pointer type [-Werror=3Dinco=
mpatible-pointer-types]
  296 |  spin_unlock_irqrestore(&bank->slock, flags);
      |                         ^~~~~~~~~~~~
      |                         |
      |                         raw_spinlock_t * {aka struct raw_spinlock *}
In file included from include/linux/wait.h:9,
                 from include/linux/pid.h:6,
                 from include/linux/sched.h:14,
                 from include/linux/ratelimit.h:6,
                 from include/linux/dev_printk.h:16,
                 from include/linux/device.h:15,
                 from drivers/pinctrl/samsung/pinctrl-s3c64xx.c:14:
include/linux/spinlock.h:407:64: note: expected 'spinlock_t *' {aka 'struct=
 spinlock *'} but argument is of type 'raw_spinlock_t *' {aka 'struct raw_s=
pinlock *'}
  407 | static __always_inline void spin_unlock_irqrestore(spinlock_t *lock=
, unsigned long flags)
      |                                                    ~~~~~~~~~~~~^~~~

Caused by commit

  1f306ecbe0f6 ("pinctrl: samsung: use raw_spinlock for locking")

I have used the pinctrl tree from next-20210125 for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/Ij63wwrJNJq70tk8tdZLIrr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmARNUYACgkQAVBC80lX
0GwMpAf9FzmsaQx5Bko0MCwze7xCtHjciEFi4O19kBnkqO7o/eE5Of7cUUErdlDt
AoQZGbs9Oirs6SVZJWE6rslFPo3aRf4sZxzN03T881ioMxlstgoS3kgn/ojxXJpl
9vyx/ur1dg267GtLdnQbrou2Ft/spGsoC/ItLB7TfmDtAbozAZzZda2fCLh0+LKX
wE5HesmD6hHC+r66GUrn0b2o3kgBb1WBLxBWW+RgRAgKYsnbK7++Ioax3QSUE0hD
zG5+hdzAB4IYpqiTqXuEePy8/gJqI5Bjo3DAp1uc8R38fWnhEyJXfkCxsJASzWZ0
SwniBYMDlr/x0rFCypM3v62/ACAj8Q==
=ZZyh
-----END PGP SIGNATURE-----

--Sig_/Ij63wwrJNJq70tk8tdZLIrr--
