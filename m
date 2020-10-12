Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7BF28B0EC
	for <lists+linux-next@lfdr.de>; Mon, 12 Oct 2020 10:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgJLI4w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 04:56:52 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35871 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbgJLI4w (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Oct 2020 04:56:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C8sxG0Xhlz9sSG;
        Mon, 12 Oct 2020 19:56:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602493010;
        bh=0BDj2/7yaYfUlmI/C6roPX3WAC3VlzB0zh4re1S9MbQ=;
        h=Date:From:To:Cc:Subject:From;
        b=AWQ8TkvqMLwH8YTbfnDDqOyZkLcEpOI62qkzIy/RPcp96MZS1pE6++qZadbftztMZ
         FK4bPzVDBFHNS69XitrfO/70ShF/+2LcKuM8Ux3blxN/tZACezMpcCIVUsrxdLW/gF
         u0C78yBrphCSlApdgF03p4vP0FFo+csUG8GxQW/DGjpponHkYYrj6dF0Vn6/70rtdW
         FgnETtwTCzGZXd3cjgZuBY3o6Dw54BFdlUh7GwWJvmCZnhBH8oeSbLkzv8Rgb3rLje
         ZrZRmYZbcfRlIudzhhhFzhXMkrqZTsfLcbJdpA1gsn6oPp31ybNnsQU7tjBx6y3KbL
         Qi+fF4hC1m8yQ==
Date:   Mon, 12 Oct 2020 19:56:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     David Gow <davidgow@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Patricia Alfonso <trishalfonso@google.com>
Subject: linux-next: manual merge of the akpm-current tree with the
 kunit-next tree
Message-ID: <20201012195649.2047671f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.wrJV8t32EmvOT+.NOrF1n1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.wrJV8t32EmvOT+.NOrF1n1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  lib/kunit/test.c

between commit:

  45dcbb6f5ef7 ("kunit: test: add test plan to KUnit TAP format")

from the kunit-next tree and commit:

  e685acc91080 ("KUnit: KASAN Integration")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc lib/kunit/test.c
index de07876b6601,dcc35fd30d95..000000000000
--- a/lib/kunit/test.c
+++ b/lib/kunit/test.c
@@@ -15,11 -16,16 +16,6 @@@
  #include "string-stream.h"
  #include "try-catch-impl.h"
 =20
- static void kunit_set_failure(struct kunit *test)
 -static void kunit_print_tap_version(void)
--{
- 	WRITE_ONCE(test->success, false);
 -	static bool kunit_has_printed_tap_version;
 -
 -	if (!kunit_has_printed_tap_version) {
 -		pr_info("TAP version 14\n");
 -		kunit_has_printed_tap_version =3D true;
 -	}
--}
--
  /*
   * Append formatted message to log, size of which is limited to
   * KUNIT_LOG_SIZE bytes (including null terminating byte).

--Sig_/.wrJV8t32EmvOT+.NOrF1n1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+EGlEACgkQAVBC80lX
0Gz+GQf+LCbynHutK7u7OFR4ocFe6LBwX3VNnT1+NXffwaPfqTd/DC6+hSfevPrq
e8bq5y/xFVjvEKPsaQb5AfpfqsTnN4qAOsypbTmA6AoF9FMds5BIUKRwjWJ3NhQW
IAbdEa12oynd2/2f4wrXYS67W2S11ZzU2bbZuAgyWCyaVC7yZ//sMzylhDRm0lhW
JcqxC+ZfHODoWM31fQ9AC3e/4sPmUYLkpEfDlAH2yqG1+u6J7HEZcZ6OrUJceZMi
T+58SsFgb5QuMl/fQATy2jvFhhGc4j8ePy9EN8pGff54Ia2aoVI2/Y+WGH8bCOZZ
wOheGFl3vx1EZHH2JotcxXv+23C2fQ==
=Ewv4
-----END PGP SIGNATURE-----

--Sig_/.wrJV8t32EmvOT+.NOrF1n1--
