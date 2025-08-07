Return-Path: <linux-next+bounces-7864-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0364B1D028
	for <lists+linux-next@lfdr.de>; Thu,  7 Aug 2025 03:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0443256552E
	for <lists+linux-next@lfdr.de>; Thu,  7 Aug 2025 01:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B5A195FE8;
	Thu,  7 Aug 2025 01:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PkM2EYBL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33D410E9;
	Thu,  7 Aug 2025 01:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754530826; cv=none; b=KzRFAx3lXdyetDquY8+fsDgQFpYZ0MwKJYv9BoBZbOCCsdwVn5rBhMaRoBh9d7mhpQpI4CME7Lr3/rF7zfhwjxjSmyaWh955IsjF10yuC5saU8gTL1REKT6dgF5To31GtoeUzwZv2Rrwt/xg97S3hV7l1b7uxekYWYfKPCyqWsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754530826; c=relaxed/simple;
	bh=Lrpz/rQsmPtlTB0aV7ECFfRkBbimsLZ+UO1/WuDhCuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Lg3QCSHGn/EJKko2xVfdhAYn5G6isb3APwx+nEN8mQ0gGtqeQzR3gMNiLjwuRMRw5hFWtqgqTULysJ+hFgQonQ89x5sRiH+oFn4YKDxN6IajhHh3vLmHeolWr7SbIlqFLMfKpFNnthHRH/CVf8kI+/bcNBpSD7PFcRsAWtMEnLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PkM2EYBL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754530811;
	bh=qf72l415B4gPbQygeTi94z6VL1WKUjCCFAbJieWnsb8=;
	h=Date:From:To:Cc:Subject:From;
	b=PkM2EYBLWB8sMTnFqYoboavENs2EPJyDIBi/fF1s7XFAIJ/RzH3sfxwmy1mgWVscv
	 SBYMibYQNnYa40k0XTZoLlIRoHjCJin2Vl2fDaZEwkQ4LdsiUfb7zwXzWB2cA7bJhr
	 MUDk207jvhb7uNM9YKaKug9bC1mRF7PBm6W8UpJdrjpHghtrYXFpYOYDgDVL1QNl1s
	 IomkTjN6FxxmPwJU9nQqvj+bobdW3R2WDdGHC8Y7czkLOGhhafu5ER5+K+VJtDrqjW
	 KDK/Xnizv4/7SRVC15mTaLHTxsMXT9trmC2B+3owHodstnNaqUrMiZ2jVnBNx9YrtP
	 CzRHujr5zGm9w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4by8x4026wz4x7j;
	Thu,  7 Aug 2025 11:40:07 +1000 (AEST)
Date: Thu, 7 Aug 2025 11:40:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Deepak Gupta
 <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the risc-v tree
Message-ID: <20250807114006.548d5f32@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pQEjjmPyPhctgQqYenlE0do";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pQEjjmPyPhctgQqYenlE0do
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the risc-v tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/arch/riscv/zicfilp.rst:42: WARNING: Literal block ends withou=
t a blank line; unexpected unindent. [docutils]
Documentation/arch/riscv/zicfiss.rst:106: WARNING: Inline emphasis start-st=
ring without end-string. [docutils]
Documentation/arch/riscv/zicfilp.rst:114: WARNING: Unparseable C cross-refe=
rence: 'SIGSEV`'
Invalid C declaration: Expected end of definition. [error at 6]
  SIGSEV`
  ------^
Documentation/arch/riscv/zicfiss.rst:129: WARNING: Unparseable C cross-refe=
rence: 'SIGSEV`'
Invalid C declaration: Expected end of definition. [error at 6]
  SIGSEV`
  ------^

Introduced by commit

  9868b87525d9 ("riscv: Documentation for landing pad / indirect branch tra=
cking")

--=20
Cheers,
Stephen Rothwell

--Sig_/pQEjjmPyPhctgQqYenlE0do
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiUA/YACgkQAVBC80lX
0GymKQf6AxwCBpCkn5OHcybFBHF6AK55Q0+Xr7k2xt1/DFg1TGCYERvVJpMxU51K
w//sG5QknhnFjrRxArC4dmTox5UM6vVcOh+MV9RY/lDG31LEIbeTC8lut7e2e5EN
8zcEkUbZauQVxxu+WcRUkZZXXOJHoTqIWdh3VAcUoREz5t3uX6jB6cxqv9k4G9BI
dtnjSfCPDo5dwrPJkGSGDynp8p5gMViKbYi6a48/oXvMNCUOvWzKzkuJdFvKwS4i
7pBSJC1QL0rrHwMyUdDgsjCiywzJqW+fJdyIN9rGgLFgTASXYC7aOHcm4XShvz3k
jJLxvAXsKuHhqNoS7s5fhwUknnrscg==
=LfG0
-----END PGP SIGNATURE-----

--Sig_/pQEjjmPyPhctgQqYenlE0do--

