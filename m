Return-Path: <linux-next+bounces-5543-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D16A4150C
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 07:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6F033B1BEE
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 06:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CF743ABC;
	Mon, 24 Feb 2025 06:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bW/w7SfJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E010F28DB3;
	Mon, 24 Feb 2025 06:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740377001; cv=none; b=lkyTxmQ6OZXQVUCCSd5Bwq7yEdyvnHLjDkMs5sshV4M3oAC9PdDC1QC6MoIpekswVRf0T8dHOonXodzQALt+NTkPCgrzDbSA6AzG2KsoS8Rl3CDN3S3ECAZ6qPuyi0d46Dr8KkQd+gkrLI9Boa8bCDSZn3hg5b0iZ8omJlzGNbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740377001; c=relaxed/simple;
	bh=5+f8JFhiY/TtUUlBxUJ2f5DkAXVcMkGuOoIMx/FBoNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kyy3paSsAPafQdRWx+EA65uLw7SVIgcDwR5oIx5gUYiSpn9ZjOnJr+eKyLY+zDwt8njJFfO2u3wdee5XKOlsPeLzJrzOf9W2V1qIcWMWk0LwKOZssGiS+09/MBZfhE9mqh1f2u58FV+ZiOUP0UXeRZjXlgeMtWYxfBVEJU1xoR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bW/w7SfJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740376992;
	bh=CgbvIYfETXCLvT1jN25C9Jk8bESL6MluUcI3wxQbZ+U=;
	h=Date:From:To:Cc:Subject:From;
	b=bW/w7SfJ/FFr+pYmKBcqcxrmRfKWED9/a70Yj7z/3GzAxgzCmyobaQmpOsyqLK5e5
	 Xx15d6WVNQutoYSv7VdWf4uZzMBz4DIoNN9M3N9HZIFJS16ZpTbSZQoNs/ST0gESrU
	 O6yoRURfZDO0xYbcYUb4c8NYpu5w+a4sN6oJy5UYy14RpxJAJ4/8PU1DUsCbRcd/rh
	 xNKx+k2/WzYBQxvjbNiZ7lFctTE5rfMkNBGWDoZ9O2TNIbUtVyp4T2CFfNllzl9ohf
	 85ca4sA1YPOqaPMdryRQy7cxAcGDResXoYmy2pg0kgjPwcXToObopCPU0BQG7MB86/
	 ql1eRDyTMcACA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1VXH3Pvlz4wbR;
	Mon, 24 Feb 2025 17:03:11 +1100 (AEDT)
Date: Mon, 24 Feb 2025 17:03:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Joel
 Granados <joel.granados@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>
Cc: Kaixiong Yu <yukaixiong@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the sysctl tree with the tip tree
Message-ID: <20250224170310.41c8611d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YcKGD5bZuYKTX2eJpDOWQYG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YcKGD5bZuYKTX2eJpDOWQYG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sysctl tree got a conflict in:

  kernel/sysctl.c

between commit:

  8aeacf257070 ("perf/core: Move perf_event sysctls into kernel/events")

from the tip tree and commit:

  dccf3c99febf ("sysctl: remove unneeded include")

from the sysctl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/sysctl.c
index 635f5e829fe8,eeb4cba12190..000000000000
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@@ -54,7 -47,7 +47,6 @@@
  #include <linux/acpi.h>
  #include <linux/reboot.h>
  #include <linux/ftrace.h>
- #include <linux/oom.h>
 -#include <linux/perf_event.h>
  #include <linux/kmod.h>
  #include <linux/capability.h>
  #include <linux/binfmts.h>

--Sig_/YcKGD5bZuYKTX2eJpDOWQYG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme8C54ACgkQAVBC80lX
0Gzc0QgAiHS2/21vbnJwToUUpUge5EhiN7F2JnwohwfAa7B6uxETMwquRjhL8NQi
HeIKJx0Ztqbytly4FJ2ojRcAZn+5KCHcsBTUGXdjr+VghzWR0aDrhf6fzCANqkTz
18FRsSVZ1x8xVxE0cnP8HyexFWmff3KcaAV/QDdb6v1Tp+HQx+Os2b8dAVzXoM8U
hiq3N0oPx7GHeqUVQtpFgNJCMPFGXtNGf00sgETcIQ1KuSW3XkFdPVuUugISF6fQ
fVk0vs3gFYyG40o8cdj6lgHgyVvnX5hZgqPl2VzaD0uuL8MZaeQ4epe9zLgJOKqK
pHIuuM+BpwMUqx+Yd+evVXNiLFtJmw==
=h9Z+
-----END PGP SIGNATURE-----

--Sig_/YcKGD5bZuYKTX2eJpDOWQYG--

