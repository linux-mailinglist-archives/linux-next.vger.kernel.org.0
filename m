Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68268412A3C
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 03:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbhIUBVW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Sep 2021 21:21:22 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:41317 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhIUBTV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Sep 2021 21:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632187072;
        bh=6wyYmrb2kcZgr8Efd7F0inCq6YkAUqw/Xp0N6jTKS6M=;
        h=Date:From:To:Cc:Subject:From;
        b=WjswO1BN0dvBnvkNyPnJ1nplsEB+LKXCm/fUKXF8Nhk2pzx/7ow4te2N766WtZmtv
         SoeI4l4ukFSZzIv2rWAsOa0kEBdUgaYID3i9L3m8/Nenb7CHnMSuElGw+r1pNJ0lz9
         Pc0kQG2kzHGCfbuhB+Hjedva324V9j9jGR/L1bl02YoETkoUr6MyHU9ZvD2jBxKaVY
         zLV+qwlqHaGaYEO5cVai26ENWK9vAZLmATI+tlxbtpLoBWqgUPW3CNQ/qBovP0Bf9A
         ocU9t8ycK+Z9fHiT2KjZetpmggKQ3IUSP5qQPSedHUlOmZuEAZTSGKQ1Wh+R+onaby
         N6d7of6uqbQDg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HD3Sv6BlRz9t0Z;
        Tue, 21 Sep 2021 11:17:51 +1000 (AEST)
Date:   Tue, 21 Sep 2021 11:17:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Eugene Syromiatnikov <esyr@redhat.com>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the selinux tree with Linus' tree
Message-ID: <20210921111750.6f7bd218@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pp/+xWKgy9H3j7Y1el9onwW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pp/+xWKgy9H3j7Y1el9onwW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the selinux tree got a conflict in:

  fs/io-wq.c

between commit:

  dd47c104533d ("io-wq: provide IO_WQ_* constants for IORING_REGISTER_IOWQ_=
MAX_WORKERS arg items")

from Linus' tree and commit:

  5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_u=
ring")

from the selinux tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/io-wq.c
index b5fd015268d7,dac5c5961c9d..000000000000
--- a/fs/io-wq.c
+++ b/fs/io-wq.c
@@@ -14,7 -14,7 +14,8 @@@
  #include <linux/rculist_nulls.h>
  #include <linux/cpu.h>
  #include <linux/tracehook.h>
+ #include <linux/audit.h>
 +#include <uapi/linux/io_uring.h>
 =20
  #include "io-wq.h"
 =20

--Sig_/pp/+xWKgy9H3j7Y1el9onwW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFJMr4ACgkQAVBC80lX
0GxvUwf/S59kX8Ly3PbcBDa/NTtXyyAyq3A7zPP5fd/7X1vH2PUGQnzcYZWKQXrN
XAahUOG6H0+xP8A3a/lRZp8EjCNznTIE5kIf+g5qlY10wgCQryoF9KEkwsh5PmdH
liEvqdPKuv0I5PEwqnv4KTFOh2B9Yf+LOUkkdHI5pGRBeb5bSD28663ldR8LXkSa
CawJwCFcV70TugiLIngz5qeSnSfeO3gIsWFO9B7l+GIjU3Sptxj+jWfA5YzCFuLN
cpu1HenLhhdGBLE9o1MAWDn/+vuyDdX9w+ERWgt26mi64TQxy5M7Qrn28vlXLuTP
jmdlPE7fgqNBVRbLD9VpgfvDJs8SQg==
=lTRn
-----END PGP SIGNATURE-----

--Sig_/pp/+xWKgy9H3j7Y1el9onwW--
