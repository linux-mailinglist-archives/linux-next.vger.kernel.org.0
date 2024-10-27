Return-Path: <linux-next+bounces-4457-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4F29B20D7
	for <lists+linux-next@lfdr.de>; Sun, 27 Oct 2024 22:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B4621C20C18
	for <lists+linux-next@lfdr.de>; Sun, 27 Oct 2024 21:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497A717D355;
	Sun, 27 Oct 2024 21:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Dt97lVT+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B281B126C10;
	Sun, 27 Oct 2024 21:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730063952; cv=none; b=uS1UwyWoaf7Ot+2+dKJPJGrFvq7jC02Lq1t/jQDZGuPUrbSCNAb0CGyvI6EDYGgYP1qepOEbggbBtm/p5sc6btAVPnNM8n6q6VNPj2sCRfoqkIj+qyu54qKzjzwgpo2KGMJO3ig/TZakdoJQS8A5/uo2M1DE5elVrKJvSA+oK50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730063952; c=relaxed/simple;
	bh=PjrQyDeI62UFtZJCp2jSsNNSboTSj4fuF5f+XzItC14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WAIJGJisbxne4zSm3z3QvmWwUw6S+SCbfJ0UIdWn+foimr5p3XimCemhce/2QLgahLWhu50iXcVVvlEoPRRrlqWfmLoCJixe1QLfiKpTGgQNVXJvTJlkWegA/GZnFVF81lHU/5/T4HR/qyaN6g60C398Cqdbeul33o1eJ1AYJyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Dt97lVT+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730063946;
	bh=xRPCKQ2GPEvjyvtUpfEOB4C5Q2rfWJs0ggvBpCU2ZUg=;
	h=Date:From:To:Cc:Subject:From;
	b=Dt97lVT+zgR8XvpETIS7hEQQMVImpPF6AbyLJpaX1BoJ99cXliA+wSrSN0Xz0yV/3
	 TlvXiHGhOKGPrRougE+Daw554ol8+rZ/FaTx5XFx3STeJG4kA9u/AhhQ43R/xVeXzg
	 CWVXzX4qvmOr0iABGvFXdKfcdF+z/Q0wDFHxQPZCt93AFbenVEotgvKobP8i1jByKi
	 +imX59oq+7cpSiQ0HtDJViRtuKlvgV2mi2FOJLC1RQ6b4GkOiQdGFF0wlAQPBPVPfK
	 QbYJwXlrCx1CMmwta7gUf1+CCcIdmz1TlDzSkk95mi/UmoSl+hpCNjbqSjLOpIHMl4
	 BKRsYxGsgYCTQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xc8XV1dGMz4wnp;
	Mon, 28 Oct 2024 08:19:06 +1100 (AEDT)
Date: Mon, 28 Oct 2024 08:19:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Anup Patel <anup@brainfault.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the kvm-riscv tree
Message-ID: <20241028081907.10fa06fa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_G+aN87.x7TZpgPF1iTbm=k";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_G+aN87.x7TZpgPF1iTbm=k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  4abcb5504609 ("RISCV: KVM: use raw_spinlock for critical section in imsic=
")

This is commit

  3ec4350d4efb ("RISCV: KVM: use raw_spinlock for critical section in imsic=
")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/_G+aN87.x7TZpgPF1iTbm=k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcerksACgkQAVBC80lX
0GzK7Af+J8QogpydRx+OMvGCZJe8CijEPSsPzGCjX4iUX02ngby8V+X/NjagFV5H
5duj6LkOb/cS/HtGMmuhQd6uWAnsnlu9mbOvhh8jgoSsrRLnkx+xmekGO2NbgDT3
rx9cM3VtyZQFDRpjnqoN7m5749kNraKtEFPzoh83rI4KI47PQDxUPk9ZBHoddkt2
zAlOYZVMFKmOXDQKK9/ZTya1BtGl6BJ+FFdESCdoCUl5gijmvLR3pP0SmG3AjbVx
cSxF2MMSMOqfZn3A513CbYGsWavqLQwA1uYqRz6CEfc/qQmi3ErjV4q9uW8wJp1Y
fZwI67Dv8MMjBq9VNwfr876tjr4jJA==
=jeT9
-----END PGP SIGNATURE-----

--Sig_/_G+aN87.x7TZpgPF1iTbm=k--

