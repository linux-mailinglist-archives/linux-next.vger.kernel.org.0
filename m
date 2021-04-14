Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18C9035FE7E
	for <lists+linux-next@lfdr.de>; Thu, 15 Apr 2021 01:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233518AbhDNXgl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Apr 2021 19:36:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40389 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232631AbhDNXgl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Apr 2021 19:36:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FLJl50pM3z9sRR;
        Thu, 15 Apr 2021 09:36:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618443377;
        bh=kfv+xc09MV9UVzqaFbOAn65ue91Hf1emN1/qTLwxKdM=;
        h=Date:From:To:Cc:Subject:From;
        b=YhIim8AAlSmF8+j9nPRKATlo2BKNKyfUfX6ZBDbpKPeV4AIC4gcPl/wx9SBLb4Sm0
         qlZH4554zOwQ6dISjGAJw30FAOSfRcZWVcEDnhJVgfv3L8cBJTMf4pxG1x3byXJDri
         oCqfDM8QKcDSkzqQN3s4TyFGkfME3Ys3onLQMi64JPya5ZfHWq0mnLAKpLAuKQng52
         3exst+c3H2ZXSvRZKGCj/dosrATEzPpw2FmrkFs2HWTexUijoscQiBJNJfq13gGSHU
         uOzGlR7h359puDdq5U12yRUleekMrWV9pjIokUD2J8kaBeapfdldWUc8ISR4CPkrlO
         S3GVJBuk2vOqA==
Date:   Thu, 15 Apr 2021 09:36:16 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Yu Kuai <yukuai3@huawei.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the powerpc tree
Message-ID: <20210415093616.02468ba4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S0UeJ6AcnQylsDPmEgAB3Vr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/S0UeJ6AcnQylsDPmEgAB3Vr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

drivers/macintosh/via-pmu.c:190:12: warning: '__fake_sleep' defined but not=
 used [-Wunused-variable]
  190 | static int __fake_sleep;
      |            ^~~~~~~~~~~~

Introduced by commit

  95d143923379 ("macintosh/via-pmu: Make some symbols static")

--=20
Cheers,
Stephen Rothwell

--Sig_/S0UeJ6AcnQylsDPmEgAB3Vr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB3fHAACgkQAVBC80lX
0GwFhggAlMymVViwuP6aw0+tIpMCngJyp8gr9XP/RvT41vVkLWgu4E/kY8r1YZb2
jJN/w/zpvuAUzMzMr3yrCrv6iKyYsMVPBg1rJMo69JKuGoHA8VPNhcsrkpE779rP
N9bw1sufjxVxu6pm6bCoTsGTL0Ah9sRN4BSDBvD4DbSdtBnHqdjWSnBifP6Enna3
GAjW6Jkma5xQGcb4Eqj7JPbFn0JmKUvz59P9ysBOtpjEHaMMjKvqs8es7GGR5V0C
0RIralJRYOTigItYlAWLr9TfwSouUXKCSqToT9Ub9DhicvW2zPnbDXXF9dPnuwKW
9wD9H4HMNCniYKRZ30F3bczIW9mNrQ==
=Zi9X
-----END PGP SIGNATURE-----

--Sig_/S0UeJ6AcnQylsDPmEgAB3Vr--
