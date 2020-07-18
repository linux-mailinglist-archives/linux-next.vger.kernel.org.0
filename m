Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97F262249E0
	for <lists+linux-next@lfdr.de>; Sat, 18 Jul 2020 10:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbgGRIfl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 18 Jul 2020 04:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgGRIfl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 18 Jul 2020 04:35:41 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0CC4C0619D2;
        Sat, 18 Jul 2020 01:35:40 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B81XS0Pbbz9sRN;
        Sat, 18 Jul 2020 18:35:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595061337;
        bh=/JC4+I9ojxORAlks9BSHvHNb9rXl2GhB0EH9eS44SGU=;
        h=Date:From:To:Cc:Subject:From;
        b=TwFBPgNrUtqA3FUCVFTV6wxvR3++SXhCWewYZJ8GzlGiRX9nmLJauDFj6nfze7/p+
         x17eHHvAv4yXuWsTKwiJEfb/ECCLgt8o/0MZrr+PDuG4Jc5CE0zeAnaIZJeFJJiwNe
         9fZb9jKM7jrTmhF5SzBxDGWsq3E6oWtcSXDViKUYwWqlZtR9z7hceWYt9rAYvBaq4N
         6zocr+1trdr2LSxwfNxRB6V4DSm3WWoanii/upfG04IFVog5RK7wctUBdqdL9TroiN
         KLk/C68SOeo2xKosrG4fr6p2a0siWR2jYHgJwi9JrDMq+K0QL/JWYWfrK3OnEEphxO
         YvZqxdWhOs7aA==
Date:   Sat, 18 Jul 2020 18:35:33 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the thermal tree
Message-ID: <20200718183533.0145f682@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GrjFDz344.hnVwSNhV3I3De";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GrjFDz344.hnVwSNhV3I3De
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  130b31498517 ("thermal: core: remove redundant initialization of variable=
 ret")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/GrjFDz344.hnVwSNhV3I3De
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8StFYACgkQAVBC80lX
0Gy9xwgAhPMuhcn6Q7Xq2vaaGBU9oXwZeTkK0AyMIzQFEMabMLkNSiJDiJEYi9N4
rM8guxfF6B6TwVQq4SndCo0DG41f1ekWHqbg+dJjlFZ0o3NRhEEk2KvVPl/KOHLM
OZHBd9kaiJ3g16kb4tnk9yDJ/gTKC7dWJ9U2wlCyw2KH1yA7zee7jICu9D6ZInET
mmLdml3FLiq/gf4Le+qTdGQESGy3rUY51AwLCvgEsDDQ3Nhn0KA0qHyLSSPNMgQN
lJWgXzRcUeqb9EThTnvuPf0KR/3SD3k2xCOLtt1L1kCencC+ulopQGN7qfZZm0rx
d6nZys0CXmfgRhV6XHGMmjQeEi6Rgw==
=CPIu
-----END PGP SIGNATURE-----

--Sig_/GrjFDz344.hnVwSNhV3I3De--
