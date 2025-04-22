Return-Path: <linux-next+bounces-6300-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA479A95A47
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 02:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B2621893329
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 00:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66F63B19A;
	Tue, 22 Apr 2025 00:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MNKPjlcq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E0B139D;
	Tue, 22 Apr 2025 00:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745283414; cv=none; b=jxsj+Pe8ngOJflF1WoXJOQo4qnwNTs3opvbDgyPhxScXsrVx/hc5iBKoBIL8MCWRde/EH5LaIGUFQpxP7aXoulYXNba5mDrHga72D1n9yv1p2fNYj9cBm7Szc3Hxg12IrGOI2uQAnWLLiJGu8DSiK3ZxECJapTG54wq7b0tnTPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745283414; c=relaxed/simple;
	bh=S3mf0RFz9V7H/5S0ZmW1Rh7y1QErnMcQsYOH753LQy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hBh0mo5fkGmF7MezqknL2vfIxAiNnIs/CZoOLOh91ZC+vC0goMlizOGKf8GZ9T3zQpoGsjeaOTP8NDtZLeZy1EE/zgRXfp9MxB1h5V6USd5kdYFlroScpJV0O8z/EPvHNqYqxyEa7xL5mjRRxNB2brWhH2aEHcQdByV6KcVH1ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MNKPjlcq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745283405;
	bh=65pu8We0eAbCRS9DywM8pyLcAUUHlKKs5Kpgo2mBeqw=;
	h=Date:From:To:Cc:Subject:From;
	b=MNKPjlcqtXGr52/qH9PzblFWYJWCgVWC8xSfVCr50etzf5sY/HGTDD10MajWqpNXf
	 1dOeFmKL9za2zp8zImmJ2P81ZeY/O6f0/T86OQqWdlt70VEbEenmyKeP6KQ4Ymzl1J
	 gz/+3bw3Ar9njcwYMZ3vAUuDBFG2cnPrPfN7T0vD4re1DYvpIBLT/RGW2I+qrCWv5O
	 0QPSvLDGpyVoWHQgDNi4k+7YNov3YYCvDkXuhLUKwAQWUHfqhXyHSHqVCKk5x+SrV7
	 mSSFvN2jSX9aY0P7VLIiy6+Vz+nNOUA6i/p+jnFpXELjJqBPuriuvG1I0mUkfLU4Wr
	 raZF1ZShaLT+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhP2P0x12z4wcy;
	Tue, 22 Apr 2025 10:56:45 +1000 (AEST)
Date: Tue, 22 Apr 2025 10:56:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bcachefs tree
Message-ID: <20250422105644.012200f1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wrxm7ic1GN90r9pq2uEIx00";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wrxm7ic1GN90r9pq2uEIx00
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bcachefs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: modpost: "bch2_fs_async_obj_debugfs_init" [fs/bcachefs/bcachefs.ko] =
undefined!
ERROR: modpost: "bch2_fs_async_obj_init" [fs/bcachefs/bcachefs.ko] undefine=
d!
ERROR: modpost: "bch2_fs_async_obj_exit" [fs/bcachefs/bcachefs.ko] undefine=
d!

Caused by commit

  a15d40ac986b ("bcachefs: Async object debugging")

I have used the bcachefs tree from next-20250417 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/wrxm7ic1GN90r9pq2uEIx00
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgG6UwACgkQAVBC80lX
0Gw+2Af+O+4DThml37bYFUcocKizLleTgxxiqIch6zgnD1MfLHBtvEbod4JQHFl8
ec2TAWy6UzVFSt9exG/5ejoGtu2InAxD/L56/l0Sz+OAq6VQi5uVP7XyOqZWa/D0
vXz1DxCB8Q0QV+PmV/qQEuC90Pw+SlPQ/VRIfGKmFwt7TopDOHZ1sR6Cqvmd8oC9
TDe/kZ2DwtLwEk5opkFJyw+NlDS7i3i34RfZfcvM8QKP+ltfPpan2Skj+mHh2oP9
y+lBQhHWpt2zR3zzM4n74xUeiCzwdPtw2/hQIMBHjnzkb4wlfKRGbJt8anYYCx8S
EDnEBD1s7gpjjcTMYTvzKle8DxbUoA==
=msgQ
-----END PGP SIGNATURE-----

--Sig_/wrxm7ic1GN90r9pq2uEIx00--

