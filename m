Return-Path: <linux-next+bounces-2491-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3518FF89F
	for <lists+linux-next@lfdr.de>; Fri,  7 Jun 2024 02:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0B9B1F241D6
	for <lists+linux-next@lfdr.de>; Fri,  7 Jun 2024 00:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1214EC2;
	Fri,  7 Jun 2024 00:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="K5pena32"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855A11843;
	Fri,  7 Jun 2024 00:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717719863; cv=none; b=RTY6jLRtv9RMWda0f+cDfKoLJ3fUbealLqZVFmNG7xPTc9WAxPFSaCz5wQFEe/AfE5ys6y39YtYK64YW8zWPuCH53d8PKl85tiyyQiMbeZfg6Q17gayQTrv3y6kdq/xCnZBNmismeOdz8XTwb2yXkOy9uUHMcNpBkeX4Bshlkg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717719863; c=relaxed/simple;
	bh=tIEKOl+rAfm6uj58kakA2+qTEeRPlwjJrJ3/KAFdyIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r3BMmXScFSo7JS5E9F2Xatttc/CWNvHv4QLCSWjist/WxjIgaTb1IkUEXinsK08XPecz4QtsvIhc38F8iCxcHXK2L+4DHsgIC0siCWgNsxgoQV80ff0IWMX5ClfD0yI7gib3OIWyWDdsnFxQ/7ZfMew8thZXzRsYpPy2ctIHPmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=K5pena32; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717719858;
	bh=uFaoVtQWOBDLTyF1e/D12sXO9+fnF0aN0aa5g5cu+Ow=;
	h=Date:From:To:Cc:Subject:From;
	b=K5pena32tCF+iJZ0E5ZE9sRQbtpRORmNHUUfYSdF+HIkhpAwhrXUhwaEKAn8WhifO
	 zNJoGa2oddEgg/LS/u1wJD9TsLaO6fQlw/qdOaSwctnq2JTnKT8i60lfMggyqdbTlM
	 R6blweYuLc3ZX0OO1eWicTFCxpALsiL+G+apVW5Fx5CHY4+0yPOYS9K70JtzaagidZ
	 EyygfpMHJX5DEnNy4E2q31jQs+gLDjR3JqF4i3S33EzFcugou3YFurtd+2kVk3yWeZ
	 dHR1fouHOomCH6WEn2w8X8fwexgZJHgtDpzS+wJRsqMJn0d/hmoa28STMtTtMTPnHz
	 QgU2DHp99X8eg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VwMQB2wvkz4wbh;
	Fri,  7 Jun 2024 10:24:18 +1000 (AEST)
Date: Fri, 7 Jun 2024 10:24:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Yury Norov
 <yury.norov@gmail.com>
Subject: linux-next: manual merge of the input tree with the mm tree
Message-ID: <20240607102417.2cc20b04@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9z_3V_ee2UclbIre0+ebrm6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9z_3V_ee2UclbIre0+ebrm6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the input tree got a conflict in:

  include/linux/interrupt.h

between commit:

  2156d61a07d9 ("cpumask: make core headers including cpumask_types.h where=
 possible")

from the mm-noonmm-unstable branch of the mm tree and commit:

  c76494768761 ("linux/interrupt.h: allow "guard" notation to disable and r=
eenable IRQ")

from the input tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/interrupt.h
index da88261f4748,3a36e64119c8..000000000000
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@@ -5,7 -5,8 +5,8 @@@
 =20
  #include <linux/kernel.h>
  #include <linux/bitops.h>
+ #include <linux/cleanup.h>
 -#include <linux/cpumask.h>
 +#include <linux/cpumask_types.h>
  #include <linux/irqreturn.h>
  #include <linux/irqnr.h>
  #include <linux/hardirq.h>

--Sig_/9z_3V_ee2UclbIre0+ebrm6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZiUzEACgkQAVBC80lX
0Gwmmwf/bY8ABZl0TAPgj9oqHCH6v7HQYKy/A21ntSkFeHPj4IIJ1YGa0Z8JaL3h
FiYVV/qh8pD182KB4Py8TlV1ItvC9Ig2aulLf4DroDbkga5T5PYCyilOQ7YsX55n
y/rf3tnw+wWrnuxjD7QALGM+b95Ple9E2UCVaUdqiyMvtBFyYK8GgFYKHO/a5i4M
UZ7BCZrR0HKIj/G7PmZrqQK58fCzOI0jfPTOc2w3tkNsoqQwGz3c8F5ahsl8L/EK
VvlIyoFCuSo+2kSj0pz1nmkNgT+f77XU67/uhftOs79/MjGZY8jqc25A6dx5Db0L
9n8dwQGMIFCpCfcDtFa/X8sRRfslGg==
=ASyF
-----END PGP SIGNATURE-----

--Sig_/9z_3V_ee2UclbIre0+ebrm6--

