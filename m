Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D331C21AF45
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 08:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgGJGSM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 02:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727772AbgGJGSL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jul 2020 02:18:11 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D87C08C5CE;
        Thu,  9 Jul 2020 23:18:11 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B32sX0CGnz9sRK;
        Fri, 10 Jul 2020 16:18:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594361888;
        bh=uebh7Nj+FZYez9qaSQRIVhMsqdQtviRjGVGzYgirTWo=;
        h=Date:From:To:Cc:Subject:From;
        b=XqqlC1qCopY/k+4JUsz77Op4qC/UktVCViUgw0QJ3im+6So+nyWLJ8LS46D+OWLG+
         MzFukU5KFg1YvrvAjR72AM87GBaqUFbVXBecw8IMWxnXqzTAeMNcQlJpEO4DAkFFbJ
         oMwQHnHOycBTH0JjVHKvhLLluWVkxaquKBGrsxnnE6GSMt+iD8cYi2+Z72HnDXljPC
         nBTaY5+T8axvyReUyXc2CQa9LN0z7ZUnOgamn09BAQyTraeeEZR+lXhPB+3SDziCTr
         29zN8qT1ytAA4xRlb/6zAf8j8Uquq7up19vdOvq7LpmmccBCiqyIOqlxu99Bm49Y4u
         ujx0b/PwUUOXw==
Date:   Fri, 10 Jul 2020 16:18:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Kees Cook <keescook@chromium.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the pidfd tree with the seccomp tree
Message-ID: <20200710161806.28d8c856@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BKyrhWxOocKHwTO5Q19txOk";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BKyrhWxOocKHwTO5Q19txOk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  fs/file.c

between commit:

  21fec66fd4be ("fs: Move __scm_install_fd() to __receive_fd()")

from the seccomp tree and commit:

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
index 4fb111735d1d,340bc9569f9d..000000000000
--- a/fs/file.c
+++ b/fs/file.c
@@@ -18,7 -19,7 +19,8 @@@
  #include <linux/bitops.h>
  #include <linux/spinlock.h>
  #include <linux/rcupdate.h>
 +#include <net/sock.h>
+ #include <linux/close_range.h>
 =20
  unsigned int sysctl_nr_open __read_mostly =3D 1024*1024;
  unsigned int sysctl_nr_open_min =3D BITS_PER_LONG;

--Sig_/BKyrhWxOocKHwTO5Q19txOk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8ICB4ACgkQAVBC80lX
0Gxb3gf/XR6DTlWiYpt8lqJWXNtw298QPZ+oY0HhzoIdMn5fmODYdVrvygpy0Ee0
hLE3ijXyEXgWvBfY+eiQ9Xj2lGbuXFnay2pfjJJXjA5YvdpE5p4dunEaqbte95Af
1YtpdFu+JvgPoSg7Xxzw6HIX0FMohG04N7NGZcLqz/w3ZZgEveBeGX0lDBmoff2c
5FX1ydeh04dnXEEbNDUlr2QsW01z58+6Hgr3x+Ov86F1JG2hA/pHJmYQ+vu2e3sy
sVAeQtdPH8MKD3FPQor12c+D86BPlIQjwfs+NxbVCWyJuu3bUN+LOW5aXMtY40Td
FQ0oRLXCYY2QgB/+UZ5JzDuAG/FX3w==
=aYHZ
-----END PGP SIGNATURE-----

--Sig_/BKyrhWxOocKHwTO5Q19txOk--
