Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE01B176A07
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 02:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgCCB3S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Mar 2020 20:29:18 -0500
Received: from ozlabs.org ([203.11.71.1]:54153 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726755AbgCCB3S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Mar 2020 20:29:18 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48WfYl1pJrz9sRf;
        Tue,  3 Mar 2020 12:29:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583198955;
        bh=9JgwDHLebH7yM40ELOfocC40qLVAwpcXJe/0yOA1g88=;
        h=Date:From:To:Cc:Subject:From;
        b=a0C+82I54n/QClXx9rJSYbqBaN2rESCM8Xf98eHGox4eNhyd3FYuy0udTiL2JCqIt
         I+ynQ99jXZNcld6w3lGDOfhH0XvL53uDA639VunJX/8+4Q4A+3z3nmZ6kSXRLFohgk
         VnPiGdLOj66ZoaS95IsFiZPwb1nXPv6H+SoKhHiLmVXRAbFOqYrY5NTgSqjBZcZ6pb
         /Kj5nf6FoR1vbDSCqpIyGNw8rwsZhC7rZIOpqnw0vNNJSENdLZ0XQVgD9k4Jyq/r41
         IGrm9hbzo/BaWx3P+xkEGu5yqeBrpo/RS74kkKx2R6ySk9OJssV3J1kjOoZEKZ1Jgn
         2uotJ7RMbj79w==
Date:   Tue, 3 Mar 2020 12:29:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Akshu Agrawal <akshu.agrawal@amd.com>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20200303122909.0d760f83@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k8LROJLLNdbDSbqbVb3+ij6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/k8LROJLLNdbDSbqbVb3+ij6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from include/linux/device.h:15,
                 from include/sound/core.h:10,
                 from sound/soc/amd/acp3x-rt5682-max9836.c:7:
sound/soc/amd/acp3x-rt5682-max9836.c: In function 'acp3x_probe':
sound/soc/amd/acp3x-rt5682-max9836.c:341:23: warning: format '%d' expects a=
rgument of type 'int', but argument 3 has type 'long int' [-Wformat=3D]
  341 |   dev_err(&pdev->dev, "DMIC gpio failed err=3D%d\n",
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/dev_printk.h:19:22: note: in definition of macro 'dev_fmt'
   19 | #define dev_fmt(fmt) fmt
      |                      ^~~
sound/soc/amd/acp3x-rt5682-max9836.c:341:3: note: in expansion of macro 'de=
v_err'
  341 |   dev_err(&pdev->dev, "DMIC gpio failed err=3D%d\n",
      |   ^~~~~~~
sound/soc/amd/acp3x-rt5682-max9836.c:341:46: note: format string is defined=
 here
  341 |   dev_err(&pdev->dev, "DMIC gpio failed err=3D%d\n",
      |                                             ~^
      |                                              |
      |                                              int
      |                                             %ld

Introduced by commit

  72c3b2b09fcd ("ASoc: amd: Add DMIC switch capability to machine driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/k8LROJLLNdbDSbqbVb3+ij6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5dsuUACgkQAVBC80lX
0GyXTwf/Viokg1Oor3erp/lUXDSs9qHoliYCz0MYQFs/YxrQ55wseIqA15yPKOJU
Ks7A2hptHkfyljjP8fNsZY841javuNi8/k+gxqmiN4E1YhzAvzSUw51ptSk1b+qO
aZY6Hf/yd3oDpS2WKh2jOqrRcFR3e9c2EGoioElMeP0yn2oxr3ZuYLOEgH3diHNc
GGWxE9ytM0MqZeMyrppNzR9wyBylLr3X2MOYqo5M7JAAQApud8kDfD9BNmk5zgfQ
J8B40jPk826UZ8Rvx3AI/GoYdRBpAehlvL7Km51y4/1GQNRrk68y4zlg+SeDOZ2l
eifKqPPYPIGUSxUX/nO0eai0STg+Gg==
=OzbO
-----END PGP SIGNATURE-----

--Sig_/k8LROJLLNdbDSbqbVb3+ij6--
