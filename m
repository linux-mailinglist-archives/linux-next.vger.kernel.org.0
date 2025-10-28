Return-Path: <linux-next+bounces-8733-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6770CC12B39
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 03:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 218664280FA
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 02:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40FBE1E520A;
	Tue, 28 Oct 2025 02:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aLkJlKF5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6067199252;
	Tue, 28 Oct 2025 02:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761620200; cv=none; b=j8joBSd8CySQUitf9ec3UGy1J/NENN3BwvL/BJYF1xHza7UCpFokfl6WTHyrpv+az7D+/XaDG6PCRV6oLY0FKtWLpWFT0fY9EfXzfQTZQQRoNojESyf1cS0Nf8JXQj7JV1LbPp7BTwLi5HGwaZOC/QUPVO/xk2raOG8DLXu2SPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761620200; c=relaxed/simple;
	bh=kgc5r+eylW++ToZ1SAuiXAdAlxh4nLzfJxxGfmooSqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MPWwqW+PLcLZF0sd/cTtzfdtLnE78sBsI15QIT1d8K0bapqeaPG3/Foy7PGnNk4VgMjB57eWS5OLCuYnpLYb3DEGXy4ZzQ6ynA8uAoLV9Lm8e4D4smMmR4HT9BC2DUVuci2Cd1755wyURb8Rk7nnGpJRnZTINLyo7mI5A+24WNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aLkJlKF5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761620194;
	bh=ghRUWxqdhcEDFRZsE8UjipddC/P/cnAKnyBuJwpHNT8=;
	h=Date:From:To:Cc:Subject:From;
	b=aLkJlKF5dLbNPhBl4yLQIM0oSp0/WvkaecP2FlJn+NmpiJmAk/VMfABD0qzWRTQL0
	 s26miSmnj3YG3zSXS9xbkvw7ao/vGZKH2SCprBnfDqKKUiFDFlPcU1F4YhHto/RdaR
	 Cqp/GeDxQxjnx7uPmrLgKLVcoU5QNSulDS2EvcM5y7KwblfFruhNP/xBDOjXIEBiVj
	 86HJ08TRQ+sNRX99o0+x5ijFGpcPQLPSzVxWCobD/Fi2t8U3h8ACwMY3TbI8ctlKrM
	 r0QgC5FL+rIHZeZa+b7He0p4BmDFeksCG8g/roOxMhqTqDz91dC3pWHetZRlXBg4+E
	 cn7WvPonFiDKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cwZlQ07JRz4w2S;
	Tue, 28 Oct 2025 13:56:33 +1100 (AEDT)
Date: Tue, 28 Oct 2025 13:56:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20251028135633.7fe378b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9C0=P0qO3tCCCiZgWuOYMOw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9C0=P0qO3tCCCiZgWuOYMOw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (htmldocs) produced
this warning:

WARNING: include/linux/interrupt.h:138 struct member 'affinity' not describ=
ed in 'irqaction'

Introduced by commit

  258e7d28a3dc ("genirq: Add affinity to percpu_devid interrupt requests")

--=20
Cheers,
Stephen Rothwell

--Sig_/9C0=P0qO3tCCCiZgWuOYMOw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkAMOEACgkQAVBC80lX
0GxT/Qf/SC9sE2v1EFG2Fg454l5sYAw0S7u52JFdzoLv4efjCx0ko5qN8MTL8Nwq
1jD4RHy8oxlzgmn90EZnuIfmaeMO2au+eyrVo6nTFXjgKs5/6VBbiYm71DcJ/0tw
RqDoJ6zhplH/uIfZ3J75lYjMr6uVCYk0+nff/IyTCsSUfoxwQXjf5ykRJlR0vszS
xkXBrGn2t5jj5J9T+rRyVU7Mi0J4cD0pHNXlzvi5xmd2ZOX1UhcVLc/GfiLUgDjP
DdhvjMCyJq8jaQHb+xE6bf0Li8JdiRAg2TE32BMUjD/FgBQCs/YT3gdREQwW3ggL
HQQtLturFMUAYp2vnwAA/NGLsy6v/Q==
=bx+6
-----END PGP SIGNATURE-----

--Sig_/9C0=P0qO3tCCCiZgWuOYMOw--

