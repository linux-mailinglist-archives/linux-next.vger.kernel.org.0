Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B4132BB69
	for <lists+linux-next@lfdr.de>; Wed,  3 Mar 2021 22:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232155AbhCCMYJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 07:24:09 -0500
Received: from ozlabs.org ([203.11.71.1]:38037 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2360738AbhCBWYf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Mar 2021 17:24:35 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dqs9N3nbYz9sCD;
        Wed,  3 Mar 2021 09:23:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614723832;
        bh=a4QcSfumEHM7CH652isxGibW2y/SHEjtCK58Us/YfsU=;
        h=Date:From:To:Cc:Subject:From;
        b=VbFLksAJyWC11ucvneQ03hT90yPzujncD1/cX+c2pLU3ogP8sIsvt/r0/GHmxOg6R
         ibw2L488exvCjsU0gU0OCBKpwlTrEkLfqGbly2yUQNWkYLEFeGy7sLotFEPTCdtwsW
         PpIiQb9ptyltVnkjcvnR0yqU8kw1dITRxUL7nKZ4QVUZCRdrHIsc8TeE6q8LFP24k6
         XXXVDxzW/U8xOk06Md8QE9M+tv9M2ZGNem6RJXo1G/MyyMEXaSQJTbVIz/Pj8fM2wj
         YohCvxbTSHNpgtOUp+Z1ltZNV12CCM3jszkY/sbJ7YnXHNmx+oJOKrO3AXoXdu2fsI
         OdYQXv+H26SLA==
Date:   Wed, 3 Mar 2021 09:23:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the f2fs tree
Message-ID: <20210303092351.35b015e3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JBvFRi3v7kF5WreTHlfE_IA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JBvFRi3v7kF5WreTHlfE_IA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the f2fs tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

fs/f2fs/sysfs.c:576:25: warning: 'f2fs_attr_ovp_segments' defined but not u=
sed [-Wunused-variable]
  576 | static struct f2fs_attr f2fs_attr_##name =3D __ATTR(name, 0444, nam=
e##_show, NULL)
      |                         ^~~~~~~~~~
fs/f2fs/sysfs.c:639:1: note: in expansion of macro 'F2FS_GENERAL_RO_ATTR'
  639 | F2FS_GENERAL_RO_ATTR(ovp_segments);
      | ^~~~~~~~~~~~~~~~~~~~

Introduced by commit

  10e0b8ef8715 ("f2fs: expose # of overprivision segments")

--=20
Cheers,
Stephen Rothwell

--Sig_/JBvFRi3v7kF5WreTHlfE_IA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA+uvcACgkQAVBC80lX
0GzF2Qf/ebddaiq5m4wEUhyw/REEK26Fz4DfDu0tac0NrRhXqt9mD9UjMvgKPg15
xlIwlyo14ZL/+pdskHKAOsOF1l7ljN4fK0Saf8LDM1/kgiraILzXa9ZpHuOXUGsW
kwiYFA2BfNRD2nqL4dsgvVsXLVxbcu8axaOvcLHSFAc3cub2BVbE6jwpeZw10OJ2
JXBkHjle4ud4Jqbu7Vbe/axlyOA02Uzx352e8p7p3YTTiLtQe9yVFs9gs0YtOx85
iFWtyUu6OConMZJz4sxEL6MHtN7WzjysyQ+9MzyIoMoznOyc39AqftglOhKkCB88
eIsDBtHxK9+dn5xTp8dSUKYFlCoJJw==
=jNZK
-----END PGP SIGNATURE-----

--Sig_/JBvFRi3v7kF5WreTHlfE_IA--
