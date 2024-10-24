Return-Path: <linux-next+bounces-4420-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E2F9AF42B
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 23:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03E7D1C20FE1
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 21:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4E21A7AF1;
	Thu, 24 Oct 2024 21:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="inyDlDyC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8676170A27;
	Thu, 24 Oct 2024 21:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729803843; cv=none; b=Cg6KcStUOzS0OxME38hdgQXBbz04GDLRWzzuYtqNfZaBVJwTQAZusgCNZNMFzemiurZURPuYDXjYQRfpTzAkUCbwQLuNLHd3AMJatDiu3mPfZktQeuuhSDr86oCDpszX4ru3DklyDj26BKMfoglkB4EJ2k3+CbPlo+g2266EuD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729803843; c=relaxed/simple;
	bh=HDHtYEDtisQ21LZ+fEUnKlGpRbwovaWC+4nyixM/7G8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QQWThQPltHXyBDgt+tz23FmKpYU9wvYIFuU/qxCbflU4S5b4gjLJkh+ME4Z1fmO6klIHI0a5hVd0WxmVm7LYgqxYT2uOxcf9dTKW240GTOwoWtrJDtWGv0UHAfyyO7CxNjTgJtyVPkTFzVaBMgWW9LOgPf1FHONV3TQPsmTDeeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=inyDlDyC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729803835;
	bh=HV1Kee7qDTqMNaLLv1hXHw1ElSowCmUMeLFY8SXFJ08=;
	h=Date:From:To:Cc:Subject:From;
	b=inyDlDyCPiu1HigWNV5f7L12B3ObKRtegPwC37NkwNhDTd0iiOMZFaJKQFeOjUpMp
	 ApVBp7jZQAUAkkiu0VG8DHiorkjDAiAljKWCl+lVqDKaQhUl7/Y+pKKHv5vSOa1XsZ
	 ryTH6rNU580n/vkxIZz8vlE6V9PkHkhkwvMoMatO3WPlS/KQ4qP9tdkKkO5zJ4q3yX
	 ZvwaTxePIFDco+VzqO2+4knimbgh8yJ21T1bPbwPp3ojSCo5UJLCTG5iqrKwv8b9C4
	 K2VRyVQ9PZpDVh1OvuVKMWPB7P4/BzyZ4aEHEuJeiBJDhXsllGVChxKJvuF/84sN+t
	 4KShDRikLAw0w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XZJLM1CVDz4x11;
	Fri, 25 Oct 2024 08:03:54 +1100 (AEDT)
Date: Fri, 25 Oct 2024 08:03:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the risc-v tree
Message-ID: <20241025080355.34c62c4a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i/jNZXW.y=0.HKa2zcPsRYl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/i/jNZXW.y=0.HKa2zcPsRYl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  814779461d84 ("KVM: riscv: selftests: Add Smnpm and Ssnpm to get-reg-list=
 test")
  e27f468bcf14 ("RISC-V: KVM: Allow Smnpm and Ssnpm extensions for guests")
  d250050aae4f ("riscv: hwprobe: Export the Supm ISA extension")
  5e9f1ee1c523 ("riscv: selftests: Add a pointer masking test")
  cebce87fb04e ("riscv: Allow ptrace control of the tagged address ABI")
  c4d16116bd11 ("riscv: Add support for the tagged address ABI")
  871aba681a0d ("riscv: Add support for userspace pointer masking")
  1edd6226877b ("riscv: Add CSR definitions for pointer masking")
  12749546293e ("riscv: Add ISA extension parsing for pointer masking")
  8946ad26c0e2 ("dt-bindings: riscv: Add pointer masking ISA extensions")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/i/jNZXW.y=0.HKa2zcPsRYl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcatjsACgkQAVBC80lX
0GzYoQf/TCJvEfH45K6JTdUxq3l9a+BWxMKPJwMtUIGuF7beGx9a72EP6zNrcwGV
2de/JtuQmONhLqsCTEEB+OXXF6Gtrh14h1GX8s73BuNxSVJ4pcilIJ+KU+1zrwD8
5s9a54iUYCmyR/UE9xPCqp1PJ3B42xXLOS5z19FPfHLg3e+W/AdJ6alj9yMImQ1L
Oqn0MTSuJBY3358Lnqh65vvb7GaZ3fyDbGyPTBIUpKcSQQCP9UpZsvVLio0/zMm1
9gWXoP2rCn0sY5YYj0oAeeOyZymOIIk0eu+iEb1IiNI8cJGQnDbf+/y8ZL/cpjFI
C3670BJBAfotag28kh38fzntvNXlng==
=bQrU
-----END PGP SIGNATURE-----

--Sig_/i/jNZXW.y=0.HKa2zcPsRYl--

