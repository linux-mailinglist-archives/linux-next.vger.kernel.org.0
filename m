Return-Path: <linux-next+bounces-3361-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBCC957BF8
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 05:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 272771F226EC
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 03:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A0E4501E;
	Tue, 20 Aug 2024 03:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="a7KB7wgK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4122E634;
	Tue, 20 Aug 2024 03:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724125443; cv=none; b=mw+TCIPStKCLnsxZ8hK+8izolPAvdcGlQLTsvCZ/b+3+hmmfNRKt6rlZoCkGjDKTbCol3ta+edacqI7f7AlFGgv4VUQxUMmkAoL8E8audJem+Sl6xSUJb0vJDznFwT2vGkWGvE337Y++lLF1EzOwuDDLl8HakSTOnaghFtHZIx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724125443; c=relaxed/simple;
	bh=bX70gTcou+4R98xJ2Jin+VZVAqjyNeUIGBK2D/BWAso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cQG6E88h8NLB5J2GCdN7KIz1+khzN8ze3zGv7t3PKpGwEX7lyta33f99Z2AP7Psl3IXHR+df7SOC7D+Y22xMPn9aHIAaqtqoBuZcAmGl+GNCK8gQl2MG9Sq7xtgUmpoI55Toat017n062lQfGyz0FE9s18P50o65tRo8R6DnbXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=a7KB7wgK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724125437;
	bh=Q87pj78yQeYExoXr/H6wFYhMvlf6D47a1BXi7IpUE/4=;
	h=Date:From:To:Cc:Subject:From;
	b=a7KB7wgKF8Q4Bcb59FpDmi5UZ93qjmJSewdUpRnep2ZYTqHkGVZlKi63knPmLZxE+
	 UyOcIxBiUQ+bMZuz08f1c6G3G5iQhyM5OWcnQSlIQIWBuk9K6nR2bO3e4Ot+CxNe9l
	 KuSWDnA/D/wYtCyNFIiRB1qklky6/udC2nSVTaP5zsPRRWUYJmdgH8bIMSgMKmJJ+T
	 c7Mxm80BiAEziZFQK+sltdw0iIIDLQGoNMmRURqioLpHYql9PgoplPx/bxaZCwlbFx
	 MdAMtQcL57ZaRPji5Nd4HetM2rleEtWPW+CCxwYiNrz9940lFdgPsEV2JS0L8HT4bX
	 XFoR+41WnFp9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WnwLN0x60z4wcF;
	Tue, 20 Aug 2024 13:43:55 +1000 (AEST)
Date: Tue, 20 Aug 2024 13:43:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Jithu Joseph <jithu.joseph@intel.com>, Kuppuswamy Sathyanarayanan
 <sathyanarayanan.kuppuswamy@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drivers-x86 tree
Message-ID: <20240820134354.2aec355d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bYQ6iLeq2T6U=vjvAbTmm.m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bYQ6iLeq2T6U=vjvAbTmm.m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drivers-x86 tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/arch/x86/ifs:2: /home/sfr/next/next/drivers/platform/x86/inte=
l/ifs/ifs.h:131: WARNING: Title underline too short.

Structural Based Functional Test at Field (SBAF):
------------------------------------------------

Introduced by commit

  0a3e4e94d137 ("platform/x86/intel/ifs: Add SBAF test image loading suppor=
t")

--=20
Cheers,
Stephen Rothwell

--Sig_/bYQ6iLeq2T6U=vjvAbTmm.m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbEEPoACgkQAVBC80lX
0Gy0TQgAkzyRvBJHvmOWnCSL0mhWa05J4va+uPlElKg+K27EzXRvfGAquI8eGKjJ
/jU76W+4ysDqanh3ZPgfNs6sGkxOu0DcuIVL/xvrZSaEyI73ZJ5PjVRLmHYYWnW4
cAP8a7N2RSLHuZJPqwDdcsLuUFY50Yf6uElAarTRCdvVH5sAx7TgcByuPzzNKo3B
LiR+1JPXRzXXtAEqiSdorWfSOUlsahVUlkG44HsHBjAv+KAM2RqrivenR8dD0SX2
wcnxHDJt/mJ6ua9/W7fzJbuS1y/NHyznQgl+sk/uoN4+6jDbur9kS5afQ4N4x/mE
lwz24eyogMv7xAhbQA2GW5BSWFN+bw==
=ZtWH
-----END PGP SIGNATURE-----

--Sig_/bYQ6iLeq2T6U=vjvAbTmm.m--

