Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A92827F98C
	for <lists+linux-next@lfdr.de>; Thu,  1 Oct 2020 08:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbgJAGif (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 1 Oct 2020 02:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgJAGif (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Oct 2020 02:38:35 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C8CC0613D0;
        Wed, 30 Sep 2020 23:38:34 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C23Ng6vpDz9sTR;
        Thu,  1 Oct 2020 16:38:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601534312;
        bh=RBJiBoz8G2EGVdAT6E3of1uC7YVoBJ+eg8J8ki0v5Zw=;
        h=Date:From:To:Cc:Subject:From;
        b=ukDmWTSgy0pWJYmgcGGafRBIxLEjprqygoQANgUOP+XgiSRPbmZUKnX5l68ljT8x7
         cMz+awKoxLyLQ/ILC4NWn8lYuaJsiZhJWAQ4xZq0+O1uu+h6Yl6aryQI/e6bwIyJAZ
         7C42lzLvos1czc75boZXKtoJUcbg7Cza+9fmjgYs6dJ19LotbQdtA/YFBvH4w+4AlL
         0fQIGpw77Pbsxu+zKiw1lcOP6tICIOH9z/Rzm5jEjbtOM49aQLVa/tPo1TZzsPCYc9
         RoCuxhkWKK3NPv3uh9h8GnfE/ED7VNjLv+682UHg0L7dT/rii1lTIxpeT3EvGmlde4
         NNwxXixxYEevA==
Date:   Thu, 1 Oct 2020 16:38:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Li Heng <liheng40@huawei.com>
Subject: linux-next: manual merge of the tip tree with the pci tree
Message-ID: <20201001163827.20ea7bf9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Tm3Hmv4nFSZ0T+_xTKYqaiv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Tm3Hmv4nFSZ0T+_xTKYqaiv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/pci/xen.c

between commit:

  b0623566c2e9 ("x86/xen: Fix xen_msi_init() missing prototype warning")

from the pci tree and commit:

  2905c50b7d3e ("x86/xen: Make xen_msi_init() static and rename it to xen_h=
vm_msi_init()")

from the tip tree.

I fixed it up (I just used the latter since it incorporated the change
from the former) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted
for merging.  You may also want to consider cooperating with the
maintainer of the conflicting tree to minimise any particularly complex
conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Tm3Hmv4nFSZ0T+_xTKYqaiv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl91eWMACgkQAVBC80lX
0GzLywf/dOqnhX1Yge95OzotCZ2NODjW4HiVdq7pmj2/Ok0CEH9pvKYRhmDxSICk
NhwlpBz38HLKwpH5XPf2DPsCmrLRr6PuxnUs5NP+XY2QpU7TaKetqhoNxiRtunyS
5ZT5JDdW3I5p1/2cgYCcgyxAuVm1r+MpIXLSsJIgpAnei1d78g/KSWSbqBNZYFrU
NI7Jjq5GhuEXmPnW3ZplPIySTpsBY5lVjsXe11g4EoahPvzNoz7APj3Nqu/8CIfN
QY57Vyk2RY5D1occ2kYMol03oqZJA5FmbpA2XM2h7gUgHrF4ibWfoIrgtoZ2V7e7
zDARyRGPq6F1mvTZHOacIhxXInaLfQ==
=NUS9
-----END PGP SIGNATURE-----

--Sig_/Tm3Hmv4nFSZ0T+_xTKYqaiv--
