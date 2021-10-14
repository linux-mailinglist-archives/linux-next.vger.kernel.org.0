Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7315D42E476
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 00:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230203AbhJNWzk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Oct 2021 18:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhJNWzk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2021 18:55:40 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96933C061570;
        Thu, 14 Oct 2021 15:53:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HVl7F0WNLz4xb9;
        Fri, 15 Oct 2021 09:53:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634252009;
        bh=W9k4rlXYFcvRmBCEV+RIrGWKO5o3ELTRNuvQrIhpF0g=;
        h=Date:From:To:Cc:Subject:From;
        b=CV+giH1APtHjdfp3D6+ewP8I1SRKdNybX3mo1KN/yZ0/J3vGjYAtHQhLhlYe/ozt3
         2SJ6S8V2MweXYA1E6KQaX/gHeQr7RqCkkzvg4ovg0msP/JgYn29UHYp2eFW2OCP66v
         zi6TVipIH4FSKNst2qWE0Sa7H1pJtxeUqpxX2apxyjhcoB1xoK1riAeE6+0UEeG/97
         tPVDAdYuLCZQ5N5tfgbgfrIvQS7w1sQkw18KaiCv6654x5O9FQRMM2ganq1T6Xxyg2
         kPvZaG3va2OCKaz9b1WVyFR7gpVEvjhNV/3zUcbI/ZmXFTjnNomEksT6OXMgZ5lNaO
         hk8kaNLX8if1g==
Date:   Fri, 15 Oct 2021 09:53:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Todd Kjos <tkjos@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags needs some work in the selinux tree
Message-ID: <20211015095327.42344a21@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w0rmlU4D5Kvd6qci1qP3yaB";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/w0rmlU4D5Kvd6qci1qP3yaB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  fef994d85ac9 ("binder: use cred instead of task for getsecid")

Fixes tag

  Fixes: ec74136ded79 ("binder: create node flag to request sender's

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

In commit

  d1c927fb8b52 ("binder: use cred instead of task for selinux checks")

Fixes tag

  Fixes: 79af73079d75 ("Add security hooks to binder and implement the

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/w0rmlU4D5Kvd6qci1qP3yaB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFotOcACgkQAVBC80lX
0GyCsggAl9x6zITN++MNBb2CJ1IFMO0tehCYyXg3dlpnYzZL1KQ0ahbdOzt0MLa0
2pA5pUGkvW2JJ6YQnIMbzFNVJX1bGp4ehrijtL39AuYWZXERcPfbzFcskw20BZKl
wQd6KVdU1HJGfyr/UUfxDeWGS3OYeV/1xOw+ci2RS6d/ZT4Du4hz5mDnU3ElfTd5
Ntyz7uklWzP43bns2Ma9DRIBiGqOKXCEj9Td/FCoeGKBbIxL4pkWoeOpLBzsd/Jr
ObsMZF8WRERsKmU34GlWKQu9RrILJNTc9DmarAWTGckWjHC0TtEEaL5KGitjx1n6
81BSaRn7LVfU2739st15Rzkb2hrPtw==
=AAj0
-----END PGP SIGNATURE-----

--Sig_/w0rmlU4D5Kvd6qci1qP3yaB--
