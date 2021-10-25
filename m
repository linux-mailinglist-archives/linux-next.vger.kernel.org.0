Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95F6443A689
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 00:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233780AbhJYW2b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 18:28:31 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:36015 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233982AbhJYW21 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 18:28:27 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HdV0V0gmVz4xbr;
        Tue, 26 Oct 2021 09:26:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635200763;
        bh=ptJuaRZFd0Pe2lQjQIDy0j2bGLGW2s2yRvclp6452jc=;
        h=Date:From:To:Cc:Subject:From;
        b=DwTwknQxIbwy/pq/QBOfAagnCE1y7IPOc+ztovi/XfV+pnifcJyGrzEkG8OwpTiSV
         f9QmhnPZNguVaOXlV3PhX3F0kJrGCZJ1rAUJcDezat07ZJXWHazWfICrYlkPZZg7Wt
         7Xy+lunupFatMJZJYe0SyFJSXWeu2wc5EEmrGD03CT38xMJcM49JrmjLBczYZsedki
         w/J9N4Fy3Ee4MLY0BFDHl9gwHW+Ia1wOHseo6ivcdjEl4OcrJYWGiaR9mvBfmT2q7B
         kxC0fVmuz84hJj/bk+Np5D3HC59y99ENYbt8KIeLBPV17zhA0nxJ28QlQTKOQfgpRj
         qXhozYBwTCf6w==
Date:   Tue, 26 Oct 2021 09:26:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mark Brown <broonie@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the spi-fixes tree with Linus' tree
Message-ID: <20211026092601.7e16a5c7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WiSPMizPj2P5gDIbj6OXv.6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/WiSPMizPj2P5gDIbj6OXv.6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the spi-fixes tree got a conflict in:

  drivers/spi/spi-tegra20-slink.c

between commit:

  ac8a6eba2a11 ("spi: Fix tegra20 build with CONFIG_PM=3Dn once again")

from Linus' tree and commit:

  6b6c496a88e7 ("spi: tegra20: fix build with CONFIG_PM_SLEEP=3Dn")

from the spi-fixes tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/WiSPMizPj2P5gDIbj6OXv.6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF3LvkACgkQAVBC80lX
0Gy5gQf+N6l5+R6vcWbjyNkwkOZlGmCN7GktPUPgK0xzlP51UpiKwhakl0BJNDkk
7MT8QNAGxBauVQ2yh658Hs9TU4GFZORYdB30WC/f85f26XYVyeoaB8jIBo319FKu
jJdbf0SHMtZn26qEfeS8TBe2LMWa65e8lteJ7X6lyUTOUtpXhjopgTYbshjB8eG8
3/mYiZD/nJPNPjyHpYv+lvL3jerN2Du66omTbu+Fl+aehnTi7i07Ss6lA6Y4aNDs
NOpE1YesvC2sBX/ke+Im1O7sXm61VRY9laDGeGVTchr/+6sQ5XVVAr6ZUHQWPrlk
jCu63cgSosAHY6B7k2MT1z2X/RX9Sw==
=jL9/
-----END PGP SIGNATURE-----

--Sig_/WiSPMizPj2P5gDIbj6OXv.6--
