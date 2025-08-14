Return-Path: <linux-next+bounces-7937-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB9AB258D9
	for <lists+linux-next@lfdr.de>; Thu, 14 Aug 2025 03:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7A462A84E6
	for <lists+linux-next@lfdr.de>; Thu, 14 Aug 2025 01:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C0535963;
	Thu, 14 Aug 2025 01:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M+wq6Apv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484F1163;
	Thu, 14 Aug 2025 01:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755134233; cv=none; b=jbUAAenJbHkQi8l/nuDzCN0NTNQYZrvcOcFQDDBnhM4+z3gTQQyuraHmIaUPoFZxhuMvOV3og/y3Eq0fu+NKOtyppYSVE5jVZBLC5LdKLu4N2KZ0mRuGtfPJYSsN1YqHTdkFawhLdk9MEGa3c2DabREP+qgUoUuXD1NHdZFUZVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755134233; c=relaxed/simple;
	bh=zwCXeunyU8bKt3ROR7W1CsDnrNwSg2sEDZ+EO5XVu8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TDMkGTgsF3cNJQY/SVpjCCalaHYVTXMWMTUT+7g1VEg32bZrUsw628aR/Us5+vgwUiWfEdMvfkjuGFkB96M0GgJ1Ci0B3yG4XwBQC0WyJOi+7gTOHwUKKXgeOkvoP5y6+STkbfN07vTWnA93cATj32ytQHroxXX8QVR1xYOi1PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=M+wq6Apv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755134219;
	bh=k+K1zwUewEgQ96unfGotQ7+9QaAZj9kIzNJmBcvl7bU=;
	h=Date:From:To:Cc:Subject:From;
	b=M+wq6ApvQ+2eMxIFtXRgUDxdVfxiaixhyFogS3VzO52dKLE1DNz+uwwOeH8ObUkuK
	 HAB5F+mnDl7uvSyisoR7766gFFo+OIDE1BF2+7nFSLHCf5fnmUxWeZy+jlWF28dbY1
	 YCJOjEloC7EEZRgZCb8FukboNDP0eETBe5bd/yYPWt3Xk6Y0t9ErbFGGi0Ct5qFExs
	 13H6fSIWb0Lx2c6J2/Q5rT+NrgwtBdtN9coFe99AlRzYGL2KCR+Sm9epMpZfkLRTYf
	 /FB6u9B9vYzPBvMEqqzlvyvJYirJvpBVcg27Rwf1R4R3tnR+zXKN403U4pX6bJ3ugc
	 6eEGkPR+1lt5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c2S5675L9z4wcg;
	Thu, 14 Aug 2025 11:16:58 +1000 (AEST)
Date: Thu, 14 Aug 2025 11:16:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the clockevents tree
Message-ID: <20250814111657.7debc9f1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uqCTQJ3i+cB50wE=C_m.pr_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uqCTQJ3i+cB50wE=C_m.pr_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clockevents tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/bitops.h:6,
                 from include/linux/log2.h:12,
                 from include/asm-generic/div64.h:55,
                 from arch/arm/include/asm/div64.h:114,
                 from include/linux/math.h:6,
                 from include/linux/math64.h:6,
                 from include/linux/time.h:6,
                 from include/uapi/linux/timex.h:56,
                 from include/linux/timex.h:56,
                 from include/linux/clocksource.h:13,
                 from include/linux/clockchips.h:14,
                 from drivers/clocksource/arm_arch_timer_mmio.c:13:
drivers/clocksource/arm_arch_timer_mmio.c: In function 'arch_timer_mmio_set=
up':
include/linux/bits.h:47:9: warning: conversion from 'long long unsigned int=
' to 'long unsigned int' changes value from '72057594037927935' to '4294967=
295' [-Woverflow]
   47 |         ((t)(GENMASK_INPUT_CHECK(h, l) +                        \
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   48 |              (type_max(t) << (l) &                              \
      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/bits.h:52:33: note: in expansion of macro 'GENMASK_TYPE'
   52 | #define GENMASK_ULL(h, l)       GENMASK_TYPE(unsigned long long, h,=
 l)
      |                                 ^~~~~~~~~~~~
include/linux/clocksource.h:153:32: note: in expansion of macro 'GENMASK_UL=
L'
  153 | #define CLOCKSOURCE_MASK(bits) GENMASK_ULL((bits) - 1, 0)
      |                                ^~~~~~~~~~~
drivers/clocksource/arm_arch_timer_mmio.c:264:66: note: in expansion of mac=
ro 'CLOCKSOURCE_MASK'
  264 |         clockevents_config_and_register(&at->evt, at->rate, 0xf, CL=
OCKSOURCE_MASK(56));
      |                                                                  ^~=
~~~~~~~~~~~~~~

Introduced by commit

  fbdd82d7f782 ("clocksource/drivers/arm_arch_timer: Add standalone MMIO dr=
iver")

--=20
Cheers,
Stephen Rothwell

--Sig_/uqCTQJ3i+cB50wE=C_m.pr_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmidOQkACgkQAVBC80lX
0Gz1bwf/aGeZe5rfSh10K6Xtmw599aF3echfAiXW74uKtduQbplNjQ1xzuzYWA2F
C9NUjoBuEKFUmCRlNNoPEFPd7TcIsqF0W47eibaoRgyeBUMxdwBt9HYqcZVvFD3y
8zSUfQyI+Yqtm0e4xTFxa0DK9ClRNb89VTbDwvxKfqxS3GDTLS7efPW72qc5BLQu
hyn/YdqROQXakQrf0ygtNntCVKNbScoVeAGwaj2Oo1ctAFr/trda8bzYnHE9Kr7T
nLjsC1OJoVCLntfBYiHTvF6ewc66eZBCVS138wylg+EncbynwdD4LJwfEccYagt6
ip8ez8yuh5e98sPd3dajZrKSsmx/Iw==
=0k0T
-----END PGP SIGNATURE-----

--Sig_/uqCTQJ3i+cB50wE=C_m.pr_--

