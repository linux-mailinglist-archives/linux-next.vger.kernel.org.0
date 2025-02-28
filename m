Return-Path: <linux-next+bounces-5607-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B668A49282
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 08:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F269B3B7889
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 07:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10EFD1D14FF;
	Fri, 28 Feb 2025 07:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YBcO8nMW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BBE1C5D78;
	Fri, 28 Feb 2025 07:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740729334; cv=none; b=iP9jjJcSwyg8eAE+HP3Cld+B2vikaiBfXLGhFuDKKjZBeqBsgdSyz7VlZb3NAzs0EYPJs+unuDP4k5wtlVJRL4Bdelgk+SUSOnt0VUZnAJynQL8gvU5MZkyhfK4yDSXdfM7JXaxR6s8CpG+S6gWlwToA1BBk1ucuHRuwJUMaOzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740729334; c=relaxed/simple;
	bh=LAJM8c0wRSszWgsYa0RTzNMW99FQy6Qb843s2Vuy3Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Vs++1dz6S62/GlzC2fXTQCxce+kOwesxVEM6LHPh/+MXQMn7pLNuJgIhlK8MAUUeQ/bA18bJUsEQOJhZ1LSWDWYBQXKHIqZKKLm0LpKhS5dPUHvAn0jxfXzW2KmS3lgNVm26ulUli0XYtP90YPwCxEKqLPSDMkix8lburmGZp7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YBcO8nMW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740729329;
	bh=Jvw7//FMOysqywEa/utDDVkZpeHOIq/szvWObPXWAj0=;
	h=Date:From:To:Cc:Subject:From;
	b=YBcO8nMWfNOGGZVg2dGG2xSLjuTObFEKvzJzbhdbncRwfTm6PoQIKyxhFEQArBtyx
	 QjPoU37y6J15IWxLnwTPvcxNHqbaVvKG8d0gmULmxBqAtBsBKmRelotJytOvsHybkJ
	 lXE450r6vVphQsn4Pt/2l6jC0uL4w2zhFcdA6icB7tnrkmz6ePxFz39nCpGo+BQMHS
	 cSLu4GO0BfYcZlcqoxCHsqn7qWYyzRiMH1Mj5Jq+E/vaUJVMdkzxnVjMiBF9lQvHTk
	 fSW4Aha45I80e/qQq01bOebZZ3TyX/wx8Y49dy6lo+eVpEUfRQ3cYyz4wpQvS3NipW
	 5jFeWByAxPaNg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z40r13dfgz4wcT;
	Fri, 28 Feb 2025 18:55:29 +1100 (AEDT)
Date: Fri, 28 Feb 2025 18:55:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: NeilBrown <neilb@suse.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20250228185528.229f01f7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QM.Qck40oC52ciwYDbNomNm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QM.Qck40oC52ciwYDbNomNm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/filesystems/porting.rst:1186: WARNING: Inline emphasis start-=
string without end-string. [docutils]

Introduced by commit

  88d5baf69082 ("Change inode_operations.mkdir to return struct dentry *")

--=20
Cheers,
Stephen Rothwell

--Sig_/QM.Qck40oC52ciwYDbNomNm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfBa/AACgkQAVBC80lX
0GwuKQgApMOIsvPjqOVP4H8cvOaihExZ7lsthXUpqhjYFXU31/+kDCyM7t0Hpl0e
S32XOm1t+FZ7BH/Xn943dTcY4h5ppnNsal1g3JBOTejoOLOQ9O1No91JCXM4/mXu
OXkiLIovGJNw2yTNDkn7Ng55I483r7o+dOG6JNjRTuhn6f7Ta3/UaKvJ6NQZNBfr
T3QOrvgryrODoUwNzdJoqL8JVYqFB7ZXkU+c7jFL7Kc7pArIktmrD2N7xyh44p05
Cj5lgqst1ALfgfuWbykIBeM7mdbe5gZ1uVZhwdDTib2giqwtaid5ZPnhWtEwvGe1
RJtpNDGiw4OEsQgHnUm6aRBWzk0fvw==
=2HA5
-----END PGP SIGNATURE-----

--Sig_/QM.Qck40oC52ciwYDbNomNm--

