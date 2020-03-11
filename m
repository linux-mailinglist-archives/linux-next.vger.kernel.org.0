Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E57918117B
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 08:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbgCKHLp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Mar 2020 03:11:45 -0400
Received: from ozlabs.org ([203.11.71.1]:40623 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgCKHLp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Mar 2020 03:11:45 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48cjn35DqDz9s3x;
        Wed, 11 Mar 2020 18:11:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583910701;
        bh=ho8g4Hr7x80fXCgcTBaMtv85FnVp0fBOvHpikFCX93w=;
        h=Date:From:To:Cc:Subject:From;
        b=aVo1KIq/juUBNyhHoNTJZC5c/DohxRuuD3TO+LAKHfQAcvOk/HER6+ZBsfG2yAkCI
         Ughaz5MW8uSEsF4covPLzebFHClLjlq9a65eQBcFa/zyJsArxC74m+9VIupctzFBA3
         r+b7YwZSXRjnmxcdaWQZg8IQEbsKqzQl8BdCh4AcBGZIssnypw9m8DvidZq6LS+ik8
         LGyz24WuH5JR2xpDiaw0esX9as2P8XRipmmXUw+Q4ZNW0LMyqapE9DAbCjKiMCo0At
         WDLYrPZOGdxG7cAmAjEhYuGlbqKzVTOG7CuYgkPp5MViItx9TG2lJC6oELEf2GJdvR
         PsIH82o4TitUg==
Date:   Wed, 11 Mar 2020 18:11:20 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nitin Gote <nitin.r.gote@intel.com>,
        Kees Cook <keescook@chromium.org>
Subject: linux-next: manual merge of the akpm-current tree with the jc_docs
 tree
Message-ID: <20200311181120.4fb51c72@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=pK9XZzpjWvR34mrdQiH2zw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/=pK9XZzpjWvR34mrdQiH2zw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  Documentation/process/deprecated.rst

between commit:

  d8401f504b49 ("docs: deprecated.rst: Add %p to the list")
  76136e028d3b ("docs: deprecated.rst: Clean up fall-through details")
  7929b9836ed0 ("docs: Remove :c:func: from process/deprecated.rst")

from the jc_docs tree and commit:

  eacc9a8c9c2d ("Documentation/checkpatch: prefer stracpy/strscpy over strc=
py/strlcpy/strncpy.")

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

diff --cc Documentation/process/deprecated.rst
index e924d3197761,a0ffdc8daef3..000000000000
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@@ -93,44 -93,22 +93,44 @@@ will be NUL terminated. This can lead t
  and other misbehavior due to the missing termination. It also NUL-pads the
  destination buffer if the source contents are shorter than the destination
  buffer size, which may be a needless performance penalty for callers using
- only NUL-terminated strings. The safe replacement is strscpy().
- (Users of strscpy() still needing NUL-padding should instead
- use strscpy_pad().)
+ only NUL-terminated strings. In this case, the safe replacement is
+ stracpy() or strscpy(). If, however, the destination buffer still needs
+ NUL-padding, the safe replacement is stracpy_pad().
 =20
 -If a caller is using non-NUL-terminated strings, :c:func:`strncpy()` can
 +If a caller is using non-NUL-terminated strings, strncpy()() can
  still be used, but destinations should be marked with the `__nonstring
  <https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html>`_
  attribute to avoid future compiler warnings.
 =20
  strlcpy()
  ---------
 -:c:func:`strlcpy` reads the entire source buffer first, possibly exceeding
 +strlcpy() reads the entire source buffer first, possibly exceeding
  the given limit of bytes to copy. This is inefficient and can lead to
  linear read overflows if a source string is not NUL-terminated. The
- safe replacement is strscpy().
+ safe replacement is stracpy() or strscpy().
 =20
 +%p format specifier
 +-------------------
 +Traditionally, using "%p" in format strings would lead to regular address
 +exposure flaws in dmesg, proc, sysfs, etc. Instead of leaving these to
 +be exploitable, all "%p" uses in the kernel are being printed as a hashed
 +value, rendering them unusable for addressing. New uses of "%p" should not
 +be added to the kernel. For text addresses, using "%pS" is likely better,
 +as it produces the more useful symbol name instead. For nearly everything
 +else, just do not add "%p" at all.
 +
 +Paraphrasing Linus's current `guidance <https://lore.kernel.org/lkml/CA+5=
5aFwQEd_d40g4mUCSsVRZzrFPUJt74vc6PPpb675hYNXcKw@mail.gmail.com/>`_:
 +
 +- If the hashed "%p" value is pointless, ask yourself whether the pointer
 +  itself is important. Maybe it should be removed entirely?
 +- If you really think the true pointer value is important, why is some
 +  system state or user privilege level considered "special"? If you think
 +  you can justify it (in comments and commit log) well enough to stand
 +  up to Linus's scrutiny, maybe you can use "%px", along with making sure
 +  you have sensible permissions.
 +
 +And finally, know that a toggle for "%p" hashing will `not be accepted <h=
ttps://lore.kernel.org/lkml/CA+55aFwieC1-nAs+NFq9RTwaR8ef9hWa4MjNBWL41F-8wM=
49eA@mail.gmail.com/>`_.
 +
  Variable Length Arrays (VLAs)
  -----------------------------
  Using stack VLAs produces much worse machine code than statically

--Sig_/=pK9XZzpjWvR34mrdQiH2zw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5ojxgACgkQAVBC80lX
0GxXBQf/WEhrM1It9/SFpFrqBtc6vnNpfO3V8ejGlLJUwy4dxWIRmFTjsYLuMICy
LMPoNxquTTFhrsnEBW+KazaYFWU2AHoRSBnL2rnCNyCmGyqbXw0qiYBYzleX92CU
5TKelFgy/122JIbbpIziT1LysdlZ7mBVS9Asw5qNlcV4zDQNvVBFB7e8RdccVNTK
g4ASojd+XJ7XHuc4Vyp4T8AEZxamVG6gfCjNrt/t5rbjamk2d3a+naXRclluZfgk
CvlKLIQNXLo09IxLGFYh4cVYMo3qZTjBxFYyRFT7HR+5L7J4X1/TtdaKid4QGO5I
5EgtnHHyt6dcmZjWU9N+cCAPi9CXZA==
=wgrx
-----END PGP SIGNATURE-----

--Sig_/=pK9XZzpjWvR34mrdQiH2zw--
