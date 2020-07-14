Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53D3B21EB26
	for <lists+linux-next@lfdr.de>; Tue, 14 Jul 2020 10:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgGNITi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jul 2020 04:19:38 -0400
Received: from ozlabs.org ([203.11.71.1]:32839 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725793AbgGNITi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Jul 2020 04:19:38 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B5YMq4R6kz9sDX;
        Tue, 14 Jul 2020 18:19:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594714776;
        bh=5FTY9IYSNtTjBV9hCkBrN5BM8oS4XK8NEYCYAmC4pho=;
        h=Date:From:To:Cc:Subject:From;
        b=XYiTOvRAwF0WInq7fmx9uySQwHS4QU7+5H4wNOXfe5qujQyFqufHzXjv/gV4rAURK
         7qc7LkQ+72RkF0nxyN9X7vZk2EMHfOAzEt5nPAT0OMJZaFsBucslFNG9TYQ/HI/w9q
         AT/AihDv9ikR4MY2i3Z+f+GIBHvCd4kHdr+Tbl4BwAepTQRrx1nx89Hr2qtkdDvuXY
         4WvWTPJi9twzf3GoKZ/Xix7HVyhjUDUOljPnAsC9UAiQxMaQUQVStkFDPD+pWh9Iu1
         VraZ+nWWt4gCXkr0WyLblK6wV2Q8ZhdgZWwEU3+Ab6T2iKs6DIG/+AAeXHvp1WtUBQ
         iaNESJaKdNHog==
Date:   Tue, 14 Jul 2020 18:19:34 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Hocko <mhocko@suse.com>
Subject: linux-next: manual merge of the akpm-current tree with the jc_docs
 tree
Message-ID: <20200714181934.58fc201c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pWHLCaf7d0uibWm8g.V_EP+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/pWHLCaf7d0uibWm8g.V_EP+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  Documentation/filesystems/proc.rst

between commit:

  059db4341303 ("Documentation/filesystems/proc.rst: copy-editing cleanup")

from the jc_docs tree and commit:

  7079aa70a489 ("doc, mm: clarify /proc/<pid>/oom_score value range")

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

diff --cc Documentation/filesystems/proc.rst
index e024a9efffd8,78a0dec323a3..000000000000
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@@ -1680,7 -1673,10 +1672,10 @@@ requires CAP_SYS_RESOURCE
  3.2 /proc/<pid>/oom_score - Display current oom-killer score
  -------------------------------------------------------------
 =20
+ Please note that the exported value includes oom_score_adj so it is effec=
tively
+ in range [0,2000].
+=20
 -This file can be used to check the current score used by the oom-killer i=
s for
 +This file can be used to check the current score used by the oom-killer f=
or
  any given <pid>. Use it together with /proc/<pid>/oom_score_adj to tune w=
hich
  process should be killed in an out-of-memory situation.
 =20

--Sig_/pWHLCaf7d0uibWm8g.V_EP+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8NapYACgkQAVBC80lX
0GyXuwf/dvy90fXsK1Ge1EvLGc0AaEgeuMrARjFynOSHOEwAUWtmXAo23qd6HvXI
SzrSC9FH61rjd/XEtJT/qPPBPd1POeK4+vX1aZ452zxNVZJB442N3ksm+BKqgGDv
kXtWtRjjg8ath8PNCR9d6LXuTKvZ5jmlHrcYcKKXnCS5NLF1EjZW06wdLaVOPnEn
E4i6riAstKMdHEeN11rXqeRAR06sdhBQ0/gPEpwDQ3L3Btv7tJin0mPMLjrvkXwa
pO6kNNtKs7vil6aJDqpyQCxoYGe1hXUgzkgKZXcoN7dfxW3IylEGqzYCdMmTLpl9
KvFibtj9qHs5ReEnBACbGMCyfxFBpw==
=R6FN
-----END PGP SIGNATURE-----

--Sig_/pWHLCaf7d0uibWm8g.V_EP+--
