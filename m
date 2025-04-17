Return-Path: <linux-next+bounces-6284-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F357A91327
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 07:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 134C97A5921
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 05:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941161DF246;
	Thu, 17 Apr 2025 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="C+DJRvEn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E93195FE8;
	Thu, 17 Apr 2025 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744868695; cv=none; b=bFmo4AJbk939Ik72S+xswO9PekbJ1JVxNwYI9y2Ex40JR+tLhh2iiDXEFpgGs2SkiAZMwujXw9lGTd7hPLBUMk+I46vRcDr9eL13q69lin+X75LZdHmNvYxf8NFFcE1FmtqTat4Nw45n2aWSuIpe9/M8ebp5UML9p6fG7PI2aZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744868695; c=relaxed/simple;
	bh=Si3AfpSIXUZWHEBNXUEisWaaiZp9N8CK2LqUyKMe1sw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LXWsERFPxZZhvGztPbRVLsUxgJQ5PQWLQpChFnH7ACZeiMRVaAFsB0nI9ihINbZ4zJl8Hn43rbHL1CLliN+4m/brFgHZ4yuvGQDLV7IKNR095r19TfjILNzjMGMNYUE3ee4/NSFRA4BTKR8In0WhCl9K0xcUkBvaiP2QRecgCxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=C+DJRvEn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744868688;
	bh=+G/l/IR8gz7cAHFKnICiUwkMBvH+qUera4e3n1Le9+c=;
	h=Date:From:To:Cc:Subject:From;
	b=C+DJRvEn0uGPHYSTXZhLiLPTgjeYgj4aUoKfc9CXEgCyFmAu4sNxWpXKtMCuhzaBp
	 HNOtf7hnIkm4QAg/1mXST26JFO1ZdhJll51DIneKOAZ28jdLocJJo0oIZYuDK++131
	 bYmBCjgCfdx0jn7BGOKL155lvCLNdTZpHMWNgclJBItsjukJtbLhsvyVYZdweNlNm9
	 LpmNO3hf/wmfIMB60Pv0Ob+Us22aL4/k9uQWtIHoetbdo5ELDqOHHcN8UWvoM/u9LB
	 274uzKk6HWRiCN8IapD7Bi/7HzBS0vx5o1XXuE0SMX/X2If2bpH/IvX1UspyPH5gsq
	 UGrI1N3a8UR/w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdRg41jGlz4x5k;
	Thu, 17 Apr 2025 15:44:47 +1000 (AEST)
Date: Thu, 17 Apr 2025 15:44:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the gpio-intel tree
Message-ID: <20250417154447.642f2ec4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Cg0v1yfqYb36Wgsb=RoL6Ym";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Cg0v1yfqYb36Wgsb=RoL6Ym
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the gpio-brgl tree as different commits
(but the same patches):

  8f4543e980ff ("gpio: ich: use new line value setter callbacks")
  b7a49fd57be3 ("gpio: graniterapids: use new line value setter callbacks")

These are commits

  69e230a0a288 ("gpio: ich: use new line value setter callbacks")
  04eaa41eb8eb ("gpio: graniterapids: use new line value setter callbacks")

in the gpio-bgrl tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Cg0v1yfqYb36Wgsb=RoL6Ym
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgAlU8ACgkQAVBC80lX
0Gy9oAf+Lb5Rm5+EF8v0d8fHHFwP+bYZJ8zkautSLRV9acQ9owluHk6umU/4p1VR
sZtSEbUD2lv9ETnj5Ia3Xt/MyjT/E+vdpmYCrjbAAh2KCC/5JR7aJROV3WnbA9j5
eDmfLJAQppgWV/R5vJUWgLeGgjMn44mRL83Amvcff2mrEJOQ/su9zuEIr7BAbj9w
ejjU6jHhmmYFoVY5rbPQ0HswzTZ6L6F+3jYlj2x8vFrL6gOBRgcKEzsfUUbft/el
80ffYpXy3qXcalSpOreGpPFdLCQ2gG+3dYNbJZL5ptHNvH/W3H/2rZc3rQEH1nZT
d2fFyMKVoWF381sBooQWm79D9hKvwg==
=Q1JZ
-----END PGP SIGNATURE-----

--Sig_/Cg0v1yfqYb36Wgsb=RoL6Ym--

