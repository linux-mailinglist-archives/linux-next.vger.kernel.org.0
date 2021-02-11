Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF8F318406
	for <lists+linux-next@lfdr.de>; Thu, 11 Feb 2021 04:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbhBKDho (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 22:37:44 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:59683 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229812AbhBKDhn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Feb 2021 22:37:43 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dbj3r5bFRz9sBy;
        Thu, 11 Feb 2021 14:36:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1613014617;
        bh=YLUDqgRDKAtWi5FdISRI1n3N3z+A0LrRf1pFnoCeZwc=;
        h=Date:From:To:Cc:Subject:From;
        b=bWipClgYbMijHdmw31tkghs8KlowHFYD0VMbsnphM9NXOOk0CQuxTvXH/PsKqgS7t
         i/t81d2fy1P242D2J+pSjBG+NgJNuq8FgEogl4DgYmWHO9D/Yh1xSmp6gr+r+PPER2
         pHoijm5K02NjLgkTQvAEq2v8kxU91eaLzTvRQj43P3bewMulXLH2RWxmPtBcQJqqOa
         prQFr44Cqfx1LGX95xYDSc5C6M5NKW3lahVifDrzx85P+pOmkN3fFYbiatrOWSSeuD
         yKs28fdKLPsxoP02wn/im1HKRMKpT49VRfVVjQVkNLvdPzN4DSms2f5y+gPNXsVyfK
         ObFrBtK+xKGHA==
Date:   Thu, 11 Feb 2021 14:36:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alasdair G Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the device-mapper tree
Message-ID: <20210211143655.5d736b71@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r1SSl5frTbtM15u0ySEhcxM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/r1SSl5frTbtM15u0ySEhcxM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/md/dm-linear.c:234:3: error: 'struct target_type' has no member nam=
ed 'report_zones'
  234 |  .report_zones =3D linear_report_zones,
      |   ^~~~~~~~~~~~
drivers/md/dm-crypt.c:3585:3: error: 'struct target_type' has no member nam=
ed 'report_zones'
 3585 |  .report_zones =3D crypt_report_zones,
      |   ^~~~~~~~~~~~

Caused by commit

  7defd0da9dd2 ("dm: simplify target code conditional on CONFIG_BLK_DEV_ZON=
ED")

The report_zones members existence is guarded by CONFIG_BLK_DEV_ZONED.

I have used the device-mapper tree from next-20210210 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/r1SSl5frTbtM15u0ySEhcxM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAkplcACgkQAVBC80lX
0GyZ0Af/aKi8ZrtN14P71ou1N/T0yv2fcX++0GDjAWDt1jzZYzbuw4v/ITKUfI/O
eXFak08yniSiHT/YvAUT+4SPiayetwe/Xiuu5ij1IiVak61RSJYkOEWjkoFeBrRB
vxRJjvykNFTP8d2v30g1604lfzOGer2YGBIX/VQZ8z/j1S/5w9gl1zCVCQm4P3kW
QKeO7IB+qqyMfzoOEmPk1hvsKT1ueZ1NEVOpqgOj8Vx5E2gDm+V5Bgs9C1p3i7vf
4e4wDSuaXOdfAvxZtnp0FSSLDroeZZ/W3FjJlbjvih3Ct6oWEtGmgfvFpThArXWV
v+AngOonPJMjeLEfy8tuJj+qH6dsFw==
=CDRO
-----END PGP SIGNATURE-----

--Sig_/r1SSl5frTbtM15u0ySEhcxM--
