Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCD838D864
	for <lists+linux-next@lfdr.de>; Sun, 23 May 2021 05:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhEWDEN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 22 May 2021 23:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbhEWDEM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 22 May 2021 23:04:12 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC00C061574;
        Sat, 22 May 2021 20:02:47 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FnlWn0bZDz9sSn;
        Sun, 23 May 2021 13:02:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1621738965;
        bh=4zv7K+LsqE4BrttABIwauTOn1fEPewb1rYMMvlUoBdk=;
        h=Date:From:To:Cc:Subject:From;
        b=J8VLneRf3f36SCENftA1zo6vF6bjsrAlhV79lGrlV5paGTJ8Fp8FnBo+A898PnZs9
         E0jftHmIiGTv+vOLl9PhMPto/B1wvuPFdRu+ow6gLex3PcKMxAwf8EQ2V11NEdc0CJ
         8MXAJGRFB25fTkPgN8Kkns02ceckiZYi9IF5nd3WrJlMMPeOV4vHvtIP8E3YSGWgit
         5a3AiXIY17cOJYTHr4bmjsO3cm4eJxQPI5uzlGVS6NNTgAnBJibDEHVq3TCkwq7Wtt
         Khtub64gB2Tqod5GY2RzK7to6UmvuQD1hhoZ4123EOMrtInGYDrUMxZ883yLxWmSLz
         /7uz7h5zpO6Dg==
Date:   Sun, 23 May 2021 13:02:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rcu tree
Message-ID: <20210523130244.1f672253@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1IgF/AWQiOi9Y0lEofVkbv6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1IgF/AWQiOi9Y0lEofVkbv6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  5f47b19cd121 ("rcu: Do not disable gp stall detection in rcu_cpu_stall_re=
set()")
  96100b1ecfd7 ("rcu/tree: Handle VM stoppage in stall detection")
  399a8f91964e ("Documentation/RCU: Fix nested inline markup")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/1IgF/AWQiOi9Y0lEofVkbv6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCpxdQACgkQAVBC80lX
0GwOtAf+LftcvVPJysYlGqzKWaigBhpxTv6ZTy0gslpsIK5qJ9I6FlXg75ge/lVP
VoQE9tHgcwQHX+QQotBBZNg+tZERXOTqez1e+j7W82AHWDP0vhE6zeApJKQc9DrH
AFNOhuqsckPsX6IDT1Gi5jf5JQlvoyZtL177s3GpUs5LNDMw9L9uN8KpZVrmiRcy
ZQThtzChKZ0O3HVrYS7wbo3xzcmOD06lfG5cbjDEsG1uOi1lxsa0v4xOB363BHXJ
MzqFE8urrdJbpPR6OwDg5fr3AGZnf4h/nngJwWw9KXAgyNPrlTG4W84Dc9PZcPks
o92uJofyI62yQ8G2jkTzXwApp9nt7A==
=wNx0
-----END PGP SIGNATURE-----

--Sig_/1IgF/AWQiOi9Y0lEofVkbv6--
