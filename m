Return-Path: <linux-next+bounces-5209-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B15AAA11694
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 02:28:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B8DB188B7B7
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 01:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4036F2F2;
	Wed, 15 Jan 2025 01:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Czijx20B"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7218493;
	Wed, 15 Jan 2025 01:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736904439; cv=none; b=Na5Sd8id1YSMWxq/64uwRH0OgoOXiGv0y0kFNvW076B+8FCZTScHX8ziuVBHWIdgEd+6C6qfwGRrwrcLdnSk2L5F1rcO5vYOttROmAsU9DTqiV2ATNm7T5zxl4CMvMQ0eDW2u18wS7pZ7eJ+q91ruKL1hllSEhDQ1A+SjIB3GeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736904439; c=relaxed/simple;
	bh=Fluazswed19xZmgVXErWPtFbKk+3wW//Z0RCKh7ozzE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=F/pFOmWlay2MRSCGSLY5q+oRO+PDbpHODmcstzBaGbhsxrw+Ia18DasPN8iNIHNpZVDWY4zDU1Sfecq5BSvrMuTQrkipzZ2+mW4sB7yYhaRkxSXPlQCm/HQRT/j3Z3T6fIkVr0A5YQWWeivFL8GyegrCX0asUPKpZTn7QQpTqWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Czijx20B; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736904427;
	bh=U39WSjwUC+/jLiCV8H+r0MXes2Kfwjg5yxtXyp8N3xU=;
	h=Date:From:To:Cc:Subject:From;
	b=Czijx20BrdWpf0HuYjMXvZi6WBATkOHvECYbVR0HSOhjDjP4q6WibDvcUcaISbt8s
	 fk27e8XEmEJjd1xOIqgE/tH6srbdS34LQX1+sQS0FWXaGqz56TnoEqFD8bYCAtUWh4
	 X1FmMPM6jWmYb5V6wJ5Ke9eamZuYNQki0lK2R7SDrPefgCHuMb+hUvEj3N7c/aF0gR
	 4lefiUvONv9ZE7t4GG32AWXGpyrLrIpV7qkxSLPuRALOmwSd5uYVQ1521jt7SX+z4W
	 6wm+swDCUqRy50dlZGYIuqhNWkCyuJlFO6K6hGmn9AqzteZUacl/NlmiDk9QD38wDh
	 vcW6dTnW8n9Vw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXpJB49Jmz4wcl;
	Wed, 15 Jan 2025 12:27:06 +1100 (AEDT)
Date: Wed, 15 Jan 2025 12:27:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the cpufreq-arm tree
Message-ID: <20250115122713.21a5721f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Urm2tdNf6VCd3+SdHJfwfP_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Urm2tdNf6VCd3+SdHJfwfP_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the pm tree as a different commit (but
the same patch):

  819ea9cd7de8 ("cpufreq: Move endif to the end of Kconfig file")

This is commit

  7e265fc04690 ("cpufreq: Move endif to the end of Kconfig file")

in the pm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Urm2tdNf6VCd3+SdHJfwfP_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeHDvEACgkQAVBC80lX
0GzN+wf8Cx37kyLepn3Im7E9wtV8QnCXj13Xy+Y/yNgkHx1FH+uE+gwsQ26/yzsh
JXGvM5jRWDRkSZU+sGftftl33gnD08+tbYbrVQIbEA6WJqQNT0HiGK0n8cPV+6m5
x+T8e6wu7s2yYHPG0WseZpCzUw3BgaV+/i2OwhZuBXJxv7MEPTHrL0tXRyLO+3ed
+LRG6nRXWr7DJx3dydbg1m1Jd/x3/2VEs+24XCcC3EKQiWyIGAOZA3gb4xVQZi4B
FXbenABcKr+JdYSt7Pgt6oe3BtgubCmqR8ccHY9DVfasch61BiOYYImcJWzkp8Lq
QnJy01QH56AmJRE/YGcfj9pcQ+dmZw==
=i9Bw
-----END PGP SIGNATURE-----

--Sig_/Urm2tdNf6VCd3+SdHJfwfP_--

