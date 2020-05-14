Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2121D413F
	for <lists+linux-next@lfdr.de>; Fri, 15 May 2020 00:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728313AbgENWnU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 18:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728229AbgENWnU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 18:43:20 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688B3C061A0C;
        Thu, 14 May 2020 15:43:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49NRQZ5bMbz9sTD;
        Fri, 15 May 2020 08:43:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589496199;
        bh=aAaREl4wtg8m5bBBhlWrMHr+r5xP6gQjE/JEICeZG3E=;
        h=Date:From:To:Cc:Subject:From;
        b=RZ4s9HiGzxEgAqvB5xZBrLAwG2138vTNReky3++q8UxUblS81Q/9jEgkdGpXNmLTr
         jVNJmbaBbPM+NAOdgNAX7hxlEtJOhvWuhKqGutN0C9g3eXKhLcHYywB9EYcLDCPchc
         xuTg36JRQ03Qa47NoAqBWxHPFpfzbU+etvb+xo6CiofvlAZVqL+o+g4zdsAAJUhV4E
         8nQtf9m/fjbfHRN7HmDDI2N7YSVqNF2Bzpc5i8jAtGes2HWKv2Ym69vKQxYJ33eDAU
         C+Y22ASqVs+jNoT8ULIb5iffQ6aqkmy32HLhBuvK6uEITBkAYNKdN3IFgFqTZca55s
         kL5Z2PNdUTn6g==
Date:   Fri, 15 May 2020 08:43:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commits in the rcu tree
Message-ID: <20200515084317.7deae61a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mcZlU9e8Bi.SUIOyAez9_CP";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mcZlU9e8Bi.SUIOyAez9_CP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,
Commits

  b2998782ded4 ("Documentation/litmus-tests: Clarify about the RCU pre-init=
ialization test")
  663f9202eb8a ("Documentation/litmus-tests: Merge atomic's README into top=
-level one")
  f5eff20366f6 ("tools/memory-model: Fix reference to litmus test in recipe=
s.txt")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/mcZlU9e8Bi.SUIOyAez9_CP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl69yYUACgkQAVBC80lX
0GwOGAf+IkvkuLZuGvdy1FqMcRh1VgWgSvXseITJvxc2NBISGHpDS8L9YO9Ltv9H
2z0yHN7CAXe/nfKdVeUd6tmclx1cBIJiriEzzcCcPXa3+bZ2O4i4D5uvjTUwYY0i
Bc2KvgD/D9tjouJ7rQ4TyK7jJz8hx9cHDGG0uPj1ve4FF4dUntE1LaJ0satevSAU
6JNfnu50R/0TTD1/2ZX211Gnt6cR5ukKTO7pniUf6wILiXg5VX/LHcpzHVlf19p3
oBapgYZqxycSsTnnodJMgP4I91Rv3xmLw0bYr7K1oK5nzEC3ZOm7aAj+912Y72rF
v7TTI8Rr3fYF8yGd7hzWBGSCIKzFxA==
=vHT/
-----END PGP SIGNATURE-----

--Sig_/mcZlU9e8Bi.SUIOyAez9_CP--
