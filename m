Return-Path: <linux-next+bounces-6203-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AC8A853CB
	for <lists+linux-next@lfdr.de>; Fri, 11 Apr 2025 08:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 929DC18872FF
	for <lists+linux-next@lfdr.de>; Fri, 11 Apr 2025 05:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3BE1F03F4;
	Fri, 11 Apr 2025 05:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dCbs3wd9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A50645;
	Fri, 11 Apr 2025 05:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744351078; cv=none; b=lML9pWrs2c5H8vrH6I1YYaizxbiKZreOGbLvb1Jr31lRXuPQjnaBeMFPqWU0EjDZ/NdEggXnXTtV/eQXRK+eVoGBljq+d7gDNMTt6e7f55NZ0cOV1SCBEoBuqp7hrFhFIzYXjBc2VdJk8g+ob6tp16oz8apRPDeEIAZi8sPMHF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744351078; c=relaxed/simple;
	bh=YPD/YojZ1CL2rVuj6iDVV+N3kNal4B64jOrHgS76RAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Hnko/cJRbUVU8hixpxfIXO7PF4bXqKvuS5k+X6zPoHKAISC8RvrtBKYGIBp+WPINkTRicTY4FkBg3HllbSkeDfqJPEz0KVpKy2XTBhyf/7qW5IpQlWDNEAFTdbXYnmkDP42mxrvkrYcKIhy5tqnqUSLpz1uip1yMKz362O8Ectw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dCbs3wd9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744351072;
	bh=M/Vy4k6oE6Q5+4FihTIeboLuCjQyfxOAFYcMS8WMduA=;
	h=Date:From:To:Cc:Subject:From;
	b=dCbs3wd9vgl3LjBY5EAtXxCqW+QIBbnnwzEQ1tqrIINS+OdVj+bYSOI33xHmIqTrb
	 ib4wduoNbQ2K90LaY9bxr8g5rb75hpgeo/q281J0CIBMcjPqeZg2HZVVzWCNbQ2HoB
	 qBWb7jh6HrltBdBROxhZWf5NXqLB/lqClivJInDZKCBe+87GWOiKbpV0EhR0cEtp3C
	 LyCPbuHoPXORKlMRv+J5F+h7sAgeTmZYVINOY9bkEITcBsVdSfEf9GNiB7EVknkRH/
	 to7OvzdYedWjvKl+w3UfjhF688r/Vd242nKuj+WKR2cODreMB4zWCjkIbIC6cIJjbl
	 WTI1n+oI1pTtw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZYmDw1r83z4wbc;
	Fri, 11 Apr 2025 15:57:52 +1000 (AEST)
Date: Fri, 11 Apr 2025 15:57:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bcachefs tree
Message-ID: <20250411155751.03bda841@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HwGW.pqezsKdq3qy7zo3OPQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HwGW.pqezsKdq3qy7zo3OPQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  7dbcd51dd047 ("bcachefs: Fix UAF in bchfs_read()")
  ff89dfe4d59e ("bcachefs: Use cpu_to_le16 for dirent lengths")
  6c14329d3da1 ("bcachefs: Fix type for parameter in journal_advance_devs_t=
o_next_bucket")
  d589fb60c015 ("bcachefs: Fix escape sequence in prt_printf")

These are commits

  34b47e3d73a2 ("bcachefs: Fix UAF in bchfs_read()")
  4a22a7332341 ("bcachefs: Use cpu_to_le16 for dirent lengths")
  afc5444e4d86 ("bcachefs: Fix type for parameter in journal_advance_devs_t=
o_next_bucket")
  f5cd27ec7146 ("bcachefs: Fix escape sequence in prt_printf")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/HwGW.pqezsKdq3qy7zo3OPQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf4r18ACgkQAVBC80lX
0Gy1EQf9FnY/Qud1cyJRWpvZzlgy3gO5hLY612UiUuDtznNbNGkuQLILmboadwTX
a9qqqhTtobjpI71DYqNI0T+0P8A/sOB7xLzQPVVk1Kq8Isx1ggoCHQAIgjY9HPpj
n6JU9LGsfl9S3Ye3fA+t0IrEh7rS+khqew16F2xxuPSucx/ClqAuIN5jrlv7gYBF
zeDPZGJArWl/kwrRGrO18pIS/72yMyqy9e975LMy3snzLY6Fg81npFwjTHnpP/BP
fE1CH9hWfjtyZ3tTRFj2+TEJwLF/qKFpujZDRso0w5TQFgM7UC82yA1JRb3l0ehf
Vra9Hog6Z81Ew1URvkgSdAed2Nrgrg==
=qadj
-----END PGP SIGNATURE-----

--Sig_/HwGW.pqezsKdq3qy7zo3OPQ--

