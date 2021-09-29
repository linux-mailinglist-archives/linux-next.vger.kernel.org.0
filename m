Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 351DB41CF43
	for <lists+linux-next@lfdr.de>; Thu, 30 Sep 2021 00:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbhI2Wdv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Sep 2021 18:33:51 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:55557 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345134AbhI2Wdv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Sep 2021 18:33:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HKWMR3Qt5z4xLs;
        Thu, 30 Sep 2021 08:32:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632954723;
        bh=C7fcYNF3ZO/rDJ9ho+VH+GOZtnaJOFFQk+G3LxeiPBE=;
        h=Date:From:To:Cc:Subject:From;
        b=C5x9ErW7uLHbWMseUTJkD0gNVDiflciJY/pML1K0lvWhwt9LCp65EvofZqMKIJ5u1
         jZo/h8uzuacVNNSe+j3mspKSJGykwUVhD6gJVAvP0V8QPEE+PnphXlnkMD6DCLQfA+
         h+dRmHSLUJs74g7vCG2sCaDh5WxURIO0zRs6+wMArCrsLXDtmd7uZYXEBthexZxQvr
         BfiejBxgvxRbgs/ikz5QLfi6noFOTB8rFX2mOjbTt6z8bed0WEmNJ54I6Hd94kyfU1
         1cmZeCgNvLBWlaggP0thBha008he1Nadj1yXnJoMg1qdzbx6TEUskqjigD4vf08S4n
         ChlhiBmILMPjA==
Date:   Thu, 30 Sep 2021 08:32:01 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     David Stevens <stevensd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the iommu tree
Message-ID: <20210930083201.16636e24@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VN2fsYbpNcIDXjC8WlIj2zE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VN2fsYbpNcIDXjC8WlIj2zE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commits

  06e620345d54 ("iommu/dma: Fix arch_sync_dma for map")
  08ae5d4a1ae9 ("iommu/dma: Fix sync_sg with swiotlb")

Fixes tag

  Fixes: 82612d66d51d ("iommu: Allow the iommu/dma api to use bounce buffer=
s")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/VN2fsYbpNcIDXjC8WlIj2zE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFU6WEACgkQAVBC80lX
0GwPnAf/bTiUNAVmpsdU8oNdi28jpghUclGR+68kGSyOzP9lo0NTL6xa+xlceSIq
UvycTDgjbwTS/8B3UbP1grwwq+/5vXz1rzgzAaHsG4/78CRrb+T5DJr8LM3MHvTR
AoRdyG6koRQ2QgEi1bNoFaf+Qr6RiIlyhydoOgdRBKGnaagmWTH6jMtuvqkNj5ox
6bHDSJ2pNo+fEcU0P/kMyBcLbszZvwKY2U9P+Yp7BwjO8cAnn6j4KvvvSq0maz/x
/j4BEKPeF/LtE6vuiOz5Hc8cPJoBbhHrs2YNNXZ3czJMxON5h9c1Y/7aq7f03InZ
V+T+fieSJz/xmPVPAzNwn8/vHQFrZA==
=XDry
-----END PGP SIGNATURE-----

--Sig_/VN2fsYbpNcIDXjC8WlIj2zE--
