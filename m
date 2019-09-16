Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2E9B330D
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 03:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfIPBpp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Sep 2019 21:45:45 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:34566 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfIPBpp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Sep 2019 21:45:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
        Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=r9K3thlaEGsm6IDV53I4ktWkaE/snlWCDUXjKouUxM0=; b=xGnsOyGc+PXRA/cWK0Jnb0FOt
        fIKDPCB/xvkNAb6vBFHEKWYxktbFbCXHvn7xnWzkW3aGcoGUx83obrnTkOY3+OjLSJcw0LQgtnjIx
        iY+At2NXOtn2TDrdf0btkUoDeeBC9VHvEe2JAL/Nq5mmmcMrYEFtOa9UIXZYyS7xXjtYs=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1i9g5E-0002AJ-7I; Mon, 16 Sep 2019 01:45:40 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 68CF42741587; Mon, 16 Sep 2019 02:45:39 +0100 (BST)
Date:   Mon, 16 Sep 2019 02:45:39 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Shuah Khan <shuah@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Petr Vorel <pvorel@suse.cz>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the kselftest tree with the tpmdd tree
Message-ID: <20190916014535.GU4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="A+KtNVtgI4x4SWvL"
Content-Disposition: inline
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--A+KtNVtgI4x4SWvL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kselftest tree got a conflict in:

  tools/testing/selftests/tpm2/Makefile

between commit:

  3fb2179b0f3553a ("selftests/tpm2: Add the missing TEST_FILES assignment")

=66rom the tpmdd tree and commit:

  d04e26067d13f01 ("selftests: tpm2: install python files")

=66rom the kselftest tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc tools/testing/selftests/tpm2/Makefile
index bf401f725eef8,1a5db1eb8ed51..0000000000000
--- a/tools/testing/selftests/tpm2/Makefile
+++ b/tools/testing/selftests/tpm2/Makefile
@@@ -2,4 -2,4 +2,5 @@@
  include ../lib.mk
 =20
  TEST_PROGS :=3D test_smoke.sh test_space.sh
 +TEST_FILES :=3D tpm2.py tpm2_tests.py
+ TEST_PROGS_EXTENDED :=3D tpm2.py tpm2_tests.py

--A+KtNVtgI4x4SWvL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1+6T4ACgkQJNaLcl1U
h9DrGgf9Fx4x4EFYxQf1Wd8MS1pgKI7l4p9OrLGVc25pEEPxhsmSjiCNIwjODgZ/
B03mH96tCv12FnPLsfD+YxC8reCK1LrdpeFrdOAH32+EtjsI43XeMM/So+k6u3Rl
hdikAPQmEo/IZzIL/bkAk7tkQmnrTzzDNtX0UQ2Lv+2k0kvlxtoJmAyZTj54Yuc9
ZDMbM9gWg4myaZBQBHSZk9a/w7JGYtN5k5RyG7nDFieH1OCBiQ3oRLdVdFaXFmgH
rGpVk3hyy8u+AI5Vvfn2tnsEaKoLkXKDpvHCTbNPZS4Bh/PeNf8/moXzpxTf7bVE
oaGaD2UNMMlbGB8vQtKg+TCFwK+6Jw==
=vsVz
-----END PGP SIGNATURE-----

--A+KtNVtgI4x4SWvL--
