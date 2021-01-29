Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEB7030863C
	for <lists+linux-next@lfdr.de>; Fri, 29 Jan 2021 08:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbhA2HIP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Jan 2021 02:08:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbhA2HIO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Jan 2021 02:08:14 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC16C061573;
        Thu, 28 Jan 2021 23:07:34 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DRpLp3nY8z9sSC;
        Fri, 29 Jan 2021 18:07:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611904052;
        bh=CBnQX/9BT4fWvnBH2HpYrwl4g+Tim3wZzojPaFHiCHs=;
        h=Date:From:To:Cc:Subject:From;
        b=g+KnLKbggV6TK9VbQfS92U4RjYAfYTRJRN4SRcwc+I7ps4B6/REAEuvyyZTpJz1NF
         8m56CaieOwcWOPcFUy/kthnDkeiQ93yjJKThx/gdR1wo6FIv9jP2dDHdiX17PfQRl9
         rTNiZBVrIpC+IaBl60Bc3NNedQFN2VmR9ocZjhls1jIRsuFKzgWkVdc1IF87ELlWLY
         dM/BGWVE/hVqL9LsRvzftk+LSCjvPxaPK8wt3O837IhbklL9Rc/EhfJIAmWqnN3slr
         ASwyjE/w7nZyoG59PqM4q6GreKjp2Y96wsKygrVBF9uWczAcZ9UQHLEeS8H3IX65l7
         54skAqn22NbKg==
Date:   Fri, 29 Jan 2021 18:07:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the char-misc tree
Message-ID: <20210129180729.44e79afe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EgVFxuPFb4xK8jtf67GEl.b";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EgVFxuPFb4xK8jtf67GEl.b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/driver-api/index.rst:14: WARNING: toctree contains reference =
to nonexisting document 'driver-api/pti_intel_mid'

Introduced by commit

  8ba59e9dee31 ("misc: pti: Remove driver for deprecated platform")

--=20
Cheers,
Stephen Rothwell

--Sig_/EgVFxuPFb4xK8jtf67GEl.b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmATtDEACgkQAVBC80lX
0Gx/cgf/b4hAL9TgC6QRHQQJSm02cc5W8mGwrGr3BdCH9eRm+m1UzLA2HyC+rOYR
yR0M6rkT2dQWlYZ6jqbp+FAQRseeKlcWGyYf8RDcbkcUJlHbQbrEBp5aKQ4ZpFhJ
JcPmzRfvSy+4OiQOx1g4czXR/7Y7SBzn29U69jfjbxD5MvQnkEV2L7AoM2lNw7JC
CZeU12mPLOcI7FcFNP4MYY73kB713VlvTQt5pYGePkoi+8aPBs8n9iJcyQf2gnJ+
pVoN8e2/4Sv568DVMFMA7UXG0k5YLVbv7CTC6gjrB8d7hgEowpFPJhJ3Yi2it/2Y
0/LdVm7JPuzsNIxSRDeZdvX+G46/pA==
=23Lj
-----END PGP SIGNATURE-----

--Sig_/EgVFxuPFb4xK8jtf67GEl.b--
