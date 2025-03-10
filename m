Return-Path: <linux-next+bounces-5704-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE5FA5A5C4
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 22:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79A767A186C
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 21:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DBB1E0B66;
	Mon, 10 Mar 2025 21:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JUYCEHgZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450C11E0489;
	Mon, 10 Mar 2025 21:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741641085; cv=none; b=Zqwv0vbr2Ijfw64+m0EcNSni5JrEWKr8YiaYf+OMmjYoJlvRR0zzanDksjPrQYrmvCFlu3KifbUCK3+RvCgiZwdreQI+Nwg+RBNGMXRXS73t0UZygU+fZ8LBVf+ann3RdIsH1EpukTOLb7omsUX+t7pisb89UIRMjMjC+5zBXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741641085; c=relaxed/simple;
	bh=k9/6iE/4uHAMJ1SRnkIN9MSQowwIP/yuGeuZ1TUwIxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RH/sj8TDvwQ9a710r2xwTdKwI/R41YJVbHAo83vNLzFKrKovSfxgsDa1Eu2riLX41L9FusBJkHqe5Okuk/7biUGkAkeN818uyyZlMg6kYWRIZlb2lsteBCuPXrRqs16pEPMwt1sAVlHmjC7gnwQaWd4s2jK110ZMJdOFZ4TzxhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JUYCEHgZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741641081;
	bh=L4Iu1BKV6DyKZv07nFgPNgYdqIBFwQ4d5Vaf26bRZhc=;
	h=Date:From:To:Cc:Subject:From;
	b=JUYCEHgZxnH3kUtVYsAzv8E8780hw43HRCTvlTk+fjYNwzAyS7ulOm9dog9czJoq+
	 o+OQqWJMCrYZfhWhduaYYiduKB8NnxC7pYdP+uDTGd7SEjWzwMWfnwfTrmh6MXxiJ8
	 0oPNP8PHe2WoolL6O0de/XSnsQpQ2A7O5M8wLt/PcTQZ0KimmElO0fQ7OusbU5meUA
	 fBfrxqEAxXBo1hQUFt1iGIfn5jqUDofufzmw7Jg0sX7Be39etjZRo8MYzyhKJ+kRVh
	 DvVzd2RjoFEqvYNp8Mlw9fi0u7/nO8xDsn5z/cElwPzq36Po7vgg8saJ2WcH56LsyI
	 AYUThXazvzRoQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBV1j1nqqz4x8p;
	Tue, 11 Mar 2025 08:11:21 +1100 (AEDT)
Date: Tue, 11 Mar 2025 08:11:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tpmdd tree
Message-ID: <20250311081120.499c3326@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b0rQBRxO.aRZ0Zj799BPQpG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/b0rQBRxO.aRZ0Zj799BPQpG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  e2a88fcd249c ("tpm: Lazily flush auth session when getting random data")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/b0rQBRxO.aRZ0Zj799BPQpG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPVXgACgkQAVBC80lX
0Gw8Awf/c39YXJQoyyN7N5HciWVzB498Q/FVZJoVb0OxOYvFLtpbnTeGQKDQ9jTd
Ozp0iMY5bA9i4vZzFqMv9oDVmOqgsI7eH5W6O110ixzGAhDO5wrDJmIZoyFk7Kvi
BRE9eBIMjP9d0b3m1CsM91jMF4SUWfjxY2VRxbPSWdJXIIbLY++mcB3kgykJkL4Z
PyokhH5LnXCKY3YwHXik4rFQqcZ9R3AxR/LCg/s30hV4oMZvNAdhGRaY0NglFa+0
s3zdFmKO6dty3hlVFTLBtd2Wkwhs/EtJ48masJ0zmEhuD2gNlbY+LBOAp3sHuCGx
kDTLo25mt+NlX+8Z6H205JL25LcqzA==
=LQPB
-----END PGP SIGNATURE-----

--Sig_/b0rQBRxO.aRZ0Zj799BPQpG--

