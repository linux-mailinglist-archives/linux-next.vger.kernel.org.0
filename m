Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 457CCCB3EF
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2019 06:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387540AbfJDEhg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Oct 2019 00:37:36 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57257 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726569AbfJDEhg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 4 Oct 2019 00:37:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46kxth3cLFz9sPv;
        Fri,  4 Oct 2019 14:37:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570163853;
        bh=T33u6X8G9UN2xJqzu1eNRQMNTlnfYibIjsC3cpwy71Q=;
        h=Date:From:To:Cc:Subject:From;
        b=HJM9FO+oAxmUkPjr/9HaoWWjEqXF4aW5D+iNk92YiPWI3TS2csUO5QXAWVm/uF55O
         +M8/W2AM13I1PI7JbqxpVx0rAL9r4R9cpzOMjIIlan6M1GQbm0Yh74NkuzaZQg+WLm
         FvipUMjJ4JpjQ5LW69bdhdxY6YK/RTHHtogXmmoYPbGtjyZfKjH5XIgXAi0jl3gJXo
         zu+Dt9YNLSKbgQXCKfUhmp5hE1TXhCu5+J1gDBSpthoJDZhB8AmsVecdYMum3DeXZM
         LdtJS3HuPzghrPxg/3uiNWLT279+9wqeflHgVF0ZBZDOTcm+ZVMW8CDlQ4fsXCy4Hk
         GjNDuHy/zpaXA==
Date:   Fri, 4 Oct 2019 14:37:31 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jinke Fan <fanjinke@hygon.cn>
Subject: linux-next: build failure after merge of the rtc tree
Message-ID: <20191004143731.30f97c7f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3NQvkFj/O3vw87TecTU4EbN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3NQvkFj/O3vw87TecTU4EbN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rtc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

drivers/rtc/rtc-mc146818-lib.c: In function 'mc146818_set_time':
drivers/rtc/rtc-mc146818-lib.c:176:6: error: 'boot_cpu_data' undeclared (fi=
rst use in this function); did you mean 'bootmem_data'?
  176 |  if (boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_AMD ||
      |      ^~~~~~~~~~~~~
      |      bootmem_data
drivers/rtc/rtc-mc146818-lib.c:176:6: note: each undeclared identifier is r=
eported only once for each function it appears in
drivers/rtc/rtc-mc146818-lib.c:176:34: error: 'X86_VENDOR_AMD' undeclared (=
first use in this function); did you mean 'X86_VENDOR_ANY'?
  176 |  if (boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_AMD ||
      |                                  ^~~~~~~~~~~~~~
      |                                  X86_VENDOR_ANY
drivers/rtc/rtc-mc146818-lib.c:177:34: error: 'X86_VENDOR_HYGON' undeclared=
 (first use in this function); did you mean 'X86_VENDOR_ANY'?
  177 |      boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_HYGON)
      |                                  ^~~~~~~~~~~~~~~~
      |                                  X86_VENDOR_ANY

Caused by commit

  1e2c8aadedbe ("rtc: cmos: fix the AltCentury value on AMD/Hygon platform")

This driver file is built for several different architecture, but
the added code is X86 specific :-(

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/3NQvkFj/O3vw87TecTU4EbN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2WzIsACgkQAVBC80lX
0Gzmwgf/Tufdr5G0dHnLnZ32RVEwQIvO1GHk9ektmXQtDI28UHTtXMdL6EK63LfJ
UFtwYwenfxsmDqKU3wbljQxUjikstvEpiOJ4K9BDQm4BnYsFcyfNrduqph/RiP0T
e98awjLeZzS7HO+hKkv7A16NRBHQMswdTqIWLlxwvgpgLezJMh76IviJ42OKb4a2
DjHetLvIObkr0WZVrIK9yGW7sDhl8QHs/h9ehLxf/OdjDjKaDw4gft+cmYVlTfPd
xPJ81CA8zGYq4VwnYLjKN1Lh2VOnDygqMPe6lH43fd79mpt5jFZvF8D1XeJPyGI1
U6JsV1meKMw7DndvqWmPIFb5P2VnWQ==
=Q27T
-----END PGP SIGNATURE-----

--Sig_/3NQvkFj/O3vw87TecTU4EbN--
