Return-Path: <linux-next+bounces-6782-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2B7AB7E42
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 08:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87A794A7652
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 06:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD30427CCF5;
	Thu, 15 May 2025 06:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LFLA+aYC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0011C27;
	Thu, 15 May 2025 06:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747291588; cv=none; b=FqWe/3/hxUtiwrV5cxU33eYDAUIE7k2+eZxqPHlPUReyOH0OCCVkNJzRcZdJxsD+Mzonk4xSEbk2j/FSq0xb2CQ0vZ0vCKxCij8Y7mpKt7aJBROITy7/glvFCJr6U+RRkvoHssApZiuX0oPmBid856msNj6lzmYLbKxIT1AbzEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747291588; c=relaxed/simple;
	bh=ZkhdVgXRBp13v6ndTRfayWBWmABoes4ASXORUhRc40U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BhRSJkd7NTfkNGfWc4OfQZNzcUnw7N7LVAMrV/hAI6jESGIT7mb0l0eoVRjXZohsrn+uhhegHPtLIzkGI+WTIS5HdEBH/eN8uLNDm+8isE93qm6KrvDZEFZOiGIUwj4xkkeT/zp7UVgRtmekKNaqf8jwnPp23PvDQXObzf9VCho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LFLA+aYC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747291581;
	bh=c+J8T3JBgt9Kr1p9LvVN7EV9UHHLyxgFezQOXqMvIeY=;
	h=Date:From:To:Cc:Subject:From;
	b=LFLA+aYCnXCFaCSh+fOHNbRLupyGZ+TQCBsfdwoTvtrK1+Vm9wwDJjuN9+cQYLLpd
	 pgKU8hhEsIHNopEj7CIsC5NdDTGu4iufOr+H5MIi7r5S3jPngsHfiPRM3t7evddLlQ
	 D8RKREae7TBk0cmOhUsSJIRlINmRvfDtqvPhfMK0Yo9j4NCfYC+eQtEk/JA3lo5LbU
	 dsmfi+Wq22kAj+GCMnyAdP0qRQo2r4Sb9mlkIzPltBHK8iUl9HTyPiNPaKzWDQuC3r
	 4BMFzqR7kzpledSRN0r56B3Q0j/5Hm3xDSjrDUChSj0yD1M06qFmmpSFhKaxeTDwEo
	 nwrpbBnbrZunw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zygj90nQdz4x8R;
	Thu, 15 May 2025 16:46:20 +1000 (AEST)
Date: Thu, 15 May 2025 16:46:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Suma
 Hegde <suma.hegde@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drivers-x86 tree
Message-ID: <20250515164620.071d70e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/et=2mf57qA5O2Eo/psJ=ENE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/et=2mf57qA5O2Eo/psJ=ENE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/platform/x86/amd/hsmp/hwmon.c: In function 'hsmp_hwmon_write':
drivers/platform/x86/amd/hsmp/hwmon.c:38:16: error: implicit declaration of=
 function 'hsmp_send_message' [-Wimplicit-function-declaration]
   38 |         return hsmp_send_message(&msg);
      |                ^~~~~~~~~~~~~~~~~

Caused by commit

  92c025db52bb ("platform/x86/amd/hsmp: Report power via hwmon sensors")

I have used the drivers-x86 tree from next-20250514 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/et=2mf57qA5O2Eo/psJ=ENE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgljbwACgkQAVBC80lX
0Gx/OAf+IUMFbngQ2oipcGaqRXHDRawTnYie7muyp4grCWjgZG8O2BvggUvUSzri
Abz6U2BtGRbNF+UjpTGakoq91Nzamu9lHvT0OqcsXac15HF6DgaI/A5xn1iPS1yu
vrG8yDgZ2nsh6GURUArCaNjDDqAhJIYeiK+DgC7gq2cLTODHIfYf81W5Siyu7bUA
HMKAyGIsQM+zTVU3krKJZoxXeysvnPoQL60pFGcyFlHfpFJhyyAsJosLD/0o2Mtk
MDabaAjh9UzQjsXpNxpR7WGkkO7MSoyPKJIiTCFgXO49F2etiO6JRGChqfw9dfmG
hf7qZZkYRJY0JOGYVsHrPoQQgpbPgw==
=I/B5
-----END PGP SIGNATURE-----

--Sig_/et=2mf57qA5O2Eo/psJ=ENE--

