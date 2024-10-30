Return-Path: <linux-next+bounces-4534-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECCF9B5B2E
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 06:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0C881C212E9
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 05:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4315219A28D;
	Wed, 30 Oct 2024 05:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="seExNhOo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FD61991DB;
	Wed, 30 Oct 2024 05:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730265883; cv=none; b=eRB+JLrgheV4ltYLPzZp0bY0s4AaagwMwMmyR6DX5YRJbSlNFJ/Dv9k2PXFcHwjFWyev6QdsPGv205zYBqMoE+irQl5kGrFvItAEpNbLkCmd4nqwuQNB04Y06EI+vZtK2UjrKGLjqz5eK3e4swxwv0bFSBKcqUm5wdZHLtyXsEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730265883; c=relaxed/simple;
	bh=l0ha2wz4P+J9gU6eUGx4MagqVHFWG6WUI9Ik+N5yywQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Muz/u/up1sYEe+Pk1uVGOWiNj1BulxTGrX5bdkBsubWOUt8VutwNx4uR6MZ2TO5iJdfM2R53fG5yrhaAS5RuRUHZBLB2d6sCiAIyysAlvdE3SUCoUyETCyRIk1Mdi/8mm/5OVTOgy4kpLyV3xNC+BqvxXUO+k26eaPc0FRAkFRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=seExNhOo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730265874;
	bh=HLVqONloigeLthsVY0FIEVYSB+uftgQp5RzwgmRkk6E=;
	h=Date:From:To:Cc:Subject:From;
	b=seExNhOo/s8Qm8OpYqH5tj/OuAdqsJuH/E7HrTPm4OCsAVw756/1G4iiknXUaNDt/
	 ZfCPubrS0LCgt7QAJI3fn32HvKI6Ms7PP0PMwWLmHHy8uGJW6TEQqIKyvSpor/JNyp
	 AemDXkrHcb1J1G+69Le+9AdxPEZ7QBLDkT4uMDBHeEXfGTUzuFe/bFmpGoBizaX93c
	 4gjYfOogzCF0nWvaFLJQIWG+3UvPE4pNIsDfUypoH0vUcZTTj2nlucP6yq4VV89Om6
	 k/rWgZml9k+yxqOTlbCaI0M3PWhOWZR3WbsVS1OUTPTNGXxUBf2C3gXtvqBs7M6l5B
	 NQqbnrKJJZCjQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XdbCk0kB5z4x8f;
	Wed, 30 Oct 2024 16:24:34 +1100 (AEDT)
Date: Wed, 30 Oct 2024 16:24:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20241030162435.05425f60@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fvCud+5xSHDGHaNZxwbuAf0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fvCud+5xSHDGHaNZxwbuAf0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build
(htmldocs) produced this warning:

Documentation/filesystems/api-summary:14: include/linux/fs.h:3504: WARNING:=
 Bullet list ends without a blank line; unexpected unindent.

Introduced by commit

  0e152beb5aa1 ("libfs: Create the helper function generic_ci_validate_stri=
ct_name()")

--=20
Cheers,
Stephen Rothwell

--Sig_/fvCud+5xSHDGHaNZxwbuAf0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmchwxMACgkQAVBC80lX
0Gz6Zwf/V27ImU8oIMQyyDbG4dG5kkeIRWlfLrf0IVlt9//T0c8wRN3gYaDUh8xN
cRJCLO8cj280xOa9KFaSXl8vJymZbnmG6T3Z/uBjgEhPQYniDUbb8FIop8kMO3vk
pESojtX792Fq6Zct9rTFCapuB2oCpFG6eRxiNEdCHB2j+ljT2bzdHvCouFFK2t6b
6HHst7YNqCliL3FZ+GSuLoby4rKCoL/e2nE8Goi/9LJU3z10ytNZjCuF6dmV8PO7
9rm9SrblBwLtVbyFcujiEpTceJfTDTFh+PxSnJq3ZU+ft3LK5be0lmQ9YVZf3pMx
06yn4EgDOHOPzOZvbrNnKYp5DFbFXw==
=cgru
-----END PGP SIGNATURE-----

--Sig_/fvCud+5xSHDGHaNZxwbuAf0--

