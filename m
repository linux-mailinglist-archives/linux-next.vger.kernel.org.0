Return-Path: <linux-next+bounces-3441-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B213960118
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 07:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48FE0282A0A
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 05:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3680654F87;
	Tue, 27 Aug 2024 05:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aSKbNA0O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350862556F;
	Tue, 27 Aug 2024 05:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724736875; cv=none; b=sQsUaKglV1YlstqkEAGUR2s68sbZA1jl2EcmI6ob0tak6yv2i+I6Yn2lTKHWQBfZNvrlVxZJG9+0dK8qOAC/c2KeAskqwuDJnb2v3bS4nVq+QFGzaH14zg5Lujkk9MPWXYNleYCvcLs8QDz5Tm4iJrVZqk6jo/uaVh3H0VQxlKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724736875; c=relaxed/simple;
	bh=bRCYqkNrmLBBZM54h9z2n9IkgHJSsQjV8dU95ur1bUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QviVh4fJHlPl0rkIUJisoCjYfuItFfi5IvJ1N5FhZRPQdsL5Kczjc1fk0yg1hOgA8EsN1h2d9a/CoUYWkwz+mA+x//DjPRCPnYIC3Vnc1RIO2QY8nkEtduAsn0znmtk0+31TXPMnsQaKWZ/R9PerppJfPiBmrxIhGA9NCJpxy+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aSKbNA0O; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724736868;
	bh=eMu/Tz9j0lXqoLoZtN20hGgxgSXWGI62feifpivceaI=;
	h=Date:From:To:Cc:Subject:From;
	b=aSKbNA0OuA/4JKepom1MOKb44dP8XnnA/2he+Fc4UoFklKKJVXUj39Y+As2QrHAHG
	 zUpaedcpRac+jdZMCZHEX45M7sbd7nUMRcouG43Ofxlep2PhxHm5onvchvYgS2qFqW
	 aBVAqTh6rgobrf2dVJ+WNQePpf58CAyrRgzWwd/udUeb9VTcF90ZCVZ7C87mm5inmQ
	 Cri0UNEPXVnEHl9B77jnEzEn6eJ0OkOxpYszwen9intSV0dg4H+lMqqCj7/bdotzEh
	 bzd7YazOAqkrZDqlZH46547eNHsKw4f4XXxVqbAgJgp3HHw71Lvwweilvu0q/QcpRN
	 qeEOUdjoJg7jQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WtGSg3TDdz4x3J;
	Tue, 27 Aug 2024 15:34:27 +1000 (AEST)
Date: Tue, 27 Aug 2024 15:34:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Jeff Xie <jeff.xie@linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20240827153426.4499c093@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9rXTUHFLGuZtA5x7.L6bsvC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9rXTUHFLGuZtA5x7.L6bsvC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allnoconfig
and others) produced this warning:

/home/sfr/next/next/kernel/irq/proc.c: In function 'register_irq_proc':
/home/sfr/next/next/kernel/irq/proc.c:343:17: warning: unused variable 'umo=
de' [-Wunused-variable]
  343 |         umode_t umode =3D S_IRUGO;
      |                 ^~~~~

Introduced by commit

  0b39441eaab8 ("genirq/procfs: Correctly set file permissions for affinity=
 control files")

--=20
Cheers,
Stephen Rothwell

--Sig_/9rXTUHFLGuZtA5x7.L6bsvC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbNZWIACgkQAVBC80lX
0GyTNQf/cHazJ3rlGCxV5tA8qReIjzuiFBSz5Jqp0IKSjFUNAtJjwiSo600MSwV/
SrI4o4wx0WUMJfWGlW4c27vSy/bijmTEUXvdalsIBQdvjrQQFaeZGJ5sq4C3vQlP
Zw7cz69rIAryLhHTEZ4vOWB+BoEgHeGfKPGKIY+k/eML1nRV5hS9NQZs71e3bTJ2
LFTkFxC4pMJqxzOQ/mi64oTEqQJZqGbN9BhxU4UMsnDeJUSysDHCr2A3ZW67M0YO
/NT2CkkirzW5zRhhAixpH/l3hzeI2uH957dZ/vO8cT/Flpcxb8e8crPEi9B7VMrp
A0Osjj/V4RJpPQxJaF/xdD5bSQ+qiQ==
=PYA+
-----END PGP SIGNATURE-----

--Sig_/9rXTUHFLGuZtA5x7.L6bsvC--

