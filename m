Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19CB226D9E3
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 13:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgIQLKn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 07:10:43 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41757 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbgIQLKl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Sep 2020 07:10:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BsZ4n5g9Rz9sSn;
        Thu, 17 Sep 2020 21:10:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600341017;
        bh=WgBa20qobIP1NTevgK+CZPRTSep8ttMyfa6zfCns6Hs=;
        h=Date:From:To:Cc:Subject:From;
        b=omEWjyGQri6+wVOuWic9PWoFBf6hPONqMS2DL/CScJc9u+BB5UyYOQprxFS9id4Ju
         o3u7i4g74xwIz2FbMbxqPziTr/HetHVpbzP+Zs/D9JhG6mbWON3S5zZYl2kdYb0a53
         qyCB0iInPOij4XKNqW7Yt45KUAR4Rc5CnxP5cHC5F7QiccUzPhdm4YSr40un6kFA31
         m4O+M5U4LJxE05WY3xZlAy/gJPZDpHeYYB2GoTjQkrpg3vE5c1BNjnyJTk+8k5yFVt
         GUqlq35FCJ0r4N/CJykSTT/5b2EQO7SNAwFvMpmi1c4G6HMtZ8u+WcFG4ipaT2jQ5o
         wi7n1RqnVxesA==
Date:   Thu, 17 Sep 2020 21:10:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the irqchip tree
Message-ID: <20200917211017.1d1216b7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TevJp64OHmXh7L4/CQ7eDZg";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/TevJp64OHmXh7L4/CQ7eDZg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  e86085c6e2fb ("irqchip/irq-pruss-intc: Add support for ICSSG INTC on K3 S=
oCs")
  1c46bcaed207 ("irqchip/irq-pruss-intc: Implement irq_{get, set}_irqchip_s=
tate ops")
  7d1ca43a7c14 ("irqchip/irq-pruss-intc: Add logic for handling reserved in=
terrupts")
  7a141591acde ("irqchip/irq-pruss-intc: Add a PRUSS irqchip driver for PRU=
SS interrupts")
  309f1f85f7b0 ("dt-bindings: irqchip: Add PRU-ICSS interrupt controller bi=
ndings")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/TevJp64OHmXh7L4/CQ7eDZg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9jRBkACgkQAVBC80lX
0Gz6iQf/Udj1BrH6NVYa4nypIA0MMHbj2TDinhhz+HPAjTEp3zze0rKsRHS4N0+E
LyZQqbpRd8LKXS87j5czw9VIoBN5Lne2a91XhmyNqBp1UN+lVS/2vfX9cows9Mri
Njr1hnrGHj/SZDaFmuG2NAy594/ZooI9KBPI0GDOx3GM5MqWritmol/RrgMu0v5L
nDY+uAvGJpyomu3D2aCL7Ms85sB/tyP9RbxGEn2iTX4NGidTAz8dWq0gc0Fy/NIB
flAuiCBuvb+kbsunDUktVmnT8xzBhuFPZTQfOLDQZPKYC7EWWEma/inl9SED0B5/
3qwR29K/5UOL1Tju5UrEilzyxC/gIg==
=ZB3y
-----END PGP SIGNATURE-----

--Sig_/TevJp64OHmXh7L4/CQ7eDZg--
