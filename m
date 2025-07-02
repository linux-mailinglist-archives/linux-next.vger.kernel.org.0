Return-Path: <linux-next+bounces-7311-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AADD5AF64B1
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 00:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E3493A9CEB
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 22:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33711242930;
	Wed,  2 Jul 2025 22:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VIBxd5rw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867FE1940A2;
	Wed,  2 Jul 2025 22:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751493672; cv=none; b=BHdRStPweQNz6+7XogOxcxK8YhA2SFS78AznkjmuG74YK9jNlb6s2SKlZ2545NhOImtoYfuQb5KZP9i33TMYRZXPXiaydXc1wDPMUqzc8bZcqjTZbOSu58hBeKPk9Cv+93Eh5luin8yofF6OJVdlf+zhvqBhVH4shG+8Ws4qfLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751493672; c=relaxed/simple;
	bh=SxrwGRKqSYnrR3ll0u2yHsFVf3+27dfTHtiCRtDo+9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Liafe8/pUF4+YjCuHi3UobdxPwFPtz5NUsXRl+CakhXV2ey3l4ffHmE26Mu9yp9Bh7TBVzRMhfNuzXR7XM8LV0/cefuKBZVIn1ipfF+9bay//ZJtJzWQ/L57in/Ws6+GMbP5dA1OEryq7PwtH+PuWUHFjugZDTiR/VScrVGoGfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VIBxd5rw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751493647;
	bh=lhffDlNc60wn0VKpX5I58Syw8CJRCTy3jYTJ4QGB4ck=;
	h=Date:From:To:Cc:Subject:From;
	b=VIBxd5rwWGtDdXUPF1NqzLFOmAnX6gLgU3WYUAqjKJePnA9jTRksaBfz4u9VYM4eh
	 5faRuR1MCQLy0z3w1ObYApExpi5ZiiJolW93yIC3ULN8LAW/hSRYiMWtvvpP37DhEc
	 aSVsKH+ILdbG3dodB5GFAyM1PCgo9G5vvVvS+E+TNKePS91zsZvruov10B0oM9M4fw
	 c2Ai80lSekEenlNUuKLpQyEWT/JkgsjPLHkXLHLj5qc3ElcipnIqoQmHHxwA2/faWu
	 dAJSrIPfoi/4MAKYUwDv49h0gBL/00CPLT8b6XIsyOXU7hDN8GwYt1A4WWxo4IcmJv
	 fpGCRonTawFgg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bXYk673SWz4wd0;
	Thu,  3 Jul 2025 08:00:45 +1000 (AEST)
Date: Thu, 3 Jul 2025 08:00:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the perf tree
Message-ID: <20250703080035.52470f9c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tCbvw9NoHCjDm30wluAAsv2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tCbvw9NoHCjDm30wluAAsv2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7063002abb0c ("perf tools: Fix use-after-free in help_unknown_cmd()")

Fixes tag

  Fixes: 657a3efee43a ("libsubcmd: Avoid SEGV/use-after-free when commands =
aren't excluded")

has these problem(s):

  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

maybe you meant

Fixes: 657a3efee43a ("lib subcmd: Avoid memory leak in exclude_cmds")

or

Fixes: 4b96679170c6 ("libsubcmd: Avoid SEGV/use-after-free when commands ar=
en't excluded")

--=20
Cheers,
Stephen Rothwell

--Sig_/tCbvw9NoHCjDm30wluAAsv2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhlrAMACgkQAVBC80lX
0GyFfwf9ELkUad15nnwC369SelvbmCy3yfbQcH2m0LaQbJbMg1d4ew9DOPO0STTD
7ySgarezqUDqxiCrUDrDiNzdITgM+HlSI5tvVBQYKu7myBIGCDq9ULebi/nVx98y
+qVdOYjjU44j9xcJUbhthyPJuLgN8w+4XacYmFYyot6S34YjPO1yiPxGjOQ0hdld
/XLJJ6BMIHetSuQ4Mb9xG2IO+ZOynlAX45Gncxx+BnfJgF2mdT2FAjEMQqkvsOsr
lbigl9U20cMcun2YKfC6cnXp2jkZJgPEcSy2QZ0aXFS+Nk8eA/Og4icazggPdjBh
VxogS71CQ3AgYYOIPjT1sHWull8/sQ==
=yCnD
-----END PGP SIGNATURE-----

--Sig_/tCbvw9NoHCjDm30wluAAsv2--

