Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0D573C95AC
	for <lists+linux-next@lfdr.de>; Thu, 15 Jul 2021 03:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhGOBnw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Jul 2021 21:43:52 -0400
Received: from ozlabs.org ([203.11.71.1]:44975 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229909AbhGOBnv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Jul 2021 21:43:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GQHBw1WjSz9sWc;
        Thu, 15 Jul 2021 11:40:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626313258;
        bh=qbRNE2Yd6kIDTyLmX7JYPO1kxz0WQw+vLfzxj5bZm5k=;
        h=Date:From:To:Cc:Subject:From;
        b=GbRvV6zd5qhF4QPHTt2dSM0ow3GPFvLLCxbgu/4y/ewXU5Eer6Rn9iCZOkZn5yVcn
         WkvCz7thCu358KmoXUwsfMZMUyAH2eXI0vIMBHF78A6gJIQns/FavEgrvyoX3gsila
         8FkM00Hh9xgnLJdwIEJkMAq7dzqIZb6aHsoptR6gm9ZXOGBPAv0xqHD/PJLQp2PpYX
         j6QXQE+OrRPl5VjWpZbSSZqaIU6xIYalILoSsr4GJvmBl+4a9+4XBZCNuuhk747v2X
         mMqmc/38wZNdlJKydPJ8CV/KG/EwfcJJztWZDGEzbfnmmE1C54C/zdjKnZAbaWfnWJ
         2ul1s8FFFtq2Q==
Date:   Thu, 15 Jul 2021 11:40:55 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Dave Jiang <dave.jiang@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the dmaengine tree with the
 dmaengine-fixes tree
Message-ID: <20210715114055.4eba03e2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=ajLp77sR2aMnkThZYOBMD9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=ajLp77sR2aMnkThZYOBMD9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the dmaengine tree got a conflict in:

  drivers/dma/idxd/submit.c

between commit:

  da435aedb00a ("dmaengine: idxd: fix array index when int_handles are bein=
g used")

from the dmaengine-fixes tree and commit:

  6cfd9e62e329 ("dmaengine: idxd: assign MSIX vectors to each WQ rather tha=
n roundrobin")

from the dmaengine tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/=ajLp77sR2aMnkThZYOBMD9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDvkicACgkQAVBC80lX
0GwjKQgAnXZdTEwsbaxoQ7raA6wzk3SKaSNia8POTNTaTRtQLUHUn6gHi9OQOdtW
HdI0/3X9+0kJSC8hgFg6TcZCCCmpl1BZ65DIL9P6kXK8OYaAzfMCCxSCsxjGusZs
tkZy7Gzvi4KRDAbIOkmIXbJwAeiNXrSDKTSqgke0myvMzDo17PitQhX0DIccDGks
QKY/gZKGkar7k6dRC1DNTsiFO8g2yiXh4BQw5HVkmV3KR1t4bmaniUXtoxWBV/zQ
6LEv3i52YagoiE3U4qEghoh2czhXTjmhcwd70CDgIBYqjekEYl3tuCflyaFTGU5f
/E7jzuyswILwDlXRl/5TFrkaWby1Dg==
=o6tq
-----END PGP SIGNATURE-----

--Sig_/=ajLp77sR2aMnkThZYOBMD9--
