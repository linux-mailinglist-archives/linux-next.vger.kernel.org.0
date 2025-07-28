Return-Path: <linux-next+bounces-7728-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE9FB144B1
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 01:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77F3F3BB51B
	for <lists+linux-next@lfdr.de>; Mon, 28 Jul 2025 23:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C80212B2F;
	Mon, 28 Jul 2025 23:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oDx7uoKn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15A92260C;
	Mon, 28 Jul 2025 23:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753745458; cv=none; b=rWLhAHyd4dt1VvYRPbpDuwV5QMuGg3gvizr8xfkQsTZCtetUa4K+6vEBh+hS/WPg1lmxJdXzPgn+SiDPR2brLmZKDvy1BgKQRXUTu6AcOSyFwFUlS2lhI97Ss2LkKutSosT6+u/W1kdC+cvVMZNGnpWtWt7V8z+mMVCVxfasL48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753745458; c=relaxed/simple;
	bh=d4TJtVaO3xS86kp5j45Kp5ZptoiA4lkXZencmUOfcXs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZXijQdwbmEketlqlbORSB8fWzRhZ4LiDmF6x9KGTBhUIU3hsLBKoSkEAuUrVaUQ0SYzp2NEzVud5nQrW/ARuGNDJEs++8ENtR+XR8JbQirmYrSlcGxkX0ufX1DG9ypcC7hkgdbvqXSbjwsmbopd0Av8+pbO+hMvoX22GYe86eZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oDx7uoKn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753745245;
	bh=d4TJtVaO3xS86kp5j45Kp5ZptoiA4lkXZencmUOfcXs=;
	h=Date:From:To:Cc:Subject:From;
	b=oDx7uoKnyhGwcSOIAiJ4mQulfgWKNFrQf2DDBYn3p1JqaHMRy5xDWYZlCU8eRBNnT
	 vqlqca4KKlvRtsou325ZbHw/mWuOAq5qL3xB32+xHkKKvyqePTpo+AzFWuxC/TeTNP
	 aNgziCp44PBqOeR+QiMbzgAxgzPlECAUAB/P8uzkp51/xK/P8VLskEEvhUrXWl5TJz
	 aOr8QfxglUq0rOZ8Ki9FThho8SXeWnJISSaSO4HzURYrzB8p2iWXZSsT5/43gP0tCp
	 cGuH5ynhtiGGmOKHuyLHP5ufvbn6q/o78E98GDgy8QA6OiDoxho8jkDdIdppKTSumr
	 GZQCajSj9/sfQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4brZQ474RDz4w2N;
	Tue, 29 Jul 2025 09:27:24 +1000 (AEST)
Date: Tue, 29 Jul 2025 09:30:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the clockevents tree
Message-ID: <20250729093025.66f30db3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Amr3/DqBjbA6n7N+NzqCWTS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Amr3/DqBjbA6n7N+NzqCWTS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the tip tree as different commits
(but the same patches):

(all the commits in the clockevents tree - some of the subjects were
changed)

I guess it was rebased before being merged into the tip tree.

Please clean up to clockevents tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Amr3/DqBjbA6n7N+NzqCWTS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiICBIACgkQAVBC80lX
0GwBYAf/dusnbA+s1PCb+hZDa/gXRsftnk2mlWvjKw1TyJK5mqbY/K6ymwIqNyIG
W0HGOoJDXmMIhUQTIKbZOcmWgyZd7iARyKEyBC/wBJV11/qiqayzoLvFkvRZkhyH
ZI72mmCXZaZgm+BZ0Nvd4/WBVGyUlWKXBJcDC9DJRVDs5KlERNAgtS0ULbtHhEyj
1SjP15m593NtIXIi7fwTW8n9YQAfdlYuqzeTtZ9ArRpcNZtEH0+P3m/IMSryIGa+
+b4VKQi8B08xhUHkSdgIB6a5Q0ekbKVnLj6tWl4fggh/pdWwobVrR7aVHX836MqF
PTEdhSyuccUCZ0SZVe5Q22Ek8gFmIg==
=l/Yc
-----END PGP SIGNATURE-----

--Sig_/Amr3/DqBjbA6n7N+NzqCWTS--

