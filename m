Return-Path: <linux-next+bounces-2949-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C79C92F2DC
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 01:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E1D91C20B44
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 23:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F37D16E884;
	Thu, 11 Jul 2024 23:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CnqvycZH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB49815AAD9;
	Thu, 11 Jul 2024 23:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720742314; cv=none; b=Bu8Ozu6ySnwLoImz80YJMn/AFKjH9LemVGp/zQdJmc+AiMQP1yyfR1GKxhBEEWMRjU0g36LdD8xhg23MSVAoJKVrA4lZmVXxPev1xWqIz6Bqcdh6Bpoqhx6FBV2oUTAJkkEOrW091oDSR//P3fXkp7HwVRiO6ib4Vc6M+u+O7e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720742314; c=relaxed/simple;
	bh=2vBC+KzcKTxk5k7WHAz1mB5gMwlYbubQ12KRQ2/rDrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bmnYLtX3qV8niDsAXb4UbAkBtamtkQVk+rIJ6C21pQ73qozvGO4AkuKAHOPKPnhf5rshSURIs75noKT7GQSKnjgB7qmxLyg+xf8FXCLtLCNCvVuf2h80zp4t8jJXF2DtPVFPQGHrbW27+8yGe0wMWoNJOYzaP+EXFmu4zmMGzmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CnqvycZH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720742308;
	bh=zZ8/h8JZ7AJhCHt1R2GbbeguaQJrJzLHHkBrjjtpecM=;
	h=Date:From:To:Cc:Subject:From;
	b=CnqvycZHlJGkCivGN/mIlvxtw+96I1ott32433moDF+sYHUUVUGfhO7fVs+N0KsTX
	 BSoZUgXHQ6LaknIBJRlD3+lflUxlclf2GApHhwvh5m4B0EqHWMyyO7qeWwl6SDm/M4
	 NoDzejE8wR11Q5/8nRkPPJMmQX/J7JgbQk14JuQQmck/AjF2Rq9EHRc4YrdDz0bBTO
	 YFDAG/kWHAUlvWdB/qfq8wS+/snaFgnMkBk0Xc2h3LSv8UZ6FtK+hdA6G/DnXzJlv3
	 2gIGJSl1ZpO/KOQIOV7W0XAuNidh9eVDXR7ssVo2Lt49w5g74GRC08L/oWGfGLDFRm
	 qvNHIH5grgZQg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKsBB2KTBz4w2F;
	Fri, 12 Jul 2024 09:58:26 +1000 (AEST)
Date: Fri, 12 Jul 2024 09:58:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Drew Fustini
 <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yangtao Li <frank.li@vivo.com>
Subject: linux-next: manual merge of the clk tree with the arm-soc tree
Message-ID: <20240712095825.6e1224d9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qD7mgudfTiVy6t9Hm6zpsBV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qD7mgudfTiVy6t9Hm6zpsBV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the clk tree got a conflict in:

  MAINTAINERS

between commit:

  480d9a6083f4 ("MAINTAINERS: thead: add git tree")

from the arm-soc tree and commit:

  1037885b309c ("dt-bindings: clock: Document T-Head TH1520 AP_SUBSYS contr=
oller")

from the clk tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index 44cff47c2594,04eb5587ffa7..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -19382,8 -19322,9 +19382,10 @@@ M:	Guo Ren <guoren@kernel.org
  M:	Fu Wei <wefu@redhat.com>
  L:	linux-riscv@lists.infradead.org
  S:	Maintained
 +T:	git https://github.com/pdp7/linux.git
+ F:	Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
  F:	arch/riscv/boot/dts/thead/
+ F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
 =20
  RNBD BLOCK DRIVERS
  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>

--Sig_/qD7mgudfTiVy6t9Hm6zpsBV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaQcaEACgkQAVBC80lX
0GweAAf+NvWgW6ckvbjJTDY/DDeKsGHmyNw9ApUImUJOIpMjGsgxmZbU6CrA0CFZ
iSBMVdpZsZC1gbd2BVuXOmrta9m/M+CxnpmjKAIG4cGQNIbob9f6uo4vlGudCCCi
Qygww/jMCKE9HM6HocaIFY/n0cdNsY5kAjEyycgDiIkc/LxalUKqC8LsLBLC+90t
XOdeG8Db1yGgsnb84/X1kQqvHoejExDTAFYVeuExoh5ADePkriG6+4CFTiBTKk/2
0Hmq7u5fSe+GjkllfAebC2gC8kocvaKSEEetlRxZ/hwvm4Ch0xCzd1LJFcL66kqC
ADm8MebRMhNez8kHqBNrGP3FaBWyTw==
=yBL5
-----END PGP SIGNATURE-----

--Sig_/qD7mgudfTiVy6t9Hm6zpsBV--

