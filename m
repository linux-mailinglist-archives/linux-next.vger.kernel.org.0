Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD76346ADC
	for <lists+linux-next@lfdr.de>; Tue, 23 Mar 2021 22:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233435AbhCWVPC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Mar 2021 17:15:02 -0400
Received: from ozlabs.org ([203.11.71.1]:56529 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233409AbhCWVOs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Mar 2021 17:14:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F4kdy6Ngmz9sTD;
        Wed, 24 Mar 2021 08:14:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616534087;
        bh=S9dZRCybNg6tFe4gAm2KIcQTMrqWZCFRwEcHTWF54IU=;
        h=Date:From:To:Cc:Subject:From;
        b=cLEMnAfZ7yhjYtiXLYtKrR2xM50lQubJzc102fep6BhdNbBwwEdWyyw2go07V7kVL
         4tbu5Gqzw25CO/Q009ilcySVv1RzIgIv9K3VZyOi+W38BrcnCKr3nbhtggC/5TPM0C
         iXCpF4EDosCKkzY3fA+QbjRzQms8KH57G4m/RKPgGDhVUiobq1nkbwOxzdmUnOqLgr
         wyvF2dbsjiUM5/2eUrKdDQ+ub4lGgnkCWzIfQnURZ8csdDq9FE5Nl3bodW+E0bnavW
         Cod01AEZ4dOhgiIypT3sFs5J0jWRh9QFPCKiq+DQIwgp5zAwv9IzHLWZ+TzpTrWoZr
         BMw0E+H51ScYQ==
Date:   Wed, 24 Mar 2021 08:14:45 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm64 tree
Message-ID: <20210324081445.7db17c31@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CPUmG_n=8eYRHP6y1Faota2";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CPUmG_n=8eYRHP6y1Faota2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  b17f265bb4cc ("kselftest/arm64: mte: Fix MTE feature detection")
  4dfc9d30a8ab ("kselftest/arm64: mte: common: Fix write() warnings")

are missing a Signed-off-by from their author.

--=20
Cheers,
Stephen Rothwell

--Sig_/CPUmG_n=8eYRHP6y1Faota2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBaWkUACgkQAVBC80lX
0GwkoAf/TE8VQxQ7xfbx/SEifsPcR3aK/WhS0znSqSv5XdJmdX3j2z65LjuI2vX7
tmWHBSmbE+1+s4faCGPoT2GfIczWRQjAWCqFpyioStyssPAp1Yvy0pEdcf9syS5u
cHQdKI3gh+7cQILVP3Dk0F5XjNEZJkKkxbXgI25Mm/aqpSmWSbNPkMk4yhPHUSR8
gCiuduuxEfT57oh0tZxZ3bd8u2kLn7bD55tUoL1uWWcpvrdycZX39n/pdCnMKmlS
4sTsbn6+n1X/Eh8b6KOZmB3kKIPq6tlwXYFLrN807+KmWnW0PR9pVOlIGEtzWrjZ
KgKDnbXwi0YAysFVFXiVvmGLxklDnA==
=hYWi
-----END PGP SIGNATURE-----

--Sig_/CPUmG_n=8eYRHP6y1Faota2--
