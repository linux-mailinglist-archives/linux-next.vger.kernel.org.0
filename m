Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D336FFC68
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 01:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfKRARy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Nov 2019 19:17:54 -0500
Received: from ozlabs.org ([203.11.71.1]:57057 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726284AbfKRARx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 17 Nov 2019 19:17:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47GV0D4LwYz9s4Y;
        Mon, 18 Nov 2019 11:17:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574036270;
        bh=er8aQvti1hb8NEWJoT8OPqKSmOaCUydcAzCHa+4TfB0=;
        h=Date:From:To:Cc:Subject:From;
        b=Ofs0oW5RVGKlEy4kP4u7bfwchbS8T3x7a2ZK8nBhZUyR+W2u9RbOGNrLk8/VIGwH4
         uiLxZZk2EwZ6Qz6SZpaZx/3UT6ckvmfhmOX0W5c3gUbZIrbygUqj5MU4iUQts6XS7I
         4kDFMRfMHrA1leluadOoTnOy+KG3t7RxOlqM42CHUBPR3uDJELa4u6diEgKQ6j23Zi
         XKj9G9nOcdsvOBsrH1jjXjeHAgTNUvzZXe9Znw4ZO+pP5HhgG6OPJHYrLPbaYzyAfd
         /KCeAvxoakn+y80gk13iD8kvbDOHJ/HF/rvx9yzqBGH1AJU/2VyfO+JaeTVSzzEnfM
         jFQyYsyZu9j+g==
Date:   Mon, 18 Nov 2019 11:17:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>
Subject: linux-next: manual merge of the drm tree with the kbuild tree
Message-ID: <20191118111744.2beeb816@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/USf9csr6sW8/Z5gDG3oHV/U";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/USf9csr6sW8/Z5gDG3oHV/U
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/Kconfig.debug

between commit:

  fcbb8461fd23 ("kbuild: remove header compile test")

from the kbuild tree and commit:

  d30213e533fa ("drm/i915: Fix Kconfig indentation")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/Kconfig.debug
index 41c8e39a73ba,eea79125b3ea..000000000000
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@@ -1,33 -1,34 +1,33 @@@
  # SPDX-License-Identifier: GPL-2.0-only
  config DRM_I915_WERROR
-         bool "Force GCC to throw an error instead of a warning when compi=
ling"
-         # As this may inadvertently break the build, only allow the user
-         # to shoot oneself in the foot iff they aim really hard
-         depends on EXPERT
-         # We use the dependency on !COMPILE_TEST to not be enabled in
-         # allmodconfig or allyesconfig configurations
-         depends on !COMPILE_TEST
-         default n
-         help
-           Add -Werror to the build flags for (and only for) i915.ko.
-           Do not enable this unless you are writing code for the i915.ko =
module.
-=20
-           Recommended for driver developers only.
-=20
-           If in doubt, say "N".
+ 	bool "Force GCC to throw an error instead of a warning when compiling"
+ 	# As this may inadvertently break the build, only allow the user
+ 	# to shoot oneself in the foot iff they aim really hard
+ 	depends on EXPERT
+ 	# We use the dependency on !COMPILE_TEST to not be enabled in
+ 	# allmodconfig or allyesconfig configurations
+ 	depends on !COMPILE_TEST
 -	select HEADER_TEST
+ 	default n
+ 	help
+ 	  Add -Werror to the build flags for (and only for) i915.ko.
+ 	  Do not enable this unless you are writing code for the i915.ko module.
+=20
+ 	  Recommended for driver developers only.
+=20
+ 	  If in doubt, say "N".
 =20
  config DRM_I915_DEBUG
-         bool "Enable additional driver debugging"
-         depends on DRM_I915
-         select DEBUG_FS
-         select PREEMPT_COUNT
-         select REFCOUNT_FULL
-         select I2C_CHARDEV
-         select STACKDEPOT
-         select DRM_DP_AUX_CHARDEV
-         select X86_MSR # used by igt/pm_rpm
-         select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
-         select DRM_DEBUG_MM if DRM=3Dy
+ 	bool "Enable additional driver debugging"
+ 	depends on DRM_I915
+ 	select DEBUG_FS
+ 	select PREEMPT_COUNT
+ 	select REFCOUNT_FULL
+ 	select I2C_CHARDEV
+ 	select STACKDEPOT
+ 	select DRM_DP_AUX_CHARDEV
+ 	select X86_MSR # used by igt/pm_rpm
+ 	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
+ 	select DRM_DEBUG_MM if DRM=3Dy
  	select DRM_DEBUG_SELFTEST
  	select DMABUF_SELFTESTS
  	select SW_SYNC # signaling validation framework (igt/syncobj*)

--Sig_/USf9csr6sW8/Z5gDG3oHV/U
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3R4ygACgkQAVBC80lX
0GxOxAf9H6jZ6ZSXV0i9podvVHiAjJFeotvG2AUiBoYF6mS0hNJY6OcEYVbUrDeY
Y0tw1VaB/pYzZW82K4lHA2NHoM8K6M75YvTI2Pxcn63mTZVQNTQUgy3mkxdx8qvP
dJykv2KBy7UbtHc6hatqrExixGNQR5/t2TPN9qfp86pbS/qccbmhFQWVkMp7lQjL
vVhnrBQ9msIq8NqDmxm5vpa+aO8fFad3fB7F/tcECRcRdW0x0wVq1CogiXzJdZwi
z291AQxk/YwHdkbq7ZU1DsVTJ5zJv8ezXBYFvvSnJgzhGmkjc3A37ha52HGr96Y3
u/rkrtO4NVWbSrh9+0mPhIYv8n1+9Q==
=gNCg
-----END PGP SIGNATURE-----

--Sig_/USf9csr6sW8/Z5gDG3oHV/U--
