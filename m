Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4FD15B3A4
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2020 23:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728185AbgBLW0R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Feb 2020 17:26:17 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:43361 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727947AbgBLW0R (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Feb 2020 17:26:17 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48HvPL3Mldz9sRN;
        Thu, 13 Feb 2020 09:26:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1581546374;
        bh=VQS6IgmpnsYuX7ESvvv6ugBYoowEfWcXmjtDhWcgdKU=;
        h=Date:From:To:Cc:Subject:From;
        b=bTWz1jpSGYdiJ6wS3JtcQZNjTH3dDWYD1AHpqBXt8C2GoyyV6TMRd3MPUmKllIMhP
         c7k4sZmiICvEYVPAJU7qlSg2DlrrpF8kuyEk8woTjU+p744stwDPRaPZwezoEJIyL1
         dRmNDLd2KVOVvUanZ/UbDo/BqiwC6+wEqj6e886sxyet2qk5PzizdLbFbadjshoyWl
         Un6sDRHmvfRe+CZFj7rW2knlQEpDytcSxba/ZQ5jb+QfAkdsTEV9UHUSb9dJmgpeEi
         cEQfAP5M+tq9/0eEulIg7COzcpolKw9wcm1mnQUx8y+BoXB93DBuj9MnL/p569paOA
         eF2xsboIMnqVQ==
Date:   Thu, 13 Feb 2020 09:26:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the rcu tree
Message-ID: <20200213092613.1b66d1f5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Aq+J/5bOAUdVlTecKNkDIXx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Aq+J/5bOAUdVlTecKNkDIXx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  71901ffaf70d ("locktorture: Print ratio of acquisitions, not failures")

Fixes tag

  Fixes: 0af3fe1e ("locktorture: Add a lock-torture kernel module")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/Aq+J/5bOAUdVlTecKNkDIXx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5Ee4UACgkQAVBC80lX
0GzxqAgAjHFKel11Yz28su+ejldC1Cq07a0RruqqrzqAZ94Dq6QkP7fWk1SlW4sf
gFNd3af0cMr7iayygPp2d1gzeluFrP0LRlAqlOyqbT9r+t9Lntn8GVWbIw4ChudX
lIgNtKUTpKP8iAvP1q1IbuB/FU2rR7PS4KUufwmkh06IIt8U8TMums4H4alVQpLj
f/Q0L7/OdoPEIDLI3SmYQoqaGG3pETGd02OXgYrAPcGcjPSjV+LYgBTDgvgKmdgg
FufWqcWuLgUhMW2p22ZsS7bWDxKRYyR0WkIjVMwx1jz2RtVoDUSePG46gPxN5vW0
1azxWFNak9r7HZiJ7BiTuGdA87Anig==
=zquh
-----END PGP SIGNATURE-----

--Sig_/Aq+J/5bOAUdVlTecKNkDIXx--
