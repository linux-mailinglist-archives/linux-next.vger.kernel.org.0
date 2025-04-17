Return-Path: <linux-next+bounces-6282-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FD6A91257
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 06:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FC284444A0
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 04:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B16A1DD526;
	Thu, 17 Apr 2025 04:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IdoC2tUy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E64119ABC6;
	Thu, 17 Apr 2025 04:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744865195; cv=none; b=ZMIM69Zzmja/Rwz19QzoO21NWIJHN5bcv9MRPpFnDLAoe7AYFdI7kD1YS/GrkfUeb+XxQw5PvzHY0akz7ZedViTeU2uCqFOv53kSmmZSVZ2eXLMhVQPtc756kC75wZhojPFmBPGNaIlMSJQhNCJ75HDGyCldM1AcmEJMuAq1gqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744865195; c=relaxed/simple;
	bh=K8SkiHxrCKzwTq/mZJ96qvMfgq/dZJsgw3ghWUVqKug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ld4SRiWH6gBLvrqvZ/WuZoeCL4c2wBkq5vRbdPlsGxG2hOejkNjtQi6xPoA/xQcmjVLI74ycJE8AKB6+sc4VblXCJZ2z7fh7F7b1MyaJLb5hC/za5imJx0PjZnr9bu3tvcocYXsQAfOmf7yjbcFsKYMiylRK+W+ehKM3JsVhRQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IdoC2tUy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744865188;
	bh=W4Eno2aLkiyV8ghB33/W6zz5PT3dWlL4c69V39DVBL0=;
	h=Date:From:To:Cc:Subject:From;
	b=IdoC2tUyU5VryngxRsqKjnUr/BM2r+AOctincFaW9awNT2XqWZiMxessCfIa63qsu
	 kSh5m+FW2Gppx2UYDPzgQ08ZGugWxxc+Ql6ATXfpK3BUctue55ffU9gF0mirZfek5o
	 j6KYsqHdrzvBDlnj3fN7sM7Kc/zCaoD1aIK7Sy62sc05ybNiGnOhSSTuuOxXt24gfu
	 b+xzSE4ZUhvSEnYrEstmiKdnOn3C2S58PF7p+xkDjEk3/3ftBwKTgwWWQwvKm34Ybl
	 FnMhfC6JAeDjQ7Qt/7n3y5FOmdv0T2wjWcWwmm9QM5W8JnIuFjPleKFcQWcwxQBswD
	 8B7QR0N7IG9BQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZdQMk6PcLz4x8b;
	Thu, 17 Apr 2025 14:46:26 +1000 (AEST)
Date: Thu, 17 Apr 2025 14:46:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Subject: linux-next: manual merge of the tty tree with the devicetree tree
Message-ID: <20250417144625.4be32ba7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s4P5Egj6WZVdiIqMz_C.n=E";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s4P5Egj6WZVdiIqMz_C.n=E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got a conflict in:

  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml

between commit:

  672da444fccd ("dt-bindings: remove RZ/N1S bindings")

from the devicetree tree and commit:

  0ed228275485 ("dt-bindings: serial: snps-dw-apb-uart: Simplify DMA-less R=
Z/N1 rule")

from the tty tree.

I fixed it up (Ijust used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/s4P5Egj6WZVdiIqMz_C.n=E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgAh6EACgkQAVBC80lX
0GyDZwf9E27ZmXgD26/S0yb5AwL4MkGUxbw4cxfg3XoW6g+o+PpaZ35gupJKf2kL
I5m8dnF57c9erInfaW3vnO/gBsftrAnaarpD4PBxHLfLQOCgnQVmD5TJAYOrSSYV
cNkYnf8a9H/iBn8LvlEeGUvYb6Qf2TisQwKb4bIYfIp00fkYUmvU1pGOnzBZkS5G
IbYeLQ+bdlvvZDUl3Da2Rl8OQFuOeLObHHn2DF+bxVyymdboRYRqTZ4qvjyEIYvy
mFPQcAl96kxjquyAnQuiZVqKBuQZ5msiy10MYfGZ4gyY7/1EL3bkRrgstHPD0ZbX
Wx80fk2sWVo++B8YQehl1zzECOvKhQ==
=zIiW
-----END PGP SIGNATURE-----

--Sig_/s4P5Egj6WZVdiIqMz_C.n=E--

