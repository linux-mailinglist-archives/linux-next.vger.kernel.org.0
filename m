Return-Path: <linux-next+bounces-6807-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91393AB962C
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 08:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 036AAA07347
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 06:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411A0226D1C;
	Fri, 16 May 2025 06:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nLU87bF7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B307D226D02;
	Fri, 16 May 2025 06:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747377829; cv=none; b=LOzGnqYRxliJEmxLEqDD/ZSArvHnGbJqXv6SWZV8JvBYP7T490WIf4K+w7OSsgiglGrjLu+MS6kQroBuLJD2g5wJaolXVKZAxWM16fNL1S18vyGKns1XWWrGGQxs5fjZihJCX+i0Zj1ESEIk+jds69Xze5mZcwWQysg/ILZJvdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747377829; c=relaxed/simple;
	bh=J6HrDU/iuBOpVReUxjtn9Tl+I8U41M1recE9tRet0no=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=r+7sgMLqIwukYt2fVwKXQbb7diYS9pphEMRFwnzwfKDstcn/eDOGixDDbND8yGlDIr0WlHdwcHOOKq2CzgEYgORJITwqZVVxi1pTv3n3aQ7COHvSLAzdua/Bd/UVfB+jE3mpEktW6PA/2MkhZ/0lD/ZWpAY3aXsJTl/DLJs44SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nLU87bF7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747377822;
	bh=v5gJB5Uo3vfH1d27TDYKjmjTHs2E6N8QSAXQq1fHv68=;
	h=Date:From:To:Cc:Subject:From;
	b=nLU87bF7MLnTnmBvySiAIbp+RnbwYh8V4Aw9e1pqJ9OCDXdFOZ1x1IkKse9F586jp
	 62Ic5uKnUVgtFRdDS9KzW8hdGANQ936jGM5+rlnf31Y8rtVuJIariieRw1iOau5GQP
	 zYgC6eD2+wQY5Xeu1fusCxTV4cEnMRULJlgYgW4h3C5ScmD39iQ5z7HUM7/3otkSZW
	 fJkxLFEHrmGW6rxpGePUX6GuGi9hawWgJbE6mx0v5/R0/+MdyH+yR8Z8Bza41IwcZd
	 zZjvpRXAsAxEgrbrRu7AvwrRnE4UT0CwzbxrqpVD9IpQ+WcsT5xi9cQZxJUQ9x2E1F
	 aM59ygwllgP2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZzHbf56vhz4wcm;
	Fri, 16 May 2025 16:43:42 +1000 (AEST)
Date: Fri, 16 May 2025 16:43:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the clockevents tree
Message-ID: <20250516164342.74fd3f15@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=4sMk/VZQ54LsROEIw6ae59";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=4sMk/VZQ54LsROEIw6ae59
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the tip tree as a different commit
(but the same patch):

  1732e45b79bb ("genirq: Fix typo in IRQ_NOTCONNECTED comment")

This is commit

  0128816c42b5 ("genirq: Fix typo in IRQ_NOTCONNECTED comment")

in the tip tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/=4sMk/VZQ54LsROEIw6ae59
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgm3p4ACgkQAVBC80lX
0Gww/Af/RWnJi4UI5eawhE2KSkjNBrCWgR6m5jwpJ74kTEdFZVNAYJyBHs1SPG2v
CpY44kNmtGk72cZN2JF0nAa7B8Ye0WFrSC1JbBlO4Kd8eUukzKDFQU10AwHQOf5h
NbnDG8D7PVU37NS50ZPYqazcZV9pk3LVgwfl5U5WM94H5uA7NTcBrZkOtOriihkG
R3RKdiJSvhePwVdjtjv52dSPhBeXMAItVUu6knbLnnt1aUAhmj6mIfToKJVVeYSs
3dBgFxW0ebsSOlZqJcsatteiFqukFyc2rraLIzjroYkYnJGsPiFtgykDfxUucsqY
XUnH29rEblWVE8UwAInkRimx1g6v7A==
=DxfE
-----END PGP SIGNATURE-----

--Sig_/=4sMk/VZQ54LsROEIw6ae59--

