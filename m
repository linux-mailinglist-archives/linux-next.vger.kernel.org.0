Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64FCA2D4F2D
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 01:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbgLIX6K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 18:58:10 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54857 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727709AbgLIX6A (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Dec 2020 18:58:00 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Crv9P5jwBz9sW8;
        Thu, 10 Dec 2020 10:57:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607558234;
        bh=tZs1mzrzYfArypDz7n52gc2xW7dbapSpxPrhSbiXeKw=;
        h=Date:From:To:Cc:Subject:From;
        b=IHba/dpobWtLpZ3anhrS4wjAy/L8qOnBFieI89h1t1g8CH8Vcrpg8S3zbqqN4sfNk
         d7H4Sch9NsbsRieCMz8/p2ZR/e/GhmiKBh78xZzK2F4vrlOfbljOUAUcTaTw5mC/lc
         WBGY8OMx8d5mtwWG2eKuSkgWeBoTkOGu0Ts7hCEw4nPa9QG/yIhBAKz4ui/UTO9SsH
         0fA9VZ+Aqg5E30bryjYPuQNhQCxoVNC0MOycs28CYMRPlSGSDqhS8zFVTx8gX4N+8h
         FdyQwhr7JaU5VK7PSP4Y9UF+wmyVw4eX3DvtMvnKljW/tB7N2xAiTq3kfkx8AOBKy3
         4aiAsJ/SsZ+yg==
Date:   Thu, 10 Dec 2020 10:57:11 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michal Simek <monstr@monstr.eu>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: linux-next: manual merge of the microblaze tree with the
 asm-generic tree
Message-ID: <20201210105711.4cbb3b01@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fnsKPm2zX485C0EQ5gCkpx5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fnsKPm2zX485C0EQ5gCkpx5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the microblaze tree got a conflict in:

  arch/microblaze/include/asm/mmu_context.h

between commit:

  94f89922e1e0 ("asm-generic: add generic MMU versions of mmu context funct=
ions")

from the asm-generic tree and commit:

  05cdf457477d ("microblaze: Remove noMMU code")

from the microblaze tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/fnsKPm2zX485C0EQ5gCkpx5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/RZFcACgkQAVBC80lX
0GwQrAf+M1scls7iUMqAWCe3/+73qLxA/qzlCz8s+YvBszVlnQVUJWYJtyx/6F1V
wFNp6QMlS1ejemO/L4+W+CHERlySq7JEpPQ6D8ytQ50wQ88gl89Tc85d582wguCc
/bqkErBLK03RYxbdu1kiOWlYvsRD+W5WqBv9vhCuaxvqyX080q8qvccFWwkOyESw
/wydLx2/bnvlS86OnQ88FeAarRaPdU8B0mQlu1IV0VkS3RYh3AzBWroJaBOe1pLv
sjNLaTjP2A1hd00rrL2fyzL65SCRM5IWkBkVFr3dQHPA545OkNif0PpmaVLAMSDz
6uy9miZAi96LG+ddjGkxAcek6npTIg==
=1UvM
-----END PGP SIGNATURE-----

--Sig_/fnsKPm2zX485C0EQ5gCkpx5--
