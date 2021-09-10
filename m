Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E8740653C
	for <lists+linux-next@lfdr.de>; Fri, 10 Sep 2021 03:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbhIJBe7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Sep 2021 21:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhIJBe7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Sep 2021 21:34:59 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC4CBC061574;
        Thu,  9 Sep 2021 18:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631237626;
        bh=TTNbzhm/WJ9aozQQd5bRAmPji9SmhQnxav+eScNroaM=;
        h=Date:From:To:Cc:Subject:From;
        b=NPEBRlH61bo4hQLFGTog4AH6xU3UfTJ7IZzvzZaJkl1JWhQ61YH7KbBHs6B9rTVVJ
         D9gfrqi0XWoX4qqVKHjluPg6KbbUvEJGNALZYpB0EsgGX+ONLzz7+a9UOuqt5Pnpcz
         dB05vsjQJr9TZkXJs9aiAPxi4j92WyhroX7hbBFZrMoJ7bNzdu7KrpNm1CRg6QIHv3
         2/Pi50tMoHbhzx/+Atc5iMPcB5oN6xuo29opVxSAfuvmuueFILE/DC1nBfkCEZ578C
         25XDl4LYawTc32t2Gf0+dCCr/fcYB4KDHF6UGYlfyUsdMyUYY9UpplSjwa+r7d+rEB
         lHN5RNds7O87w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H5JLL4229z9sVw;
        Fri, 10 Sep 2021 11:33:46 +1000 (AEST)
Date:   Fri, 10 Sep 2021 11:33:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: linux-next: manual merge of the kspp tree with the
 compiler-attributes tree
Message-ID: <20210910113345.62bda9e6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fYJFVjRFtPZsOpVaQ4FZ30b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fYJFVjRFtPZsOpVaQ4FZ30b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got conflicts in:

  include/linux/compiler-gcc.h
  include/linux/compiler_types.h

between commit:

  b83a908498d6 ("compiler_attributes.h: move __compiletime_{error|warning}")

from the compiler-attributes tree and commit:

  122b05c65c5d ("compiler_types.h: Remove __compiletime_object_size()")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/compiler-gcc.h
index 21c36b69eb06,01985821944b..000000000000
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@@ -41,8 -41,9 +41,6 @@@
 =20
  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUN=
TER__)
 =20
- #define __compiletime_object_size(obj) __builtin_object_size(obj, 0)
 -#define __compiletime_warning(message) __attribute__((__warning__(message=
)))
 -#define __compiletime_error(message) __attribute__((__error__(message)))
--
  #if defined(LATENT_ENTROPY_PLUGIN) && !defined(__CHECKER__)
  #define __latent_entropy __attribute__((latent_entropy))
  #endif
diff --cc include/linux/compiler_types.h
index b6ff83a714ca,c43308b0a9a9..000000000000
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@@ -290,11 -290,13 +290,6 @@@ struct ftrace_likely_data=20
  	(sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short) || \
  	 sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
 =20
- /* Compile time object size, -1 for unknown */
- #ifndef __compiletime_object_size
- # define __compiletime_object_size(obj) -1
 -#ifndef __compiletime_warning
 -# define __compiletime_warning(message)
 -#endif
 -#ifndef __compiletime_error
 -# define __compiletime_error(message)
--#endif
--
  #ifdef __OPTIMIZE__
  # define __compiletime_assert(condition, msg, prefix, suffix)		\
  	do {								\

--Sig_/fYJFVjRFtPZsOpVaQ4FZ30b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE6tfkACgkQAVBC80lX
0GxSPQf/cZwU1II1Qwt4wzRxqYbubzCmSiul2SrdUy99zS32KhUWwuatDtZFkUcb
QZQgZ4mFA/m1QKnEgZqHhG4CoCNmOrkSQmTf5V8ZrfJUKu+8Aujt+ulUXouimIeJ
GLf/+6ypT5OW4B2BBPkVS3b866MEdv4Kl5KduxHQz9fNbFM1k4wUs88qGVZzR6cf
EPvi5nTcahTMhY0HpYybKjCRWY4tpv/Xl1Sbrua3dr2F6kZUu27mxjnF08EKANG5
4Ri0t4RXukVVnE3S984sH3MjCf46BdQjZbDQehnq8ElHR/WblwZ+0qMwxl0U27U1
Uk9fRcACjMUehDwgfQOwRvI1siY2pQ==
=bLgg
-----END PGP SIGNATURE-----

--Sig_/fYJFVjRFtPZsOpVaQ4FZ30b--
