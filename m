Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 072FD202A85
	for <lists+linux-next@lfdr.de>; Sun, 21 Jun 2020 14:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730008AbgFUMn2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Jun 2020 08:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730002AbgFUMn1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 21 Jun 2020 08:43:27 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8856BC061794;
        Sun, 21 Jun 2020 05:43:27 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49qXJr41Hwz9sSJ;
        Sun, 21 Jun 2020 22:43:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592743405;
        bh=/Y/a9qNV3HIhNZm3vmufHp8jcmmMM6utoXB4S/oj4jI=;
        h=Date:From:To:Cc:Subject:From;
        b=PSKiObgVmbqG/CXgzmw4DOkurAwgaW6FKWp9eKydmLYF3JhoD12gc3d0nG4h3gx1a
         zwDZUzuP+ZjatW+Lt0Ag82Awcbh2YaiI0lGY6dRO3qELyRoAGKV1gy3rm5r/JM5Wjg
         yGs2FEKO35po0sl2d+A4p4alBbW/n/r3AKADVlomb7i9hagNfSURPjX5dodhPk0+Zd
         ZNTTtO7ze6ynFH42MWTE78nCjD2YvM2rr3PG8X38kReeROww/dOO7ZXmkD9IkY4Xcf
         DqCc6dYG96TANPumnpnbygaGJYTJRbY6nmc/MfC1yzFCxNdsAl2mrf6SDhP5xTqi6Z
         UNrGgDLfElIiA==
Date:   Sun, 21 Jun 2020 22:43:22 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Kees Cook <keescook@google.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the pidfd tree with the kspp tree
Message-ID: <20200621224322.4e90f1a2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j=4p44Urs=Ny+=DV2bLQgMW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/j=4p44Urs=Ny+=DV2bLQgMW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  fs/file.c

between commit:

  d3868eea5cbc ("fs: Move __scm_install_fd() to __fd_install_received()")

from the kspp tree and commit:

  60997c3d45d9 ("close_range: add CLOSE_RANGE_UNSHARE")

from the pidfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/file.c
index 9568bcfd1f44,340bc9569f9d..000000000000
--- a/fs/file.c
+++ b/fs/file.c
@@@ -10,8 -10,8 +10,9 @@@
  #include <linux/syscalls.h>
  #include <linux/export.h>
  #include <linux/fs.h>
+ #include <linux/kernel.h>
  #include <linux/mm.h>
 +#include <linux/net.h>
  #include <linux/sched/signal.h>
  #include <linux/slab.h>
  #include <linux/file.h>
@@@ -19,8 -19,7 +20,9 @@@
  #include <linux/bitops.h>
  #include <linux/spinlock.h>
  #include <linux/rcupdate.h>
 +#include <net/cls_cgroup.h>
 +#include <net/netprio_cgroup.h>
+ #include <linux/close_range.h>
 =20
  unsigned int sysctl_nr_open __read_mostly =3D 1024*1024;
  unsigned int sysctl_nr_open_min =3D BITS_PER_LONG;

--Sig_/j=4p44Urs=Ny+=DV2bLQgMW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7vVeoACgkQAVBC80lX
0GzfWwf/TMjzSKKpbNH081RLpqLwJbkLDUdY6NyezJvuElG5oJDiDo8i6SBtMVPv
YEOjmuR3e87O0Ji5Dzpa/3xWwBztahh1mHAeEI/7tc5ZepIhp4ImWwdG27QAmv+e
CSoHKtVOsFhWibg61DPf/UlVmDRHO3Sv7FFu0qDqR2xIbT9ZxvejroNOuJkHAvTX
xA+HRUrkbZLUDSPyzQmCfOdWKjvxWmtnbYovy8Uw9MzwVTxlNzey3m4A5OLUhK52
aQT1XqX5Pnsxo1Yr9MOjI2q6bq/+73ESzeiByH6uT74nyMom3kBzENjCfWs/Rn9r
41ahIrCg4dEgO81gtPTaf50+Upx9KA==
=shze
-----END PGP SIGNATURE-----

--Sig_/j=4p44Urs=Ny+=DV2bLQgMW--
