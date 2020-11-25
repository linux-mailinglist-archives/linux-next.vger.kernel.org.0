Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCCC32C4958
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 21:52:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731115AbgKYUvv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Nov 2020 15:51:51 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:56643 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731101AbgKYUvv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 25 Nov 2020 15:51:51 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4ChCjx0BzWz9sRR;
        Thu, 26 Nov 2020 07:51:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606337509;
        bh=gxFFHkjozjJqJyV/qwoh9H56LzZgAbA6LYvEWzkoM9M=;
        h=Date:From:To:Cc:Subject:From;
        b=AGJIFoG5yOJ/pd5Qz6RKzov3eOmDDmHRSDdkSX3hydx6N+32zck4nmtCDh9XID68S
         vN0wC9LAObrkE6K8iYp+vqCYv9mZIdFokxR9hxocd+st2q/j5ofp2nxwiu5+z9NMDF
         /xFeEfzM8rSTSKfVQ96oNlvq3rS1vnerhgJU98ou5wknHbsGSfuGbFk+SOTtwY3xzU
         YSeTe5AsPpMc4Kojf4wjTlcr6W22MgVA/g9t0LhWWjxOFMtnoKGKN1nMDa3OoTlYdw
         UWhGkzRcpGZSUnxxjyo/PUEOzG8hUCO9fksxHmBwkzZv3GgI3qXBuHrsuhLPeZHABp
         xF1viL9bzS78g==
Date:   Thu, 26 Nov 2020 07:51:47 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Tejun Heo <tj@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the workqueues tree
Message-ID: <20201126075147.71c62e25@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XzNfYACScOw8ha=XAfqCV7R";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/XzNfYACScOw8ha=XAfqCV7R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  061f16a7ae28 ("workqueue: Kick a worker based on the actual activation of=
 delayed works")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/XzNfYACScOw8ha=XAfqCV7R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl++w+MACgkQAVBC80lX
0GymlQf+Jfg0bvQZ4Uh8kntdOB7+i3sc6LpqiANdA4tfNGiOSYZ8Omuo/Bf32H6f
p2byNpFX8LqbCEoteeyJswEqpnoqOvbsa52DoO6aaKiF7AIGaeBrzmmIBpGzBCgp
wPo+MUe/7htashtfNHO1Le2klfE2Daf//2zKL4qsGP68gE0Tm48Ehzx2N2CGyU8j
6olPAjYSWwuL0veSgf/RjcItShuZlEqdgbYiQlW+XdpyVTs8N692wSXltPmOF5F8
T1q2QYwH9PHTvZTf9bMsvSkoSRCtZTuqr368EaTCjagqboMsxVpYrxLGdpsDCWFp
31MaPBFRjaZKcfOoVL4MbnHVBJI4sg==
=xQVn
-----END PGP SIGNATURE-----

--Sig_/XzNfYACScOw8ha=XAfqCV7R--
