Return-Path: <linux-next+bounces-3176-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 219AD94396C
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 01:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8440281B12
	for <lists+linux-next@lfdr.de>; Wed, 31 Jul 2024 23:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9287216D4DD;
	Wed, 31 Jul 2024 23:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qGg7v7DH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BCA1BC4E;
	Wed, 31 Jul 2024 23:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722469140; cv=none; b=dfzEAfEOVUkhKUNW+QrDbgb0l3bQVp6aJD1qJotwSzJ+IiM5C/4Blit9Qv7YOyHYNK0u9IOJ6bLsAvXJ18QY2CL/+LhkYC0MaDE213iT59Ch5XkjcdWc/9HohqSDC0Idctk09CqoBHBHvoXiFceC18O6g2U9L6v/UFwVqQpym+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722469140; c=relaxed/simple;
	bh=XEWO2q1ggp6M9HCJtARPySjVL5Hm1EM9s2+eWn3KU/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=s3QczKxk1H23y265VLT59Y8XiLJM1RwbVq3vzhBPXdbhpCEFJ8lYPP9XRVd5Lzu6wkS9nbLzLlslJkpmAaYaNApwrmNep+kJ5fHaVDlctbXaXcpC9xR14k+1t9UmQWqnjDkaTvGcp1Rc1xEJyIjkWlvGF9JZ5jyxvlYTV4OFE8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qGg7v7DH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722469135;
	bh=QGY+2ABFXl3KTaIoe/k36wSKhOzKeefPFNQVXqPn3LI=;
	h=Date:From:To:Cc:Subject:From;
	b=qGg7v7DHxSL9rYrbg4Ww0z9iYga2FgYwFm4kC1Kp209lG9c7nWrTJJDt23akAfhBr
	 EwGAq1+50cwCeQvAYwRMKwBPe1zzw8OCkohe/YCe65gf13BVbzCxc//LG8WhXBmfgx
	 1WQpDkx0cxtKUchMHmvzN0zQSfhdvoakCKxJojZgW8NSww/kcYNyAzPl4g1PrWrTwT
	 qoI4/motLCSHriNoyim340u9iR9Nk0o7i0zrgJ3ifvzY/Pa2yS4wvog4Yl8h3pq/TO
	 kVuUGMUQU0iytwsXRVasOARpGyz9fgu1DsBItji33kve1qj8VOH+dCgvRAIcNUtnCg
	 oHUNnRl/zBrIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZ7pQ6ZVDz4x7H;
	Thu,  1 Aug 2024 09:38:54 +1000 (AEST)
Date: Thu, 1 Aug 2024 09:38:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Greg KH <greg@kroah.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm tree
Message-ID: <20240801093854.4853ffff@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KnjKeB6nBDxG9BXJ2IKZGWO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KnjKeB6nBDxG9BXJ2IKZGWO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the char-misc.current tree as a different
commit (but the same patch):

  56310b3b4e7b ("fsi: add missing MODULE_DESCRIPTION() macros")
(from the mm-nonmm-unstable branch)

--=20
Cheers,
Stephen Rothwell

--Sig_/KnjKeB6nBDxG9BXJ2IKZGWO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaqyw4ACgkQAVBC80lX
0GwVagf+MPdfB1DG1AzvRYy/XxSg4L4n9YGUneu5ZgGK/Y/e/CUJw9ddkdYOqJbl
At7IBkYZY1R9eTP7OFbAROlnTPegqWQ4MNqpt0EeX+AVxHTCZnamkPG6lw9j4bF2
EC4q7uH3yWHQNxPn9rLCIZ7hqzyc/RPUPKW3ym2MJQzba7JOgtIecDf8gBYM+edB
ikhtcRSvmTOlmony+ezRhgPUWUQLKUuAEpKSbOYqnK4I4coS0HwlRem0eV61zOH7
ho43afDNIbzj0gQRxKRFB0iwFzI8gScKZyT+kUVORz5+PMJuCOCfAnb4eAfki4gV
k617InarFkQ2QLlhv93fr1Sc2edYxw==
=ihhR
-----END PGP SIGNATURE-----

--Sig_/KnjKeB6nBDxG9BXJ2IKZGWO--

