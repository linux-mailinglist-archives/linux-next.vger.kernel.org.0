Return-Path: <linux-next+bounces-7222-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C968AE6175
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 11:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52F8B406939
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 09:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82254281372;
	Tue, 24 Jun 2025 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VxDJZA+3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E7527C179;
	Tue, 24 Jun 2025 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758710; cv=none; b=RIm0xoiaIQ1kY5UtSJlw24IzafPtUkHPvoctRYjqpsVe2l3AUC3vlgAuTOlM3Pt9mHM26gcV0hWD5lCC3pOtScUFlonPY0pp/s0KQVrscuZwTKJqNbyp9VYOCD7IbbweKtNs9epSI7qulIMDegnsUBMZ2crEB3Ys6xKVWXVgVJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758710; c=relaxed/simple;
	bh=V6caY+WeVL5rrT2vcH49ZSQhs2y7KlfWXKArD8x44sc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=F3nID5MGQG9lRtfXnmICyRn6HehnSroSwwqToKukB5PKGCqjbcywnZ0J21dMWiiIppOcpWBqA/slcSvJYmmM0gD4+cxEeEFWFdNJQaQ70me/fiOkE1oFlGrrDgppnlo2PP2kOV8hGGrUtgyd7GLFMDNTeTJtfJcrChxPhH0hx2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VxDJZA+3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750758703;
	bh=CXzbPmxpnN2WK8X4zwGzyPSKDkERV47aIX6ni2Jy2sk=;
	h=Date:From:To:Cc:Subject:From;
	b=VxDJZA+3kZ7uSOgYQAfbG+psG36GBRVcsLps3ffqSn0D0t1y4q1nknTFtRyZHbSOt
	 oGI5MvNghlgx6cdhBQuwIW5MMhgSp0mdYhK2Z2w2e85/ex27QkqUtmKMhPbUNYFmSm
	 /VR/+v3fzeSkoZByUHWC4IKgy5LCGBaDHF5n1QH9YWNeOsYKeoD0OQLRbduzcnhbS7
	 5oZ8no5ciaoFeVWoTmfeG6y1U7X5htS7zCVQt0uSDCpc80EYs81GvjbIWO5YgiE1eR
	 tGTfK4940dZ3IKWfWi5/UUF54JR1+W5DenBQ5LVpSvoloXuxuCGbklYum6blj6b6/D
	 j/MnJkiPHtPgA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bRKwb2S4Lz4wbY;
	Tue, 24 Jun 2025 19:51:43 +1000 (AEST)
Date: Tue, 24 Jun 2025 19:51:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Hindborg <a.hindborg@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the rust-timekeeping tree with the
 drm-nova tree
Message-ID: <20250624195142.1050e147@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nVl8cyxu_C0E=cuITrlAQCf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nVl8cyxu_C0E=cuITrlAQCf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust-timekeeping tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

error[E0599]: no method named `as_nanos` found for struct `Delta` in the cu=
rrent scope
  --> drivers/gpu/nova-core/util.rs:45:33
   |
45 |         if start_time.elapsed().as_nanos() > timeout.as_nanos() as i64=
 {
   |                                 ^^^^^^^^ method not found in `Delta`

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0599`.

Caused by commits

  2ed94606a0fe ("rust: time: Rename Delta's methods from as_* to into_*")
  768dfbfc98e2 ("rust: time: Make Instant generic over ClockSource")

interacting with commit

  a03c9bd953c2 ("gpu: nova-core: add helper function to wait on condition")

from the drm-nova tree.

I tried to fix it up, but this lead down a rabbit hole and my rust
skills are poor, so I just dropped the rust-timekeeping tree for today.
A merge resolution would be appreciated.

--=20
Cheers,
Stephen Rothwell

--Sig_/nVl8cyxu_C0E=cuITrlAQCf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhadS4ACgkQAVBC80lX
0Gz6qAgAnGN53FN6d50U7Uko/vUr5+ulVsG549M4a6h6jJtBM0BGcEXZI2p584Q8
0uehYZfj700O708kJqZwK+PQaRWcWE0V2heK7wWhrnIsBnzPEeCu9xdxLDdra+bO
Inh3tugCHvLpJU92L7d73g5ar48HZgFzWZswxunMGz71Y/6IWvztBpGwkf4xv0wN
ENKmKUPewZ6yfNUhi9xB3yNC7ynpC/qZzEa5PD0eVj6P3wDtQyiaI9Lr1QlawYmt
ulBfzeEjRurYn2rWJcs7e2cKvco+mxaD3WkYsBOHfeq0Jg39y4QDaMBgCk7madFc
HVloSS6ZPAPaPl133zIuuBPa0bLTQQ==
=9ZnQ
-----END PGP SIGNATURE-----

--Sig_/nVl8cyxu_C0E=cuITrlAQCf--

