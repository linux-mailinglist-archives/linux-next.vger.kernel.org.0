Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCE7371004
	for <lists+linux-next@lfdr.de>; Mon,  3 May 2021 02:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbhECAMs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 2 May 2021 20:12:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43485 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232628AbhECAMr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 May 2021 20:12:47 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FYNgm5NN0z9rx6;
        Mon,  3 May 2021 10:11:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1620000709;
        bh=v9rvPI7N3xC7qDG7C9zkKs7oLjGqPTNOIRwvHkmPYJs=;
        h=Date:From:To:Cc:Subject:From;
        b=HWLLb0gkww9/fJ9p8V01cqJrNkkAUjLDL+Yglus3+SJWh+kViRHd+hk4pPEJ0VOzc
         gYJg+HPtqEOOuBG4o6NtUIR6hEPSzhw5o9difh3zpu159ogvRIl3njVd6iWh/LmZ8P
         Udw96XSjRAQnvCp03gzdAz93mO3331Z04qDBw/ilhsD830qhytxcQaNcCbF2dLzLva
         DC6UFYBJAubirAQ08t9xY7VSddev5FmdfFL5gPO+GzTLUUjqd803Keb9ffIXq6+BPA
         7kltBNngxqHPWLGq9j6X2ADV3M1axtz9fg7zvhGPdaWJYOJ4/M0wF2DrDhoUfiFHxI
         JZQKR0AV4RVZQ==
Date:   Mon, 3 May 2021 10:11:45 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rcu tree
Message-ID: <20210503101145.17cb2bdd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DU0lr4_KUutVDK5U.Td4J78";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DU0lr4_KUutVDK5U.Td4J78
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rcu tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: modpost: "clocksource_verify_percpu" [kernel/time/clocksource-wdtest=
.ko] undefined!

Caused by commit

  98f0fdb43573 ("clocksource: Provide kernel module to test clocksource wat=
chdog")

I have used the rcu tree from next-20210430 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/DU0lr4_KUutVDK5U.Td4J78
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCPP8EACgkQAVBC80lX
0GwU5AgAjFmoKqRPknnyk8ELjix64j52l07zilFeqrE9vT2nDpfzU2nYShaK/i2F
1tyVlqBrE952VX5O2npJiz1k74hVvbZ5WMw8B+SmNFF2Nuy6cN8hdZOH2/VdY7Fy
nZ/2hLliIJ9QX/5PjPRVFj5qFhREWxjvzKB9Oa+FTo2olL5lpHf8Ctep+96Fkldu
2yajQwQiPKfaq265HyiApMNXISuHaHg8INMFK59HkXpKCdgaa+VYcsy+6sW1+t9s
EZo560GJtn3b4ZQWnZeJlsPahFs5n5ohVlcL0Nzw5Dqfw3K9fMu7NlGP7YZhXtlp
FRcBI4TKGdL731G6vLZ7LNgBGQ2SRw==
=OVsu
-----END PGP SIGNATURE-----

--Sig_/DU0lr4_KUutVDK5U.Td4J78--
