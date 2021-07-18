Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52263CCB80
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 01:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhGRXHv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 18 Jul 2021 19:07:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:51533 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231821AbhGRXHv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 18 Jul 2021 19:07:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GSgXz0P78z9sX3;
        Mon, 19 Jul 2021 09:04:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626649491;
        bh=qGRz2HtiPAT2wYjfnCNlBtNosq97pxVlKoNQQNRmaW0=;
        h=Date:From:To:Cc:Subject:From;
        b=sk5A+CrzQCKE1KZHzFn84M59L/DffECo37m4By1iBtHkP/yoTqtNMKymLKYKv8RP7
         wTlOnx3nIN9E0Skr/6TkKbiQZpDgMAIBkgFfxo/uzBoVO+a+TGYYNPN+0ua9VItVaT
         gcdmy99Faj5nG6xwhA31kZDkKk33ETP9l5jNJoCA5y43ZBQQdXYgQt1/v4Lmq7ci9Y
         gJz0D3hXGJ9Bz1Tixt0nTo5k6HgIbcHfkOWQS6YPdgoIFPcCaX2dSEFSBqavHTmAAh
         u8qLe7zyixKwlurxAWPxW9tKUIt78GGIs0v+aiL0ZAeXtYibITURrk8Hwfew4Xxt9+
         ID04pEDg+5P+Q==
Date:   Mon, 19 Jul 2021 09:04:49 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Marco Elver <elver@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: linux-next: manual merge of the compiler-attributes tree with
 Linus' tree
Message-ID: <20210719090449.610a76b3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Co1eVVjvSmU7z9LgXCCxgG/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Co1eVVjvSmU7z9LgXCCxgG/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the compiler-attributes tree got a conflict
in:

  include/linux/compiler_attributes.h

between commit:

  ae4d682dfd33 ("compiler_attributes.h: cleanups for GCC 4.9+")

from Linus' tree and commit:

  7ed012969bbc ("Compiler Attributes: fix __has_attribute(__no_sanitize_cov=
erage__) for GCC 4")

from the compiler-attributes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/compiler_attributes.h
index 2487be0e7199,7b1fa5c30169..000000000000
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@@ -33,10 -33,10 +33,11 @@@
  # define __GCC4_has_attribute___externally_visible__  1
  # define __GCC4_has_attribute___no_caller_saved_registers__ 0
  # define __GCC4_has_attribute___noclone__             1
 +# define __GCC4_has_attribute___no_profile_instrument_function__ 0
  # define __GCC4_has_attribute___nonstring__           0
 -# define __GCC4_has_attribute___no_sanitize_address__ (__GNUC_MINOR__ >=
=3D 8)
 -# define __GCC4_has_attribute___no_sanitize_undefined__ (__GNUC_MINOR__ >=
=3D 9)
 +# define __GCC4_has_attribute___no_sanitize_address__ 1
 +# define __GCC4_has_attribute___no_sanitize_undefined__ 1
+ # define __GCC4_has_attribute___no_sanitize_coverage__ 0
  # define __GCC4_has_attribute___fallthrough__         0
  #endif
 =20

--Sig_/Co1eVVjvSmU7z9LgXCCxgG/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD0s5EACgkQAVBC80lX
0Gz0TAf/X/vSt96kYYZvX40HSW8K82aeU9dK+kLFkeINTPdGd49OQvR9ZBaePdf+
kHrC2yHItf9UJ+kAIpnR+HDZftZiuGqty97EGgnI4n8YM3AzGbXpGpV3ZyeIaiMf
DSr58rz3xhCLGqZTtYByFvw8nPSA9mYRYQdWenNTrz/7wbUmWsgtr3LM7I3z7xHF
yTAp2nCKppVWypS/otr54uDoDUcjB2fprJJlaBivwssVFrMmsPmGnvBW6XEMjJNK
G4QBQgkmwLE14q0I83YfJ3BnDQmoUt0hWV0RNRHNcUnc8NN6CCWMHvBM1iGPRUZd
phPDb4Spc+Q4PeElNpFtqObzKqqVsg==
=Ak/l
-----END PGP SIGNATURE-----

--Sig_/Co1eVVjvSmU7z9LgXCCxgG/--
