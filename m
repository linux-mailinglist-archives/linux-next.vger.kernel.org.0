Return-Path: <linux-next+bounces-6862-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5D9ABE76F
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 00:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 701D33B7F8A
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 22:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8F21CD1E1;
	Tue, 20 May 2025 22:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iLX0Vwqf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899C3185920;
	Tue, 20 May 2025 22:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747781258; cv=none; b=dM8S8BZUKR9Vtr21j/JFuF7sWk4xFMDDKjExO6imjbutuujZRVMvGlwumAbWlfaPQ/jbpAXNioEB5m/w0Ca1LTg9Tf8IPj9lfcz226rd1CnU749+cj5EWE2VeVde/IAceYU8iOmgDRL7ZCK8UxneMidGrv8TfFqhvxIi5i8aicI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747781258; c=relaxed/simple;
	bh=DPXZqMy2KLIaT+Lm4bgnn1avVejvL5Nygwc8+uOEzKI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kKY/E9BLIm0Y+y6O4ZXgj/K1iUjVdPcpU8oJcF+46TwBfmXEhqtctFpp+YyZJrdzS/qXf3k/5x6oME+JJwoYM5G7QQyXGXTYqjfVT/3EwEG6NCcZ3DvOL/yUB4RXyziEyHKomq2bNhbySS/qTUnLSxdsF83Pa41Asiz0OUaK9dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iLX0Vwqf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747781250;
	bh=DPXZqMy2KLIaT+Lm4bgnn1avVejvL5Nygwc8+uOEzKI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iLX0Vwqf/19y/lFvMiD32+4V77YlaCVzk4K/NAgMcW4F2mVpsSv9KqIbiY1CK4oMS
	 2VpcssUFaD6rDtKI9ENI01lVnPRjj0bu14Fo8O9I35I8w6zwfGI8nebpRne23/JOC5
	 DjFTAjQ2NwRxaI11fAGiBM0KKugthiiJAI6cUTHSmrT0N1Z6QYa442b5LRn1gzot91
	 HnhdBG9kwKzw58lO4l+hAYqd0WOcInHicZ/4HzgZ1a+3VUbfxxk3kSPTpPwUZgFw41
	 FVp8LSJY1Id7Qqs3xk/DK6F8qfgqK0yGLByRKBMlDJkNrBgty1AHOWKKtOzRWm509b
	 OZaDgN84X3DGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b28nt4cjDz4x8R;
	Wed, 21 May 2025 08:47:30 +1000 (AEST)
Date: Wed, 21 May 2025 08:47:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: error trying to fetch the clockevents tree
Message-ID: <20250521084729.002e670f@canb.auug.org.au>
In-Reply-To: <3f2c15b3-1daa-4386-a6a1-1d05c33d58d8@linaro.org>
References: <20250429082047.4af75695@canb.auug.org.au>
	<db7fce1c-c051-41d9-9cf1-ef015b0f7fb4@linaro.org>
	<ba3ff719-ce60-4c0f-a215-fa332b614b82@linaro.org>
	<20250515221042.7471ffc9@canb.auug.org.au>
	<3f2c15b3-1daa-4386-a6a1-1d05c33d58d8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dNZD0veG+6QeFmtW_R1_FyO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dNZD0veG+6QeFmtW_R1_FyO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 20 May 2025 19:23:28 +0200 Daniel Lezcano <daniel.lezcano@linaro.or=
g> wrote:
>=20
> I migrated the repo to kernel.org:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano/linux.git#=
imers/drivers/next
>=20
> Is it possible to update?

Done. (I assume "imers" needs a leading "t").

--=20
Cheers,
Stephen Rothwell

--Sig_/dNZD0veG+6QeFmtW_R1_FyO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtBoEACgkQAVBC80lX
0GxZJQf/e7CM6PDsAjX6oMYIy8ORlneXeRH0IwV+oTyk82NVOs+0b0l2adhuKL50
slnhPe+kagtnw3It/eegIwsABnrcawdurOrbUhsVF45i4MLTyRuvzfi6nRLLWunB
4FIgECch7BN0yvVZmiYjydNdExk1bYDA50Z6bZAUnd0211vbmHQnnj6D58KvNxgZ
oMShopRJNvalAxJrX3YP+22ybqs4E4AI+Mna0p6cYr6zuCCegUqGP3/ki5LvrMLz
z4pdmGDhzluWe41/6+e/3ofSvmQDXEJ0sWQIKaChAwF8hRhXJdPVNIhsKnKUqt5L
TBupyMPUmpYWLGAoDpKxAgJhB84CEQ==
=vdwR
-----END PGP SIGNATURE-----

--Sig_/dNZD0veG+6QeFmtW_R1_FyO--

