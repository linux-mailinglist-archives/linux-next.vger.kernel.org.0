Return-Path: <linux-next+bounces-7216-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3E6AE5CBA
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 08:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C551F4A58A7
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 06:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28C4C227574;
	Tue, 24 Jun 2025 06:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I98WAP7Z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2F982864;
	Tue, 24 Jun 2025 06:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750746226; cv=none; b=DbzQM+mqPnEmSwgYPvHS3khz59vyqs2GMXwHRdiVhYOF0Qi/rrBqwUSWMiODldOoQM3ufZlDJJrV/OJ0p4U2Y60LdyiTRSMX0BBZQXIktaGVa1a1xCR1kWNSuEFOP+AgyidOOCcxcY3wEblPJakf9NoN+K8lNFBkTphrN0eICJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750746226; c=relaxed/simple;
	bh=KiXsvLQCcydLzSa/go5AtxtnkQaKDqMjEtjigjWN2DM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fewxDQJTi9UgM8ebxhKXCxBPL2lBYtDHee8ZGx69hrV0lA6K//EefKnGSBXBlgOZxokQNKHhGbADsGx7kb60CsmkG98rbMhWHQS34pGjtR1VuwcP59G+oVFPJfhawG4zBE58IgeL5PEJUWC5HJiHanM8KS1Dwk8FctSUaGksYWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I98WAP7Z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750746219;
	bh=RhEec9NclXRXgvrtyXYtp31bAdk3i/T9h+emYmt0k5o=;
	h=Date:From:To:Cc:Subject:From;
	b=I98WAP7ZV2Nf1GqWHIOycv5TW2OuubCcefKhpkUJ5boLaAapQxm03drHjx86nyz/v
	 Px2TYHTuGe4MpMA8+3acstY3vHSjvKFetFcBT+bZLYOkTSYbLdBGM865LqjXfapoCQ
	 P7i0OZE5Y1nIDxgumTizk3agOrIjkDP/MinZVIih+cApy4bI+EAB8sw0U/cW0jZmEj
	 +7cg8KQyy7LB6+vOWY/0l0Lru2Xy6ohvLvFgn31hlCfQ/yGFtIrkIZ56IyBbmrV2/L
	 +lXQRriL6MQ5f1wAZKA58Rv918OZf8hfSh/MYKd9ctvYVy49YPVDPWxZs7a0xVC4Ue
	 i90nkyxaXFGYA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bRFJW1Qfmz4w2S;
	Tue, 24 Jun 2025 16:23:39 +1000 (AEST)
Date: Tue, 24 Jun 2025 16:23:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the rust tree with the vfs-brauner tree
Message-ID: <20250624162338.7b4a03bf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BeJ_fVxqB_vDaYXgJ1q/2zq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BeJ_fVxqB_vDaYXgJ1q/2zq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  rust/kernel/sync/poll.rs

between commit:

  6efbf978891b ("poll: rust: allow poll_table ptrs to be null")

from the vfs-brauner tree and commit:

  fcad9bbf9e1a ("rust: enable `clippy::ptr_as_ptr` lint")

from the rust tree.

I fixed it up (I used the former change) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/BeJ_fVxqB_vDaYXgJ1q/2zq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhaRGoACgkQAVBC80lX
0Gz6qAf9HK1MxWJ84wen6eyGDTrc+XKrvA4TQDRhImBcEOzFOS2Sw3jaOsVblElx
t/RMVJbSS5n+xVgj0H817ivWHBkI0ubpCH//ieRcYsSqWhhvBjVbm2HnACJHzCTQ
SDML3t07MMUDJKT99TrUwgROQ183MK1p/O7FW/AxbMwUrKnkIjv+pBggly3P0KjI
1Gwmp/7DgXuPBijdHPTXzj4l95EH1+qtrPqv4AUA7WhgRPB0LLCIGpkBg93mgLj2
r9qMgwnJzVFu/XCz2CnpyL3dJPGPZi/8NwRAnAOaHkUorWPP4lLEKIF3LrQP8Xb0
sfpjxpfakpLe8hpXVYCuDOFPACdCmg==
=fQX5
-----END PGP SIGNATURE-----

--Sig_/BeJ_fVxqB_vDaYXgJ1q/2zq--

