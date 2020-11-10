Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A682AE16F
	for <lists+linux-next@lfdr.de>; Tue, 10 Nov 2020 22:16:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgKJVQT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Nov 2020 16:16:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgKJVQT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Nov 2020 16:16:19 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B9D3C0613D1;
        Tue, 10 Nov 2020 13:16:19 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CW0z30QMZz9s0b;
        Wed, 11 Nov 2020 08:16:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605042975;
        bh=hJCP0mj9c+6Wz3Co2SdfUvRDzlP1IxA6ttlTLv+42q4=;
        h=Date:From:To:Cc:Subject:From;
        b=aDrwzXg1Q7BFRpNeLa/4LnPKZbLtCbkbc/NcqXjTfBai77b2bmwvMCTP/2CPuLWA3
         8eXp3Ftw8qm0woxiHi0rEd5JW52wpudDlP9X3/24zKTgUvGg9FQ6tqtrOvCvD2ZMGJ
         ffN3OTqnrMSXD1aBGiELT4dJGPNo+qNmu6Ub5EClnTBwAMr79h10yZOpktv0XdsFPT
         bZjwOdyEWdQN0vd0PosTb7wHCihgsjLx3PsfDhm/D5pSRw6tHqqG1ZKZt8nUyWjs55
         TmQOLpTAQ4rWTccknXvGaJqphjGjfUFnyq2VTf54a7idCxaL+taL0SUg80G6iwBECA
         4oiCI5z71kKOg==
Date:   Wed, 11 Nov 2020 08:16:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the omap-fixes tree
Message-ID: <20201111081613.0f2ce62a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yGzM.JyMx/9G/lSrGp4IZk9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yGzM.JyMx/9G/lSrGp4IZk9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  e4b5575da267 ("ARM: OMAP2+: Manage MPU state properly for omap_enter_idle=
_coupled()")

Fixes tag

  Fixes: 8ca5ee624b4c ("ARM: OMAP2+: Restore MPU power domain if cpu_cluste=
r_pm_enter() fails")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meeant

Fixes: 8f04aea048d5 ("ARM: OMAP2+: Restore MPU power domain if cpu_cluster_=
pm_enter() fails")

--=20
Cheers,
Stephen Rothwell

--Sig_/yGzM.JyMx/9G/lSrGp4IZk9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+rAx0ACgkQAVBC80lX
0GxAhAgAkmjv9b72TbSwCVRYSjc1Qr1tnX660K0Vnb9SuI0C1ovQ4ic2Vm/Pqmrj
ch/GFKsyTCgnOSr1Es9p7yPze2bsUBC5RJsQSSYN91UGfOpCiJPNj0txB8tgAKh3
dm8fr5e2TWhXLtiu8sL8IhLIAQOh324ivYjTBtAi6fphbvhGx5pcsbjvKHI6MFjp
o3tgKEDZtZrGB9Ul5zIEnO5VQNBm8tIvr25dCjf7Lyp+vaUUz1VCpodNF6hyB5vT
oaK3K9Ckddh84CaTVsQONJWnYOEnLgzsquk0avPtU6ERLD9YiWLxAPrFhGA/tzhU
yWWNPWEU/DoS0XTH6RQvm5qAcgolfw==
=8EdS
-----END PGP SIGNATURE-----

--Sig_/yGzM.JyMx/9G/lSrGp4IZk9--
