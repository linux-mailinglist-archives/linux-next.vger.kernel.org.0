Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC748206A63
	for <lists+linux-next@lfdr.de>; Wed, 24 Jun 2020 05:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388324AbgFXDEy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Jun 2020 23:04:54 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:37349 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387985AbgFXDEy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Jun 2020 23:04:54 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49s7Kv1wN0z9sRR;
        Wed, 24 Jun 2020 13:04:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1592967892;
        bh=sM4GqGCncPD697+XCz69OxgcoCzkpAdKeMXLuP39ro8=;
        h=Date:From:To:Cc:Subject:From;
        b=uLAm5irCe/VWo/2qUJOnIr7QkbwTjQo4hMd2YJ3GenCgcOBllqbI6CTve0LqdpFd0
         V43F9umUKOi73/pQdCAHLEVKSw1kisIvmjidYx1YjrG+JovQAoZmxS6FwrBiLnKMsB
         3v+L+Vkp7ROnWzkjzQFVOLwVgXmXG4vsbGuwWc+9n0qNpRjkI2NYrxQkn+5TTd4WPu
         0O7T1Y5vb4XQE59brWFePDZui3/sWdYbkFBAwyLvh1z5Uhqlvs1MDUOSxkGLMjYYOE
         9EZlsl9KuBSLiw3prDhtzgSAKiLs87pvBVAUqhtYtUXE+ukva5IY8Hz4gX2t8d4pzA
         bf8iI/c/AjBow==
Date:   Wed, 24 Jun 2020 13:04:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Message-ID: <20200624130450.57e793f9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UkWkjBSiyyWNWXOBbKJfnYy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UkWkjBSiyyWNWXOBbKJfnYy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/sched/core.c

between commit:

  964ed98b0752 ("sched/core: Fix ttwu() race")

from the tip tree and commit:

  3c88d09bfb1b ("EXP sched: Alleged fix for v5.8 merge-window scheduler iss=
ue")

from the rcu tree.

I fixed it up (I used the version from the tip tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/UkWkjBSiyyWNWXOBbKJfnYy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7ywtIACgkQAVBC80lX
0GxkuQf9EYGha9AFqSapMc9Dqzo3aKPXxbSKUtd5IJXh3NX0/EioH4RdwyP2kApA
9mpOwlICzHQQYdAO49/zntVDujA6Z0CJrO6daMA6X3dT+5iD6nQzij41PJNOXho6
Xm9Gd1eZ4NNC9/X9s021v4d0NOGhgyDWH6z4cb37O3yjgC5j+kV3P+u7fYqhj0xJ
yi8npVKdt2Zkn16gERTEC/dsmJWtzS6YFjXzLevOwwXiuI8P/GFARA7iwnrT1EBP
yNpUjuYfKvNehfmkP+8TDrv8d1K5YVnL58L4UVLiFl4RVJIp+vwyvvBcz23IVhIU
JR7kcfQpMCh8XNVgzYytieG1TbYzzw==
=bBo9
-----END PGP SIGNATURE-----

--Sig_/UkWkjBSiyyWNWXOBbKJfnYy--
