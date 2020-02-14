Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC1B15CED2
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2020 01:00:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbgBNAAm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Feb 2020 19:00:42 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:58345 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727594AbgBNAAm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 13 Feb 2020 19:00:42 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48JYRr0dfZz9sP7;
        Fri, 14 Feb 2020 11:00:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581638440;
        bh=+bF0ogXTKSBSFulDbq0Q/LY5vp9XJnDtkN1Dl7LfxWw=;
        h=Date:From:To:Cc:Subject:From;
        b=mz2PKB2cNg5619CstdtvI52ETpbWrPplje9a2IQk6p+MZaNZYBeN+CXLrQBweIbnA
         lDfV5ov5d7xlVdd5sna3CS68yCJeFoKyo0dtVG/GRc9d6GoIheNi8RM1vYofpFbRdK
         Zm2d6lwBf+8L7bJr4DY4O6a5SpO9D+KpZXjilDGYkK2L7nHwoEnsAqMfKLq1WMjn7k
         0wdxazSlLOoo43RSaPqNQ6cRaSVqQVu6pKkz3Ck34ymMNGe1pqiVHKf3v518h6+4Jn
         XqkVR1KPp95Xa4RH6RypFeojZssOLHY6T4HWwZBy7EMgmWVDMtavV45jCHbR2FwMno
         Q+/aSMvdQEkig==
Date:   Fri, 14 Feb 2020 11:00:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: linux-next: build warning after merge of the slave-dma tree
Message-ID: <20200214110039.51369fae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_BOx+yha+JxtMQq8mnV==N/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_BOx+yha+JxtMQq8mnV==N/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the slave-dma tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/dma/sun4i-dma.c: In function 'sun4i_dma_prep_dma_cyclic':
drivers/dma/sun4i-dma.c:30:51: warning: statement with no effect [-Wunused-=
value]
   30 | #define SUN4I_DMA_CFG_SRC_ADDR_MODE(mode) ((mode) << 5)
      |                                           ~~~~~~~~^~~~~
drivers/dma/sun4i-dma.c:701:8: note: in expansion of macro 'SUN4I_DMA_CFG_S=
RC_ADDR_MODE'
  701 |        SUN4I_DMA_CFG_SRC_ADDR_MODE(linear_mode);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Introduced by commit

  6ebb827f7aad ("dmaengine: sun4i: use 'linear_mode' in sun4i_dma_prep_dma_=
cyclic")

Please do not ignore/dismiss new warnings ... this one points out a real is=
sue.

--=20
Cheers,
Stephen Rothwell

--Sig_/_BOx+yha+JxtMQq8mnV==N/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5F4ycACgkQAVBC80lX
0GxOvwf+MB1EzOgp+Vo4F6r9heRIKSAI0850IsLlx/eD2f9YISEhJ4Xzxx+lSpSu
uygD61J0UcsKP089KUA4y+OeoRcDDpWY5fgFyuWXWR5v851RF16BB0XCRcdXGj6c
hqFiWxNBLpTPq/0I6itDYT2Q8N5xvmWhTsfFf5WK1zMDn7rwF2RZosftLSIlKBJj
ZD5Lgux3dofNudSZab0+V/rv3pkqLkJ/sYd150BHYyordibTZoCIecK/4LL6oPPu
j9tVuCw1iqyUPaMSCKjSH91wYHmpoFv1wvEqLkShxglwGwAyU/0ivUSs1aw6H/Ol
5Jabb3LcXz9Cwfh3gVSGg4/I5Ef1Qg==
=XPkO
-----END PGP SIGNATURE-----

--Sig_/_BOx+yha+JxtMQq8mnV==N/--
