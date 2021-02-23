Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD931322361
	for <lists+linux-next@lfdr.de>; Tue, 23 Feb 2021 02:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbhBWBMU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 20:12:20 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43497 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230352AbhBWBMR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Feb 2021 20:12:17 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dl1GY0ZmLz9sSC;
        Tue, 23 Feb 2021 12:11:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614042693;
        bh=BhMebJFheEGWGacHH8G/FVKpbw8z1PwEQVTKLdmBpx0=;
        h=Date:From:To:Cc:Subject:From;
        b=b0dcuwviEzVOXwvj6cuk2WV/ETQc3P6ariYEcXdE/b5eG608oshp0+JaO2Yeq9ahI
         EqwL8K5DbLoCh0nW0nzQ5cPZF8QuD26Pz2jKNV8Da+keJIgo9ws0paZ2lf7LQY6O+w
         9NMVXk1+B/juPLXeXR3hqmLIxmwhOBHVr1huh5yUkoM62WuOau2RlewSGL5pJWb+3L
         SAflwOuIN/SQoH/n3yiGbd4AJ362o50oJ0PwAbRJxKlQYPxuOM6AuriWKNHNdTrVxf
         ErSihEfi+HbJkKwKJznFm5vtWqvFCBOjZ4PE0vOJ2fGY60+9URxAkZClNWPFZ3WSyU
         e9qaAsthrS2yQ==
Date:   Tue, 23 Feb 2021 12:11:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Qingqing Zhuo <qingqing.zhuo@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20210223121131.476e425b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J4JljfHDm2DxNyjnuVG9GN8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/J4JljfHDm2DxNyjnuVG9GN8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/kernel.h:15,
                 from include/linux/list.h:9,
                 from include/linux/kprobes.h:21,
                 from include/linux/kgdb.h:19,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:3=
0,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_=
types.h:29,
                 from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgp=
u_dm.c:29:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c: In function 'd=
m_set_vblank':
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5465:38: error:=
 'flags' undeclared (first use in this function)
 5465 |  spin_lock_irqsave(&dm->vblank_lock, flags);
      |                                      ^~~~~
include/linux/typecheck.h:11:9: note: in definition of macro 'typecheck'
   11 |  typeof(x) __dummy2; \
      |         ^
include/linux/spinlock.h:384:2: note: in expansion of macro 'raw_spin_lock_=
irqsave'
  384 |  raw_spin_lock_irqsave(spinlock_check(lock), flags); \
      |  ^~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5465:2: note: i=
n expansion of macro 'spin_lock_irqsave'
 5465 |  spin_lock_irqsave(&dm->vblank_lock, flags);
      |  ^~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5465:38: note: =
each undeclared identifier is reported only once for each function it appea=
rs in
 5465 |  spin_lock_irqsave(&dm->vblank_lock, flags);
      |                                      ^~~~~
include/linux/typecheck.h:11:9: note: in definition of macro 'typecheck'
   11 |  typeof(x) __dummy2; \
      |         ^
include/linux/spinlock.h:384:2: note: in expansion of macro 'raw_spin_lock_=
irqsave'
  384 |  raw_spin_lock_irqsave(spinlock_check(lock), flags); \
      |  ^~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5465:2: note: i=
n expansion of macro 'spin_lock_irqsave'
 5465 |  spin_lock_irqsave(&dm->vblank_lock, flags);
      |  ^~~~~~~~~~~~~~~~~
include/linux/typecheck.h:12:18: warning: comparison of distinct pointer ty=
pes lacks a cast
   12 |  (void)(&__dummy =3D=3D &__dummy2); \
      |                  ^~
include/linux/spinlock.h:251:3: note: in expansion of macro 'typecheck'
  251 |   typecheck(unsigned long, flags); \
      |   ^~~~~~~~~
include/linux/spinlock.h:384:2: note: in expansion of macro 'raw_spin_lock_=
irqsave'
  384 |  raw_spin_lock_irqsave(spinlock_check(lock), flags); \
      |  ^~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5465:2: note: i=
n expansion of macro 'spin_lock_irqsave'
 5465 |  spin_lock_irqsave(&dm->vblank_lock, flags);
      |  ^~~~~~~~~~~~~~~~~
In file included from include/linux/rwsem.h:16,
                 from include/linux/notifier.h:15,
                 from include/linux/kprobes.h:22,
                 from include/linux/kgdb.h:19,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:3=
0,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_=
types.h:29,
                 from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgp=
u_dm.c:29:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5465:23: error:=
 'struct amdgpu_display_manager' has no member named 'vblank_lock'
 5465 |  spin_lock_irqsave(&dm->vblank_lock, flags);
      |                       ^~
include/linux/spinlock.h:252:34: note: in definition of macro 'raw_spin_loc=
k_irqsave'
  252 |   flags =3D _raw_spin_lock_irqsave(lock); \
      |                                  ^~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5465:2: note: i=
n expansion of macro 'spin_lock_irqsave'
 5465 |  spin_lock_irqsave(&dm->vblank_lock, flags);
      |  ^~~~~~~~~~~~~~~~~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5466:6: error: =
'struct amdgpu_display_manager' has no member named 'vblank_workqueue'; did=
 you mean 'hdcp_workqueue'?
 5466 |  dm->vblank_workqueue->dm =3D dm;
      |      ^~~~~~~~~~~~~~~~
      |      hdcp_workqueue
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5467:6: error: =
'struct amdgpu_display_manager' has no member named 'vblank_workqueue'; did=
 you mean 'hdcp_workqueue'?
 5467 |  dm->vblank_workqueue->otg_inst =3D acrtc->otg_inst;
      |      ^~~~~~~~~~~~~~~~
      |      hdcp_workqueue
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5468:6: error: =
'struct amdgpu_display_manager' has no member named 'vblank_workqueue'; did=
 you mean 'hdcp_workqueue'?
 5468 |  dm->vblank_workqueue->enable =3D enable;
      |      ^~~~~~~~~~~~~~~~
      |      hdcp_workqueue
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5469:28: error:=
 'struct amdgpu_display_manager' has no member named 'vblank_lock'
 5469 |  spin_unlock_irqrestore(&dm->vblank_lock, flags);
      |                            ^~
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5470:21: error:=
 'struct amdgpu_display_manager' has no member named 'vblank_workqueue'; di=
d you mean 'hdcp_workqueue'?
 5470 |  schedule_work(&dm->vblank_workqueue->mall_work);
      |                     ^~~~~~~~~~~~~~~~
      |                     hdcp_workqueue

Caused by commit

  9d99a805a9a0 ("drm/amd/display: Fix system hang after multiple hotplugs")

I have used the amdgpu tree from next-20210222 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/J4JljfHDm2DxNyjnuVG9GN8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA0VkMACgkQAVBC80lX
0GzGBQgAh6JW4WLVfPEQ2qlumlgo/Par5lG5la0csZs5INAz0GJf+trsvJyMToL+
vNb3td3AsfsE3kHq/LHWJj0/TTt79CMhRhHJgMYKwbIewOunaK7UqEx2mb/616M3
Q7hfNsrjxbINX1DUoZSkiXuWYT+qdc/KH7PEcOQR+7649T+USOla0Exo+3Ae5mzR
g5yHyKZ43QsadGEb8ZOWzka7iIlsjF9epJDzFgSoNDyX0IahCfuNjbPViLwKsjeU
1zdmdpgS56Y/KPJAR//pVTHG724F64q8WQSYeWT/Lf/IunOEwcMPxwjzoZXckTcE
ItDboycnoa9y5tTz1Rvrz8amT0SraQ==
=BANv
-----END PGP SIGNATURE-----

--Sig_/J4JljfHDm2DxNyjnuVG9GN8--
