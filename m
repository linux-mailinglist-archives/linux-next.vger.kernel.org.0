Return-Path: <linux-next+bounces-4071-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A085B98E886
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 04:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 542CF1F23CC5
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 02:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB261B95B;
	Thu,  3 Oct 2024 02:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GteBFTVr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B10F17BBF;
	Thu,  3 Oct 2024 02:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727923576; cv=none; b=P5m205KZc8ji4P0K5khcv6yzuRv5GyP59lx5JG3uyXnziwh0tNqt1SDCtXcbmtpCzU4lydgwZt1y3Z2FV75kYRyE8xgf8OP7HVAGM+TFFcaj56EE2qhcmjOPgNbtgdW+L3rDEbKJ5IzjIdHO38jeEVSKLaPjvn+g5HdihzRw4CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727923576; c=relaxed/simple;
	bh=8eMOWzNFPj5MR7IuBOsfxbUyTu9OfKYPalOkOe8Rcbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UTAw9e1m53rzqAgipomDF0SGV9WcC1Vyeam6caHOaAEc3G59AHzFalTZ8FzaOnQdBloE6oQnlx254XZk/00JHXs9kxVhHN8y4lINGDh7qSQgEzJx6/QlTCA9N6t0UNmJB1t2495Qpa0Tw3aGkKJGEJPItQsFEnytoM2RvpM70HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GteBFTVr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727923568;
	bh=XNQ8S7jm2cFLBvpFCGfp1wCPj6iUgIPs6JSM5VwC5cg=;
	h=Date:From:To:Cc:Subject:From;
	b=GteBFTVrrLy+Yr5Azj5f0LoeGV0JJ5mRZEaAD25hv2lXM6POG7R0XMs3m5y0RPIT+
	 bIpO95qjKXyi8W/guemFSauFoEyL+e0/HXikcmCK5GINtyU1hxksLW5u3DfNiC8tmf
	 YtsmWCBp6dFbx5F5mvPZKtgBdDgk87zHH0MeAENFb/47hSZUe/wb4Nd3zHlngQj1NK
	 9vIQmPSqFYYkIZYi2RNWT6M2kfHz5jScvEkNAEW5SjaN2UBpuJjj6Iuj8ZRamP8F9H
	 2SoKBegc2VWTO3l43MXgYjE+AF6UUj+2E6EeADTbhZjxJOLYNkoq5yG6CtlsbL0vP9
	 Ht7NjJNGvWDdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJwzN28tlz4wj2;
	Thu,  3 Oct 2024 12:46:08 +1000 (AEST)
Date: Thu, 3 Oct 2024 12:46:08 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the auxdisplay tree
Message-ID: <20241003124608.7eb3f1fb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PatsjSF98La89.17dILeSRS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PatsjSF98La89.17dILeSRS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the auxdisplay tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/auxdisplay/ht16k33.c: No such file or directory

Caused by commit

  7f11dc1a9ca9 ("auxdisplay: ht16k33: Make use of i2c_get_match_data()")

I have used the auxdisplay tree from next-20241002 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/PatsjSF98La89.17dILeSRS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb+BXAACgkQAVBC80lX
0GyiPQf/a1v7UgILf3bq8heqmVSBnFi/zbw7HQ/zwv8PrYRrVh3b4mBszyO/rSGF
UuTbMS23fvwowrZNsqozFUWkfWJNT9sgZd7MDji9qXLFymOuUMjl1ZnVG6T9hhWV
HDDXZE2LWBtSPzSpaFuzI46tqk7BxNF5jrY+vupbMZtSbUb2PFvx8ZvAWL5seNKX
bSA747Uj2crqzBXfgIJrwdvTukyEl5ToehLgkYQ0KYbQJxPs5sfbF3anu56tNPgi
B/LAUQ7z/uGJU5PFnE4MUYjMLTsZm/dVEOVDAz46nttsLKSh89pV8rKhyxsQESqO
k26MzpBK6UyDFJ8UtUskTVFkpW5RMg==
=j4/x
-----END PGP SIGNATURE-----

--Sig_/PatsjSF98La89.17dILeSRS--

