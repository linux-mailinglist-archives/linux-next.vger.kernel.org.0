Return-Path: <linux-next+bounces-7151-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE20ADA4AA
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 01:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E27F3AE582
	for <lists+linux-next@lfdr.de>; Sun, 15 Jun 2025 23:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5593F202F65;
	Sun, 15 Jun 2025 23:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Cj9rv2oe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22144CA6B;
	Sun, 15 Jun 2025 23:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750030724; cv=none; b=t0biA4ypz2CBCKqngFeY7y6lUo7EUKOUcr3YYzsVbt1YRT86yKcY+UctVCJI7EzXNXUYydqcMnRFYIgYrMMnhZqKXhRm88wXDI054wp4248YpYl+iQTbouqBxGSYNy2E7+nWgkpvRpXakyhJ9uRViNlgfkXwC7TGeDuzHTmKfJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750030724; c=relaxed/simple;
	bh=xLncOc3CFTq3kolmyxZbpzaSBIPFm4F1dTZw7krqanw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=i2CoUC+akaTl5ucOXEu4VbFmWMKNW7CgLJxeFw7RRE4zcr5L8EBZMtNlHqcBjhCmIJ9Cp/a8MHxBuWO9vaxjScN1H0BbwjUjuZatSzLPRUN3iaAwyaiWzQmVp4Gcoc2vggN5w55i2igjyjQSt1D0zgBhk+ueagY4TopVXyXfnlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Cj9rv2oe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750030711;
	bh=Ehb24vgBhJ2eyVQDbn3/HiwyeCmitsSp6RcfjVuw8vM=;
	h=Date:From:To:Cc:Subject:From;
	b=Cj9rv2oeEoA/6ZhcPRKKZnGtRzQwRqwSH2M1k2CCtcuVXKYXRzydcv503yrsQ8VdD
	 ueQ1NSpTnbCSiJ0e7FrlLL9MIMotGxlTz+dtsSPRWTHDKh4pgFy69hnJkd+RqDM2V2
	 7Qxe/DJyCC4IuXHVdi2rEr8PyaoCc5wZwBi7e6ssSReM1dUYQ6Hqa3PznwPrVLeYM5
	 7X5ofxX61Rk8zAYkjAiBJhqaNNRm2YS9Zi8MZxbJbf4ViHoBLp08OHphZgfBDEMFaS
	 IBwetHpToC8x0cB59Q6y/5/XUaHQrCiTCB06MYM5ZhV4PtzftR2SuGhN3HODmfNEu+
	 Jr/p1TNPn3jLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bL8hl1XYdz4wcn;
	Mon, 16 Jun 2025 09:38:30 +1000 (AEST)
Date: Mon, 16 Jun 2025 09:38:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>
Subject: linux-next: manual merge of the driver-core.current tree with
 Linus' tree
Message-ID: <20250616093830.49011634@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TVlESwlCST/P23V_l28_jia";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TVlESwlCST/P23V_l28_jia
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core.current tree got a conflict
in:

  rust/helpers/helpers.c

between commit:

  c7f005f70d22 ("rust: cpu: Add CpuId::current() to retrieve current CPU ID=
")

from Linus' tree and commit:

  1b56e765bf89 ("rust: completion: implement initial abstraction")

from the driver-core.current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/helpers/helpers.c
index 16fa9bca5949,6451cfd94a8d..000000000000
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@@ -13,7 -13,7 +13,8 @@@
  #include "build_assert.c"
  #include "build_bug.c"
  #include "clk.c"
+ #include "completion.c"
 +#include "cpu.c"
  #include "cpufreq.c"
  #include "cpumask.c"
  #include "cred.c"

--Sig_/TVlESwlCST/P23V_l28_jia
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhPWXYACgkQAVBC80lX
0Gw2qAf+JG0BK4zbVDN29kPNhvIBS5BQb8ORguycNmS3Y5AnSkoBsjL4pJiIXiW1
IJBta/ivXbeHazuHPHhIyt1ReWBz0k3iEZBLrVJPOjpiDLSMWX/KqUV1cTmlppSO
gUccVCpxfBw4kZfo1DLt2lx3g4b0dGMDtFDcxyDf7mLMpSqugMnNLw/u2sq3loqA
dTVifVvkuG64sXR/JXjiNhZdniAQ9gK160jLP56v/z7GRycXL3l6V3DM62Iyx3OR
JwAdHArwxIz82vvJ1yI3UvSZ8m2xYT93XqAZF8ayXDnZhkFpyAFeP2+tw0xB3oEK
2Yn+VMlFx9jM7/mdksyxENFsix7ekg==
=nL+P
-----END PGP SIGNATURE-----

--Sig_/TVlESwlCST/P23V_l28_jia--

