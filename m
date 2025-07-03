Return-Path: <linux-next+bounces-7321-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E36BAF6A76
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 08:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A960E16D000
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 06:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C59B28DF15;
	Thu,  3 Jul 2025 06:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qs3I512A"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5B3228CB0;
	Thu,  3 Jul 2025 06:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524713; cv=none; b=aJplWx4QY1ZTKRCKZqVqOSYejQICC2KfBbXGFBak1ERlpaBq6ZfWiiHq3yhBpa5YP50S3CpkH3NIqH2ZNi5+whN4p72srRf6GuHS2Pra18XQwNaVAEcn8TbOSFgSYESR4nSY95uOsyjVsfyLIEHdVipLQ6UaGQ8XId8+8Y839FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524713; c=relaxed/simple;
	bh=QOOHhETeEAo4etvksPWoApykOBHO+NOnZ65/35pnXwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m9nvPWKjsypjGAWT7dP2zZpHFkjCFm+mqo3eFzZ2odtf6RIu6isTXufxkV/3tdd+YRD38YNAn8VAQs78eOynsp5XDgsfBIHCILkN4m7bjJ7NG7nvKiAqWS7+qls93vlqfji9IkxYCkOFg73HYGe3e2CGOmxPPgcpgXCwh0IUfek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qs3I512A; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751524685;
	bh=k6205XzQTgMiuKs87O25RD/o8cRMgruWLjgUkFh9Ivs=;
	h=Date:From:To:Cc:Subject:From;
	b=qs3I512ANYupP+NdayK/k0HWvn1nCI+jbXAKeiYlpRxEiPsbXIexPPECiP+tMpVnK
	 7JAQvzf2AUZPCPUYhaN3HH5YzjKnDCeeHh9QD3IEGn+hgYZOaCQxJaoQdNagt7AT5G
	 Sa6rkh7bALIs2g4usT4bvVyGs3UNTAe25OfMnRnQpQTI68NJM528MPGSLejnaKRgm4
	 4PuW20KefRdLaOT0ao83HQ+r9ChFTyJptQlZZ1Vlr3MT2JiiP2aInIU9wIusGnbaTn
	 wSu9y2i/HlKxrpv7J9gW339MjOQRdK7PqqGKhUG9si8wb8LWq67FSbiDmBrfpTImeI
	 eiP+eKhO8Hucg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bXnC02lvDz4wbd;
	Thu,  3 Jul 2025 16:38:03 +1000 (AEST)
Date: Thu, 3 Jul 2025 16:38:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>, Mark Brown
 <broonie@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Jonathan Santos
 <Jonathan.Santos@analog.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iio tree with the spi tree
Message-ID: <20250703163824.2f08d866@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vha8HjkkUu_y4NHykr5Er8d";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vha8HjkkUu_y4NHykr5Er8d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  MAINTAINERS

between commit:

  e47a324d6f07 ("dt-bindings: trigger-source: add ADI Util Sigma-Delta SPI")

from the spi tree and commit:

  0dd88eaa7126 ("dt-bindings: trigger-source: add generic GPIO trigger sour=
ce")

from the iio tree.

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
index dd764b947dab,d0809d62ff48..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -25333,19 -25201,15 +25341,20 @@@ TRADITIONAL CHINESE DOCUMENTATIO
  M:	Hu Haowen <2023002089@link.tyut.edu.cn>
  S:	Maintained
  W:	https://github.com/srcres258/linux-doc
 -T:	git git://github.com/srcres258/linux-doc.git doc-zh-tw
 +T:	git https://github.com/srcres258/linux-doc.git doc-zh-tw
  F:	Documentation/translations/zh_TW/
 =20
+ TRIGGER SOURCE
+ M:	David Lechner <dlechner@baylibre.com>
+ S:	Maintained
+ F:	Documentation/devicetree/bindings/trigger-source/gpio-trigger.yaml
+ F:	Documentation/devicetree/bindings/trigger-source/pwm-trigger.yaml
+=20
 +TRIGGER SOURCE - ADI UTIL SIGMA DELTA SPI
 +M:	David Lechner <dlechner@baylibre.com>
 +S:	Maintained
 +F:	Documentation/devicetree/bindings/trigger-source/adi,util-sigma-delta-=
spi.yaml
 +
- TRIGGER SOURCE - PWM
- M:	David Lechner <dlechner@baylibre.com>
- S:	Maintained
- F:	Documentation/devicetree/bindings/trigger-source/pwm-trigger.yaml
-=20
  TRUSTED SECURITY MODULE (TSM) INFRASTRUCTURE
  M:	Dan Williams <dan.j.williams@intel.com>
  L:	linux-coco@lists.linux.dev

--Sig_/vha8HjkkUu_y4NHykr5Er8d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhmJWAACgkQAVBC80lX
0Gx8agf/WdaDvgGOTyImz5WCyqZJSGLOOUNJLATPJMpSHPUPK2qgTDGYNpUR2Q7p
kJxwHooiYKdz7FRiQh5oJ4YojthWN5B3A21jZPdNoTmU8o4OaZCuNSpGmwAc+Xlv
laT6V05R+FzCPKzkrLF3BNpAEAieIqTgGQvv1H1q4QdzTJS2z4/yP5aUZPcFsdvr
g5QfJNkxWTmpnq9p3wld7vqSgcuo8iiAL+IkMakkD1/eRS++TgSP5LIK0loOdYcS
lYSA6KzJYX1C2uHv70wnrUu4TZcS47rcZTuFTRUFjEjoQvSFXIAQOA/AEo79o68z
RA1GnAVlEsdyE5fqOjlDV2LB6cRYaw==
=0RrO
-----END PGP SIGNATURE-----

--Sig_/vha8HjkkUu_y4NHykr5Er8d--

