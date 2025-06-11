Return-Path: <linux-next+bounces-7139-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC3CAD5517
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 14:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BFFF1746FD
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 12:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134DE27CCF3;
	Wed, 11 Jun 2025 12:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="H6mwFPhC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6B426A1AA;
	Wed, 11 Jun 2025 12:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643830; cv=none; b=FEaHS1REyYIFqZCR6uXycqMixoIP9bZloZpWiBLgg5arAOhNMjmkDadOXyzmslVyyNuUpVcbIRpv9erHs2kB5TriW6YxHf7Sl3YdrjS6ceD8zGYIAd9i0dg5GlUoqAAVQUt2ZDU+QtL35zgPQh99sdP7y4xgT6vzpi2h5fRZZuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643830; c=relaxed/simple;
	bh=zuCy1zQW7d5Om1oJ2Het1uZW90IPiPdyv6GvThKKx5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k1iowsWQfDb5VDStYObGzOSxw3o5OvNfJfOdW6t8wyVBRvAcj2Hsuzr/iXy+QrTGEXnadxGVdK2x8Kfhutzl1y6xw9jU/RtuIAbSUYxavjonlLWp74DASAConejYVF2SG1Yxzb2WZntwjlcjysZEJMnDUQGpq5EM213CLPWFiXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=H6mwFPhC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749643826;
	bh=P6dMJGHnyIo8SUh7UHkQDtlifSUkiQxFkGp/Rtw/otE=;
	h=Date:From:To:Cc:Subject:From;
	b=H6mwFPhCRy083bRhp8OCPoyi5JHeIFT0mWET71uU34zBSeb2qvVIfgR/wvj+vwRcO
	 5H3EZcTtYphqQJpMGwA9ThmEPXUnHaN+fd83XnL/Hh1+Jr95hzMv0psZpLszN63RSB
	 zP1/6heeWZ9hNmLpP73GAg3NYnF7CCuP6QtACyMgaM0Ew7pzS/6u4LkMq7OZl2hPmb
	 /rphbtLUZOYnVJT0f/JHqvMnko21ZycqzXW5Gqr6oao3dS3c5MR9OiYBw3piyNAnX3
	 T5L4/Nh95Q+qOlv+lHi4pvOVGHa1QCSQXEcDcMRMcRL7SfOgdvKXPJQiYnASgIXkJY
	 8IhB6WcwqBy4Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bHPcf12lLz4wcd;
	Wed, 11 Jun 2025 22:10:26 +1000 (AEST)
Date: Wed, 11 Jun 2025 22:10:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip-fixes tree
Message-ID: <20250611221025.41c6078f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pwc2UDX46C1hXoFFJy.t9UE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Pwc2UDX46C1hXoFFJy.t9UE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  cdd0f803c1f9 ("futex: Allow to resize the private local hash")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pwc2UDX46C1hXoFFJy.t9UE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhJcjEACgkQAVBC80lX
0GwmEQf9HeQTw9958ZqNdzfgMRFWVpZ5Z2BcZTvkAs5sxvPSRxoePUL8+gsfGlAJ
asFiFhE/+KzHv+6KiA5LPgj7QyEfUHWieKNhnTNAoDDjnwqYxkgMUuAWiLBZp8oL
NrF81D0KBDV0z0XjrqIhUJb2FCCz0c6S8MBk3OROLlu2ObXrsRRw2aXdWSKr0T6g
rB1CenapTWSxjTZSLMCeB15JtbHi0oVb9bsx3QePYJP+UG+67gIDulNGOZ3dMzA/
qdeyfY3ldCbUCA+ptV4IPVwevN0jE2hGZKmkSP8Ft4pV72yrbBWa3fteycDa3ljF
8RuMcMTToCz/V8ZN5JrOe6M9MLH2lA==
=11Vu
-----END PGP SIGNATURE-----

--Sig_/Pwc2UDX46C1hXoFFJy.t9UE--

