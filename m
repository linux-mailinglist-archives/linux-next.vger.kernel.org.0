Return-Path: <linux-next+bounces-6816-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4022CAB99A9
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 12:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4F001638AC
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 10:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7873381C4;
	Fri, 16 May 2025 10:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LAQTVK1i"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB412222D1;
	Fri, 16 May 2025 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747389835; cv=none; b=nIS306Qf7kTNowpXBzMhcfwI/zApP9imNrIMKI/JIqimdCxKQ4GFJgbzcW94adNjfRVqI+Wsa3ymqwdOM6oEG0qSJU1oMLGPKM+v/iJhD4SKs5XzGWpLV+9OlbsWAsALRriI49jRFsojyXxKRTo01vRANwJyurfurPaTzQh8wxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747389835; c=relaxed/simple;
	bh=j1HFc195+eHZzuDggmE7XnncQjiusCu9G2Sl9nJ9a5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dNho5Hqfm4p1hJedOmKUAaZLLZZi34bdXn6oKwIM88EogglmseBAO/ALJfhVMzLazRy18XylK4iCN9vabkInhuPifZlvpwahkPnYYuI1zXMIptGviVVnweC6EdBdp+/OhIl1YtSX1wz70arud2uhxzOwOqzicR2wTe6sg81wwpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LAQTVK1i; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747389831;
	bh=5muHxI7+rtsGX0iFhRBYfJ7R6jC0v7WtAJI7H8fCSYY=;
	h=Date:From:To:Cc:Subject:From;
	b=LAQTVK1ij6JfaGnAaiu4Z3V+7mZTXJWbUbgNS5ElwB7gNkD0ZZkqUr1OW4WoQIkyz
	 T/ydUVkkLhAJ113K9WXvh0ZR5eo+7RurgcneCjODtyU51qw80hSffnx8a9JAqFkkUD
	 1GfOSgcGIKib4ay3ImnxgdhvhU/o4zbszAkdifQSDEP+npJBPGyHTU1WlSXyDuK8JV
	 STuPnYS23NjFEpE3cpx8ZIlB0b1dsWzOhmF0arTxtQ9Rl9uofHWeXMSVHsOiz8CgYp
	 wb+0bEhHcqGm6PSC+R/HizqfrSDzsAzfeg47mYGRJJzIeInhMZ6ChMCV20oPzpuhMU
	 vJFM+p41yFoIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZzN2b1MNlz4wcd;
	Fri, 16 May 2025 20:03:51 +1000 (AEST)
Date: Fri, 16 May 2025 20:03:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20250516200350.63be46cd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EGwe/Jgi0CUVylpY=6+ug/d";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EGwe/Jgi0CUVylpY=6+ug/d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[This is actually from a few days ago]

After merging the tip tree, today's linux-next build (htmldocs) produced
this warning:

kernel/futex/waitwake.c:343: warning: expecting prototype for futex_wait_qu=
eue(). Prototype was for futex_do_wait() instead

Introduced by commit

  93f1b6d79a73 ("futex: Move futex_queue() into futex_wait_setup()")

This warning only seems to be produced from the old Perl based htmldocs
target.

--=20
Cheers,
Stephen Rothwell

--Sig_/EGwe/Jgi0CUVylpY=6+ug/d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgnDYYACgkQAVBC80lX
0GxrBgf/dDVASSubUWgN6tCmtcWx1G/B1Nmv52PEasyhccxcEdwCv6v+NF4Ka2FN
3dfq+SQWeUdetM2KLAY1Kl9+W0X1ljKHhwJmCedbWEKU+LVb8XcqX0VmzMXyM1W7
htNX03LLtbc8a8f6l602gDSzFNmbZqqCHKhtGGpoqkFG65wk0dLgQO/ZhHB6aI4G
K17TSG6bhE2d7yWMVgAqpTTGgFu1CWF6IH3/hRU+FptG/7w2QQG6cfdFUr6VZBNv
VtkM3s8ktJoC+WoH6ipJF6auQXAHkVplo0I/+K1zqWXX8qk43QAnbTe8cU7PrLqM
wPbeh6A9Va/zu96OSAofolrZWx4Eqw==
=frNd
-----END PGP SIGNATURE-----

--Sig_/EGwe/Jgi0CUVylpY=6+ug/d--

