Return-Path: <linux-next+bounces-5376-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6E8A29EDC
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 03:37:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27977167492
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 02:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8178136358;
	Thu,  6 Feb 2025 02:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sGvrb0fo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EDD13541B;
	Thu,  6 Feb 2025 02:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738809438; cv=none; b=bmcECZBaIYOTFpNROZJTAA0L7Y2nWdePRHE1S63vDJOnSMK7Aze1mISEPxYZNUsAYp7guodgnjIavf2XpJ1aFgqyaVENPB6y+JiyqHcejCHI7ke/511NH2z826lOprX5QnLlgV3OE6S/bWBxuZQ1sRH1HFBLabZxJX9ytsdO3tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738809438; c=relaxed/simple;
	bh=QvmmQKKeSGe6VAyxTOErcRrwSiJdSvhiPQ7lRKUHbdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lOCaNEjXlU5+O2FpJf2ci/cyVf1xw9KH4kmVXvaW7QbZs9XTaSJ1etIz4aeilKKGTOTR4P8z5KuDoC4C3PwYhlkGUtI9fbVJVrrLfzCg4fT1CPXHfaK0KNhVsmn9544uroNNiNNd9wiD/FnivJYs30mJGvt3edILsTDvYGlalfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sGvrb0fo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738809422;
	bh=ybkHOc7X7d3d3Jc8hznlsrswfB8qD/58Qh3INF3PR6M=;
	h=Date:From:To:Cc:Subject:From;
	b=sGvrb0fo4c1KzwEGxpmklKSTAWQL/LOw2Cql7bsnMBJdh0pUHPvkiehUnaIc+8lbo
	 vq3H4SDIQvcOm1dvU74gKaS+vJlKtp0Yktjwjh+WLcvwL5UBLXGbJ2SP5YMBH2ENX2
	 9ShkPmRCRGVQv0SAT6Sqt1x6OGstZob1kk1TFpyPZmLCGWXwUXHn1BCpbt+C7uF3PA
	 4+WOl2L2HolIRv5hpOeRmbJnYkZ+1+jJYqV8DqDo5KPsW58Ou7r5lje2tOuj0jW3jm
	 jwhf8lPiu4h0bmmYXHFlBQBTgZOujdpsYXxG4xVRZwbFhti6nZDq/EmMV83gKXzR1r
	 myugDGRd64SGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YpLpj6D2Rz4wj2;
	Thu,  6 Feb 2025 13:37:01 +1100 (AEDT)
Date: Thu, 6 Feb 2025 13:36:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Joshua
 Grisham <josh@joshuagrisham.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drivers-x86 tree
Message-ID: <20250206133652.71bbf1d3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F9hvpMrShV+GQz.zEplzB8j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/F9hvpMrShV+GQz.zEplzB8j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build
(x86_64_allmodconfig) failed like this:

In file included from include/linux/kobject.h:20,
                 from include/linux/energy_model.h:7,
                 from include/linux/device.h:16,
                 from include/linux/acpi.h:14,
                 from drivers/platform/x86/samsung-galaxybook.c:14:
drivers/platform/x86/samsung-galaxybook.c: In function 'galaxybook_fw_attr_=
init':
drivers/platform/x86/samsung-galaxybook.c:1014:33: error: 'fw_attr' is a po=
inter; did you mean to use '->'?
 1014 |         sysfs_attr_init(&fw_attr.display_name);
      |                                 ^
include/linux/sysfs.h:55:10: note: in definition of macro 'sysfs_attr_init'
   55 |         (attr)->key =3D &__key;                           \
      |          ^~~~
drivers/platform/x86/samsung-galaxybook.c:1020:33: error: 'fw_attr' is a po=
inter; did you mean to use '->'?
 1020 |         sysfs_attr_init(&fw_attr.current_value);
      |                                 ^
include/linux/sysfs.h:55:10: note: in definition of macro 'sysfs_attr_init'
   55 |         (attr)->key =3D &__key;                           \
      |          ^~~~

Caused by commit

  f97634611408 ("platform/x86: samsung-galaxybook: Add samsung-galaxybook d=
river")

I guess this was never built with CONFIG_DEBUG_LOCK_ALLOC set.

I have used the drivers-x86 tree from next-20250205 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/F9hvpMrShV+GQz.zEplzB8j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmekIEQACgkQAVBC80lX
0Gw0xgf8DzD3Eop/q76XI+rXUyR+8L6CyFp+vSR9SgKfULe9JQsIJ+f+ota/wbJu
Xy2pvWbmfSONluWltWSkhxnexxbL0/Vg511Cj/3XuWFQH/S6q20ix/uxqd0mlFUF
mbcSwuBEREG+uV9oK8EA/6RIFVj5mnqdp2/TH0q6jq9p4tUYh4vtRQSmI3UKtDV9
YYM3uZC8LWoRWojncDmB+83FklIo3qEUNOjZnoMbgLkO9vBe287nK4bMV5D0kFxT
d2rT8i8kwAQZxk7SCfUDPcP84iMrcbTc3AfzgMgMS2laCHAkljzSDlY5xrk6Dqhj
T3IWzNnSH4zmLzajSLy9fChgGubvtg==
=WK4d
-----END PGP SIGNATURE-----

--Sig_/F9hvpMrShV+GQz.zEplzB8j--

