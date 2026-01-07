Return-Path: <linux-next+bounces-9574-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEC5CFC0DF
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 06:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93AB2302F2C3
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 05:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2891FF61E;
	Wed,  7 Jan 2026 05:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rJNqGxiA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C80A1F94A;
	Wed,  7 Jan 2026 05:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767763257; cv=none; b=pZ62qbDpYVhzCeNlubdILx2Swd0qaWuWSqoixW/JUVWNIzQdHlPTcSoVHffqwq6cyiEwzZhVIlIMmVSuVEbEYSn14QO9tHougpHyp3ixMYnO71cDoeEoP/iTDST7rvHCtqGMACNb7i6yOO3NGv10megggqKrhEcDcBmRa9S+TeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767763257; c=relaxed/simple;
	bh=gOFs6l+TsIq2I3c7kJEixOZWXjPlxSV9XXAJ7q+TtUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d0m+xbJeINBz7aYRXhW7hTuyyhZA/54ZFKHBUu4ZI/htHByPHfrs0NTNveySFbjsjn0IY8FtxbCat6iXKqoz1T/BS3d6ka+ejplWrF71gZaZzg99c1J70i/nadScYNOHtFbViGS6ImnLzCJFkST2t2DbSxiRx+SzPNHg/HsURD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rJNqGxiA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767763253;
	bh=aZOTXchLS7FC9degvgqUmmm9EDFNRJdyyB9hkp0xiBE=;
	h=Date:From:To:Cc:Subject:From;
	b=rJNqGxiA99Fy5khJOVrhlN+oFBXEyvQbA1oUgqzeBzOk+32ubd2UcGkqfxi5HbeKT
	 g0JO5lJQ98mBVMITotbfddWXPYPLIYhlhYWd62UJR95TzwHuMftHgAHnV5Pw5iqnpp
	 gR1eUPs4at2rVQdpjN6f1D5cbiryB66JBD4hLMaYXHigEbtWBmeqvHB0vNtWELym3S
	 nfidaQ9N+ATxdCWx/7KmmbZwcp7NE+hq06LCbNv7KaxYK0kXBked01r6eDsQ9lvuMX
	 qgNqe3wzxDX7fSJm+UOXWB5fdD5vfIgUqD8AAxpBi4J9bnGEIHSyVhz2uOozowQOc4
	 u7Zecuxq2/dbg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dmGb86f2lz4w26;
	Wed, 07 Jan 2026 16:20:52 +1100 (AEDT)
Date: Wed, 7 Jan 2026 16:20:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the mm-nonmm-unstable
 tree
Message-ID: <20260107162052.4273d389@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uOCu7=EVwhwWioBRld.U8bq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uOCu7=EVwhwWioBRld.U8bq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-nonmm-unstable tree, today's linux-next build
(htmldocs) produced these warnings:

Documentation/admin-guide/mm/kho.rst:10: WARNING: undefined label: 'kho-con=
cepts' [ref.ref]
Documentation/admin-guide/mm/kho.rst:31: WARNING: undefined label: 'kho-fin=
alization-phase' [ref.ref]

Introduced by commit

  ab37f60bc0eb ("kho: docs: combine concepts and FDT documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/uOCu7=EVwhwWioBRld.U8bq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmld7TQACgkQAVBC80lX
0GxPrgf8CkMpaAmlKz07hg2umke4AvOVvxR9b+LykOw3IrJ0hAIfjwGZKWCmykd/
rmVNDsXIE47CqM/TliSFS3Uwv/It9aZuYm/wS3NBqdlj9eVIWavcFxCSR5cQNwnG
FIMq+k5d5fSzQyoWIA/zBFdDoMN8fX3BkpvqXnvaSzEaJZ4/kQ9Q+I0bO0arNUfc
Ruy6N0MZT0x7QU8dzU4RVXFpn3fjPXlIw3Yykr8n5iV7IxF1yFdIURIi0G3clUoo
EWW6n68tjPhgNd6IDeg9XLteeDLswAAlP7ysN+nBlz2gEweNNsb1YJksi0ihMMSq
uWZMayjMDoShAa85DSH84yaxVofOiA==
=kJ0W
-----END PGP SIGNATURE-----

--Sig_/uOCu7=EVwhwWioBRld.U8bq--

