Return-Path: <linux-next+bounces-4754-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D62339C4D59
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 04:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC4ECB2350F
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 03:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5252204F7B;
	Tue, 12 Nov 2024 03:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ijwETl2f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C3F204020;
	Tue, 12 Nov 2024 03:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731382267; cv=none; b=ZguXucNvg5LaqplbfAXmMTPzmRvYeYPe6KRO/qSdAuGCLcUuOWZiBM54x7VVomfDY/5ss+gyByiIWGekrOOj/Mz4OjwNUqN3l+wUr7TX90SmCLGVoiVd3jjsjLJEpUAw5xhD6llss+K85J6fNncfpGWrNDsGJJuKhlBlK08+e3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731382267; c=relaxed/simple;
	bh=QPWNOCER1tMqL7KGodboSmdtgYWx+1afvemR7Fp3yzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X3uvJ1GspFA3MVr17Z4tHDPdegog7fyUD0Ey89A0I+x3PvLdp9eI58TID6Jpx+vuljYsNYqheSWBfYNTqNfPozjE/LHzUVG4ijeYtqJYT14/Pez66vdV+CvCEuwn4E6jS42EVVZMg7+D+7IgJ4tV51BLdlrCpIGbHyx/bieg320=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ijwETl2f; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731382256;
	bh=eWXE0aNVtHEDyyB7SM89JE3WosfoVWcCx1aEiXE/DsY=;
	h=Date:From:To:Cc:Subject:From;
	b=ijwETl2fHBU+RYK6mQamwCQ3rDmwmT3cH14lqcAgpZtZX7zyVYdq/zhrpVyyCbiHU
	 Nz5XuRKSLF64F4kMWSjxEBcW1nUw76g+zBk9GAfsDg8YHZ64V5Pq64Zj+CdkOqHO2H
	 0w7Xfjykl+7nSX8aOY/Qh4gEqnbrIkz6RuQI/dFpwyQPMy5D9u5MxGh5m4enq2vNek
	 8dpn5016NmCsIU5MbRpFgL76n7DvDO2mgzYcO1D3V1giyOl7updarXS3ivHUWRT+ey
	 yqk10O4REHv9PA5mRNAdRzxdt7J2Bp1P/7+gNSItFtNwdxQQD7pkj29P2jpsdHXNiG
	 uKuF+j+gfbhYQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XnX4b4dv4z4wbr;
	Tue, 12 Nov 2024 14:30:55 +1100 (AEDT)
Date: Tue, 12 Nov 2024 14:30:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Stephen Boyd <sboyd@kernel.org>, Greg KH <greg@kroah.com>, Arnd Bergmann
 <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the spmi tree
Message-ID: <20241112143056.11907529@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cBW8wbW6fEcjeO9Fm_KVPIV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cBW8wbW6fEcjeO9Fm_KVPIV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the char-misc tree as different commits
(but the same patches):

  a5438c7ec212 ("dt-bindings: spmi: qcom,x1e80100-spmi-pmic-arb: Add SAR213=
0P compatible")
  917572b9aff1 ("dt-bindings: spmi: spmi-mtk-pmif: Add compatible for MT818=
8")
  c700f7161a26 ("spmi: pmic-arb: fix return path in for_each_available_chil=
d_of_node()")

These are commits

  9aa45ca73ba8 ("dt-bindings: spmi: qcom,x1e80100-spmi-pmic-arb: Add SAR213=
0P compatible")
  9125ede03ec4 ("dt-bindings: spmi: spmi-mtk-pmif: Add compatible for MT818=
8")
  77adf4b1f3e1 ("spmi: pmic-arb: fix return path in for_each_available_chil=
d_of_node()")

in the char-misc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/cBW8wbW6fEcjeO9Fm_KVPIV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcyy/AACgkQAVBC80lX
0GwcwQf+Oas2Lw+YfY/qyeSqyjLasIWu6HN5NT67CfcftUvROjI0Zb6wcxejVg3u
5ZsSVbBV+w39MduZt2QDQyMm2onB0B3GO0I/a4utxgrZ0wBvt9zVcKOKqSTj+OQ6
6rrwJnNMYrLGMMOEDX5fJv0cPItK/rD7hvrBxp7TPBEmogtn5uvRqWwzGKFR0W4I
2L1jIG4RkMzvXdjqW1U+T6JhVnKomsUD/APrM7ZcxSz8AUqE6TUlrAot4V0Z0APm
kNiW/nrh9NUpAIyIplTI3jtKK54qL3XSGbOEFmJZupl0jpZFInfqE2oQzeRPJI93
8uCL49HPulOZxU4OpGW0m15rAYwX0A==
=eBcp
-----END PGP SIGNATURE-----

--Sig_/cBW8wbW6fEcjeO9Fm_KVPIV--

