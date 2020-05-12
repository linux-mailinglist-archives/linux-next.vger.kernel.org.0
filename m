Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77A7A1CEBC0
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 06:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgELEIq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 00:08:46 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42879 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725554AbgELEIq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 00:08:46 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49LknQ5ZkKz9sRf;
        Tue, 12 May 2020 14:08:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589256524;
        bh=JZ51i3i4AIOfFcpdw05cKI7JblWRDIAPMwXLUOY5IOg=;
        h=Date:From:To:Cc:Subject:From;
        b=Pto2LKYK6YeLAlY/0AwN5HgyTTZm7lTiMgvzBYKPDM8ONir7nq490howafSQr5Arj
         u2Z3brYRjmWabgT5FI+oB+p3/l9V2Fb3K/xkl3/VPvqKyY/jVnDNsF2dm8FwCV2S4Z
         mlmfamOE9ERnSoamOGOU1/1rfeUC8FCgqd4C+m4JS4sfz+kuY3nMBEHqEpS7MDTFJR
         1rlqhs8su1MzYojY07lQqhvtLiaL12VnPjYmngqRuFMgzgB1rpNJdDFL40/QWru42h
         ZCv3Y14xnK86IpnvTXUsaeaAoeJH5UN9YS0fQ68DMOJnC3CkrA8GOFzBHmj3I84bn/
         1tSTuJIiA9jKw==
Date:   Tue, 12 May 2020 14:08:40 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christophe Kerello <christophe.kerello@st.com>
Subject: linux-next: build failure after merge of the nand tree
Message-ID: <20200512140840.0e102581@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kk17_c2x/oBhBhM2KSzkr/t";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Kk17_c2x/oBhBhM2KSzkr/t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/mtd/nand/raw/stm32_fmc2_nand.c: In function 'stm32_fmc2_nfc_write_d=
ata':
drivers/mtd/nand/raw/stm32_fmc2_nand.c:1294:34: error: 'fmc2' undeclared (f=
irst use in this function)
 1294 |   stm32_fmc2_nfc_set_buswidth_16(fmc2, true);
      |                                  ^~~~
drivers/mtd/nand/raw/stm32_fmc2_nand.c:1294:34: note: each undeclared ident=
ifier is reported only once for each function it appears in

Caused by commit

  6c1c863ca431 ("mtd: rawnand: stm32_fmc2: cleanup")

I have used the nand tree from next-20200511 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Kk17_c2x/oBhBhM2KSzkr/t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl66IUgACgkQAVBC80lX
0Gyxhwf+OT25PnqT/kCynU9+imdzK0hJadZEiDkD48ogaSrHJpndYqkAFE9kGK/q
kInIi/yWWsGAh+TcNjA0EMVyISLrnFDhiyUpt14IBmvVk/2iipLAhHSHqLabyKww
Dbi1Dnz2e3lkzY1X5veHmD3e+F3dcLXv88zs8tzdo9xK1udVTgUsAgxKWYw2+cws
s4C7ZrRodD+nwDn2JO7hSH/ztTt63bFY/AElUvAIoNEEYNMM9o5cJ/2gezbJUDMC
u1zCJG8X4yl/JOiF81Q0sDOs1G+bVPg6QaFE9UiFqoMzHLFaPBI+y/43mRePx8Gp
fP9sIjxv91JnUz0X7QvinxCKdeA0Zw==
=sTn0
-----END PGP SIGNATURE-----

--Sig_/Kk17_c2x/oBhBhM2KSzkr/t--
