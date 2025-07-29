Return-Path: <linux-next+bounces-7741-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D57A4B14778
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 07:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 189F5542EA4
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 05:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6DC230D08;
	Tue, 29 Jul 2025 05:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="owd3tfBo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB3672634;
	Tue, 29 Jul 2025 05:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753766052; cv=none; b=bKePTcLLcaaoveDxhtsk4GxyoJo5o0+0Hxb2lhVvXLTZ/GFPojnQaNKoBOfQb0aB4hz+3U54UJUXEPDCWzIYYIAuzlu9OP8wCWajqmO2zUf/w+kVMsTZyoWlQDCuhIzUQEZL/67PCwEFIbFxv+n656zCgIv6AaQkEAagf17wmxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753766052; c=relaxed/simple;
	bh=n461d5t1P7XW1CSReTClXz5tQ1bUZojLDBVZjkZL3G4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rpCfVTvZJbcipT7RNCVjF+MJ5YhtzidXzaFu6L5LnwWFGcNaFoMoMCJCDNcHKix5bztD/bT0JnnJwpx6Bqri8xw0Vk3jtt7uydvMoLoMeh+OwdzUHaqXDoQpqyYqCcVuBMNgN0b1gvpiaT4a3U8zazIQFNrQkoR3QZ2SfKdD/+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=owd3tfBo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753765838;
	bh=n461d5t1P7XW1CSReTClXz5tQ1bUZojLDBVZjkZL3G4=;
	h=Date:From:To:Cc:Subject:From;
	b=owd3tfBocJgwc5+O9mzIMa4VjgpFcv5ZQ/VLdcZF5WaE6hwr1oVyqjKv6ukNpnofW
	 G+Pgenxq9PyRJBAFGBtTIZ/wKMCp8PuiwxV6HGnjRbbuuZD8NB6b6FZUk/8cj4MjuT
	 LH/hKULzYX9gHpK7knBacalmJyCtWLXr5rGLc5BcWXIve8QB694lx14qQ5l7/flUa4
	 rQBjJWfnB4u+41pOY01zNMzjSTG9/xbLSEGrMW/RE548X3pkWpjNF2u6GIv6e5rQvV
	 6Cc+a5Ht+SazKQhiN743YnWwA1DnTIHQMChYOUHTAYEPQ1NPL/qGcV0lYMCl+S73ZZ
	 cKJ32If8yKKEg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4brk260pBDz4w2Q;
	Tue, 29 Jul 2025 15:10:37 +1000 (AEST)
Date: Tue, 29 Jul 2025 15:14:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tty tree
Message-ID: <20250729151404.03ac580e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7IfLMYGIBd/txKexgBQuIrP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7IfLMYGIBd/txKexgBQuIrP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tty tree, today's linux-next build (x86_64
modules_install) failed like this:

depmod: ERROR: Cycle detected: 8250 -> 8250_base -> 8250
depmod: ERROR: Found 2 modules in dependency cycles!

I can't see what would have caused this (it actually appeared yesterday).
I am not even sure it is something in the tty tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/7IfLMYGIBd/txKexgBQuIrP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiIWJ0ACgkQAVBC80lX
0GwqHAgApLK2uOhoBDv1LLEIwTonJgfG2KrYswDeWi/hbCfNI4gvez0uheT07jzi
Tx/6/FgZBGTKuWg6OfdU8r7L2jKs4cKhzE36vmFQbgG+1x7D1hgbrAuRtEoA1z/T
ka+UMgiFsPyRLDeEAiWNhxPtFIQ55dE3uOOGfA/hJphpzlwd6Hk0cffxAvSiitiK
4NEi0faJzOlZkHP/wtUV3AsRO0ZIBfsOQ5y88XH7eJ0Sv2PuIr2FcIxlLMy6gX1I
nS0Gm+3hyA89x7k7yBXd3ZqHwZkMnaERmCKzV0x01k2RsfpcMOzO3mpFWT3dYgDu
k8XOWA487L0Ptjt+cAgas04cBtHOhg==
=kbFh
-----END PGP SIGNATURE-----

--Sig_/7IfLMYGIBd/txKexgBQuIrP--

