Return-Path: <linux-next+bounces-4599-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE15A9BAC0C
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 06:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2002A1C20A9E
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 05:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E8F1632C3;
	Mon,  4 Nov 2024 05:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FzDv4pgy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED5323A6;
	Mon,  4 Nov 2024 05:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730698240; cv=none; b=jp1L7HN9uW69jcgJD/YYlyrilobR8LuJmp+Xc0lK0hCg/aTH2DvnDHx5oJH/Xh2O7nAcoPmCk8iQZq1VZEE/aqGGAgtjXfM+KruQE5/nZgFlYYf64OjB17oO12OsbQn39VIfOj9rAKZdr//Dz9WYZV56k0SEXuBAjonDupGpKkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730698240; c=relaxed/simple;
	bh=qvywv4i84HAZLPotuvJYvDl4s71VUQ8CS52LsQUJl90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Gd1u75Q10ib+JeKoMTR27EjaZ3f00xKHt+12qNKLncoEG7RWDwyra4srnjtQ6hJBACvOUSliU9D9XvgAYnUz5ZO9/5qWFhgB7hN9f702BQk5jcfpr9GmJ6V1M/f+3kRIJ1pVvSAY4f669TbJoRQUK8l17DHcCI82e3QAjEpDp3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FzDv4pgy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730698231;
	bh=LdGLsZfaRCHdLDyP+nbDEj6UUqJgvbVO4i4FE6dRPm0=;
	h=Date:From:To:Cc:Subject:From;
	b=FzDv4pgyYj4vjp3MRzTtp58Uijlw1kwJXr6IkRw3UdMOKOlGM8zmWCr7+vasGT8ym
	 w16vGsN+7eWVdjVVWboP0F4aaYuTOgnVEEKXAzYHAMXIGcGTPejzCuewgh1SFd3bPd
	 Qsqs8488JDAPsL+FL3xB3OdokDZMDuS2d7fvfbs1qqcmIVVFotw8FmwZL+py8R79xi
	 MHEkcaBVVDEpmhlPXXz+uPi4o2eEotn6T8xoZn+1j0kKdNv1gbIMIfxkXuF9A7Y2AQ
	 kAjxtnig+BQLjknrXY0YJVe7mMT4+LooyvfX+2XuMYTtAwA4imeQh1ZTDE+0L1RotD
	 Rknxm2rXCH7YQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xhg6G1SFZz4wbv;
	Mon,  4 Nov 2024 16:30:29 +1100 (AEDT)
Date: Mon, 4 Nov 2024 16:30:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>
Cc: Jiri Pirko <jiri@nvidia.com>, Jiri Pirko <jiri@resnulli.us>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the net-next tree
Message-ID: <20241104163029.73e65994@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ErO2t_M7Ic+YdiztVBPF4rT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ErO2t_M7Ic+YdiztVBPF4rT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (htmldocs)
produced these warnings:

include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVE=
L_ITU_OPT1_PRC' not described in enum 'dpll_clock_quality_level'
include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVE=
L_ITU_OPT1_SSU_A' not described in enum 'dpll_clock_quality_level'
include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVE=
L_ITU_OPT1_SSU_B' not described in enum 'dpll_clock_quality_level'
include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVE=
L_ITU_OPT1_EEC1' not described in enum 'dpll_clock_quality_level'
include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVE=
L_ITU_OPT1_PRTC' not described in enum 'dpll_clock_quality_level'
include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVE=
L_ITU_OPT1_EPRTC' not described in enum 'dpll_clock_quality_level'
include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVE=
L_ITU_OPT1_EEEC' not described in enum 'dpll_clock_quality_level'
include/uapi/linux/dpll.h:103: warning: Enum value 'DPLL_CLOCK_QUALITY_LEVE=
L_ITU_OPT1_EPRC' not described in enum 'dpll_clock_quality_level'

Introduced by commit

  a1afb959add1 ("dpll: add clock quality level attribute and op")

--=20
Cheers,
Stephen Rothwell

--Sig_/ErO2t_M7Ic+YdiztVBPF4rT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcoW/UACgkQAVBC80lX
0GwFkQgAkh2G3fUKKV49+3wAQqDz20IZZz+ZAnLUGsO3FrCwmAgtgRmiLH+zGHCK
cmzeEELRDGcoUMhufkPq/39VCkwKRXSc0FlB3so+x/z0SdLjFrYkBVjskqQU2d9Y
joBSeP3L59FiUc0LGGXjqgzcgzO+MuENHmSta5drE7x3TenZU5bgAy0B2fc5DT/j
89biyYzYjQgejYaQw2EXGo+I7MnzJ4f2QWnnKvDdZ8BmKcNCUTiOoakKaB7ad1ub
SDaIT8Xj0n34qKn00rsweF+KGgV6mbZKAyjr2d/iNMbKoWIV7xtShYDraICX4tqX
EIz5fefg+ZPyGhqDTSVIwoJqT5RDiA==
=VMw1
-----END PGP SIGNATURE-----

--Sig_/ErO2t_M7Ic+YdiztVBPF4rT--

