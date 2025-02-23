Return-Path: <linux-next+bounces-5534-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F603A411F0
	for <lists+linux-next@lfdr.de>; Sun, 23 Feb 2025 22:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C69C2188C270
	for <lists+linux-next@lfdr.de>; Sun, 23 Feb 2025 21:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C693315666B;
	Sun, 23 Feb 2025 21:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mCLOJ+Pl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923052D05E;
	Sun, 23 Feb 2025 21:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740346453; cv=none; b=ZuN7LDU2bdZZMiNuU3Ao7Kn+URtfk/673h2TiBchuQNazsMrI6jf8ryrJwlnHuepeeoGx1ika82xNTHBgKnMdPjzkHvUMpJBfCQhcXgGFCmBOpe+NMIbWYUOvkCYqRzPg4KYp45EqABaCzQXgW2QJe8a4l0ySX5L0mIJRxNqUrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740346453; c=relaxed/simple;
	bh=HC8gUekt+1KIO21xATs4gveN37D3ua2UYLw0vMtIKgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rMQryqvj1mIv6dvvRNQcVD7mQaxcce5MTkeNbTs6y5z5REIJxKybf2wyW39EzpvjCByNs906Yq4Yh9R+YHqKEI7H+JROdYmZgQa024FdMZcxNUW52uI46CFUllEfh3Tg311cMABXfo6DEqXue4hPJMBeVJRiwL+9OrQZPTKq5i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mCLOJ+Pl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740346447;
	bh=scMzv/urRxu87ZCPVY4iTqmJd43dmaeSt6UOv6dZP44=;
	h=Date:From:To:Cc:Subject:From;
	b=mCLOJ+Pl7Z9UPbuP4rNMIi1hTBTnOb6lELP+867TAgJCdGvftgFhwJUgWIuxZqAmc
	 xCD5heBykMt/HSALqxENABrhbXteekrAsOTqS0wvlhiuRDmtiuL/wqs+93ptjFH36o
	 qhIY/eK+BC5ozIrfHknU22a5NuSYPdXqcBzQaQJWjj6pCFSkhGRyUQP5E2v7YBN6nm
	 86JxTFeRLHsilYENnTCtksLwi9EN5DIIAOzx2M3oAiQ5u8C9NYWen5SrrWdm3sHKIX
	 86uM7ItdYrf0/2awXuBN6hMH2W5azODnpg4fcHIOLgEC58LhF98k5g8UFMYnBn1pO1
	 UWZI495lfMpiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1HDv3kcrz4wbx;
	Mon, 24 Feb 2025 08:34:07 +1100 (AEDT)
Date: Mon, 24 Feb 2025 08:34:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sebastian Reichel <sre@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the gpio-intel tree
Message-ID: <20250224083406.6174f821@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jlrok+CgIf4odDD9qBWI22P";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jlrok+CgIf4odDD9qBWI22P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  b16e9f8547a3 ("input: ipaq-micro-keys: use devm_kmemdup_array()")
  67b12cda28e1 ("input: sparse-keymap: use devm_kmemdup_array()")
  5f95e8d0be63 ("iio: adc: xilinx-xadc-core: use devm_kmemdup_array()")
  18c4aec76056 ("pinctrl: pxa2xx: use devm_kmemdup_array()")
  d7f6555aec79 ("pinctrl: tangier: use devm_kmemdup_array()")
  6e1bba1140a9 ("pinctrl: cherryview: use devm_kmemdup_array()")
  af946f612dfe ("pinctrl: baytrail: copy communities using devm_kmemdup_arr=
ay()")
  85ab35bae5ac ("pinctrl: intel: copy communities using devm_kmemdup_array(=
)")
  4c176c256dd9 ("devres: Introduce devm_kmemdup_array()")
  d7a76a31c46e ("err.h: move IOMEM_ERR_PTR() to err.h")

are missing a Signed-off-by from their committer.

Also, these have been merged into the battery tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/jlrok+CgIf4odDD9qBWI22P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme7lE4ACgkQAVBC80lX
0Gzrzwf9EXzu0OcCsZt1qpVAkGL4oaVMtXxxVvuTo9KPZ1EpwRZMXQSMRAXrETKa
a44/kYt+BaFdUatU/M8C+2NBznAMjWrb+rUiwGnPZDtDlTEmk7odj4WDpbL2njyv
nvzRUPXeRHsThrwbz0+pfXYNc+Qwbti+FoIcaC91TkVM5Br5oXz8CTtkKcOkYxcb
+qlnO006JW/RHmsf4bDop1qd1N7r3kqY+VUjUVHxR9ONsHQ5FffO0RPBtcHse0zC
gMxk8KRs5P66AyfZIpHqJW3WFAuIzeaRxMvoSr9zZmUeNl120EOnkyoULj/frw1C
3bMGcvpz1TJjxdLErqt3hka8hTweVQ==
=nBZ0
-----END PGP SIGNATURE-----

--Sig_/jlrok+CgIf4odDD9qBWI22P--

