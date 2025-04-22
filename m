Return-Path: <linux-next+bounces-6307-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F62A95DF0
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 08:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C74A1899223
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 06:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188431F4CBB;
	Tue, 22 Apr 2025 06:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RXZXDkJC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87A6224AF7;
	Tue, 22 Apr 2025 06:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745302510; cv=none; b=U5UDW/fJGffPWmyFSb3mXFGdiqJA9dNvcrG/A1gW+tg4V2GbzI2yJ3+Dnx/I3BZsaFgQgSQdoCC+Ag/WNRVJKsZvhYLeg/YVktqhNXqkoX2mKt1oOxRHhUezSEpfyoIizP2oDkJSQXmmNcMjuskjhiMsUi0CKAmlj+UNt1kZEZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745302510; c=relaxed/simple;
	bh=3FqMuZ8H4o8gXtTMpAKFMMSwC0UYu/eXoUqpQ0bTHko=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hv/K2NGal6o3EvtFYBtrwtrfXDuwwOwl47DRplqedXCEikrNoPdTP+hZgNUkJDcS7xtGnWbQYEMM007kkCJoMqx8hWRMOofqZP/btXhH6pTHiBX7ILxkuHYBU43yu1v7/2RbNcvPFmLEJ2NBgGAlABP1NFw+J80QPcekSJd9lQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RXZXDkJC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745302502;
	bh=QVMRFF0HnMuDauG9BiETyBoIinlRhjQP+PxMeCLIYbI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RXZXDkJCnkxwhFREEgoM2mg/PU1Pi/fAuGIKjAwNXwuPu3L4atBbJuZV7OdQtYhyz
	 2o44gNrYrEmG5fBVXq+ccO2Dd8SpMgK/1TQzJWoYMh26K21q4M5En/fR50S3PKsDDV
	 QMxwH5Z+3duIJSyh9OLAR7nuqEnturc22mciADKXO7npoPuT/SkN03snfvI/NXrnLL
	 xFHPGplB83pQQv6oh6zuxFXU9puKO32S/1GHHQ0KrJkuUdBbhBaD1FpHQ3N6mlZ4Tf
	 NTlMYGG9Parf1oW4gT6qv9Ex+BD341XrM5Pn7F06NebIqf4Pjghlk2ULQlUYPA8OEv
	 rQKe+6TLG+5Qw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhX5f24ycz4wcj;
	Tue, 22 Apr 2025 16:15:02 +1000 (AEST)
Date: Tue, 22 Apr 2025 16:15:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the powerpc-fixes
 tree
Message-ID: <20250422161501.306c2712@canb.auug.org.au>
In-Reply-To: <157256be-d77d-427e-8feb-77d1373b0c00@linux.ibm.com>
References: <20250422114720.480cea29@canb.auug.org.au>
	<157256be-d77d-427e-8feb-77d1373b0c00@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+i4FXKqrriw4fU2=CB0IMrR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+i4FXKqrriw4fU2=CB0IMrR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Madhavan,

On Tue, 22 Apr 2025 11:20:38 +0530 Madhavan Srinivasan <maddy@linux.ibm.com=
> wrote:
>
> I cant recreate this in both my x86_64 cross build and ppc64 build with d=
ash.
> I tried both ppc64_defconfig and pseries_le_defconfig compilation.
>=20
> x86_64 dash version : dash-0.5.12-3.fc40.x86_64
> powerpc dash version : dash-0.5.12-4.fc41.ppc64le
>=20
> Can you share the dash version=20

I am running Debian Testing on ppc64el and the dash version is
0.5.12-12.

Try this:

$ make -p 2>/dev/null | grep -w SHELL
SHELL =3D /bin/sh
$ ls -l /bin/sh
lrwxrwxrwx 1 root root 4 Feb  5 00:14 /bin/sh -> dash
$ dash -c '[ $(ld -v --no-warn-rwx-segments &>/dev/null; echo $?) -eq 0 ]'
dash: 1: [: 0: unexpected operator
$ dash -c 'x=3D$(ld -v --no-warn-rwx-segments &>/dev/null; echo $?); echo "=
$x"'
0
GNU ld (GNU Binutils for Debian) 2.44

i.e. the $( ... ) returns 2 lines of output because the "ld ..." part is
backgrounded by the '&'.

--=20
Cheers,
Stephen Rothwell

--Sig_/+i4FXKqrriw4fU2=CB0IMrR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHM+UACgkQAVBC80lX
0Gz/IQf/SN+x+1J7VFJkonKWzmhQA5zThWUQzzAs+Cm+Xn83+RnwmmInYBhzYJK8
vywIDDEUsGgyreJJyhb9PP8Je6g2vMi1pXCGkaXv5ZbttJUL2QIvVKCkgrVExrvN
YUPJe/JmG7s+Oao97lFoqI5bEgI1ITfGO4MnyNmr5QQjgt4O49UQCNwzepTDtfco
1dXANjEFpcPEz2YvrzZW/7XUWY+WvnfRXN0Gy6iRW4JuUhPGKAWIi1yhH2C9W0sa
+IAa7W5rWVO8yyBXXvGtCoRjIEuRZRTZ/r32v+lLqAfcAw2ppBJxRAbLLFXxWr3p
m1wcbdFi5Is799Ju2kXaDo9V2XOuPQ==
=xhpS
-----END PGP SIGNATURE-----

--Sig_/+i4FXKqrriw4fU2=CB0IMrR--

