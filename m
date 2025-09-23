Return-Path: <linux-next+bounces-8450-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EE2B96946
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 17:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03A3318A57F3
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 15:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C9E2586CE;
	Tue, 23 Sep 2025 15:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvB397DG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D8D2561AB;
	Tue, 23 Sep 2025 15:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758641289; cv=none; b=L7HTENNGhttTxz1xPKvnY/ltL075HSyuGen0M2o1iahTMdxDFhelZ9IQ/LwSWoWm2ny9+nm6vCtBjCcAjvD51zrcRjYkaWX5xDk4YZ8109xnv9Q9tWt48sg7+WHryw14PBL6ODIZrMnx2ORrH17IEnt3LqbZS2TaD/q01iCqhv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758641289; c=relaxed/simple;
	bh=s8WNfiJvHWWPvgGKGR4oef/bhVc7/ikFoOBvIpLWmdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ytx35+YJ9QVIRQBIhNbqI4yZN4aGcxrfNZuj3FQIhlkIpZYcD7iWNJSs5uZcqe5hsRsDGnDzYCirhwwYM/zi9yG08JA89PhlROwt8vC/V2j8YGOJijSv7+oWC6hmGoES8ZNPCcQNjVRIEZ1DLR8WRFRHR6QuufNzycmf53CrJno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvB397DG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85945C4CEF5;
	Tue, 23 Sep 2025 15:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758641289;
	bh=s8WNfiJvHWWPvgGKGR4oef/bhVc7/ikFoOBvIpLWmdA=;
	h=Date:From:To:Cc:Subject:From;
	b=EvB397DGx+0VJYEYo0YkVYmVOQT5T4YwVrAzhC49Dm+R+LKl0YPxEwqKuUv5G/3aO
	 VLYA5ItQrBcDOtVWTddI2biTSHjtvFoFS3h70/OZfZ7raf8H9Ca9fEIB3ze/cPfSGs
	 wdr1UdmgdIOzbnxery/isp1w73aqdT8xGNICZg/saV/Q4vx0DtcPUsVCasLIMBjxCk
	 hkn+dUoRsyp0JMIdpu8y9Voax94HK7IlWxgRgB0zsbzZcB1UlhTND2RVVD3UvGsfrE
	 NQ7YwAK1zFyh+HPbRfyyiTzevLS/sCO+BoZfBaToF0pbgRmLVRiluJTdVyFFIZRIsg
	 nK8TJirTP8Dug==
Date: Tue, 23 Sep 2025 17:28:05 +0200
From: Mark Brown <broonie@kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kvm-arm tree
Message-ID: <aNK8hSSKKZhEHZbt@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ca8rvQ8il9HsEJBM"
Content-Disposition: inline


--Ca8rvQ8il9HsEJBM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kvm-arm tree, today's linux-next build (arm64
defconfig) failed like this:

In file included from <command-line>:
/tmp/next/build/arch/arm64/kvm/at.c: In function 'setup_s1_walk':
/tmp/next/build/arch/arm64/kvm/at.c:229:30: error: 'TCR_SH1_MASK' undeclare=
d (first use in this function); did you mean 'TCR_SH0_MASK'?
  229 |                    FIELD_GET(TCR_SH1_MASK, tcr) :
      |                              ^~~~~~~~~~~~
/tmp/next/build/include/linux/compiler_types.h:577:23: note: in definition =
of macro '__compiletime_assert'
  577 |                 if (!(condition))                                  =
     \
      |                       ^~~~~~~~~
/tmp/next/build/include/linux/compiler_types.h:597:9: note: in expansion of=
 macro '_compiletime_assert'
  597 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/build_bug.h:39:37: note: in expansion of macr=
o 'compiletime_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/bitfield.h:65:17: note: in expansion of macro=
 'BUILD_BUG_ON_MSG'
   65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),     =
     \
      |                 ^~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/bitfield.h:155:17: note: in expansion of macr=
o '__BF_FIELD_CHECK'
  155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");  =
     \
      |                 ^~~~~~~~~~~~~~~~
/tmp/next/build/arch/arm64/kvm/at.c:229:20: note: in expansion of macro 'FI=
ELD_GET'
  229 |                    FIELD_GET(TCR_SH1_MASK, tcr) :
      |                    ^~~~~~~~~
/tmp/next/build/arch/arm64/kvm/at.c:229:30: note: each undeclared identifie=
r is reported only once for each function it appears in
  229 |                    FIELD_GET(TCR_SH1_MASK, tcr) :
      |                              ^~~~~~~~~~~~
/tmp/next/build/include/linux/compiler_types.h:577:23: note: in definition =
of macro '__compiletime_assert'
  577 |                 if (!(condition))                                  =
     \
      |                       ^~~~~~~~~
/tmp/next/build/include/linux/compiler_types.h:597:9: note: in expansion of=
 macro '_compiletime_assert'
  597 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/build_bug.h:39:37: note: in expansion of macr=
o 'compiletime_assert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/bitfield.h:65:17: note: in expansion of macro=
 'BUILD_BUG_ON_MSG'
   65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),     =
     \
      |                 ^~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/bitfield.h:155:17: note: in expansion of macr=
o '__BF_FIELD_CHECK'
  155 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");  =
     \
      |                 ^~~~~~~~~~~~~~~~
/tmp/next/build/arch/arm64/kvm/at.c:229:20: note: in expansion of macro 'FI=
ELD_GET'
  229 |                    FIELD_GET(TCR_SH1_MASK, tcr) :
      |                    ^~~~~~~~~
make[5]: *** [/tmp/next/build/scripts/Makefile.build:287: arch/arm64/kvm/at=
=2Eo] Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [/tmp/next/build/scripts/Makefile.build:556: arch/arm64/kvm] E=
rror 2
make[3]: *** [/tmp/next/build/scripts/Makefile.build:556: arch/arm64] Error=
 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/tmp/next/build/Makefile:2011: .] Error 2
make[1]: *** [/tmp/next/build/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Command exited with non-zero status 2
178.88user 199.89system 0:12.26elapsed 3087%CPU (0avgtext+0avgdata 429304ma=
xresident)k
0inputs+0outputs (4major+2413868minor)pagefaults 0swaps

Caused by commit

   4f91624778b27 ("arm64/sysreg: Replace TCR_EL1 field macros")

=66rom the arm64 tree.  I have reverted that commit.

--Ca8rvQ8il9HsEJBM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjSvIQACgkQJNaLcl1U
h9Di0wf+IExbrbcY1/VeHSQvxOlH7PhIHFnqzUTuor13hmilcwzUPuBBBayFX9QO
iU2dJFjyszK7DqQP4W1js+YdDSOCKtOtJWQXozE5awAvi7ataImHDSnN3A07KALc
Z9S0+e8Ty3FHrF6HLFbyXPHXGeg7/QBvah59oR+yOYH9Nnut/ApR0lMvaTSBKlQf
xbN2WjRkEmR/HIOT4pA1dFr40KJKFzQL9Ma3YYnRdCeJUE8tpefrvczyI3uTnWYa
HrI3Eyv0biw6fTsmZwIxWKqLhXili3wyWQSUJS5vxLrQZ48UvbZKjx7nsdH3oQI6
S0x6l4PCTZAr1HFUoP3NgKEQZnkO9Q==
=qJut
-----END PGP SIGNATURE-----

--Ca8rvQ8il9HsEJBM--

