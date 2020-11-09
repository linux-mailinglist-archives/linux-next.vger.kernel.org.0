Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25A712AAFCA
	for <lists+linux-next@lfdr.de>; Mon,  9 Nov 2020 04:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgKIDPE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Nov 2020 22:15:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728038AbgKIDPE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Nov 2020 22:15:04 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6286C0613CF;
        Sun,  8 Nov 2020 19:15:03 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CTx1s4jkHz9s0b;
        Mon,  9 Nov 2020 14:14:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604891701;
        bh=SyBfwsVcZpmvqzZ++GMaEw332DGDt7SxdOfJb+41Z4I=;
        h=Date:From:To:Cc:Subject:From;
        b=DIyPcdVE3Io4CEaijge3W4DJWMfjXIhtf6i+SqocVUVSRAAEuvquKk6z0wSeHXzSh
         jEHh0oetMS8Ev5g5AJ5TnT7AtXzdrjKPjx0gZbSSv76O3TqgH2VxG93Jngn2RiXfhu
         SColWTkAfd2CkRbdtgDoDwxyaE9W+yDkEZZ44hsiMLSjs5r8V9uDLhpNKtWTQ/zAlJ
         GF8tuZ3/EVfEWQy9X7y8gV2FhqSzAUNlyav0akrRMUf0tRm17yfDrh1LPw1ZXgXcGh
         xC8QS6k1N03fDJE+NPWwPQB8U+Wv3101ahZ9PZ7qu+D13ho7/fxIM1BHKRz8jr/ET/
         +WyOHOdJHmAvg==
Date:   Mon, 9 Nov 2020 14:14:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Jens Axboe <axboe@kernel.dk>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the block tree
Message-ID: <20201109141446.3370914b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Tcn5_2_DZDwAsyCr67qhFql";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Tcn5_2_DZDwAsyCr67qhFql
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/linux/sched/signal.h
  include/linux/tracehook.h
  kernel/signal.c
  kernel/task_work.c

between commits:

  fdb5f027ce66 ("task_work: use TIF_NOTIFY_SIGNAL if available")
  bf6996650675 ("task_work: remove legacy TWA_SIGNAL path")
  ceb39b7c17b7 ("kernel: remove checking for TIF_NOTIFY_SIGNAL")

from the block tree and commit:

  114518eb6430 ("task_work: Use TIF_NOTIFY_SIGNAL if available")
  12db8b690010 ("entry: Add support for TIF_NOTIFY_SIGNAL")

from the tip tree.

I fixed it up (I just used the former versions - this may be wrong,
please let me know) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/Tcn5_2_DZDwAsyCr67qhFql
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+otCYACgkQAVBC80lX
0Gw/JAf/U3/EL0KIfWk/Iq0zOsHJGPii43F+DNfwoyFvKj8uvV/5hurnGJwn0fqR
xEVaKzuB1URdk/n6IUYUM8oYFa3fSETAOmK4ttPpRKQcrBOU45FrBMJFSR+BijvY
LXCx2DS0XZXrZy40VcQm4eb4tEPZ/rLSA5SqiWwQA2gqsoXydarqDkRTpx+ZpTPS
uTJZjw5PFMCxrP/cyUS0CetDi9VmJ/KveFvP0tqBngPJsyI6/9F/+KtbO1eKknMO
h2v9cPQb723+dVR4rFMjuaBWZpsc/NV9LGLjJaoRSCT7UVjo19yPvtFqGoEl1c7D
+l5NIGLTXPk/xDizEMNSOoU/LVjGPw==
=3fGX
-----END PGP SIGNATURE-----

--Sig_/Tcn5_2_DZDwAsyCr67qhFql--
