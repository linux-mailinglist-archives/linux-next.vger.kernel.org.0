Return-Path: <linux-next+bounces-2472-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 729358FD9CC
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 00:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F2F51F23287
	for <lists+linux-next@lfdr.de>; Wed,  5 Jun 2024 22:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF4215EFAC;
	Wed,  5 Jun 2024 22:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nZF4QsFc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2670612E63;
	Wed,  5 Jun 2024 22:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717625995; cv=none; b=BIjMWAUEBRy8FC6zx/HDREq5xwwC+jAJGNEe9o/XfYWjJVkB/Tg542zU038/dPoQazmGa00mQrRiQwTQ5kpHad36P9FKyjscHowFgWu7nEDJ7rsD4yMubwFuIMUXPrDYSB7IayWLH2+Xz18gP56tmBWCYi7WSEmWbH6aurS+SxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717625995; c=relaxed/simple;
	bh=YpVfxhhwRSD26pYO0NpR/TOdnWAo6HCUT/oHXimXS/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p9fi6/pqAwiK41RCc7L1nkdC+crdWG/ZAMlyZ+HAvbJAlcwiMBWCtDHh8NZsng+YcLmWtX53ubcnkWw5ZNGW9rHSX7Q37+5YJq+PaLJxEWV5faKOPnKqO/c3Rrk8bnxc2MPB0hDTq36iW4ZoLZKq3VgNvdijFlvorT2gVYJsEi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nZF4QsFc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717625990;
	bh=KQIo0V7m8UWgMc5O+fafN5HOwZeYu0p+Dp9ILN+5+rQ=;
	h=Date:From:To:Cc:Subject:From;
	b=nZF4QsFcqOiSOlkSG0lKXPWN9npBg8v+BhCjlhFGl0Q7XT7veFl2iy81+RSgZ5lJU
	 uON2MwUVybKlOEINisCetWwEmdEIYckhLNEETlcrz83NgLfAJrkQYvmvcRPzkx6xtf
	 TuQAdlhePh4b0egmfCgZ3dUywYfI4kB0B0k4MkZVeuxNyqpKUeKXH2tELZdbyKDtaf
	 vbH1kVIAcoFLwyE2nRlSbY73VJ0f5UXH4zoaMP82SWZDCO62LihFeDQtpmOiup2/Ov
	 CDcVNaBWb3GPMtSgEPT5p5AruPwXmSlTCD2I09Fb0Gb2YPP7Abto4qCsxVU+1mrRpb
	 kbg+/7WfauJoA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vvhj2153Qz4wqK;
	Thu,  6 Jun 2024 08:19:50 +1000 (AEST)
Date: Thu, 6 Jun 2024 08:19:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Rapoport <rppt@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the memblock tree
Message-ID: <20240606081949.14f3c980@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LTlgKxkI=/Sh9e8ctN/d1rS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LTlgKxkI=/Sh9e8ctN/d1rS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  8887ee905d08 ("mm/mm_init.c: not always search next deferred_init_pfn fro=
m very beginning")
  731b11684819 ("mm/mm_init.c: use deferred_init_mem_pfn_range_in_zone() to=
 decide loop condition")
  e62a627e845d ("mm/mm_init.c: get the highest zone directly")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/LTlgKxkI=/Sh9e8ctN/d1rS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZg5IUACgkQAVBC80lX
0GyhvQgAkbUk20z/7DBLTs97d+POXKu6S97AvTeb0DsDklSmI8XlX0h82TvYk9k/
a+4mq/nxG8uIggouZgiF1ItIwPPR5FXQu2sHfYuwYI6SE8jOVnlGTzB2qjNSzBK+
SD/FAgQRZsYnS7GBlLC0DhX3vzeJV0r2J51NjjcwoosAPtZtKXSGizKjjALOa0qS
aO4ymsuQ3OPutVPtSEsfaFfliMey3l7Yzc6mLYqfvKhEPXYmDsHmGubt7C6BZ2CC
sSrZ/uKQV4Dh0UVc4ChUVY3GYg8JFd+nwMcxB4AzUXMYd44yuNRUqevfjnbuhr9h
fxh0YPkirW1w91j++iiGhW1pxvXvpw==
=sQH2
-----END PGP SIGNATURE-----

--Sig_/LTlgKxkI=/Sh9e8ctN/d1rS--

