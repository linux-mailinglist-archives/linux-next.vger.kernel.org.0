Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEBFA10A766
	for <lists+linux-next@lfdr.de>; Wed, 27 Nov 2019 01:18:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbfK0ASu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Nov 2019 19:18:50 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60697 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726701AbfK0ASu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 26 Nov 2019 19:18:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47N1b45VhLz9sSX;
        Wed, 27 Nov 2019 11:18:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574813927;
        bh=7/fA7nsrQLmigYdQo0vZuD7DCUXWCaRudMS2rL8v8SE=;
        h=Date:From:To:Cc:Subject:From;
        b=ozdDJ/Rww5xE6dTG8AOwTQ3VARtkjI7/+3Oefuvvli5FNYzJ7XGBCeYVdUwLXm7jd
         4m+zkTHM6N8jX/9eK9C5RzXbk/PVhEjID+otAPm8gWD1flLRrTAtMtSR4x4V5g9onR
         KnuHjU3mMsi9AVr7y955N2pmLyxIAjlJI9mZ/9e5Jl+wk80GA6SK6Pwmv9uUQs61Ri
         /grJ5InUl+NJjwtZ4NUaQjFIBndYlPvweydmW/u5K91rolxXzvSS/02jWm9b6FVC98
         v1Baa4Ggn18oXwAj8pc5N37ZQWW0fnWlDy5j/EZW3yccAexd3Z9Zmma2uSzUNI82mD
         J7dwAZgdmeLLQ==
Date:   Wed, 27 Nov 2019 11:18:35 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>
Subject: linux-next: manual merge of the tip tree with the drm tree
Message-ID: <20191127111835.702b9720@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/djGOEiVp03qtTAvYQL70yf6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/djGOEiVp03qtTAvYQL70yf6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/gpu/drm/i915/Kconfig.debug

between commit:

  d30213e533fa ("drm/i915: Fix Kconfig indentation")

from the drm tree and commit:

  fb041bb7c0a9 ("locking/refcount: Consolidate implementations of refcount_=
t")

from the tip tree.

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
index 5571cc73a9ce,1400fce39c58..000000000000
--- a/drivers/gpu/drm/i915/Kconfig.debug
+++ b/drivers/gpu/drm/i915/Kconfig.debug
@@@ -1,33 -1,33 +1,32 @@@
  # SPDX-License-Identifier: GPL-2.0-only
  config DRM_I915_WERROR
 -        bool "Force GCC to throw an error instead of a warning when compi=
ling"
 -        # As this may inadvertently break the build, only allow the user
 -        # to shoot oneself in the foot iff they aim really hard
 -        depends on EXPERT
 -        # We use the dependency on !COMPILE_TEST to not be enabled in
 -        # allmodconfig or allyesconfig configurations
 -        depends on !COMPILE_TEST
 -	select HEADER_TEST
 -        default n
 -        help
 -          Add -Werror to the build flags for (and only for) i915.ko.
 -          Do not enable this unless you are writing code for the i915.ko =
module.
 -
 -          Recommended for driver developers only.
 -
 -          If in doubt, say "N".
 +	bool "Force GCC to throw an error instead of a warning when compiling"
 +	# As this may inadvertently break the build, only allow the user
 +	# to shoot oneself in the foot iff they aim really hard
 +	depends on EXPERT
 +	# We use the dependency on !COMPILE_TEST to not be enabled in
 +	# allmodconfig or allyesconfig configurations
 +	depends on !COMPILE_TEST
 +	default n
 +	help
 +	  Add -Werror to the build flags for (and only for) i915.ko.
 +	  Do not enable this unless you are writing code for the i915.ko module.
 +
 +	  Recommended for driver developers only.
 +
 +	  If in doubt, say "N".
 =20
  config DRM_I915_DEBUG
 -        bool "Enable additional driver debugging"
 -        depends on DRM_I915
 -        select DEBUG_FS
 -        select PREEMPT_COUNT
 -        select I2C_CHARDEV
 -        select STACKDEPOT
 -        select DRM_DP_AUX_CHARDEV
 -        select X86_MSR # used by igt/pm_rpm
 -        select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
 -        select DRM_DEBUG_MM if DRM=3Dy
 +	bool "Enable additional driver debugging"
 +	depends on DRM_I915
 +	select DEBUG_FS
 +	select PREEMPT_COUNT
- 	select REFCOUNT_FULL
 +	select I2C_CHARDEV
 +	select STACKDEPOT
 +	select DRM_DP_AUX_CHARDEV
 +	select X86_MSR # used by igt/pm_rpm
 +	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
 +	select DRM_DEBUG_MM if DRM=3Dy
  	select DRM_DEBUG_SELFTEST
  	select DMABUF_SELFTESTS
  	select SW_SYNC # signaling validation framework (igt/syncobj*)

--Sig_/djGOEiVp03qtTAvYQL70yf6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3dwNsACgkQAVBC80lX
0GzKpAf/ZhQaIORg0QMkjiSexMkq8/uL+SqauTZr+6sShMRNZm2oknpQIDxxkccx
zbhUYumhzdtZ3/cCDmi8f9kdOSIGtD1m3RhDvUhEyBS+uyDjFvEDlB+PH5cS0ae2
cMkxh3RALp6pnA/+ZzfsT9xJewOz3PV4n2wJNYdOAq/F6Vjv4JqMid4PtwsMndFU
ZwouOmygTURstjUvwbrhBGB1oarwls8LXFebEiwFld7wiC8tO3n+KZOAUWKGR6vW
fUDC86k6BB5n/SPdoVw9CBFntVj2XmAarX8r5I+ZkqgSV4qLTrKcDLq2XP9duWB/
d8j5ycea4Z7OOyXsH71MeVn8+ODbpA==
=btYm
-----END PGP SIGNATURE-----

--Sig_/djGOEiVp03qtTAvYQL70yf6--
