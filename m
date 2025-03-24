Return-Path: <linux-next+bounces-5954-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2B4A6D8BC
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 11:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B6463B1081
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 10:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D42D25DCFB;
	Mon, 24 Mar 2025 10:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FaYYKqrh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DC125DD1C;
	Mon, 24 Mar 2025 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742813830; cv=none; b=VztPbJJZKUx/bN0MZoZmCfvXXQSFdIqNSnEZeQYdAD5JRCO+i4vqeAc1SJwsvJO2fKp5tVm1XBJkoWjjD4U2lT/EHFYZmOQzaKR+DtHgDs4j/RFRUvKPGzqjlM8KyyiKPL+N+ZKeTfesjIMHsik0xQrgQQSPp3AxnuF+KYxRO7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742813830; c=relaxed/simple;
	bh=nokVEstSgYL4s/ZEqAsrD7W8PeiAIohj0Aw/3oR39dA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GYOhhD7o49Xoi+nCvcuehkoVh3QM0Y3vXNwAjxYiSsgA7uSyZWZN3r5w42LKChphyXCIfxeQn2bhqVnEIl2t5BKogS2dGCA3Pi+DR4EXx7JyxpCvsyH3HW27dnGHTgc7XPrIGxGALSJBqMYESW6rpVLqBa/tLywbR+5W3Qq87o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FaYYKqrh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742813824;
	bh=lnWrbRDEFzpa2MhPXPMfR9xSFD+lXHsCZW0mVk1hzy4=;
	h=Date:From:To:Cc:Subject:From;
	b=FaYYKqrhdx0+tRfiS+RSrtcbhJ2SwxT2uVx6pW1KgwBKWBOobcbG9ydh2xCXYAujE
	 xC+tn9PX8yFSj8pP2BfRW9W0NIhTnWjdaB4sQQtiKH9XE6TPBR+iU4S90hqEV60Z1e
	 DDJzF0nyaZjQm61eKdiKDy4UzGib3HAHbW3fKhJy0Pd0fU+zbmg0lOkNegpHTM5KsJ
	 JrZPIZkFAvhdH2l2JnZxixd8WE5O26Q2+/EtgwJ1WVOHA9EJGuNvo7BCCSdec5Z2sf
	 Qzx1pPeL7c4ViWBaem8GsjuaICbqbTUHqJkp6Wv/CjbX0tm3pNRRN9/DCsv5pY6/Mb
	 8x2wjusnbYnCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZLqkS12ktz4wvb;
	Mon, 24 Mar 2025 21:57:04 +1100 (AEDT)
Date: Mon, 24 Mar 2025 21:57:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rust tree
Message-ID: <20250324215702.1515ba92@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ea3hjHqZcT1wdYKn_ICJI5F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ea3hjHqZcT1wdYKn_ICJI5F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0277]: `*mut MyStruct` cannot be sent between threads safely
  --> samples/rust/rust_dma.rs:47:22
   |
47 | impl pci::Driver for DmaSampleDriver {
   |                      ^^^^^^^^^^^^^^^ `*mut MyStruct` cannot be sent be=
tween threads safely
   |
   =3D help: within `DmaSampleDriver`, the trait `Send` is not implemented =
for `*mut MyStruct`, which is required by `DmaSampleDriver: Send`
note: required because it appears within the type `CoherentAllocation<MyStr=
uct>`
  --> rust/kernel/dma.rs:132:12
note: required because it appears within the type `DmaSampleDriver`
  --> samples/rust/rust_dma.rs:9:8
   |
9  | struct DmaSampleDriver {
   |        ^^^^^^^^^^^^^^^
note: required by a bound in `kernel::pci::Driver`
  --> rust/kernel/pci.rs:225:1

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0277`.

I have no idea what caused this - it built in next-20250321, but that
no longer builds, so I have reset to the version of the rust tree in
next-20250320 (commit 4a47eec07be6).

--=20
Cheers,
Stephen Rothwell

--Sig_/ea3hjHqZcT1wdYKn_ICJI5F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfhOn4ACgkQAVBC80lX
0GyE6Qf/Td6nkXIEwjJJgo38ikJyqdQL4T0fOHnn4YAugQ9p73tHAuLFYawKwVjK
/PmCxTARDe1lz0mUcqo6+Mc+4u9vf6ZYRHs+2kbPdQSDpto95UcDZ9jW0XTH0zrH
62lQPE8YUbiuALCAvQdRb4AXTHWfJjNTjUE6aXNTwyP1MCRhVKgmxJW0lHBuX9S+
Bt4svh4IHtv4zIRKKw2prhcY0uM/fc59qfKBRzslTgpcKbpP0kjROISg1mdRAud6
RglW8Lx0DQGyNsfCCQTh2DB2Y3kOm8d9uJw+xqaqd35tTqyILsZCrccid0Tmz1zH
uTbuQTxMVghVAoAvuYe7Y9skcXhH/w==
=cAyV
-----END PGP SIGNATURE-----

--Sig_/ea3hjHqZcT1wdYKn_ICJI5F--

