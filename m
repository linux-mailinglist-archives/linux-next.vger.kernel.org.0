Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80D463305D8
	for <lists+linux-next@lfdr.de>; Mon,  8 Mar 2021 03:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233374AbhCHCRO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 7 Mar 2021 21:17:14 -0500
Received: from ozlabs.org ([203.11.71.1]:54091 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231360AbhCHCQ5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 7 Mar 2021 21:16:57 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dv25x2Zzyz9sWF;
        Mon,  8 Mar 2021 13:16:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615169815;
        bh=WXuQHax1KxsOPA+O7TbL9Z16sHGpvN/9FO3zaSzMM1Y=;
        h=Date:From:To:Cc:Subject:From;
        b=cWWUuuDwSg7J9oyXBxXCNYT3QwX0WM65l56SAOLJTlb3tIfL/VIoC7MCzJGX/3pfs
         PAuuzcF+lx8uWssuVPByGEjAhuxPWpxIvm9tKzp+R0Rslmld5qIvbMP10Ojolb2PCX
         ptHDvL5MhoUdtYBufrtY/YYqwVoaGLOpct4liJrfsf6dqYpebo/ncvRNlNJUnpuBXu
         AJ0ajewP/FAtgkmtbu/v8d/XGYpNprFmrf75M+Kg4sVPQ+nESaYO0d4uwgNvGsg5pW
         GNPhKWOOiEjiJqOrUR3PRdMyf0DoQUD8QmKNxIDIR6jJt+dJKNihlJWFju5AujW9M9
         mYrryFbESBBPA==
Date:   Mon, 8 Mar 2021 13:16:51 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the tip tree
Message-ID: <20210308131651.68446a90@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W5diJXd8sR+psr0d88XwVIC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/W5diJXd8sR+psr0d88XwVIC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  eca8f0c80a00 ("hrtimer: Update softirq_expires_next correctly after __hrt=
imer_get_next_event()")

Fixes tag

  Fixes: da70160462e ("hrtimer: Implement support for softirq based hrtimer=
s")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 5da70160462e ("hrtimer: Implement support for softirq based hrtimers=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/W5diJXd8sR+psr0d88XwVIC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBFiRMACgkQAVBC80lX
0GxJkgf9HrTTjtDE3QeWP0e24hZpM6IFGkjaeIBYXxmZsmhvxxz4y31WU22Cj4mX
S458s7ud58Euc2YSbxyEDCZECUuBBCFOMcNtNnJ5TE6ty4ahqk+7jzMYUjDrvWz0
SqoeBjlntFxaWW+2lpjH7pN1R+/eKcGAY3foOoaQ9sAbw7UC0VZFhuOe1MVVnJT9
YUpKNbAp5zzcBxrHPK2qD2+dhbwUg8qjVDATJ6KZUeWPtmMmdwaquEJzJQFQVWAE
DGCLfd4HQHRCDjZ2IVyP3Jv8W6W8S5ZkHhobbrgoXyzpO8xCilnNUsTQenvYclXr
cEAduXOdGRzdZrdeOE4YhsMoIiDZ0g==
=gxNh
-----END PGP SIGNATURE-----

--Sig_/W5diJXd8sR+psr0d88XwVIC--
