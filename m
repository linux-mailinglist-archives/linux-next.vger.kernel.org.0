Return-Path: <linux-next+bounces-8087-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E433FB335B5
	for <lists+linux-next@lfdr.de>; Mon, 25 Aug 2025 07:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E527F1B2229B
	for <lists+linux-next@lfdr.de>; Mon, 25 Aug 2025 05:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063A7213E89;
	Mon, 25 Aug 2025 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FLfauTyV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB4921ADA7;
	Mon, 25 Aug 2025 05:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756098216; cv=none; b=VSw3sws3gUtoGU0aXXOfpn8eq88zZKcVvw4JenM5WCumIuz8Hgxh3ZD7pd34qB6JZ9IZqA44YX/ixi4ckvdQPAsq7iIoGrakkF7rjqFCp3KtwNWB3i9+g7e6NQ913vsAu1+l4naivbfA9ddZhQHqMvLBfKYE+vcoU7nq14a64/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756098216; c=relaxed/simple;
	bh=/wxRuPUnqwDUi3mX7f4z/dSu8GpTt8CnmlQ5Y4NdvE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Eo7zyrhCDftHgAxdFsTFoQbhQT8puDf0dMgD45QT3tzqjx5d9wqmdYa/EtmGlfs2gfO+QWxyRbHrg1pFOKWhmNydMLHLXh2DJeFuMb1WADB1u2sv16jAUGv/J4ZCKaD3EtZiPl2l65oTiqPAaz4P7Z1CWaWUR1ebN+iN6+Wwrqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FLfauTyV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756098208;
	bh=uWmuAPB/MHIfGgs+o7z2EHbmhKfnHJ/S+dG8/xZW2os=;
	h=Date:From:To:Cc:Subject:From;
	b=FLfauTyVG7PI6obiWY3u/SMGmzRZ/6tcbKbOotSCvMbD+NcUfzqMRob8oM7d2VQX/
	 PS8jc3W5iIvBLzPTTy2l/9xM3G7yO9OJM4Y2m4cqhZW9QJSTRs0RSIEPzLd62s5UVX
	 VSe0Yz6sFpiYAXekcU2++xV9NLdI2ZAk66ovvekhIO4qkv83Zk9o3FOcmfNHCykK6U
	 1w3DKK87W7cK+9n8rI+X3boOahp5M8h56y/2LwarisLbJwJJKrb62/0+j+uRHyII0e
	 ql152XtQV3ugQMdKYym88anr00TR/F8DMiefl7bUl3wgU5FSjayNX61mxHWptTKk/O
	 l69zxn/jEV72w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c9JbM6SD5z4x3M;
	Mon, 25 Aug 2025 15:03:27 +1000 (AEST)
Date: Mon, 25 Aug 2025 15:03:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>
Cc: Tiffany Yang <ynaffit@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the cgroup tree
Message-ID: <20250825150326.696d7496@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/flJ5qIWza9tOFkNivEEMyh5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/flJ5qIWza9tOFkNivEEMyh5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cgroup tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arm-linux-gnueabi-ld: kernel/cgroup/cgroup.o: in function `cgroup_core_loca=
l_stat_show':
kernel/cgroup/cgroup.c:3804:(.text+0x1374): undefined reference to `__aeabi=
_uldivmod'

Caused by commit

  afa3701c0e45 ("cgroup: cgroup.stat.local time accounting")

I have used the cgroup tree from next-20250822 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/flJ5qIWza9tOFkNivEEMyh5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmir7p4ACgkQAVBC80lX
0Gw2Owf/S6OOf54Z1fRDeHERrSxBHF4cLf3wDYenCSZrj+Y4WMU7M7B5IdmDjG6+
m7hThLGCObTfs8J6hVDyutXd1HclRnn/RyrcAg+JrvOoTqZGTrrlqYfi9Tlx4pzz
H754iCNTbitEzR5NffX3TPzX3laVkw+miGWn1j7h2OhsooAEviw+rJTfS8aCs0Tg
ZQZjrURjc2kM/LyBOVoNtOyTjgAWP7kGWX1Jy9lSdg2s84Z+RbdELbJzsLhTU1Yi
ZtHaZIwiNkcoIXcfFvUfq0b4lxEIUph3pawmt2mBMmh3KqkMFocbgj7TynrK6zkX
ZY35kRk6IDZLrWSYzuFYfHhwCgAmTg==
=GX4F
-----END PGP SIGNATURE-----

--Sig_/flJ5qIWza9tOFkNivEEMyh5--

