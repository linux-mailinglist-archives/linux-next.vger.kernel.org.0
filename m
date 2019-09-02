Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22018A4FF0
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 09:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729527AbfIBHbI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 03:31:08 -0400
Received: from ozlabs.org ([203.11.71.1]:50219 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729408AbfIBHbI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 03:31:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46MMFg5Tzsz9s7T;
        Mon,  2 Sep 2019 17:31:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567409464;
        bh=XELxu5FgecPOqvbsunN+p5nGwQ3YBc3AeD3egFnCS9g=;
        h=Date:From:To:Cc:Subject:From;
        b=bAJ3UbDbhkTno29Q0Ba888CbYXog/kbRlUFQINag1Jor1bwpBJaNieJPHJ9ZlHqjm
         O6hnaBSfrGGiMwHQ6bAe+mXiIeJmUuJr/LmQnTlgu3s+FTExUdWW1bMcZIFCqErTpn
         E+gLHEpxYHORmtKsvpP8ARBX2G/n2lBzaUTgBch0R7V52xB/rg/AXbhjWoTxFC8Q15
         pxB/s/3HzSw7VZzUr6RqvullPK3JepMWNawFlhcgiEN9fFaUBDmVF9O2wsmK2Y9elL
         +1ifkV2KISmN51dASokvGwkx+8qy048uovIvuIiopKhqI4Lduv15SDCpDAKn30qPGJ
         mvdgR/RMkv+Eg==
Date:   Mon, 2 Sep 2019 17:31:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Len Brown <len.brown@intel.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <20190902173102.53a44459@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/61CBMUCLyn0N/.EVCaxPnwA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/61CBMUCLyn0N/.EVCaxPnwA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  tools/power/x86/turbostat/turbostat.c

between commit:

  cd188af5282d ("tools/power turbostat: Fix Haswell Core systems")
  b62b3184576b ("tools/power turbostat: add Jacobsville support")
  d93ea567fc4e ("tools/power turbostat: Add Ice Lake NNPI support")

from Linus' tree and commit:

  c66f78a6de4d ("x86/intel: Aggregate big core client naming")
  af239c44e3f9 ("x86/intel: Aggregate big core mobile naming")
  5e741407eab7 ("x86/intel: Aggregate big core graphics naming")
  5ebb34edbefa ("x86/intel: Aggregate microserver naming")

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

diff --cc tools/power/x86/turbostat/turbostat.c
index b2a86438f074,6eef0cee6d75..000000000000
--- a/tools/power/x86/turbostat/turbostat.c
+++ b/tools/power/x86/turbostat/turbostat.c
@@@ -3234,15 -3207,14 +3234,15 @@@ int probe_nhm_msrs(unsigned int family
  		pkg_cstate_limits =3D snb_pkg_cstate_limits;
  		has_misc_feature_control =3D 1;
  		break;
- 	case INTEL_FAM6_HASWELL_CORE:	/* HSW */
+ 	case INTEL_FAM6_HASWELL:	/* HSW */
  	case INTEL_FAM6_HASWELL_X:	/* HSX */
- 	case INTEL_FAM6_HASWELL_ULT:	/* HSW */
- 	case INTEL_FAM6_HASWELL_GT3E:	/* HSW */
- 	case INTEL_FAM6_BROADWELL_CORE:	/* BDW */
- 	case INTEL_FAM6_BROADWELL_GT3E:	/* BDW */
++	case INTEL_FAM6_HASWELL_L:	/* HSW */
+ 	case INTEL_FAM6_HASWELL_G:	/* HSW */
+ 	case INTEL_FAM6_BROADWELL:	/* BDW */
+ 	case INTEL_FAM6_BROADWELL_G:	/* BDW */
  	case INTEL_FAM6_BROADWELL_X:	/* BDX */
- 	case INTEL_FAM6_SKYLAKE_MOBILE:	/* SKL */
- 	case INTEL_FAM6_CANNONLAKE_MOBILE:	/* CNL */
+ 	case INTEL_FAM6_SKYLAKE_L:	/* SKL */
+ 	case INTEL_FAM6_CANNONLAKE_L:	/* CNL */
  		pkg_cstate_limits =3D hsw_pkg_cstate_limits;
  		has_misc_feature_control =3D 1;
  		break;
@@@ -3431,15 -3403,14 +3431,15 @@@ int has_config_tdp(unsigned int family
 =20
  	switch (model) {
  	case INTEL_FAM6_IVYBRIDGE:	/* IVB */
- 	case INTEL_FAM6_HASWELL_CORE:	/* HSW */
+ 	case INTEL_FAM6_HASWELL:	/* HSW */
  	case INTEL_FAM6_HASWELL_X:	/* HSX */
- 	case INTEL_FAM6_HASWELL_ULT:	/* HSW */
- 	case INTEL_FAM6_HASWELL_GT3E:	/* HSW */
- 	case INTEL_FAM6_BROADWELL_CORE:	/* BDW */
- 	case INTEL_FAM6_BROADWELL_GT3E:	/* BDW */
++	case INTEL_FAM6_HASWELL_L:	/* HSW */
+ 	case INTEL_FAM6_HASWELL_G:	/* HSW */
+ 	case INTEL_FAM6_BROADWELL:	/* BDW */
+ 	case INTEL_FAM6_BROADWELL_G:	/* BDW */
  	case INTEL_FAM6_BROADWELL_X:	/* BDX */
- 	case INTEL_FAM6_SKYLAKE_MOBILE:	/* SKL */
- 	case INTEL_FAM6_CANNONLAKE_MOBILE:	/* CNL */
+ 	case INTEL_FAM6_SKYLAKE_L:	/* SKL */
+ 	case INTEL_FAM6_CANNONLAKE_L:	/* CNL */
  	case INTEL_FAM6_SKYLAKE_X:	/* SKX */
 =20
  	case INTEL_FAM6_XEON_PHI_KNL:	/* Knights Landing */
@@@ -3870,11 -3840,10 +3870,11 @@@ void rapl_probe_intel(unsigned int fami
  	switch (model) {
  	case INTEL_FAM6_SANDYBRIDGE:
  	case INTEL_FAM6_IVYBRIDGE:
- 	case INTEL_FAM6_HASWELL_CORE:	/* HSW */
- 	case INTEL_FAM6_HASWELL_ULT:	/* HSW */
- 	case INTEL_FAM6_HASWELL_GT3E:	/* HSW */
- 	case INTEL_FAM6_BROADWELL_CORE:	/* BDW */
- 	case INTEL_FAM6_BROADWELL_GT3E:	/* BDW */
+ 	case INTEL_FAM6_HASWELL:	/* HSW */
++	case INTEL_FAM6_HASWELL_L:	/* HSW */
+ 	case INTEL_FAM6_HASWELL_G:	/* HSW */
+ 	case INTEL_FAM6_BROADWELL:	/* BDW */
+ 	case INTEL_FAM6_BROADWELL_G:	/* BDW */
  		do_rapl =3D RAPL_PKG | RAPL_CORES | RAPL_CORE_POLICY | RAPL_GFX | RAPL_=
PKG_POWER_INFO;
  		if (rapl_joules) {
  			BIC_PRESENT(BIC_Pkg_J);
@@@ -4063,9 -4031,8 +4063,9 @@@ void perf_limit_reasons_probe(unsigned=20
  		return;
 =20
  	switch (model) {
- 	case INTEL_FAM6_HASWELL_CORE:	/* HSW */
- 	case INTEL_FAM6_HASWELL_ULT:	/* HSW */
- 	case INTEL_FAM6_HASWELL_GT3E:	/* HSW */
+ 	case INTEL_FAM6_HASWELL:	/* HSW */
++	case INTEL_FAM6_HASWELL_L:	/* HSW */
+ 	case INTEL_FAM6_HASWELL_G:	/* HSW */
  		do_gfx_perf_limit_reasons =3D 1;
  	case INTEL_FAM6_HASWELL_X:	/* HSX */
  		do_core_perf_limit_reasons =3D 1;
@@@ -4282,15 -4249,14 +4282,15 @@@ int has_snb_msrs(unsigned int family, u
  	case INTEL_FAM6_SANDYBRIDGE_X:
  	case INTEL_FAM6_IVYBRIDGE:	/* IVB */
  	case INTEL_FAM6_IVYBRIDGE_X:	/* IVB Xeon */
- 	case INTEL_FAM6_HASWELL_CORE:	/* HSW */
+ 	case INTEL_FAM6_HASWELL:	/* HSW */
  	case INTEL_FAM6_HASWELL_X:	/* HSW */
- 	case INTEL_FAM6_HASWELL_ULT:	/* HSW */
- 	case INTEL_FAM6_HASWELL_GT3E:	/* HSW */
- 	case INTEL_FAM6_BROADWELL_CORE:	/* BDW */
- 	case INTEL_FAM6_BROADWELL_GT3E:	/* BDW */
++	case INTEL_FAM6_HASWELL_L:	/* HSW */
+ 	case INTEL_FAM6_HASWELL_G:	/* HSW */
+ 	case INTEL_FAM6_BROADWELL:	/* BDW */
+ 	case INTEL_FAM6_BROADWELL_G:	/* BDW */
  	case INTEL_FAM6_BROADWELL_X:	/* BDX */
- 	case INTEL_FAM6_SKYLAKE_MOBILE:	/* SKL */
- 	case INTEL_FAM6_CANNONLAKE_MOBILE:	/* CNL */
+ 	case INTEL_FAM6_SKYLAKE_L:	/* SKL */
+ 	case INTEL_FAM6_CANNONLAKE_L:	/* CNL */
  	case INTEL_FAM6_SKYLAKE_X:	/* SKX */
  	case INTEL_FAM6_ATOM_GOLDMONT:	/* BXT */
  	case INTEL_FAM6_ATOM_GOLDMONT_PLUS:
@@@ -4318,10 -4284,10 +4318,10 @@@ int has_c8910_msrs(unsigned int family
  		return 0;
 =20
  	switch (model) {
- 	case INTEL_FAM6_HASWELL_ULT:	/* HSW */
- 	case INTEL_FAM6_BROADWELL_CORE:	/* BDW */
- 	case INTEL_FAM6_SKYLAKE_MOBILE:	/* SKL */
- 	case INTEL_FAM6_CANNONLAKE_MOBILE:	/* CNL */
 -	case INTEL_FAM6_HASWELL:
++	case INTEL_FAM6_HASWELL_L:	/* HSW */
+ 	case INTEL_FAM6_BROADWELL:	/* BDW */
+ 	case INTEL_FAM6_SKYLAKE_L:	/* SKL */
+ 	case INTEL_FAM6_CANNONLAKE_L:	/* CNL */
  	case INTEL_FAM6_ATOM_GOLDMONT:	/* BXT */
  	case INTEL_FAM6_ATOM_GOLDMONT_PLUS:
  		return 1;
@@@ -4602,22 -4568,21 +4602,22 @@@ unsigned int intel_model_duplicates(uns
  	case INTEL_FAM6_XEON_PHI_KNM:
  		return INTEL_FAM6_XEON_PHI_KNL;
 =20
 -	case INTEL_FAM6_HASWELL_L:
 -		return INTEL_FAM6_HASWELL;
 -
  	case INTEL_FAM6_BROADWELL_X:
- 	case INTEL_FAM6_BROADWELL_XEON_D:	/* BDX-DE */
+ 	case INTEL_FAM6_BROADWELL_D:	/* BDX-DE */
  		return INTEL_FAM6_BROADWELL_X;
 =20
- 	case INTEL_FAM6_SKYLAKE_MOBILE:
- 	case INTEL_FAM6_SKYLAKE_DESKTOP:
- 	case INTEL_FAM6_KABYLAKE_MOBILE:
- 	case INTEL_FAM6_KABYLAKE_DESKTOP:
- 		return INTEL_FAM6_SKYLAKE_MOBILE;
+ 	case INTEL_FAM6_SKYLAKE_L:
+ 	case INTEL_FAM6_SKYLAKE:
+ 	case INTEL_FAM6_KABYLAKE_L:
+ 	case INTEL_FAM6_KABYLAKE:
+ 		return INTEL_FAM6_SKYLAKE_L;
 =20
- 	case INTEL_FAM6_ICELAKE_MOBILE:
+ 	case INTEL_FAM6_ICELAKE_L:
 +	case INTEL_FAM6_ICELAKE_NNPI:
- 		return INTEL_FAM6_CANNONLAKE_MOBILE;
+ 		return INTEL_FAM6_CANNONLAKE_L;
 +
- 	case INTEL_FAM6_ATOM_TREMONT_X:
- 		return INTEL_FAM6_ATOM_GOLDMONT_X;
++	case INTEL_FAM6_ATOM_TREMONT_D:
++		return INTEL_FAM6_ATOM_GOLDMONT_D;
  	}
  	return model;
  }

--Sig_/61CBMUCLyn0N/.EVCaxPnwA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1sxTYACgkQAVBC80lX
0GytAQf/Y7+erBVjhJBCkpMVrk+m51iVWIoeXC4ynPd86vwfE+M4Kk5AglxQo0tr
uP7EhZLEotGUq/FvkQsRpA5t2gC7UKRUJ6sbEYtYvIQdwqxPR9PkiNyoWzu9FLUl
FTLjp9csl3i39ljNXufd/NPoB4/g5XAEckitMGZ5VMXSZIv4H/SnLWumAr3Zp9S9
8SB370abfjLyXQ/gX3t7Qo4DqiY7TiQYtLNgakrLwDnYopcCwuX+M/mdSK8V6SEN
DZclW6gHrFYrw3uqRwahUHdKqsG/ajh3OxzZM0UbAWJA0nPcfLGeRQ58qMeXHJSX
McFYyxf1uxI4ZyXSH3Xg4caejfL8ig==
=IIa5
-----END PGP SIGNATURE-----

--Sig_/61CBMUCLyn0N/.EVCaxPnwA--
