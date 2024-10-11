Return-Path: <linux-next+bounces-4229-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E22FF999A60
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 04:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9711D283F48
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 02:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 352651E9088;
	Fri, 11 Oct 2024 02:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="haK7pDJ3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA724748F;
	Fri, 11 Oct 2024 02:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728613528; cv=none; b=ZCfGq6vbK27mDTnlktvZ9ge6Rf8/1QFQT6RmUCcekjOSzJws7AD00RtWpyZ45oiHJxoBZyExU1TV2VxK/qg2C4ISD33io8Vjoovw4EVi8x6lnQAT2A7wiO1woI+5lEhasG6mR/auUTsq27Y76iUmxnCkKD+6Fzb0ECV928UYV+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728613528; c=relaxed/simple;
	bh=gIIrdvs0S440forZojYQInm1SRpy58GvJiBwDCT3rns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sv4qit7lMJFrjLsBdFss2yQn05ML/5jh4nKyTLzHuhQnO0sYQIPSIOxUPMx5ELinPQIAUM0T5xcsCQmGSr1BYtFhzjeRVZ5hIPteXbP9vfLAFdMY9zzewoC5JGek0DWkuVd+Yi/fw8KtO/Oh7qNZpVjahqvSIN8qS1P5Uwvz69A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=haK7pDJ3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728613523;
	bh=kH8Kd0ILS53n9/3gL9LL89nOTcrICLoW9uGtMvppGVM=;
	h=Date:From:To:Cc:Subject:From;
	b=haK7pDJ3wHQXIkEvz3W2S39YCSZtDYBhDpMDnd5Gs0dvA4bxNmTJKkkjrsR6eCPjV
	 2aFkIiR2x6g61fcYG1TtM6YOE5/6gnUP5DArGE8Yso+p+U9BilUj1FEDzQE7fbWta8
	 gx1Q3tig41pZgaEYJf1IVDobGz4k+FmbVV0skISj8Ir5k5w+JDQeVKaDXyeQJXtYc0
	 mUUwjSD2o/RCsseDaJVErMWiIjtBIw/Y1YJNPiQ1QoUt/ccruXlPeg/+X7gb+vnTuf
	 RLXIT+jcKWCX91ifNjRVtjq6CkuYFeMkum03hym2aWkdP/HZGqZYgSiQ2LRS+lx4mh
	 eeJYgOIxQiDkg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPr7l0r9lz4w2R;
	Fri, 11 Oct 2024 13:25:23 +1100 (AEDT)
Date: Fri, 11 Oct 2024 13:25:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>
Cc: Pavan Holla <pholla@chromium.org>, =?UTF-8?B?xYF1a2Fzeg==?= Bartosik
 <ukaszb@chromium.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mfd tree
Message-ID: <20241011132523.725e3542@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5bG.Wpt0pKGeIAxa7/cAVfO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5bG.Wpt0pKGeIAxa7/cAVfO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mfd tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/mfd/cros_ec_dev.c:132:35: error: 'EC_FEATURE_UCSI_PPM' undeclared h=
ere (not in a function); did you mean 'EC_FEATURE_USB_PD'?
  132 |                 .id             =3D EC_FEATURE_UCSI_PPM,
      |                                   ^~~~~~~~~~~~~~~~~~~
      |                                   EC_FEATURE_USB_PD

Caused by commit

  e5d1202b6b1e ("mfd: cros_ec: Load cros_ec_ucsi on supported ECs")

I have used the mfd tree from next-20241010 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/5bG.Wpt0pKGeIAxa7/cAVfO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcIjJMACgkQAVBC80lX
0GyqqAf/S4Jc9gtzgxt6cvydroNziEUW9zOAqBaHPOpLrDvqOtHR2nYZBoIxLh1c
E42P6cM5eYc4VkjBGsQEJUDcfgrNgqu9H4OgYEQZ420Hjf/hnX0BDASOZhOLAshw
txeZj4i7DsJcXw1JTr2nK6fLuu/KHFNC/kKNS/DRG6HS2JfGLrS16p3dyTDRcojN
7+nv/rUzPJ65JcXWvirEwkM9XBbRGzGj2eszveB+Fz71oAvGuPYbYeJxNHw3n5Xx
2+MipjgXMvsl1tVOPymegI+zsOJjIt4smpkkwersIuzqCNz55PDjc9PxWdfAg0EI
7xkN9HKzflXfXjY7OH3ONkXzTTlbtQ==
=XvnG
-----END PGP SIGNATURE-----

--Sig_/5bG.Wpt0pKGeIAxa7/cAVfO--

