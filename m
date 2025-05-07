Return-Path: <linux-next+bounces-6559-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9B1AAD298
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 03:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C5383B345E
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 01:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6001A15DBBA;
	Wed,  7 May 2025 01:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VhPHwJFl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0069136347;
	Wed,  7 May 2025 01:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746580687; cv=none; b=exc2mH5wTGenfwrpwtRVctwwJep/vZZHbpbacp6eand58QNeYLzKS1TVAshGd4WtUcsabCpAJ2m+JIIqA1NlS63Y02lSief5DOpihAsC3OZYF/CHWWs3m9hU3+wyDK1kNfV902Y1IRKjtNWJqgGoHPXmJnYLFNVS+CymDJWDrO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746580687; c=relaxed/simple;
	bh=+SAk6HRDjS5yYE/r4h4XbsrAFKHX9I3oSJmC6cMwlAk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KY3zMCSyAQatDGHsMfkH7PlO+cTUg0KtqeLctwUFEvZoaud8kEeNhjZMTVxJz2P4mTzglbw6CGXKv9L4j072nWlN8UwYXNsenT0umb/InGDi8eCXmS8ZqcC/L+c70J4rk7GtrCdQUzCjyIexa7xNlUkOPdxDXP4QhCNkfQxtOO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VhPHwJFl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746580683;
	bh=x5E0Au174ltRRpA2aVzaGMf7lMh29/cu4B6+D9Cf1jY=;
	h=Date:From:To:Cc:Subject:From;
	b=VhPHwJFlhygF6ZejjuTAIgjZK5CbfcWaA9e3j9uPV2C0dKj1Zgu8Pb8PkicFPlSQX
	 XcQ5VVK4y4vNVC02GXtvyoT990ReLOilOM3MUOgfexKu1i/MrbliUesDRuSLt7mv48
	 DXYbjLjWtj6YPTteGQSO5RcygL2xY130ihAziEK5uWIeZSIQiQgyMB16ht247g9fhu
	 jdzt5BKK9H++CJn92Go0kbSjMumTjyJSTJy/ESclec2+W5xH7pGjaon+r2SbPjmizF
	 tGn2FjQSmZ7442yKWXJc7fHiR3XgdYDTp9RZ4d7YjodcO9CvqHW0/L0wPQiW21NR5E
	 Y8oMnoC8+4ADg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zscp255QNz4xN4;
	Wed,  7 May 2025 11:18:02 +1000 (AEST)
Date: Wed, 7 May 2025 11:18:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the jc_docs tree
Message-ID: <20250507111801.7c8810ac@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l3E2J6yg=5XT+QEavyAMl=F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/l3E2J6yg=5XT+QEavyAMl=F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotfixes tree as a different commit
(but the same patch):

  96476dfb1082 ("Documentation/kernel-parameters: Update memtest parameter")

This is commit

  14f53ec8d808 ("Documentation/kernel-parameters: update memtest parameter")

in the mm-hotfixes-unstable branch of the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/l3E2J6yg=5XT+QEavyAMl=F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgatMkACgkQAVBC80lX
0GwJKAf6A6WxfbkpWTJFOMwoVIa1I4G3KxgQCjsLbreZ6gqGoBCCQuxYNcP7SJq5
jzZEpheMJrCXbG+yk9pBobdc1rmUkC47pYmXjgKzptNDEiSXOhweFgQAZybhfsGb
GArhnH4qI1PuYYpTDsXfMUTz3YgGcK9m6bPYirCwRX0yEQslOxF2MNC6os88bDJ4
s8zXSoBG9+ZwCdt58clUJ/xDM32u8rxQwio4gMTwa1MeF9KaCeylFr0CPXtPQ9vc
h8HZAqsPvLVIDOmheUhnEdYVFWsH52jyLEkzo9QTocEidcUSWH6bHc7glRxuUIZk
t3tz/urm7jzSHjEnmqla8FMC/Tu1vg==
=zDY3
-----END PGP SIGNATURE-----

--Sig_/l3E2J6yg=5XT+QEavyAMl=F--

