Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB06C28AFD5
	for <lists+linux-next@lfdr.de>; Mon, 12 Oct 2020 10:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbgJLINr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Oct 2020 04:13:47 -0400
Received: from ozlabs.org ([203.11.71.1]:56801 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727457AbgJLINr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Oct 2020 04:13:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C8rzV27Z5z9sS8;
        Mon, 12 Oct 2020 19:13:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602490424;
        bh=/RQGULKhs5Jj4kjp7KiecigKGlItBPjp7kcqUU1M8I4=;
        h=Date:From:To:Cc:Subject:From;
        b=hz/pTI0+CKpSjCh8G4OLF6qCl48Nj9yhhJ02Phx5yhk8TlrVxS5pvgBeOU3U+Cd8z
         dRrqvUvaeQS4ojwkd/TWxH1TNlq2r3fZ15jCxa+Mw09lO821k2jQrrCIqwu+c09yzW
         aaGCeIGdYlTgEVQ371D9TzCmTuH+njDN+2CFZsTX0pPb3ZqRGyfh8adKK5PLA1WOrW
         Z/vHCrtl1KPUxtLHT2SEU5C1P6RTlVO4LS46/CvTaWf7F0Azz7aItn9jShxQJsZmTj
         4tmrZ8yGkHbJR19iYvE1WNSwnDLFl3cczPC4m0yJrTFkZTto1u2AI02kFuxzkb9Uhc
         Idrw599T69pWQ==
Date:   Mon, 12 Oct 2020 19:13:40 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Corey Minyard <cminyard@mvista.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Xianting Tian <tian.xianting@h3c.com>
Subject: linux-next: manual merge of the counters tree with the ipmi tree
Message-ID: <20201012191340.78ebbaea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0KS4xOikIQTAin_m61NnD8D";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/0KS4xOikIQTAin_m61NnD8D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the counters tree got a conflict in:

  drivers/char/ipmi/ipmi_msghandler.c

between commit:

  f8910ffa81b0 ("ipmi:msghandler: retry to get device id on an error")

from the ipmi tree and commit:

  dc87264ac991 ("drivers/char/ipmi: convert stats to use counter_atomic32")

from the counters tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/char/ipmi/ipmi_msghandler.c
index 8774a3b8ff95,36c0b1be22fb..000000000000
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@@ -34,7 -34,7 +34,8 @@@
  #include <linux/uuid.h>
  #include <linux/nospec.h>
  #include <linux/vmalloc.h>
 +#include <linux/delay.h>
+ #include <linux/counters.h>
 =20
  #define IPMI_DRIVER_VERSION "39.2"
 =20

--Sig_/0KS4xOikIQTAin_m61NnD8D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+EEDQACgkQAVBC80lX
0Gy6UQf/fERKmG8Wt/QbJwaKNKM/FeDhPsLnlzT4sMMuDB2l/0t94wOmnFkeHCd1
r3lN42lcq6O/2Q+rX++5cgdadCqQAZKv6MmMHUfaLI7KEerxtmGDpoJJyEFVLAnD
uXSndL0t7cxzcsHSDGAB1Z8BYm+Iztu6mGPrRbEzlEDbrahr4pRDckCcYdnYiItm
pWl40CJexb8l/YpmgPPE3oaoPe7ktFqcjkHvXgL19bmQ8mnYEzL/872CFj6QJupQ
+IM+BnddsgRT3azHaRPjycFkaxrGMWCoRsoVnYIham51MgfAFqO04X3SSezLeFcp
ZfwC5bki5cfe5efFFy857LIbn0pVyg==
=M2Lz
-----END PGP SIGNATURE-----

--Sig_/0KS4xOikIQTAin_m61NnD8D--
