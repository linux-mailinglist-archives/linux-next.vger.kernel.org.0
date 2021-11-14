Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1798544FBEF
	for <lists+linux-next@lfdr.de>; Sun, 14 Nov 2021 23:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234751AbhKNWDd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Nov 2021 17:03:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbhKNWDd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Nov 2021 17:03:33 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19E80C061746;
        Sun, 14 Nov 2021 14:00:32 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HsmTl2Pgrz4xbs;
        Mon, 15 Nov 2021 09:00:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1636927227;
        bh=A+uOrs93zD6EYeEdw1HLXoRi/i9DQHp6q038xzTbl5M=;
        h=Date:From:To:Cc:Subject:From;
        b=lzVCYzHcW4q2DyrLWm0vS3rDCsibCP/a6Yh/0KqKABt2UPbmVXdWJiP/czEgIhikj
         n9bRVoCDqjvDWIeDx+6o/cbe/SL2G+Os3WX8SzPAtL+n4ksic0uvuR7yB+5NDOR/kQ
         nyYvKg8NUv2rnIb6Y0mrXQytM13YivIxG+zBoWCvfXxw+pbgfbIDwuZLNm0fsC0WNp
         jqUbzFUavDFAh0DSlqYmjIgj8VuMCnuGlwS5acnOoMp/MegMwiuw1m4BV9hVc9PZF+
         u0OEmYif00+boHDg46R8qCRq2kGPwhtdhz51TJ0K0aA5jDxJViybDqFfBCkIgiouAF
         xoTfyrER0E0Tg==
Date:   Mon, 15 Nov 2021 09:00:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Bjorn Helgaas <bhelgaas@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>
Subject: linux-next: manual merge of the pci-current tree with Linus' tree
Message-ID: <20211115090025.07495d7d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/06yBU/Zhg1fI//VPjFTs4Xs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/06yBU/Zhg1fI//VPjFTs4Xs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci-current tree got a conflict in:

  drivers/of/irq.c

between commit:

  10a20b34d735 ("of/irq: Don't ignore interrupt-controller when interrupt-m=
ap failed")

from Linus' tree and commit:

  eca2719173b5 ("Revert "of/irq: Allow matching of an interrupt-map local t=
o an interrupt controller"")

from the pci-current tree.

I fixed it up (I just used the former) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/06yBU/Zhg1fI//VPjFTs4Xs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmGRhvkACgkQAVBC80lX
0GxJHgf9FODbwATsp7wJarfzkvC+pfqd5tZY85evDejDrmBin5RTLHg4Yc3udgZC
WiZzBAYxCMZ4nviqbSN6Tn1x+ys2u4eMxKl+1jLKWMsACV/jNZWrqvh9Q+shpvR6
mFTIPKG3XavBNWxIUeNIEGXkgj0oAcsqk55W6jhPatn+7z8ceEwek8OYB+0Iu5mp
k0AfFyz26rQPNPHKMymcNfDh03abgFAjdroGMV3BjORjSXkrC0vlUuxuepWr0Yr0
65SBzijQmSaJWxiE5QSg1Tha97eLtMLSQhR7SEiu9tiJJPOps2+Mywx5GhiVpdYn
ErvkyIkF/dpi4vatSKUJfd9daOILsQ==
=Rc1S
-----END PGP SIGNATURE-----

--Sig_/06yBU/Zhg1fI//VPjFTs4Xs--
