Return-Path: <linux-next+bounces-3397-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DBA95C020
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2024 23:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86D3F28473C
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2024 21:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD9D13B787;
	Thu, 22 Aug 2024 21:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Vph5YRI/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080A6171A7;
	Thu, 22 Aug 2024 21:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724361794; cv=none; b=jyYtFkcgGZJtc7m+j87cjntLLqDK7c6yxYczYIXBnc2ZoSm2WtTXHxDqo/Wy9U//huZwx+FPcDdrLWihJLd1kb8Zh2DfjnY94hlGXpy+kGsbRfeEyqg8NRx4BKQdH/Ju61T4TzldgOd5cun3q6inayii1GQNprEdMPaQ2dkj06U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724361794; c=relaxed/simple;
	bh=o4T68hABPyXoAz7WcmkxuyV3FACgeRb6m561lZBh90g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TaHmHPsh+cn5TWnt6rw+N2uuvVHi0QuFFBFP3AtTpzLNS3SnW3E3E/DbwIGvZ7ChbpXS4ehB0h4e/VXUBhK/DwO3mdSL1ZnjOxk4jvhBHVYy6w659su1X3KYHIsybqEm6aLUoHEUewyXuwy7PJxj6U5+1L9OUWZhlgQvIKnqqh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Vph5YRI/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724361783;
	bh=g7aDHAmlf0/qsD9hy7RVSmKhFLYdThdwneLTu8SwEfg=;
	h=Date:From:To:Cc:Subject:From;
	b=Vph5YRI/BywoREOIiQmZfzvVJwymwzy8ZdMACnzeaLu52ss5atpBoSN7U34JvxXn3
	 QJzOHKRTkamolzZuZ7qc+Qi5B2tdq2s0zB9fzGnK54+mDLu1nbMc+TuRfpJYp3PhFD
	 WP9fBrHLQPX66Xg1RCzNUk9NI8EBocUTSu91X8NprpUoHEBhTJLA/yKO40lUxBjyws
	 h8TxRcRqcWNBfLFBTCfu2V/pTRK4CTE4QIMOsYqljnKAuI3N4alTFHMlcITmxrljwj
	 PQgiDcIc/UIpCQQ8JpA8kih7bDi3Y79qGgSrl3T8uWSCJjcoPE4LRZDo9zSMDJ7N+m
	 Tzj8fuphZvrsg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WqblW469zz4wcp;
	Fri, 23 Aug 2024 07:23:03 +1000 (AEST)
Date: Fri, 23 Aug 2024 07:23:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bcachefs tree
Message-ID: <20240823072302.7b471ace@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ULZ1J_fLrEy.qsJOswu=9Uc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ULZ1J_fLrEy.qsJOswu=9Uc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  0c8ad34451a2 ("bcachefs: Refactor bch2_bset_fix_lookup_table")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/ULZ1J_fLrEy.qsJOswu=9Uc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbHrDYACgkQAVBC80lX
0Gy7igf9EUKasiq6eETcLbj6LFCq1QJ+ud7Aruz0x3xzOlrX0mO0NvmfiW2frMvy
0fs2h4Utxxq0ulEmtceqRQgnTXNTUnqLbAWEUg30PCjra9RrPxOxAugNpPZpG4vc
C/g78c2jiE62yn/ypNcFziRa7e+dwxRQEQdmW25WAC5DYQtHHL/EYponmhEbjT/U
Mb668Nd03zIHcJapcg+77mTHesibdUwhClLQPMVFvWNzkh2sR02csdJzGdqDZ7Y5
9DZioAGEk9YDQUi4PYH3yM3jmXW2q6t1r10kuE9B1/Y52Whg3VYeK5VZVQzPfeuc
on7F9ne4pwsnvjrKkbvow/ffOgn9lg==
=3WSE
-----END PGP SIGNATURE-----

--Sig_/ULZ1J_fLrEy.qsJOswu=9Uc--

