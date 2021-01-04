Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A9C2E8F0E
	for <lists+linux-next@lfdr.de>; Mon,  4 Jan 2021 01:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbhADAiZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 Jan 2021 19:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727313AbhADAiZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 3 Jan 2021 19:38:25 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CE0C061574;
        Sun,  3 Jan 2021 16:37:44 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D8GtT3wJpz9sSC;
        Mon,  4 Jan 2021 11:37:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609720657;
        bh=QmGXt4zYYDhSnLBhT13xfyabQnhGs4VKS2lFA9Zk6EI=;
        h=Date:From:To:Cc:Subject:From;
        b=l8TGNb1MFu60rMmwjmwJFGzqixfpTbXTGklwd8Xsj2IQIn1/TaP5X+2Mc3l52iLYy
         r2DeqWsUJEuNHEKv/8PkzMjoTIzq62uefO9k9ZlsDmJf2SRg5vvFOCQy5ERrG2q/L1
         EJrzeOhF3MnLZk5oTfytRsfIj/YINm++f+j3smt423U5q31Lj3Ldwu89TFgWrU0SN6
         PXNVDfE9f1t3kSjs/UVVVE7mjUvrsrsAfz0s4alh4394giADifMuvyS5A/OR2nUCet
         yscpmenWre8Isw/dDaQA/LVMnKHzDsHRdoUm6mveaVvNXeWcTID+MdPLHoacdG4qxV
         t7Uax2CnncrgQ==
Date:   Mon, 4 Jan 2021 11:37:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Frederic Weisbecker <frederic@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rcu tree
Message-ID: <20210104113736.23ab7690@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6CDmntJ7A86DZ9OUKG_Ky0Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6CDmntJ7A86DZ9OUKG_Ky0Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/mach-imx/cpuidle-imx6q.c: In function 'imx6q_enter_wait':
arch/arm/mach-imx/cpuidle-imx6q.c:32:7: error: implicit declaration of func=
tion 'need_resched'; did you mean 'tif_need_resched'? [-Werror=3Dimplicit-f=
unction-declaration]
   32 |  if (!need_resched())
      |       ^~~~~~~~~~~~
      |       tif_need_resched

Caused by commit

  7ca83ec735ce ("ARM: imx6q: Fix missing need_resched() check after rcu_idl=
e_enter()")

I have used the rcu tree from next-20201223 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/6CDmntJ7A86DZ9OUKG_Ky0Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/yY1AACgkQAVBC80lX
0GwPrwf9HtgvuPgmxPdyywoXo3ZXDjjOy9GwV7JE6U4Q200CPajNns3SuKyhxLAj
2/advdjw0wSw8DZswWKoE/7fLJLRKOUxAPTl0q8RSXAVd+R+bko5qSDqo+LRZIzP
KVxpzy86aJt2WaJPsFI0Bm19J6n5yx+gXpjmtY+m0AT9xzuo0WV2OBdgOXJ4I1UL
D/iWO0qTUtLcqi3Y0cMtRcZm9BVvCDsqxXX1jiqUPRRigNC2UwfVjknxQHI5ySIl
vFkclHX1RknNtcyGZXJHxYvJznhD8tLAwXuC3WATYYE/RgXSgWFfqYNCm6WaN2UO
+BKUHwmgIFMdLF4GIvNyBzLmhsBh9g==
=ynn9
-----END PGP SIGNATURE-----

--Sig_/6CDmntJ7A86DZ9OUKG_Ky0Z--
