Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D316F32DBA0
	for <lists+linux-next@lfdr.de>; Thu,  4 Mar 2021 22:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239131AbhCDVNa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 16:13:30 -0500
Received: from ozlabs.org ([203.11.71.1]:52895 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239130AbhCDVNQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 4 Mar 2021 16:13:16 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ds3VB2Ty4z9sRR;
        Fri,  5 Mar 2021 08:12:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614892354;
        bh=yCq9tthbhpMmR8X46N4/qxIpSu6lMK3AoIdRJ764/Zg=;
        h=Date:From:To:Cc:Subject:From;
        b=tJ8TjR8xis8Q45v+DhmT7DARrAaEAhxOmX9f8jFwDLL9PRjJVqUYNBibMfnEp0fkF
         ca/aJyEeQwa1qDKV2FMxpSMoFi/1ybzEHUeRNdIgeUNSlnucbmX4O9hvxkD+sJaYsu
         nJUwm4f62CIB/StAnkmBUFGoNrJjORVbp/utV+clgyRw9sEAx97UyywHOCy4zIF7r3
         D0eXpIZPqji5mT0e+cBUIn/ZJwqHLMJm4TnT++2kY6wXofWhSr+SOb8M7WGQX68hxJ
         SNSaoAIFHtQOx9f0BY2h8aS0itbMQUqinZTr/hVXn8wALTIXcIKt9kJMqjmF7RFKbD
         og0HiSm380msw==
Date:   Fri, 5 Mar 2021 08:12:33 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Tyrel Datwyler <tyreld@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tags need some work in the scsi-fixes tree
Message-ID: <20210305081233.6b8ad732@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E0MN7.och/JdNuaAOSjvs0f";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/E0MN7.och/JdNuaAOSjvs0f
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f4c5e949056d ("scsi: ibmvfc: Reinitialize sub-CRQs and perform channel en=
quiry after LPM")

Fixes tag

  Fixes: 3034ebe26389 ("ibmvfc: add alloc/dealloc routines for SCSI Sub-CRQ=
 Channels")

has these problem(s):

  - Subject does not match target commit subject

In commit

  5bc26ea9498a ("scsi: ibmvfc: Store return code of H_FREE_SUB_CRQ during c=
leanup")

Fixes tag

  Fixes: 39e461fddff0 ("ibmvfc: map/request irq and register Sub-CRQ interr=
upt handler")

has these problem(s):

  - Subject does not match target commit subject

In commit

  98cf9a92b8d6 ("scsi: ibmvfc: Treat H_CLOSED as success during sub-CRQ reg=
istration")

Fixes tag

  Fixes: 3034ebe26389 ("ibmvfc: add alloc/dealloc routines for SCSI Sub-CRQ=
 Channels")

has these problem(s):

  - Subject does not match target commit subject

In commit

  2de4c19179b1 ("scsi: ibmvfc: Fix invalid sub-CRQ handles after hard reset=
")

Fixes tag

  Fixes: 3034ebe26389 ("ibmvfc: add alloc/dealloc routines for SCSI Sub-CRQ=
 Channels")

has these problem(s):

  - Subject does not match target commit subject

Plese just use
	git log -1 --format=3D'Fixes: %h ("%s")'

--=20
Cheers,
Stephen Rothwell

--Sig_/E0MN7.och/JdNuaAOSjvs0f
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBBTUEACgkQAVBC80lX
0Gza4AgAlsshBrbmYg9ars0budbGpzfIr4WiRNdYfoyiw+qIO1Q68CTevVq80NAz
aK+PQv85SwwO1wZMdnL2vZ5KuhBVhoDAGhLkEfekDM4V9R+k1LDt2nCXUR74xbYX
sVJ2Rl99/ITINK0gTq28RXNqaAuIMSJkxwOogVCbKfKMUAPbZhqnFSPW8xcAMUxJ
migWNyyLLmVY/o6nlnNxS/m0sIwNzmqDWj/qUAdvlOpf8GRhGxza6xAKKrhT5TzS
0LP7y9fVuegGRUMNqyd2ERrGA0p7B5i67xRCe1XlAkLlitZ+QA5++ph785ovII5g
mQ5QtChEXQ1aI2c6TS/Hob0szHpSmg==
=wQaV
-----END PGP SIGNATURE-----

--Sig_/E0MN7.och/JdNuaAOSjvs0f--
