Return-Path: <linux-next+bounces-5800-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A15F0A63807
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 00:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBE1A188D5B5
	for <lists+linux-next@lfdr.de>; Sun, 16 Mar 2025 23:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C6819E966;
	Sun, 16 Mar 2025 23:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="h7VCvoBy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74BA1624E9;
	Sun, 16 Mar 2025 23:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742167622; cv=none; b=Ja8T1JF8xzAv5k2PKQ2obkgGNdf4+KnaMmL/7nPr7S3ocLsc1xCq+QkN6Qy29CJrFUXrtbzrVm+WXvGwXRjBXFHZQ3hPdz2dbUSxio2uZ7WXM9Nalmw8z5Be6FhRBXLOiV02ZGdmGsg9FeU1sjZtZ+6Yo4pRjGxa5rt4CTUeTL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742167622; c=relaxed/simple;
	bh=otIfGeh0p14BkcIdhlfG4PdkQsddX2Hy+nvvNM4gfOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ILBvIhbONsE6Efjmdch5EPLZXZwwm997VP8wnFuVhC0PaR3CcBsBrlg/V5RvW4pcMv3azcFbnIeCe4QxfeTAAUvZDE1NYcOd/kYnXmb0vHzlo/zWuzbe8H7DEY0hapAvFvBf18GBu33jMSCLk2i9ahh8TsxECstQ9xP+4VDTGxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=h7VCvoBy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742167613;
	bh=tlZ6DSNgDKIfcL+uxKhjn0E0cjYFmBYfcKaYiLOkozM=;
	h=Date:From:To:Cc:Subject:From;
	b=h7VCvoBySJJ8T5bqCG2Hhm8xPDDqyQAnyuBwaog02dxZHdqXe3bXSMFG9o20u/yWC
	 VctkxdUu+k+rtchQBlXeeR9ArPvajDkLwyJS/kByMK8ggtzLRf2vgGuE/rAmvvuW3/
	 /ejcMM+b0J0xqpfalXh94rGd8pVDuCHXsZFec4IWXAfKzY+CkRvxbndRvBXYFjm8H1
	 y9M28sIzytsfG3Yq8ckgb2Vzm4VtJPJC+Y89LT7oxOb168LxIDJGNcasX2I75H/o7K
	 wjvXFe41DxvJa+9CW62pTkafpi/WqLAY8BJRv+W8u1kFv7bErrGBupDXBCR49j/48V
	 xuK0e7ZlMB5rA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGDlJ0pk6z4wnp;
	Mon, 17 Mar 2025 10:26:52 +1100 (AEDT)
Date: Mon, 17 Mar 2025 10:26:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the drivers-memory-fixes tree
Message-ID: <20250317102651.37c64e42@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9gKmwGkEWS0FApJI.JfhCsM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9gKmwGkEWS0FApJI.JfhCsM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  304e6c02b76f ("memory: omap-gpmc: drop no compatible check")

This is commit

  edcccc6892f6 ("memory: omap-gpmc: drop no compatible check")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/9gKmwGkEWS0FApJI.JfhCsM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfXXjsACgkQAVBC80lX
0GyxCgf+Ps9FrIvUG8t7s7gXc4DaITlZQTKtYmBdkbXerx7v+r6q6am0qRKHZ5h2
S2pEibEUIyNy8Ycp1IcVVbEU/VyDjETaoL5mFqrX3NIKgRvOc92B+m0TUIYnTd5v
wzw1rPiQAwmTDX/yE550Q07cx5WKhQOyfalZoKglkALMwikQYN037JhOTw/QxYhq
U2VjotpkGUYPMqDD7EpI7hq20O0zUMpc9uFHGy8SqmEKiz6Qvxbv/aklgn2n5exJ
K+y3wsGq2Nd87++Hmbwa9FrnLcagmbmNTmecjfDbZiDVubOJgFT6Gtl6KIYd6IsU
FUs8nDaOaEQdt5Bh/Pzh2xLjyJw10Q==
=gm35
-----END PGP SIGNATURE-----

--Sig_/9gKmwGkEWS0FApJI.JfhCsM--

