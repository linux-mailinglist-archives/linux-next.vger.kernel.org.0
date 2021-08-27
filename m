Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7BF53F9489
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 08:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232463AbhH0GuA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Aug 2021 02:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbhH0Gt7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Aug 2021 02:49:59 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D33C061757;
        Thu, 26 Aug 2021 23:49:10 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gwr0f6YXlz9sPf;
        Fri, 27 Aug 2021 16:49:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630046947;
        bh=tAVLp/U8kG29y66CnYPSvdupsIhwTmlq5n49HOegpAI=;
        h=Date:From:To:Cc:Subject:From;
        b=TID6KPqRL7ZqPUaiMlRjisi3mTl4TkLDrwOGXkp5z/1ZaQeatQbuOHRpqg2q26NBA
         qrsg4x+qb2ZF4yqLmt41sE9+FJ0vXFqdFKPZsAOIDH6jrb1HHq7Q992rzQeHhUZZLy
         xmu4L0Rbxy+6r0kftOtH3kRo8ja1M1FqSleEOmsVDYJbB/TOfkIvPAXgWaGx7ce4oN
         yqkgqtn2lvEjWtUIxhUHMbQVaHnAo2H39J2AVUKxZbVC591/l54k8vo4ynDS3WjOq1
         y/zBydH1x9YXT9YjbYbbxdBTCjh7+loLkR8k0oambolWXdLUrAgjxuqyU5hnDQbm4d
         Na3slohCk09Kg==
Date:   Fri, 27 Aug 2021 16:49:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: linux-next: manual merge of the char-misc tree with Linus' tree
Message-ID: <20210827164904.6b1d1f0e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z.Dz2ls4Ely_Xmz7_=iSlfn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Z.Dz2ls4Ely_Xmz7_=iSlfn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got conflicts in:

  drivers/bus/mhi/core/main.c
  net/qrtr/mhi.c

between commit:

  9ebc2758d0bb ("Revert "net: really fix the build..."")

from the origin tree and commit:

  0092a1e3f763 ("bus: mhi: Add inbound buffers allocation flag")

from the char-misc tree.

I fixed it up (the commit in Linus' tree is basically a revert of the
char-misc tree, so I effectively reverted the latter) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Z.Dz2ls4Ely_Xmz7_=iSlfn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEoiuAACgkQAVBC80lX
0GyBGgf8D1X6vH/wR6nycVrqTmDViT3V+G07+/dprdZveIloBDBMwEIaZcx/K8pB
/g46Z3mTX7aGN4PEO/dk4FcEMkW8TApcelw/GnbdPQ+hg9ntTelI3fQ2yhugn2mo
o8Mqa0dpS8oHgzdqwPy1iSRXoCbFxtlfVqCpJawSXV75URaPRlYPpUfUFQDFYk5X
C2P2KgIs8Yt6YgBApGDqEJyq87P7QuhLqx+SBf8lE7Sy6Jm3hEPkHeDX1T2c/GXx
XIxFsC2Fst93OmD2Ca3bJUHxCTsouLNwJkhEGMr6DrqR/NNob7X0OUtEyWPnZVXL
FO+vMhvFa1npTioV6Z9ORZg9rgIZ5g==
=MKhj
-----END PGP SIGNATURE-----

--Sig_/Z.Dz2ls4Ely_Xmz7_=iSlfn--
