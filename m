Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FEF21508E
	for <lists+linux-next@lfdr.de>; Mon,  6 Jul 2020 02:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728149AbgGFAeb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Jul 2020 20:34:31 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38253 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728141AbgGFAeb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 5 Jul 2020 20:34:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0RQr2G3Kz9s1x;
        Mon,  6 Jul 2020 10:34:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593995669;
        bh=r/SuHCqQ9ReBOmjLyP5++Sq17qcsjIrCCepj9P4e96Y=;
        h=Date:From:To:Cc:Subject:From;
        b=ofkTYQYRvukecFK1LtNWm4PEB142ExEwn2aPGe/OvwDRWCr2W2bb7l06s0CwU+Lhk
         +ZMfcQNwJ9YeCq1wkdwHyC6/BpAWNQI8rU159kvcVK/vOaRrzVcicf3SOy1vnpuCoS
         uAfu8KFYege5mAv1B6KCw2AXMp1llRfbVRMBQvaEmNc67caSp7NIc1QlkWph7lpn5I
         K6d/N8LOnv3slN29LTBg5EuCb+IUHsERWC51p9FMErUKPeUrNuihKV77hNkhx9mc3c
         j+2whxSE1858GulqDOBzu8InYBlkGdJfm/LNvhpaJXvVdK5mHGLTv+zHDMNOIP4h+H
         41uniY3o108Xw==
Date:   Mon, 6 Jul 2020 10:34:27 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: linux-next: manual merge of the jc_docs tree with the arm64 tree
Message-ID: <20200706103427.16470171@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oWPor8azsUeWgecAz8Ah8Kb";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/oWPor8azsUeWgecAz8Ah8Kb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/arm64/index.rst

between commit:

  5c5a8ac9b27b ("arm64: mte: Add Memory Tagging Extension documentation")

from the arm64 tree and commit:

  86de78d2c5f4 ("docs: arm64: convert perf.txt to ReST format")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/arm64/index.rst
index 4cd0e696f064,d9665d83c53a..000000000000
--- a/Documentation/arm64/index.rst
+++ b/Documentation/arm64/index.rst
@@@ -14,7 -14,7 +14,8 @@@ ARM64 Architectur
      hugetlbpage
      legacy_instructions
      memory
 +    memory-tagging-extension
+     perf
      pointer-authentication
      silicon-errata
      sve

--Sig_/oWPor8azsUeWgecAz8Ah8Kb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8CcZMACgkQAVBC80lX
0Gw2WAf+KSUsvNqgo13T+d0ItcRCPuOR4HuCDxna3lzPAT6zlpCuSFvf+XGuCxgj
6ExO5vAAQFUR66BbxqRHPJ57HjnkJnp8W4R+TE9wTeEFzfQYfaku5WlTJcWcUsBX
9jOxVdPw/11Q25b4iCn85SytV1vPEn32uATrGOh2mYl1kaIZFdqP42hsmwp5D/Gy
FQE7kzRZ4JIJ7qvAwa+KI77Pkpj3sD6qHBBVsBlSeauR2nXNETMtV5fSxE0rLXjR
1z4G/0o7CtDqF4Gb+VvytceRt0eiN3+hkB3VS0VdEgT3RsJWkjbcSyLDoFU/imrL
ku0ab6aySvGOKHfnziu117qSUOr5iw==
=kqCm
-----END PGP SIGNATURE-----

--Sig_/oWPor8azsUeWgecAz8Ah8Kb--
