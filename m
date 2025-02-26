Return-Path: <linux-next+bounces-5574-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03937A454AE
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 05:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED3441782CD
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 04:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4596115B99E;
	Wed, 26 Feb 2025 04:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A1QezSnW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB6F23C9;
	Wed, 26 Feb 2025 04:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740545370; cv=none; b=r+JV3judIVqb8vCOmEdkk395obiHulThjgvrfS5TRGkpqnxNVTLYVYHGndF2607dcBG7vxoHRFwfG/8bbwvVXSC4vnogxaodhd13B3G1RdEiESZxg6kM8B0HhcOpqvaMZkEEam2j1s7JtTpolvVVR+nMV8uasvIG6BQvBklp3dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740545370; c=relaxed/simple;
	bh=6olGzjnBeWPGeuFhbXKTjNtOhLdMNRERI8gSrfoDzCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A+QcILlnwz2VZJfVoAyCPZ/G3Q3t/zmDriMTPDAjnl5x0W+c/kPuoFRUfsejpm4LLTTKI9BaMNxb8JDqb1KQjNDO8LHwXK2QlwQsAnrk93lD0q3MCuhTktrcUe3TZ0DARzmQxeS2gK7SSD9RfjC18CeiBUZ1DRJsRoqE38jtqvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=A1QezSnW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740545365;
	bh=l+smM60R6iQq9p+ZZTLD7EftOyGRcpR1LyFuCh94ndk=;
	h=Date:From:To:Cc:Subject:From;
	b=A1QezSnWNneAL0ntWqdVfltQPTIBiLvViGHBnz52b2W9l6HoMg6LJpPC5eA/rKzeP
	 FNKT8FK4l7CuXdoMiSpuBRSt+yOheYuR/VAvd17eByNt/ArRpHfyO5P8ASKeS7kRxl
	 IAfHDKv0kUP46j3kwq8CiWfzsOgC8EcouWl69aCaNolW8R6HLhQJtauFdHb3IKKBDk
	 rUakJ0GoI2bJ+ZxmHv03CaMKIhpxgYa7MyZsSUusmE6L7m38XgqDkyePrVIAtiClg3
	 Aycd3fHzxI2yMGjtFIK9CC2FERKdUpcD5rXi1DTy/G9ABIx1AoPZpm3KnRJLF+gZoo
	 mgYajcHxm/+WA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z2hpF1zcQz4wcj;
	Wed, 26 Feb 2025 15:49:25 +1100 (AEDT)
Date: Wed, 26 Feb 2025 15:49:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the cxl tree
Message-ID: <20250226154924.6446eec8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oEwC6fCG6nq7dUTOUjoHS7F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oEwC6fCG6nq7dUTOUjoHS7F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cxl tree, today's linux-next build (htmldocs) produced
this warning:

drivers/cxl/cxlmem.h:439: warning: Function parameter or struct member 'cxl=
fs' not described in 'cxl_dev_state'
drivers/cxl/cxlmem.h:439: warning: Excess struct member 'cxl_features' desc=
ription in 'cxl_dev_state'

Introduced by commit

  7d2bffbd7fb6 ("cxl: Add Get Supported Features command for kernel usage")

--=20
Cheers,
Stephen Rothwell

--Sig_/oEwC6fCG6nq7dUTOUjoHS7F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme+nVQACgkQAVBC80lX
0GwuaAgAg9pEwNAeh/sYN8ASFdt0hZxF5SozzNowgJnIr6nArmWSqloDbpYLfzpt
CjPWAxPR1eMcNzpU75b3c+Iv5DK/Rsv41ILvHf/vEkEEIxDCxWFXmQnQD/m3BXRx
30JJtXoBc/66LjkZ+PVSWAuLHq5ztWJQmSDx9XfE0Qe4CXQ3/cymgRI5y9Yq71Ld
aSEORNJ/xdhfTI9a9Mz07wtmKG2FkuGzOg6gPXLMggyDdoYRArSiOzfO9hyS/AgL
F6SUs3BaF+S/DsQKMFPi9cBjh9Kyx5nRUj5e3j+xRnMBMLx6e5ecyJoUdaKJUsMd
bNxep/EZKMRtcANMjYsyEHqwwdpWRA==
=Y1vz
-----END PGP SIGNATURE-----

--Sig_/oEwC6fCG6nq7dUTOUjoHS7F--

