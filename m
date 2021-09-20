Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77C40410E2B
	for <lists+linux-next@lfdr.de>; Mon, 20 Sep 2021 03:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232216AbhITBfC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Sep 2021 21:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbhITBfC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Sep 2021 21:35:02 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A27DC061574;
        Sun, 19 Sep 2021 18:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632101613;
        bh=R8bU2g0Rz9VcomcifA5ByRg2rh05ah2zUJ346CMC7Zs=;
        h=Date:From:To:Cc:Subject:From;
        b=YtRWHnwx7zOUazMjFLsHbEpq4PpN39TNjlyJogh2S8x3r2UNRWbZVrZXKHvl9RCsY
         j+AlPaLgimKHYFO72ATIC6+YPSi0eG6pYT8jRivGRQ3nPwrZPZyDWU8U+cWZ2oFTIk
         wX0MLXM0u7g6dpeT47OyZjTpUBkG4ng9PcNIG72gJi9bX07ua7ruSBRbtOIO3qLxHF
         ehpq2GwfSSO7XXsoh1z9Ar+ApTCa9ITYp+def90mFYmQvNfBA88ZpILy/848ISwEHU
         38xCp/uhVrufGRIajBRpFmI8zShfhDnucqJDHNm81P5+GlYwkOQ3TNnUw6LwD1Xaoy
         3XOJ7qlMWh1zA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HCRsR2SDGz9sCD;
        Mon, 20 Sep 2021 11:33:30 +1000 (AEST)
Date:   Mon, 20 Sep 2021 11:33:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Yafang Shao <laoar.shao@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20210920113330.29f12b99@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/okQ9CZYaSTaj+dYywLuoR9=";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/okQ9CZYaSTaj+dYywLuoR9=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (powerpc_ppc64
defconfig) produced this warning:

kernel/sched/debug.c: In function 'print_cfs_group_stats':
kernel/sched/debug.c:460:41: warning: unused variable 'stats' [-Wunused-var=
iable]
  460 |                struct sched_statistics *stats =3D  __schedstats_fro=
m_se(se);
      |                                         ^~~~~

Caused by commit

  cb3e971c435d ("sched: Make struct sched_statistics independent of fair sc=
hed class")

# CONFIG_SCHEDSTATS is not set

--=20
Cheers,
Stephen Rothwell

--Sig_/okQ9CZYaSTaj+dYywLuoR9=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFH5OoACgkQAVBC80lX
0GwgEgf7Br1DG14JQfEDOb9rUqtMFDsTblo2W84NMduYdq10thqlE7rjr2uXKRsR
y+/R6iHwGJ3EFqzvGv+tIBYAuZpfHmKaNZWDOKkxurFAwxxPZ33Q7f/RyHEdHDm1
8enmQ/mrajBVv9ptzLO5/mf5x3fw5hfd5gt79yYBUkCpd1uJWlB/tsvgWsi67tm1
VL9TX7kX/F2tY9TTPPn+KcUDxeYFmH86bAZYjSdb5tfgPdqWgukfsY7rQ1+Xbuv+
70/PJhEFCETNx/lpvm94FMYgqtEDiYEuP9qsQZ6/h5fxT+KeK5H4nNdYVk01SAoX
8VuGeQ8QOS4ocHE61zS23vUWME/DIA==
=iRbt
-----END PGP SIGNATURE-----

--Sig_/okQ9CZYaSTaj+dYywLuoR9=--
