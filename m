Return-Path: <linux-next+bounces-2929-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2863392DB4A
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 23:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8679283BC7
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 21:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2790C12CDAE;
	Wed, 10 Jul 2024 21:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MCxzR80F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61F53AC0C;
	Wed, 10 Jul 2024 21:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720648525; cv=none; b=fuRElC4M9k3zCvJSQgXORWBHnK5lYYwomevXB6Lhv5BVC2pD8BgIWCHwyP7nA9A/zkrGkyAKYs557tyuHRMttMFq7Im5IlUZHSNTp5FFktg8W0XWvQzTNw4iR0GiNl2s5aq9zHszo/fSBZ/7T1tmdLpxKvDb36Y/LR71GByL5ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720648525; c=relaxed/simple;
	bh=MBSnxvViUIPwJIJlbg5CbbgSgPo6xdIuhpGkPieRbWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dLm9oN7FEJzd8TQVzdkfX5BS3U8obGKRhRJCSA03PGEJDJZkvByhCNB5d1dnLTiFlZhOt8qWtsgGwn5KTQAUWKONIuab5v1eI/F8vZ13v4Re53ToyFWreI3eHJ/Hs6rJSl6U9g1oLUnPhhEWtTpqCwp7XGUSCnVMTyXpG7QWQ0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MCxzR80F; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720648518;
	bh=PPielcce1kKyqJtQDm+UqaANRKhAF7i1JjPiQt/KZPc=;
	h=Date:From:To:Cc:Subject:From;
	b=MCxzR80F8iMMjqhUESintSZWITZbG03QMULYjKTLYzI50Ohp0233Wa8I1Qh1IL1FX
	 tZpX3Cy85jsEdH+u0Pz6oJsGg3CzLbrxs1fpfXJofLDtDXKPQk7nwCaF2fMd47dTJ6
	 dyp87P4sEMR3Z3JNojsnXX40zGCj0ALa3Z88r/c2YaSWiHZsiMbzEWXqjjMOmYTNO9
	 N3HTJQ7soqiPenkFhp2UNa1hIL0qrMLaRTyIinhOAKRwSORIa+66ofllV3JezqDgYJ
	 3C1i3EtMoeIG+sdw2JKQW0yaHSKLaC2vHeYYpzgnyxYMCqPxzB4IMtv8jUgLZ0oZ/i
	 fMHBYHD87DKLQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKBVY6QlWz4w2D;
	Thu, 11 Jul 2024 07:55:17 +1000 (AEST)
Date: Thu, 11 Jul 2024 07:55:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bluetooth tree
Message-ID: <20240711075515.48777bbd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wYZl80dQQ7_Jju0qP8PANeI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wYZl80dQQ7_Jju0qP8PANeI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  b9a7772aba0c ("power: pwrseq: add a driver for the PMU module on the QCom=
 WCN chipsets")
  4989331f005b ("power: sequencing: implement the pwrseq core")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/wYZl80dQQ7_Jju0qP8PANeI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaPA0MACgkQAVBC80lX
0GzJxgf8CU7OKg3shBpxz42OGIfkmXy6weGSaIYbItUREnnhs1DMia6zoSTJeq6B
7esdsORZsfzK4bLJ85+kjtxnYcGGTU0o5IM0BSkpyKR1T0zywA4sIYw4jBWGfT2K
CoklitZkpiAZoLyIb0xbAnUibIgGrF11esJZV3BFn84k9E/CHax8Yzsyh6zjOnRL
+9cXhhfJWJcpPALf3ctTYQfKGhf4gRsiHv2jjGPIiS023aMrjQxbE5inBlWnvz4E
ldcgPxPP55o1jj9kc6n7m6yHJkU1ONOpqXE0Nr7w8VVQs/mkuw+wISPblBPqNG5D
GlBzoK7pBTKsMZMGvgIp3xH7BRZZ7g==
=0nUf
-----END PGP SIGNATURE-----

--Sig_/wYZl80dQQ7_Jju0qP8PANeI--

