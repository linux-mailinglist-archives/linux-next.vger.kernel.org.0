Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 545F43F82B5
	for <lists+linux-next@lfdr.de>; Thu, 26 Aug 2021 08:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239112AbhHZGtC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Aug 2021 02:49:02 -0400
Received: from ozlabs.org ([203.11.71.1]:43097 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234415AbhHZGtA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Aug 2021 02:49:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwD235BvBz9sWS;
        Thu, 26 Aug 2021 16:48:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629960492;
        bh=upetBDKZ8SpVJjxsvCSHrXsCZNQqeGxPQ2kaF2Ec2Ho=;
        h=Date:From:To:Cc:Subject:From;
        b=GeA5agF4RKbT6b+9AMzeMZoK6hHxN4Eh2vkod1RAhBpJzGOoDmkoHaUOHC/MzcNll
         hVzc9ZFel2LVuLY5P7eyafh6FEq4xOL8C67SSyGYyt83Ts2nNi89MOMmi12/Dg/Dkl
         gB9p0uOawt3QrVTKCDxiYZ0H73unjFxf76Ktl8hLPUV2tqtBNb8DBUotIZawsTMolj
         Uda9jAIV63syZygGv9gW/XTf4ZHAIf3rG1nhExjtv6LBiFfVEWZ1XsGPqPiZ+iZHie
         ybecyE26F24t8vICnEX6LAv0OVR3V6ogALM5IJRETPWccqID3Abi5j7kqm26FnGgIr
         hzEZeaHGce8dQ==
Date:   Thu, 26 Aug 2021 16:48:09 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: linux-next: manual merge of the kspp tree with the kbuild tree
Message-ID: <20210826164809.402222af@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AXH.+n+43C4EMv9hCdny.1a";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AXH.+n+43C4EMv9hCdny.1a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  Makefile

between commit:

  389640bf8d17 ("Makefile: remove stale cc-option checks")

from the kbuild tree and commits:

  2d931b634b81 ("Makefile: Enable -Warray-bounds")
  7d8aac16a0a8 ("Makefile: Enable -Wzero-length-bounds")

from the kspp tree.

I fixed it up (the latter removed the line modified by the former,
so I just used the latter) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/AXH.+n+43C4EMv9hCdny.1a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEnOSkACgkQAVBC80lX
0GwVJgf6A3eBNL+JRuI+Naczc5a1tpiFspRJX7G7ZZpy70joExEQlZ2ybtxmLyZ4
3pyCs3rD6Ks8dtBHqShocSLdaVD9HQGMBD1xXkMKaPFi2RbDcbVQa3XIV2wkM/au
tmNizj3WYV+juuY9VogPmIx2szdoY18YsjyogKKWps3VuMJA/6A+Iwva0Kjnekg6
evsEOxTeFiN30aRRrWtf15dnannArziBmgSIIMpilzwMlYYehPEs1aB79slw0I2Q
lrEM/G/8d5KCUZCqRSRLEVIx1W6rRh9By8lchDP/n4E7OeNV9LYDNt+Tmw7oD3ak
uAkcGCYSdrUUB4qIkh4qRgkMLJoybA==
=BbeX
-----END PGP SIGNATURE-----

--Sig_/AXH.+n+43C4EMv9hCdny.1a--
