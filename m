Return-Path: <linux-next+bounces-8220-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C7FB48538
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 09:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17F101882401
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 07:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7EBB2E2EF8;
	Mon,  8 Sep 2025 07:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZO902U2j"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE25B1F8677;
	Mon,  8 Sep 2025 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757316588; cv=none; b=FSWVrcwaFXl6zmV//YXqlfZsl89mNk7T/5P8HAV3JdhjUzWrTmL5WSX3kgaboSM1WBo+87v38lLUM20CzjYQVP/fBRLAj4SdqzovPR2KMs/snVGy0blQFyLjDJ5F7DTWyixv/zjfGpUPY+UOXgs7kkw/K87OfZTtvag4YF3wz24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757316588; c=relaxed/simple;
	bh=ovi7fO60dbSdkohVpcAojDjfks+fBW24EzuwpHgzm3U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MZ39T78bh/Lshwn/e+DgTfb8UC7K+crW+5gCcr4x1CUCjvPlBZPr1VHcA4cKN+StYpVQ+3xJftFqHQA9pzEjX59iOpQsiEIf0SvY4KbYZLwmt4msbj+9cYxUAipJi+z1O5SC0GHHNWoW5hnSJkOgkBGtyCuEQbmygnxao+vVZrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZO902U2j; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757316580;
	bh=4xcfkKg4nMq5zDCcRXnVmjkCLz/UQ0QfNTEsoMybjfc=;
	h=Date:From:To:Cc:Subject:From;
	b=ZO902U2jwT01iAE+nVU/XLn7VPVEIqfiKufonHW16bSON6+G4gT3iVhc9whGLj7j/
	 IjMB/4/l1pRzjqDNwDRr3YY1WNN8tJSsQTljQkcnGXiVqt0vn11g3WH7WcndkUMYg0
	 OHZ04gY3Ub+C3M4gYAf9IxSMcVO4ENCdApEeqL4AND2bXrmlkV/rbb9ZlXtzgx0k/Q
	 aU0WeCet4tuLEkyshnNlleoFMybkUkNlF1ygKPRD7ypruv+0eCQ0KKg/yz3qBUHT+M
	 0R9DNb6ELowvLPl8crpy2JkU5EWm7YioPHuwm0eRZTRZcmk/NS6qQ9MmLejD16Y2cT
	 9KhyfnWcuRSTQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cKz9b4gBvz4w8y;
	Mon,  8 Sep 2025 17:29:39 +1000 (AEST)
Date: Mon, 8 Sep 2025 17:29:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <skhan@linuxfoundation.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, David Gow
 <davidgow@google.com>, Marie Zhussupova <marievic@google.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kunit-next tree with the drm-xe
 tree
Message-ID: <20250908172938.68a86c52@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B.DXCTRo_lW.HgaK8HAn+kH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/B.DXCTRo_lW.HgaK8HAn+kH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kunit-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/gpu/drm/xe/xe_pci.c:1104:
drivers/gpu/drm/xe/tests/xe_pci.c: In function 'xe_pci_fake_data_gen_params=
':
drivers/gpu/drm/xe/tests/xe_pci.c:80:36: error: passing argument 1 of 'plat=
form_gen_params' discards 'const' qualifier from pointer target type [-Werr=
or=3Ddiscarded-qualifiers]
   80 |         return platform_gen_params(prev, desc);
      |                                    ^~~~
In file included from include/kunit/static_stub.h:18,
                 from drivers/gpu/drm/xe/xe_pci.c:8:
include/kunit/test.h:1729:60: note: expected 'struct kunit *' but argument =
is of type 'const void *'
 1729 |         static const void *name##_gen_params(struct kunit *test,   =
                             \
      |                                              ~~~~~~~~~~~~~~^~~~
drivers/gpu/drm/xe/tests/xe_pci.c:65:1: note: in expansion of macro 'KUNIT_=
ARRAY_PARAM'
   65 | KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
      | ^~~~~~~~~~~~~~~~~
drivers/gpu/drm/xe/tests/xe_pci.c:80:16: error: too few arguments to functi=
on 'platform_gen_params'
   80 |         return platform_gen_params(prev, desc);
      |                ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/xe/tests/xe_pci.c:65:19: note: declared here
   65 | KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
      |                   ^~~~~~~~
include/kunit/test.h:1729:28: note: in definition of macro 'KUNIT_ARRAY_PAR=
AM'
 1729 |         static const void *name##_gen_params(struct kunit *test,   =
                             \
      |                            ^~~~
drivers/gpu/drm/xe/tests/xe_pci.c:81:1: error: control reaches end of non-v=
oid function [-Werror=3Dreturn-type]
   81 | }
      | ^
cc1: all warnings being treated as errors

Caused by commit

  b9a214b5f6aa ("kunit: Pass parameterized test context to generate_params(=
)")

interacting with comit

  a9c8517058cc ("drm/xe/kunit: Promote fake platform parameter list")

from the drm-xe tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 8 Sep 2025 17:15:21 +1000
Subject: [PATCH] fix up for "kunit: Pass parameterized test context to
 generate_params()"

interacting with "drm/xe/kunit: Promote fake platform parameter list"
from the drm-xe tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/xe/tests/xe_pci.c      | 5 +++--
 drivers/gpu/drm/xe/tests/xe_pci_test.h | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/x=
e_pci.c
index e29ec1ce7231..c789bfb8af96 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci.c
+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
@@ -66,6 +66,7 @@ KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
=20
 /**
  * xe_pci_fake_data_gen_params - Generate struct xe_pci_fake_data paramete=
rs
+ * @test: a test pointer
  * @prev: the pointer to the previous parameter to iterate from or NULL
  * @desc: output buffer with minimum size of KUNIT_PARAM_DESC_SIZE
  *
@@ -75,9 +76,9 @@ KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_desc);
  *
  * Return: pointer to the next parameter or NULL if no more parameters
  */
-const void *xe_pci_fake_data_gen_params(const void *prev, char *desc)
+const void *xe_pci_fake_data_gen_params(struct kunit *test, const void *pr=
ev, char *desc)
 {
-	return platform_gen_params(prev, desc);
+	return platform_gen_params(test, prev, desc);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_pci_fake_data_gen_params);
=20
diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.h b/drivers/gpu/drm/xe/te=
sts/xe_pci_test.h
index e2f8d65e9e33..30505d1cbefc 100644
--- a/drivers/gpu/drm/xe/tests/xe_pci_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_pci_test.h
@@ -25,7 +25,7 @@ struct xe_pci_fake_data {
 };
=20
 int xe_pci_fake_device_init(struct xe_device *xe);
-const void *xe_pci_fake_data_gen_params(const void *prev, char *desc);
+const void *xe_pci_fake_data_gen_params(struct kunit *test, const void *pr=
ev, char *desc);
 void xe_pci_fake_data_desc(const struct xe_pci_fake_data *param, char *des=
c);
=20
 const void *xe_pci_graphics_ip_gen_param(struct kunit *test, const void *p=
rev, char *desc);
--=20
2.51.0

--=20
Cheers,
Stephen Rothwell

--Sig_/B.DXCTRo_lW.HgaK8HAn+kH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+heIACgkQAVBC80lX
0GzeLwf7BE/Uk5ZxWuRnSTmOkrjKI+N8lhjDg+IXc+xdF4f6kkdciayhp+/eWlzx
44kBQDqJyqJnFEATBAcQj791+wjnUvu4v3/Ark/iR7l+e6zwUiLn3DI6ssZn+jaq
rXtfLNrtaXvp43lboxXBJvZ0COvVQSt1WaxmBe8iC7EiNSYhXo8bFBlj3eYcQjMv
AT7MdbjYh8SBkex3D8IGMYy49MgbO4j9L9MUUSPPTSRSJ/O10h3B2D6AnbIATNZk
YUQ13q/0L4LSN+BRW2Dsj2rzSBLACMcOl2cn7TMFN7LQMCdq3OzFVDVyZSc6d1ek
+rDn0ykhm5/17kqLT0B2Am1fq9TnYg==
=r5eZ
-----END PGP SIGNATURE-----

--Sig_/B.DXCTRo_lW.HgaK8HAn+kH--

