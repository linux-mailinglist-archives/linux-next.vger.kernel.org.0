Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56EFB23B5CF
	for <lists+linux-next@lfdr.de>; Tue,  4 Aug 2020 09:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729886AbgHDHfA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 03:35:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33857 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729566AbgHDHfA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 Aug 2020 03:35:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BLRNf0vCXz9sSt;
        Tue,  4 Aug 2020 17:34:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1596526498;
        bh=eye2JhZwravnhFeIr7WolCHUFPGiA0p5ArKH3CJordY=;
        h=Date:From:To:Cc:Subject:From;
        b=l7fIXiLEaZcCAFlcGIAtqfB9b5c8gy3cQWNVp2QPZUOUs5RUZrqUvX+qp4sXSHqTZ
         VaZ+t48TjXm/CmmvKWn/cfwFtI4sApuzaSAbVMDefUD64C1ikwXQg+ndK8fKq8Qc8z
         sMthhnv73p8tmJcIME/8SIFJhJNOizyx0/T3wQCiaEACzb3pYWvT80xi7Wc5J5CkK8
         LG9H24FNyLJsoj81JfbABf1BcuVKSq2dY3ASqF031YwNJwUSv54bP0VTCdqMK2iPyR
         zwDDfXS3alkTdUVpopf3MI6IHRiuzuLBcErtkUJ/85ZbyH2E3lABRPspHw5wl0VPer
         lIinFNvWMfAcA==
Date:   Tue, 4 Aug 2020 17:34:56 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: build warnings after merge of the fsinfo tree
Message-ID: <20200804173456.01c819ea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7uupr6YPSo=a8lzNq8=sPPI";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7uupr6YPSo=a8lzNq8=sPPI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fsinfo tree, today's linux-next build (powerpc
allyesconfig) produced these warnings:

samples/vfs/test-mntinfo.c: In function 'display_mount':
samples/vfs/test-mntinfo.c:146:19: warning: format '%llx' expects argument =
of type 'long long unsigned int', but argument 3 has type '__u64' {aka 'lon=
g unsigned int'} [-Wformat=3D]
  146 |  printf("%10u %8llx %2x %x %5s %s",
      |               ~~~~^
      |                   |
      |                   long long unsigned int
      |               %8lx
  147 |         info.mnt_id,
  148 |         (info.mnt_attr_changes +
      |         ~~~~~~~~~~~~~~~~~~~~~~~~
  149 |   info.mnt_topology_changes +
      |   ~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                             |
      |                             __u64 {aka long unsigned int}
  150 |   info.mnt_subtree_notifications),
      |   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
samples/vfs/test-fsinfo.c: In function 'dump_fsinfo_generic_mount_all':
samples/vfs/test-fsinfo.c:384:30: warning: format '%llu' expects argument o=
f type 'long long unsigned int', but argument 5 has type '__u64' {aka 'long=
 unsigned int'} [-Wformat=3D]
  384 |  printf("%5x %5x %12llx %10llu %s\n",
      |                         ~~~~~^
      |                              |
      |                              long long unsigned int
      |                         %10lu
  385 |         r->mnt_id, r->parent_id, (unsigned long long)r->mnt_unique_=
id,
  386 |         r->mnt_notify_sum, mp);
      |         ~~~~~~~~~~~~~~~~~    =20
      |          |
      |          __u64 {aka long unsigned int}

--=20
Cheers,
Stephen Rothwell

--Sig_/7uupr6YPSo=a8lzNq8=sPPI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8pD6AACgkQAVBC80lX
0Gwa8wf8DgnGrB0x4wEbuaaT8lvLn/sSXiV5PPBP093nODUVeGpA8d5A9XhSqgVF
Xzk5qjqdFcfCM+MlZCYxpoKlfWU2JgBz2NddOGzG3UY9Z3e2r7uJYvF2+FKduuLi
CW3P/pvu1TFYuZfQ/4hGgIHanMxAn/2EK+2qcD1+gMkah+I/M/LC6fWM2ayD4Iwz
KnqAtw5dHbiPelDlgd0H5qYKgTUA/gJMl63aOFFnEmAXIjQ2r/d7lzzhfi8t+Rkl
xAMI9T9iAVn4qUU4zOJ8N9iQHVlDwhpxEfK6GsIZh57sWGzmJuoOspDuoSODdNpA
H6lW3I3v6fOLlXaVNO6KW4kF66Tg6Q==
=JZqY
-----END PGP SIGNATURE-----

--Sig_/7uupr6YPSo=a8lzNq8=sPPI--
