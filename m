Return-Path: <linux-next+bounces-7769-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 356A2B15970
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 09:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C6781770AA
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 07:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190951EFF8D;
	Wed, 30 Jul 2025 07:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jXjf9NRP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AB318C933;
	Wed, 30 Jul 2025 07:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753859793; cv=none; b=eLFwOySi9kF5U9hW1SNjoOFj3Dv9oERLaH1p44MDM15oNoFlOHn56FOlrnaZmoYT6k9FSLtKdI0FYLQc3RNdZmHfHX1Nn8fz8DKkLq7zJmuV+fjmxGaJo1Q/W2ECYfM/vJTL298zKpxGtFSF9aSTRPcEK3iVdoKPZ6p7+KdZ6a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753859793; c=relaxed/simple;
	bh=bnUSIl0kITiFRnE2LoF33Pmwq9nHbcImI1H0MEClb20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DE2fKRLBmlYwpb/i+AOJ+cam1kdv3El8czn9UG6Uwxkex8QAx/6y6Bcne+VyN7FSO/ZuZgf6QrvyIJ+exu3ArnisxW1Wi9lCCcDAtCwp3I4lLd01uQAQXBTuqNL8vOn6iZO+8uqu+qOPNYnHXVSdlChEqlUQDu1rdsdhedMd9qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jXjf9NRP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753859570;
	bh=bnUSIl0kITiFRnE2LoF33Pmwq9nHbcImI1H0MEClb20=;
	h=Date:From:To:Cc:Subject:From;
	b=jXjf9NRPg8AQfTtBKC5p05KKcKH0j9CvuLNJr7+IvrTyY0n/qshEKfudkLXrr8/qa
	 SO+QS6odUEBIKS8X01Nz/hqk7txg78NMSdAHx9+vAcMuRTq/5G53DoWnWQKTCMRYS+
	 vNTw3+r8/krJrUwhsB4j/buyjN1yvut0QzbcUo9nTq8GQfoWK6uwmx/Bh0miW8DOeg
	 dSqJhuzU+eHWveQvzo6svlXYN8iu8XDepxhXvncYvIEmXH6dBJ0cmxSMqFcXfLJqt2
	 kYCrbzj9aVxvuK1OE5SWB4QtZ/hxIeiCG0Cwcn+pOD834p7Z9uYNzVbAmbzwoa4YO6
	 3Xl3xNH/cnCYQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsNhf5SK2z4x4m;
	Wed, 30 Jul 2025 17:12:50 +1000 (AEST)
Date: Wed, 30 Jul 2025 17:16:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Joel
 Granados <joel.granados@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the sysctl tree
Message-ID: <20250730171626.5ea7e0df@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Cd1beS6S+6v3VgSslVhtqY9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Cd1beS6S+6v3VgSslVhtqY9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

(looks like all the commits in the sysctl tree)

I guess it was rebased before the pull request was sent to Linus.

Please clean up the sysctl tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Cd1beS6S+6v3VgSslVhtqY9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJxsoACgkQAVBC80lX
0GzhcAf8CDfZUnropaps0er7jAOgziDSbfThOjLywNtWUZ/P/At5nmuXAhfxF/ZS
76lkbeEY6ag4FtIRPLYa+qFOTU3vH1iKt5MFemmmaK3xgzBuyrrZrcY16MMbk8tO
DK8ALamtUGtDV7Ciw4Tn2p5zA8yDcUtpoMsgwpMNQJK+c8IqMlJldujAsopt2hIn
tTEgNggTxW5KPf0LbRMT8Nd9m9TcVs18xwGx68T3klpQliRTUVaHLUDWR/NaI2xH
AMUgQeSkYWUp9EqbhUYaZ9504jORmhVgDFdiY4/lzX+kkmwD/s/6oUh17RXivdvY
BJL/HqSLj8DYR6LREAUqvaBcOqGspA==
=8LRb
-----END PGP SIGNATURE-----

--Sig_/Cd1beS6S+6v3VgSslVhtqY9--

