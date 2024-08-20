Return-Path: <linux-next+bounces-3362-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73790957C10
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 05:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5A8B1C2286C
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 03:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AF51537B1;
	Tue, 20 Aug 2024 03:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dY/djgh2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBEE1537AC;
	Tue, 20 Aug 2024 03:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724125664; cv=none; b=ED3BT+FYFKuno3TjDiqBqrkyjUVsxVDHoasLBicxxif5QeeLTNpo0aYl95ABwGgPzClry8K2Mu1pIKdDtnizd1s0dSYlN0YAjWyaQGZo3q0Ye+HtfJkLDDOJd+Ne2D+XeMzVhEg1KMxU9s9DTlMwn+0eXUB0elbUS8BxU09NM7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724125664; c=relaxed/simple;
	bh=IyjGKb0L/ZaRWIY4/zFVg5c0wGmTRRr+X9OQlrV3uYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LAe7M2aT4Pmjzc/XtGxCtUPUzalXmFLBPaG8qvVfLqpuv7s/tD6vHJ9dr+Wb/JXLt5bzi3QwoHarSvOIJoxDihqmSOVyCzXHagxXnNJhNgSg6ebWyh9RrV7t41xjeiOXMGKBnuxN1odRfa+zZYU+ZsL+SS00Jh+qkkkLrlGUV/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dY/djgh2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724125660;
	bh=Qd1WQUBY5Sf/+ufXU5uZYeELJWydnOf3xir87i14D9Q=;
	h=Date:From:To:Cc:Subject:From;
	b=dY/djgh22/KyLQrUrPBoXLEBoGoSrwWiJBS1RBDByWGEUPl7m6ywF2k795suKppze
	 W8dDs0CCPTNCWlfS7tNRQlyRRSevAxro5VDaZCoRz16uChYlr0rRkRKIQdbowl4YDd
	 IaCTZtnAG2/31BFXKDiqp9MohyTfAZfN0DswoFmo13+RUXidWl0oz5aK161xE+13Ab
	 wnrjcn30Qzf6lU5RkFKklMQAeT+204Zq+8L58beMeKn70m5BsoutR6EtcRettR75RJ
	 kveiKLvRkrcrxnobYBUyPotIfTRa7PQ4cvHsvWqYrBCbxS4ZcN63PN5d+sE1/VwaRx
	 9CoHmlTSR8Mbg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WnwQh0GSdz4x04;
	Tue, 20 Aug 2024 13:47:40 +1000 (AEST)
Date: Tue, 20 Aug 2024 13:47:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: David Lechner <dlechner@baylibre.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iio tree
Message-ID: <20240820134739.50c771cb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hiNPIVHz4g2GVkwUzc4Ydt3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hiNPIVHz4g2GVkwUzc4Ydt3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iio tree, today's linux-next build (htmldocs) produced
this warning:

Warning: /sys/bus/iio/devices/iio:deviceX/in_resistance_calibbias is define=
d 2 times:  Documentation/ABI/testing/sysfs-bus-iio-chemical-sgp40:18  Docu=
mentation/ABI/testing/sysfs-bus-iio:541

Introduced by commit

  0f718e10da81 ("iio: ABI: add missing calibbias attributes")

--=20
Cheers,
Stephen Rothwell

--Sig_/hiNPIVHz4g2GVkwUzc4Ydt3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbEEdsACgkQAVBC80lX
0GzGVQf+O0R7ZZbHavp80x/1aDi3exqfsCqELLys0YWlNjJGQyfIr4hJdnpopRMt
wHEz3UYa/xGdDqyEMBU7zZW8eLRb/ANp2rZkv0NyiVm8vo9j0h7tlCrybmQjNwH2
p71xpGmIKhFvw6tZpVBjvhhbvvSLBEg5sHJ8C1ulPn/2O7yI1YmwsAqquvF7zSCL
VbmnaIFVtdQb0dSXdMd/kbuLh38j7o3jbVy7UtE3E2rBtYoIPDzt0pE7Pzdapny1
elCLoMQa9ugFCyu9RMT0F0j6Z7CY9fc+uG/4KycBURnIoBPcI1ZYlJljcC8GSDsw
A8THCDRiJw2TU15Yfu+X33UXAffzSA==
=i0iT
-----END PGP SIGNATURE-----

--Sig_/hiNPIVHz4g2GVkwUzc4Ydt3--

