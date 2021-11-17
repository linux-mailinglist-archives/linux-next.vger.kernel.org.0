Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 421584550BF
	for <lists+linux-next@lfdr.de>; Wed, 17 Nov 2021 23:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241460AbhKQWxS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Nov 2021 17:53:18 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:49009 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241472AbhKQWxR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Nov 2021 17:53:17 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HvdRs0XzYz4xdP;
        Thu, 18 Nov 2021 09:50:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1637189417;
        bh=KsW1X1kk5evjD+0HUEWlOicftXKq0rW0zrC8rFhc0Uc=;
        h=Date:From:To:Cc:Subject:From;
        b=ufAmuKL/DB/PZcZ53Kyy4qrmhWXUfKutHEBnUQU1wwG6l5vD8MOhtK74jfNoufE/9
         CVWDOaVlP2Y/S/yxdyYTgV0Ee2aNDR4aWINYjZ1VKoSvLlHsClkMU5bE4RuIqzDt9t
         hPwVj8I4V0e5pR64NFEQLKuE3DxPCS+aOGoJpTjXQqRVXdQLjXLVxN1I8FOkcCXXqu
         tLCS2HUw1HBjSbmirwjWiUrsmrSIRbjSqAQ3NTYl55wFaPyVihbqMmSbmEuZYpWddq
         6PmJ8FaKjAMRfDV5pKHMWCO71s6IuPA3vE2yitkAAFzcIaqmRFjI2AgklEMgFxepru
         VWiaKctRA3x/Q==
Date:   Thu, 18 Nov 2021 09:50:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Roman Li <Roman.Li@amd.com>,
        Jasdeep Dhillon <Jasdeep.Dhillon@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20211118095014.5210b292@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LV=l.5akw6_SaGoFtbsJnex";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LV=l.5akw6_SaGoFtbsJnex
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e2ec2136832f ("drm/amd/display: Fix OLED brightness control on eDP")

Fixes tag

  Fixes: 7fd13baeb7a3a4 ("drm/amd/display: add support for multiple backlig=
hts")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

Also, please keep all the commit message tags toether at the end of the
commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/LV=l.5akw6_SaGoFtbsJnex
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGVhyYACgkQAVBC80lX
0GyBOwf+INbtaK1gAC7H7fLZpSLEz0voAbvoLrrZGfYbhY1BmJi9AJan/F5+SdiG
aq/ELMO/1QurG/3HYIJ8Eqq8mCAYj1eg2jUO1O7Nhc5jVlL/SXNUpdSa+PQ5DsfG
Tr+QRhRKuDVgwH0Hb8fz80PV32z0jQzTeN6LPQbEhfYuvxMflq13b66Icjzm414e
tH+OfoKropiRTLfEr9uysXpgmcR36RnddKx6wrcKrTTNG1rH6dPcQvTXv9TD4z71
nYV455yk+6AXQ+WILQSCblj+RWWUTCfSdcb+aj8+w6fcjOfyjALoUzCJ4K2q7zq5
94sUWneHAvZhHsK6l6wjF7YFGqvOmQ==
=CEG7
-----END PGP SIGNATURE-----

--Sig_/LV=l.5akw6_SaGoFtbsJnex--
