Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F758108555
	for <lists+linux-next@lfdr.de>; Sun, 24 Nov 2019 23:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfKXWjT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Nov 2019 17:39:19 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:41995 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726855AbfKXWjT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 24 Nov 2019 17:39:19 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47LlTH2Vrhz9sPT;
        Mon, 25 Nov 2019 09:39:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574635156;
        bh=4q1KyTDlb0ND4mkqK8ewLqPEYFfOu065MxrD5xwKFzo=;
        h=Date:From:To:Cc:Subject:From;
        b=t63HcXb0b0Mer6zIkRhVWPC2By3UYL+T+Tj4eyhld18gQIEDHHo3HOJdhRSDC+PDw
         PCXJ9QEwmUY/1391+tu/5Lvyga4E5//cv0G0I/aIBS/EWf+bbd7BRwqb3le/JvVS/N
         jfwZzGDCQi61f3xJ73B23J2fcEQKsCuO5DCMIPYFdz4HZZA+zjLlpeYdUE1JapuoCc
         gFhiA8pQRSf+PXYtUEx1XJUmh27DfSwFOnOwFU/kLZ0IYJmV0BPBtAzda15JZFgfwN
         SNfJnrZZDAkf8otD9T7lpv1KZoYOuw3+rPT/2hK9sKr09RQfiEbJdkwvhlyhtpkyXP
         qwCfTysJumUCQ==
Date:   Mon, 25 Nov 2019 09:39:07 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Michal Simek <michal.simek@xilinx.com>
Subject: linux-next: manual merge of the pci tree with the powerpc tree
Message-ID: <20191125093907.45e3421b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b+Onz14PBl20uhRM4dwdRuw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/b+Onz14PBl20uhRM4dwdRuw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  arch/powerpc/include/asm/Kbuild

between commit:

  265c3491c4bc ("powerpc: Add support for GENERIC_EARLY_IOREMAP")

from the powerpc tree and commit:

  356f42aff121 ("asm-generic: Make msi.h a mandatory include/asm header")

from the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/include/asm/Kbuild
index 148bee20e7e2,17726f2e46de..000000000000
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@@ -11,5 -10,3 +11,4 @@@ generic-y +=3D local64.
  generic-y +=3D mcs_spinlock.h
  generic-y +=3D preempt.h
  generic-y +=3D vtime.h
- generic-y +=3D msi.h
 +generic-y +=3D early_ioremap.h

--Sig_/b+Onz14PBl20uhRM4dwdRuw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3bBosACgkQAVBC80lX
0GxSCQf9GqVqx1LQuv7pxaUpAfSHTgqiURU3NYL+s6pFWcZqlqSZZuwOgW3Dlte5
Q5CwCC4z6FDugRWucbXvWo2dYTqBypijJugygqXYruHOHl3i40mgSyiTqIXkleWR
mdBbA8EOYfLfI7f/DboasIxKk/qaN4TZfCjW+rT7bPwHha/kMr1vYR8pUHPLsvVX
PNHDFavWlCT9UaPOo5CU4Q4H3gsGuag5m6owS42Ifp2gwQF3r25tgjtYDcxLPkh0
IoiqmtXKYIvHclm1p7QIjwxqbLreiuL/wvJWJYOWUICu66s3a2jkyVVjCCtOX2D8
8gHptQa/NAyg8RkEzB/F6yGCSJz/Qg==
=Idfr
-----END PGP SIGNATURE-----

--Sig_/b+Onz14PBl20uhRM4dwdRuw--
