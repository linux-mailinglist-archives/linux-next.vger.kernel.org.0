Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66E7A223544
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 09:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgGQHQk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 03:16:40 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48613 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726113AbgGQHQk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Jul 2020 03:16:40 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B7Mqk6xh3z9sRW;
        Fri, 17 Jul 2020 17:16:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594970195;
        bh=oTj8Uaaotye20E7nbwvHhre4w0zWt0nBV6tySDhiD+E=;
        h=Date:From:To:Cc:Subject:From;
        b=YJ/14INQyPXfRursA7MF7Ch5Bxhi61lCq31FGRwEa/cM/u+hg7GyA8iTZalnKCGGx
         ysH9alOH9ybXdiRrPFyJ0dAhpQOruHfdUCTYfjkQ54PvnbXwjlTsKL8zP+LyYhVO+z
         XD5TdxqdfEVpyHh4mZVmDV2D+YN+JydSSAIH1DChIYwITWmFTwf5lWymau/efGPjDE
         tItCdRiNou0vSfA2YZD4Ff1hlNu7S5N7yfT3+6uHfJyccymP99JWy+zoUktCMco5Zl
         CgKiWIp2r46c+u0n8WBZ/DItXKboS5eIlIWNAhK/mHW6aGy8jtL2fkBg/GLu3wgRU/
         2MsOvT3aIMn5Q==
Date:   Fri, 17 Jul 2020 17:16:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hanks Chen <hanks.chen@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20200717171634.4b68472c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ip=NXk1Hx7QoDwi+Gmdo.e2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Ip=NXk1Hx7QoDwi+Gmdo.e2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/pinctrl/mediatek/pinctrl-mt6779.c:783:1: warning: data definition h=
as no type or storage class
  783 | arch_initcall(mt6779_pinctrl_init);
      | ^~~~~~~~~~~~~
drivers/pinctrl/mediatek/pinctrl-mt6779.c:783:1: error: type defaults to 'i=
nt' in declaration of 'arch_initcall' [-Werror=3Dimplicit-int]
drivers/pinctrl/mediatek/pinctrl-mt6779.c:783:1: warning: parameter names (=
without types) in function declaration
drivers/pinctrl/mediatek/pinctrl-mt6779.c:779:19: warning: 'mt6779_pinctrl_=
init' defined but not used [-Wunused-function]
  779 | static int __init mt6779_pinctrl_init(void)
      |                   ^~~~~~~~~~~~~~~~~~~

Caused by commit

  e6f744c6ad4f ("pinctrl: mediatek: add pinctrl support for MT6779 SoC")

Forgot to include module.h (since it is tristate in Kconfig) or init.h?

I used the pinctrl tree from next-20200716 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ip=NXk1Hx7QoDwi+Gmdo.e2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8RUFIACgkQAVBC80lX
0GwW4Qf/U9+yRyzHbBgotPvNHdRVuVngKgRqwGRr2Q+biDGlpjacKUVLt9om0Jb0
Uaet6q5UsQHBBjopnZg3N4knmaIVCUHTsDLdG+wHnjOUHsHrhdpQlK1A188Yti0B
UuOGJnCAlKMuNUmZDKn9u4X+F66X/BMCh0izUUETjmuV6zPc+X2OUBOIgEL/P7Yq
VUwbkXn1DGrzIvoxyWqVkALk4kOkivO6u564MN3a0jtdFBf4rvnV0ab5H3K8ZYH7
+Gd1FPXFkZagPeLDsY884eg1f9pzv/yJ4GzrV063Zj5LYACXv/wQawtPy8oMY9GZ
lU+huz43csOde8EMBwdU1kS1JFZ6jw==
=wOdB
-----END PGP SIGNATURE-----

--Sig_/Ip=NXk1Hx7QoDwi+Gmdo.e2--
