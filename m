Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B7533E929
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 06:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbhCQFgw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 01:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhCQFgS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 01:36:18 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB0EC06174A;
        Tue, 16 Mar 2021 22:36:17 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0f5p4RqPz9sTD;
        Wed, 17 Mar 2021 16:36:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615959374;
        bh=CnyrabrdrJ+4UmHK2R6l8Up66FhixEO27wKX7hXq4EQ=;
        h=Date:From:To:Cc:Subject:From;
        b=eaS0lZYrmAeNQar9LHwQY49QgOe7FW/ziScnZgS4CnLyC/3m0YVxILLyJd6IWoSnM
         fay6tBROkX7v27Bea5vK1jTIOtAyTnHpabBj1ZiwJ5ZkTTEeYgNiK8gwHWJILHSRbo
         Y8MEFOnPqGGAR+HG6Nmem1WPH/MmQil9acokJhxFWr3HJ6uWX7z1NSneFkJkUhlKqL
         lD2jpyyMMVHlM3bo1W8tKOg7oM12yRSzxMzzYOxwgmciaLLafM9xkyMaPVjeuP1fyT
         oxVdYrRG48gTPU/MRyJDHDOIYxk7VHTwX71VZXqyUHxxKDd9t4uF+MnJB7eGJ1dvCZ
         KO/n7basxB68A==
Date:   Wed, 17 Mar 2021 16:36:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rcu tree
Message-ID: <20210317163613.02cd2246@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fV9IrDaYSrWySGf1saGp8P8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/fV9IrDaYSrWySGf1saGp8P8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: modpost: "rcu_read_lock_longwait_held" [kernel/rcu/rcutorture.ko] un=
defined!
ERROR: modpost: "rcu_read_unlock_longwait" [kernel/rcu/rcutorture.ko] undef=
ined!
ERROR: modpost: "rcu_read_lock_longwait" [kernel/rcu/rcutorture.ko] undefin=
ed!

Caused by commit

  bd6ae31d1b1f ("rcutorture: Add the ability to torture RCU longsleep")

CONFIG_LONGWAIT_RCU=3Dy
CONFIG_RCU_TORTURE_TEST=3Dm

I have used the rcu tree from next-20210316 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/fV9IrDaYSrWySGf1saGp8P8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBRlU0ACgkQAVBC80lX
0GzxSwf+IRNKAeVaKoo85XK3LavAx0fm/fx+XkY3Pr1tUoTYq5VkrtjmIl8wvpjI
4h1F/2nDYJUKYVgeEdjOlFaEN25NAc9fYXuc+/PnxL7D9cIzxJgJwOwatWaHYwxt
Kwe+ehSLOE9YMGxDbEAXjlcQVgmMzJDMtUt9HXGIk0TWhnz1Z8ddw0gNxNNAKnhq
58W/TH2X0/+c5iKgoQuUm4GOtA0SPk1yc3v9aOwn3lEnZRK7c5w0dEt1No0NN27e
MzZhl71mCNvBvY7FxgUPjyYt6r3pNAIT+APBcepxxxqMzyq9xfTTOdMIXRTeNKDa
CIWQODMrdG5OQSA7Y9ch60yuGJs7hA==
=DiyJ
-----END PGP SIGNATURE-----

--Sig_/fV9IrDaYSrWySGf1saGp8P8--
