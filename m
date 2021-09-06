Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEAE6401571
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 06:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234514AbhIFEVo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 00:21:44 -0400
Received: from ozlabs.org ([203.11.71.1]:40891 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234281AbhIFEVo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Sep 2021 00:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630902038;
        bh=+AemATtckKgra0q8wrPoHg+MLxTc3KrQE8jQY5E93uo=;
        h=Date:From:To:Cc:Subject:From;
        b=u89VLnF3l4APGTmf5kfwNUeJDTEYcGGgeVyn4zWxfMfbX/MKxNz9hwFEn8oMJiWDT
         YKF8phkN/Ti1MEKRM6Sm8TkscublzCULG6sbiEivl4WDCACKb/fKQtGZpIkkvk3y3s
         +zAjdNTQHdS3w3S9Pd5CNHowiCWJlwvmmL9itj5IoRYC4UNFZSupjktyWkJK3KUpEt
         sVXeHE4lFcFA0Z7jZQ0U0TYYCPirWLXIfCH/iC43Zzn68RAyEGykB/MB9AnH5xHugs
         HTNBnD7GQ7jxaymSO8nwyrXenYHYVCA/KoJout1c5LJCUw/W23H04SXGjGJOZsYWH4
         hBTUd5tub6ihw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H2wDk2vzGz9sRN;
        Mon,  6 Sep 2021 14:20:37 +1000 (AEST)
Date:   Mon, 6 Sep 2021 14:20:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the cxl tree
Message-ID: <20210906142037.59f76dab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NTq6TzVyz4q7v2nGrPHTFYs";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/NTq6TzVyz4q7v2nGrPHTFYs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cxl tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

drivers/nvdimm/label.c:750:32: error: 'uuid_to_nvdimm_cclass' defined but n=
ot used [-Werror=3Dunused-function]
  750 | static enum nvdimm_claim_class uuid_to_nvdimm_cclass(uuid_t *uuid)
      |                                ^~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  d68bc4b2338b ("libnvdimm/labels: Add address-abstraction uuid definitions=
")

Exposed by commit

  3fe617ccafd6 ("Enable '-Werror' by default for all kernel builds")

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 Sep 2021 14:14:52 +1000
Subject: [PATCH] cxl: mark unused function as such

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/nvdimm/label.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvdimm/label.c b/drivers/nvdimm/label.c
index 7abeb1233404..175db14c7694 100644
--- a/drivers/nvdimm/label.c
+++ b/drivers/nvdimm/label.c
@@ -747,6 +747,7 @@ static enum nvdimm_claim_class guid_to_nvdimm_cclass(gu=
id_t *guid)
 }
=20
 /* CXL labels store UUIDs instead of GUIDs for the same data */
+__maybe_unused
 static enum nvdimm_claim_class uuid_to_nvdimm_cclass(uuid_t *uuid)
 {
 	if (uuid_equal(uuid, &nvdimm_btt_uuid))
--=20
2.32.0

--=20
Cheers,
Stephen Rothwell

--Sig_/NTq6TzVyz4q7v2nGrPHTFYs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE1lxUACgkQAVBC80lX
0Gzunwf/YlV2kEuYKuMc8Sr6AQ2RP5gMURZ14ojqIrcudIiqyzTcsRXYUrPkKn5Y
3hGpFFQPm4Zh7ROqLTytzjhYCzrZw1zmFB7vnH5ba1Sz2DQNBh/3Fm9ko8pcZfji
dO+TMRjF4uEVgrWmECt0/RQsGZcZ6m63KEv6q3iSMUfY/2xlryhBPs9jb0mknnvJ
A0fDettlNigf2dm3aWd0Pxs6i4pVkEyDfb1aKG4hoAhtYiJDHfxmGMNi3wo36TJl
/g7136/SoP3hXHSRDYdhpV79UEXIEYe7W4VvEZ3CR4Y6X4tbEcSZ/YXBQe95WEVA
mUYp7KE5JBOfy/4NnsunBEK2tI21EQ==
=zpMN
-----END PGP SIGNATURE-----

--Sig_/NTq6TzVyz4q7v2nGrPHTFYs--
