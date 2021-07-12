Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5273C4089
	for <lists+linux-next@lfdr.de>; Mon, 12 Jul 2021 02:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhGLAkI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Jul 2021 20:40:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34651 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229660AbhGLAkI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Jul 2021 20:40:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GNPwr6GXQz9sV8;
        Mon, 12 Jul 2021 10:37:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626050239;
        bh=U048ebzJE4FLKmIjv0zcGUtfyQKWWElJJmfx/ZZ/poA=;
        h=Date:From:To:Cc:Subject:From;
        b=CsfsAdt77vOqemjgps5YiHT6AZJiUOmCvarRzHSfP5/T5HZPEmtnh87+fom4rII5d
         ++TWRm4Yer1LQ3EWe2kFNi8Zyr1owNoHIMe0oa928t7fWhsyC41l9ylDhjJpqhHrXn
         kx7wJfFjCnhytHITXejtqIZe5ssFwkKoXQJ7k+MlVaIEyXKx7KDXmJTgkmBIwTNcI4
         nVDiVlDS5NYmoyzyxjQOPfszUQS8A+tkLGnKlQMPAjnT43covGAzK3m9/vmnQ2hC5C
         NEr/NMnDYJ0U8/epGBv/nqwi+/w8RIKCiGMGj4UgI28iqemr9kJeK+XSOF3vLDMzBk
         Z2jxqz7SaLJQg==
Date:   Mon, 12 Jul 2021 10:37:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Bixuan Cui <cuibixuan@huawei.com>, Finn Behrens <me@kloenk.de>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: linux-next: manual merge of the rust tree with Linus' tree
Message-ID: <20210712103715.0993fdf2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/R6_yau2ETXRxwIh2NJ4ZVyx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/R6_yau2ETXRxwIh2NJ4ZVyx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  include/linux/kallsyms.h

between commit:

  9294523e3768 ("module: add printk formats to add module build ID to stack=
traces")

from Linus' tree and commit:

  f2f6175186f4 ("kallsyms: increase maximum kernel symbol length to 512")

from the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/kallsyms.h
index a1d6fc82d7f0,5cdc6903abca..000000000000
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@@ -15,11 -14,9 +15,11 @@@
 =20
  #include <asm/sections.h>
 =20
- #define KSYM_NAME_LEN 128
+ #define KSYM_NAME_LEN 512
 -#define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s]") + (KSYM_NAME_LEN - 1=
) + \
 -			 2*(BITS_PER_LONG*3/10) + (MODULE_NAME_LEN - 1) + 1)
 +#define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s %s]") + \
 +			(KSYM_NAME_LEN - 1) + \
 +			2*(BITS_PER_LONG*3/10) + (MODULE_NAME_LEN - 1) + \
 +			(BUILD_ID_SIZE_MAX * 2) + 1)
 =20
  struct cred;
  struct module;

--Sig_/R6_yau2ETXRxwIh2NJ4ZVyx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDrjrsACgkQAVBC80lX
0Gz8Xwf/aMcjVj9OpLfmwu0SYAFbjitFfXU16zIGdhkxzWIxrga4H4ZxE9Uh4GkV
fngSCR0bpTM2qi2sprca20yakxvr5AeFH4diihOXUbHIGfoH9IMsWy5FoAHwXT9F
h9kuZ+Xt25lQnoqDPablGmp7n3BRnlQz9WPx74dKa14u+SEWxFQVC3BdMWCBcCG7
ux2DBGafp03/4Buh2jccCx9V4aINpmfZsBvAnETzs8GvWW+2Ytc/4mno4NmEbTbz
bzQJiXVmoZ106zNK1vgEPtnb9IgW4sqEqWgi+vu9CNqwCfCRQOj1XOquKbKUIcfh
cqUDXa4o1vippYZ8IOuUcxywyk59lQ==
=FA7C
-----END PGP SIGNATURE-----

--Sig_/R6_yau2ETXRxwIh2NJ4ZVyx--
