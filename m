Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3581EDB3E
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 04:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgFDCf7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 22:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgFDCf7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2020 22:35:59 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56731C03E96D;
        Wed,  3 Jun 2020 19:35:59 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49cqdk6GlGz9sSc;
        Thu,  4 Jun 2020 12:35:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1591238156;
        bh=sYrEd3q4vBrkVZAPsehx+zHZl1jC2S3RqY1YwQho1DA=;
        h=Date:From:To:Cc:Subject:From;
        b=dB7zMMYS4iOLRaE1HGBIOrn5kJIfF/ZS3cNLADABr3l9q5L0tDI2gE0No0LC/FyWu
         6GaGWHZtJeBQmjCpWDA2gWhPzS9YAFM3aOHROKYO0NQvAxddMX4bmLXC2od+SDQDH+
         Pv1jNP+CLTe/fAyczIbQohNw9xVPwus1/uNIPKogLcCC7BKMyEaJwUljpI5EMiW3RB
         c/5ZSIw0AS2JZKj3KU1mIiL2Yu2S497jzd4IoZAZq3g/oFqgS1XLY7mAaFuem8upgp
         6UeTyX5XU2uR8lw8W5eYuTds98Ac6Ah6/vExy65IwN5g4i5e7g9mejVJHC/luDkEFa
         vyHxKDH64OjFw==
Date:   Thu, 4 Jun 2020 12:35:53 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        David Miller <davem@davemloft.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>
Subject: linux-next: manual merge of the tip tree with the sparc-next tree
Message-ID: <20200604123553.503daf22@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KF=zwyZJkiMoTsiLbQLierv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/KF=zwyZJkiMoTsiLbQLierv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got conflicts in:

  arch/sparc/mm/srmmu.c

Commits

3408974d0533 sparc32: mm: Restructure sparc32 MMU page-table layout
c95be5b549d6 sparc32: mm: Change pgtable_t type to pte_t * instead of struc=
t page *
f790d0205fd5 sparc32: mm: Fix argument checking in __srmmu_get_nocache()

from the tip tree are also in the sparc-next tree as different commits
(plus some others).

I fixed it up (I just used the sparc-next tree version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/KF=zwyZJkiMoTsiLbQLierv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7YXgkACgkQAVBC80lX
0GwrIQgAgJUxQkVHp0zEAsUqzMrxCAzRwgZuuroqqIhopVdG5Eiz/zJ7I4YznhjX
RpnnAmo2z99NkCNhzY9zo84oANM6i5vpJNs+wi9GX3T0q3XsiHUmvIbY8q949Kvp
7tns3Kx+ivK6W9ACM3KdoFK1XGJfV8DRgcuzP+Wy7QuEmPL0OKvrj7exzC364m44
FIWHmrQQRNIRfRCof2sYR7xrTxDSjWm3ISezTc51Tv3lWRu0kWVSPSipCAEpHGjQ
mS9U0qe8LK611EtEfXoU8PSkd7HMVxM3cmCgDbro4FE7fGjQ4EDk2Cgfz2oF+LU/
HKY3o942SkHJyqqQCrdTenyqadppYg==
=I5kJ
-----END PGP SIGNATURE-----

--Sig_/KF=zwyZJkiMoTsiLbQLierv--
