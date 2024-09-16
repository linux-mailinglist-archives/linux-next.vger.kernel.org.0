Return-Path: <linux-next+bounces-3872-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF033979CDB
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 10:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 884741F23A53
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 08:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB94142633;
	Mon, 16 Sep 2024 08:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DU51Qo0I"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC175588E;
	Mon, 16 Sep 2024 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726475790; cv=none; b=B9qKZ3EJVVpSj3/K5iBdGxMAIoKGsAqIEdsnIFfzT15wSsFxfEzfPZNO3BJsBX3rFUHEAeq31MC2F4azcayUJQ1Fv1iP123X/wcgFYA6929oTSYwQxrDbvcwUuFBM4bQ+Gv+/JjzVdDcyDCj2XVw/8ChZMgYhZHF2k+De7V/t4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726475790; c=relaxed/simple;
	bh=dl5Fjj5SFUWZt2QM0H3Nh3saRM/h63zGlLJDJwAn0h8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=miVFG/wMA6sc12jQ7jrnqvjJR0C1cLGUPYhJTRC9lVrbyFWeS6wSnRjaCzDRlMq6LCaM1eh7jHNt5EyL6vq23mJrdYwSAAhntxU1RUaRQYmDo87AeNIkKQuxTuqIvHV+bbrgyoEzJIbXbVX0aR6hlOoOB8sIIt3UJ09rvrC1XME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DU51Qo0I; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726475784;
	bh=XuFgNe2g1nvtMH+06OaD4Ia//5rxVu0l9LKcP3JP4h0=;
	h=Date:From:To:Cc:Subject:From;
	b=DU51Qo0IdrrinUkyijQVyg+1vj/jB73Bo0VftLVyXrkxR+oKPLtHs6xfAAdEM18gM
	 KIaq02VYoYIBDY2Qt5wp8j0RA6qvgvgclz24anvgG3BCB+J3Ppp1Q15dByG/V/rXI7
	 RhDq7zKbcve6H2qxRp3EhhPwej7LnUl2bTfKlD0sa2J2gfxU3mOM2gRoUk7z5fNDGY
	 pmqb6XMsbqLUdb/IuJ8mnaYM9lSECXu9ZnBV8osOZEbh0yV3tC3ug7UiFNptJxpuTl
	 DPqeKxPPTnILcEwOron2WczTtHf7tZNsH3IMU6m5rVIGibuCETVFz/68JNX/rHTv9g
	 fN5pWA7hQCn7A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X6dYN43wMz4x7D;
	Mon, 16 Sep 2024 18:36:23 +1000 (AEST)
Date: Mon, 16 Sep 2024 18:36:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Keith Busch <kbusch@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the block tree
Message-ID: <20240916183622.105641d8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/66BZWF7FIUsx5Zn_.ckJFj5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/66BZWF7FIUsx5Zn_.ckJFj5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (htmldocs)
produced these warnings:

block/blk-integrity.c:69: warning: Function parameter or struct member 'rq'=
 not described in 'blk_rq_map_integrity_sg'
block/blk-integrity.c:69: warning: Excess function parameter 'q' descriptio=
n in 'blk_rq_map_integrity_sg'
block/blk-integrity.c:69: warning: Excess function parameter 'bio' descript=
ion in 'blk_rq_map_integrity_sg'

Introduced by commit

  76c313f658d2 ("blk-integrity: improved sg segment mapping")

--=20
Cheers,
Stephen Rothwell

--Sig_/66BZWF7FIUsx5Zn_.ckJFj5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbn7gYACgkQAVBC80lX
0Gx76Qf9FE2/jvjTKruk0/8kcfvJ+GurBhFwXBLGVZ4AnhyRC09RzUCQthEB3Z7g
vw4x9qNGeP53ASNAwanUWQwYxKJvJK33naQHvVrAnjshanxqG2x/wldskoeB5Ph7
OaG56z4I+r9dj+p0HHYswjN0AaoqbHbOfE5RltPLC30IKc41JNAvsYhRnS+o+gMX
GjEsaYIjxA5QJ/MfCi5g+Np4DC9Owsr5oywlWS7wKL4+k9HZu/BolRQ4V/WoCv6j
nE+4YWS9ihKWPXd5LK5LcMlSjp2XEo1LEY30TQqR+U1BCuuwqIUxwnlzomCGWrk0
6JSpLtGtQp1EZc4JbTWdNW3OMfDkPQ==
=ZPub
-----END PGP SIGNATURE-----

--Sig_/66BZWF7FIUsx5Zn_.ckJFj5--

