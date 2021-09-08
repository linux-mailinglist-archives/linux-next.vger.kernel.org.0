Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1524041F3
	for <lists+linux-next@lfdr.de>; Thu,  9 Sep 2021 01:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235647AbhIHXxl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Sep 2021 19:53:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57307 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235669AbhIHXxl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Sep 2021 19:53:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1631145147;
        bh=IoFdmKYfC04bEaRzyS8XgQ8xqNh9Bpk3DtROGNZjTNY=;
        h=Date:From:To:Cc:Subject:From;
        b=ks77Rf8d1vaMqgo2ptTBsXPzRNkZRfi4M0h65+SNxgVfdUj44KMBlhxV8uasPdFSV
         awBTQA3r/W6664usHLNQtBI/BSntsJvH9RymBpY7stwwwL/anuKobGPQaSaJbFvnNU
         liKjiGs3BSoGk6xDAuoSGUAT9hqoglbw1mg3gIRb5icpKpEc1SyrMRjAcbRsAnmVYg
         JLIWIl4hS6GNfZXvK2mGQytaWpBWSe1eLCFni/xkiLUfaNakcQv+tw/Sj+tGOYxB8l
         1bh+I5T00PETqOgkV1P8mOLbbfC+Jl1i9skIESp6Z+eSqUH/WTSVBmckBhUWDF8hkb
         fdREB3tXo7nBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H4f7t16Fnz9sW8;
        Thu,  9 Sep 2021 09:52:26 +1000 (AEST)
Date:   Thu, 9 Sep 2021 09:52:24 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greentime Hu <green.hu@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>
Subject: linux-next: manual merge of the nds32 tree with Linus' tree
Message-ID: <20210909095224.43f23be0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6_IS6Y+aUTXzGI2m+woLB_v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6_IS6Y+aUTXzGI2m+woLB_v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the nds32 tree got a conflict in:

  arch/nds32/Kconfig

between commit:

  4aae683f1327 ("tracing: Refactor TRACE_IRQFLAGS_SUPPORT in Kconfig")

from Linus' tree and commit:

  36b9b1975393 ("nds32: add a Kconfig symbol for LOCKDEP_SUPPORT")

from the nds32 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/nds32/Kconfig
index aea26e739543,a20b42d4bdb6..000000000000
--- a/arch/nds32/Kconfig
+++ b/arch/nds32/Kconfig
@@@ -63,6 -63,12 +62,9 @@@ config GENERIC_LOCKBREA
  	def_bool y
  	depends on PREEMPTION
 =20
+ config LOCKDEP_SUPPORT
+ 	def_bool y
+=20
 -config TRACE_IRQFLAGS_SUPPORT
 -	def_bool y
 -
  config STACKTRACE_SUPPORT
  	def_bool y
 =20

--Sig_/6_IS6Y+aUTXzGI2m+woLB_v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE5TLgACgkQAVBC80lX
0GxWZQgAkN7/nNmAZqM7560cYf2YSzqdUG3kQZEBFCrrp+PsVqbsB+wwDIl8TjTR
4Gxzy05p1U/7obEGYl/9BO0IKcLoFI1N5RVgsg+kpwYw+ROknyxnxnh8MIuoMZjf
DgX8HpfM2u0gzuDa9Mk/ZCFEuETsB9fBRKeK9ZLFhqHKL61AxQz9+r1JKU+G4b6q
f23KMAwcTNeTTHqL7PPumET2YRZMGpXmKAlBD7Mo/xFZaUYSxjIMHAkkxDDAwklx
v75iQTMpiEMYny9qGmT7CPgaSEFmpJ4P3c9dNwglNLfS9b9dEypG+MsYZLyf7jmJ
VK07Rqk4Hdn4jQ3z8wrpsyQc/JIujg==
=iAXx
-----END PGP SIGNATURE-----

--Sig_/6_IS6Y+aUTXzGI2m+woLB_v--
