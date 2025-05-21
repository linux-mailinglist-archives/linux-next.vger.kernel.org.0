Return-Path: <linux-next+bounces-6887-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 166AEABF30C
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 13:39:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AF793A8C77
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 11:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB4F25F78B;
	Wed, 21 May 2025 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HAGiaAza"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7950F22DA1E;
	Wed, 21 May 2025 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827558; cv=none; b=hfBvZ5iNNWy/9ELWPUKTFipzMLOWB1I8H6I9JoYq/ehnOHqC2511T2CAnR43ikhSOP5dhGpoBshAbukUufiwvZb5YGOGBoon81eLFXAISuYEYMC4GXQtfuCWRMkSOIMqc7uv/irscGHhBMnGF6JJIq5No17NG7FsUDSnvNgTva4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827558; c=relaxed/simple;
	bh=l+qES3gR2t/hhhfdyOwBWYAEhgd/RW6XMvrLKPoKEwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RE/UxWBjvDgVjtZFOfFoaKuNUAygFmLUEepsZI1ewZVMRFrCkFpFyK3PhSieSqlZY98ZOKfePFToQNbOWc7cmyNc/RpTRPJxdz3b3H8L6wSM1n/+WtYfYHWeVbqi8OiWgFvwvTbAyJfkgVA8Vm6W4G/SXD8+D0oMexkXBxC2Spw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HAGiaAza; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747827552;
	bh=FPU12V+VyqRazW4tmxLrjTucxkHYp0RFjPNMtPtSVr8=;
	h=Date:From:To:Cc:Subject:From;
	b=HAGiaAzaIMw+YZ3+fWot/6zebomePKe1+NPKGjngP6vAQ/A33ctxWFW63ABXI/+js
	 vgaVtiNybkL/Bt9fEmBPyG1VIDq2HTAYEr1xT/VcvHtzQPassRx6Yk76h4fhWAwEfz
	 fNDuVj0egN65GJzr1tG4auJi+efouxJEfCqh+fMkkeb7ZQ7N8hX+vkIr55rkHxAYAU
	 fkD4c64U7onFT7OjR3f75nI6X+XBLcPE/e7H+esQGUaHHEFOy7mvFlrFL0R4IwqPFL
	 E1f/ByAfC2ktC1KVIhLf3kpviIIfzqUwVV/QWb8TYwmru5irZjUerIBCVDZfUDBdkw
	 /lwIyM8CE7I9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2TwJ1Hryz4x1w;
	Wed, 21 May 2025 21:39:11 +1000 (AEST)
Date: Wed, 21 May 2025 21:39:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, "Rob Herring (Arm)"
 <robh@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arm64 tree
Message-ID: <20250521213910.303c8546@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Otvl.1YiF6tdP6QbbI8zvL=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Otvl.1YiF6tdP6QbbI8zvL=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  54b8070548c6 ("arm64: el2_setup.h: Make __init_el2_fgt labels consistent,=
 again")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/Otvl.1YiF6tdP6QbbI8zvL=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtu14ACgkQAVBC80lX
0GzULQf+LT5aLa0NL0KXstUzsqDubY5N5u7EPD/79TJojwPUposw9Ks3/HzUWZQ3
HL30kSS8xG3EIVO8IQ6DRy/eGjA3viUmfSTjzpsxngf6E+miO4QWDnkCbpF8VYCq
WHrSk/s4dPpKoy9PRkaqyuYVTfXRfU7LhQbyWMit7mQRmuEhyfM8qlkg/+ExMnmP
hMCy/aj4mYNZrzgt5SwlMqUIVW85jdeEeBbK9NpGew0t7tC+ESCEzkOHsJdBh2LK
Kxss9hIJgrAbTOA6F8S1qCOoWJLqLrAo6LZu1M7ifek5aQ6bCrKS6H9+Ua8CElFF
NzvoBxnElalA8z3+vxkfY+dq6qhmpA==
=gvz9
-----END PGP SIGNATURE-----

--Sig_/Otvl.1YiF6tdP6QbbI8zvL=--

