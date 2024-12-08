Return-Path: <linux-next+bounces-4895-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC979E87C2
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 21:28:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3F8F28146E
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 20:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B7A145B26;
	Sun,  8 Dec 2024 20:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Uw+ZHgh7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B54142903;
	Sun,  8 Dec 2024 20:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733689714; cv=none; b=HomvrALfQY8fhklT6ItEh6Y7ozDKyCHwfXsG6d99FsuKCspJ2s6UNVDeBuLrMtUsOt6rLfEBC4nggNYgqogCMijg7bmMgULishCqwFws7mh+n2cBctTgYJgj86HtA6xT3PLfJmHlpQ5UB+V5vSjW6I8KOC9+qJuw7HG43YSxj/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733689714; c=relaxed/simple;
	bh=ho3QsC6bJcss99cOAMfmPk/TDR/D1MKywCqJyTWi/Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TFvQb1mMEtM1oBeenNYPb5AAfPPzSVYT2wzY+br68ZNZZTRtuo7wWc/ABQhnfhNqfyyAmyeAqU1m/0cKPie9FWyglXp4Sop7qH8rRq48to79t5/Cn6Po/bNYVvurfa0SBQ7Y+qfuIPpinFUr5nb/5gr2oRI9IAPSRbClKOgJviI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Uw+ZHgh7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733689705;
	bh=/D7bfkxIy/yYSMg0dvidZnP9QTNo3E3TtW55SmCgOCU=;
	h=Date:From:To:Cc:Subject:From;
	b=Uw+ZHgh7E+DM3uUXO8Ibc18GtZq5BGqw3MC8Wuu/P1810ltxKAoU2SlIT8AMtfUeS
	 pun+QLRo6tF7H18d9xlN+u/RSRauEapWNDUAnvCZNPtBDa+WzziTquwVXZj47hyPuD
	 vDxkDGgR0MTMjVeOodZKAxf40WggnJiRIKruul3hCPonRZaWizjmLMRZHyBy61RMxW
	 kDcq18vBsuG2d+PTA0L1WeqNt4Q6dAi6SrALMJ2Hf6MnGqws+81hoC3LcykzrNYfDX
	 IjFVGvq5hEebAeBSimVw2BDyR7GJdNL1wkF8uRqCNpPKujdUxHXHmlMz8+U9fCQig8
	 YEtaQiztlLpsA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y5xQd5nBnz4wby;
	Mon,  9 Dec 2024 07:28:25 +1100 (AEDT)
Date: Mon, 9 Dec 2024 07:28:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the kbuild tree
Message-ID: <20241209072829.7febb36f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OXon_.cWOo4AaNn1cPeF/ls";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OXon_.cWOo4AaNn1cPeF/ls
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  1b9406cd1dc5 ("modpost: Add .irqentry.text to OTHER_SECTIONS")

This is commit

  7912405643a1 ("modpost: Add .irqentry.text to OTHER_SECTIONS")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/OXon_.cWOo4AaNn1cPeF/ls
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWAW0ACgkQAVBC80lX
0GxfRAf/b87IiJakgKIRmWtFMfDRoOiAOdC6KD0qUV+rK4TmKHtz5OKMzVOt8Sdf
uxx35g3jHvY5VnpeJlVIIzahVgwfGn9CisMFmcXu8hj6XR/r7dDZfjjh7dRLq8s1
LD6lZ/v+t3cPUetkBSxYSohyJ3XR0qoFKClL9UeKlnJu04o3/WBINPKImwj8nJMq
9oXEa/jscLibrrLCQwFzo2hDTZG6d8KU3+SfsT6I/XmO4cREk4Nct3oBx/RMxN/D
6TrNoxhzmWVd40ZwM+onpByw3TAdEC5WbTV8PKusYlw3i7YL+MJPbw9e9jrUU7Zr
d1OraFdt/W3/Kc5O4fgvYR6HPTXUQw==
=moAo
-----END PGP SIGNATURE-----

--Sig_/OXon_.cWOo4AaNn1cPeF/ls--

