Return-Path: <linux-next+bounces-5523-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6357A3EC2C
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 06:17:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B86F16FA47
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2025 05:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E3135979;
	Fri, 21 Feb 2025 05:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ihQVANR9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1917134A8;
	Fri, 21 Feb 2025 05:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740115053; cv=none; b=C3wysjAi9QM3kJdFo3bUdr+I6nG3g+ZPcKnH6aKny9KIANihikWped3eWUOabi/VXeGhnjQInY28hgJ2XdqeXf/EQ+X7mVgXcfJAYuy256HaNTIyJpytvqiMYI86xfoIVwP9fU3kjj+8ClSrK+1kcQN4rkwjZDcmmh3/Pd7M4Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740115053; c=relaxed/simple;
	bh=FFmzy9TzEpigUqEjQ1qGHNYHJZt0OBeeA9fSLVavG6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=itOB8/LyPjIaequktOs1mgFqm+XM1g3dmK+4Lroh1Q2je7cspyLQdzoVH0P4HnoHSs8OfWp8J2NYDhNLDLdpXGlO3bWp2KheOcaB0HMeSrmPsDd/Apv8tLoEDUMVDE+C5rAKeF0SO5dB7mwLfizkgNIY1NuaUZA0fssnIXbeF9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ihQVANR9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740115049;
	bh=vn/k/ncSG7d8tGIrZRz2C7CmwNZKNmORTaKfV/mfO84=;
	h=Date:From:To:Cc:Subject:From;
	b=ihQVANR9+pBzqZZa0dwvCGXDsdRu5usTlej5EZjK9qC2UuAknHDDe+Wb568oRYb6v
	 n2F/mCdrZMeyslh5u1k0xK8IUJH3gT+vlWl0hgxk7M2cOFlWvDm7nYtFn6j0eTD+io
	 K53/RT3wJDD31BsHYA2m7MxoB+avJg07B8OZvJ2Fj4qApeIYNdRrXXcg7FGsMwVOkk
	 yMP++/IqcKMVkcER8fGa2Oca295Od/qp4rrnvwWBMjYPiPqgF5z8JBWFhP8WJW6bTp
	 iGzMYWjmLMmsM5mpSGDQriwOCit+ixtPmzKnuaQRCaYS0wNC+gbQwIK0rHvJA+ZzUk
	 EXmiyWc6oysoQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yzdfw6bRnz4wyw;
	Fri, 21 Feb 2025 16:17:28 +1100 (AEDT)
Date: Fri, 21 Feb 2025 16:17:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Joshua Ashton <joshua@froggi.es>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the bcachefs tree
Message-ID: <20250221161728.32739f85@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f7b+zjv+outtkMDPNRhmGkw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/f7b+zjv+outtkMDPNRhmGkw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bcachefs tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/filesystems/bcachefs/casefolding.rst: WARNING: document isn't=
 included in any toctree

Introduced by commit

  bc5cc09246c5 ("bcachefs: bcachefs_metadata_version_casefolding")

--=20
Cheers,
Stephen Rothwell

--Sig_/f7b+zjv+outtkMDPNRhmGkw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme4DGgACgkQAVBC80lX
0Gzz1Qf9FUDstEMBDBhAim5FkrH+fKsNM1KOKaZsru0cCm6JGrSs2hmCc07UvTuk
sCc5g7gjoqSQHBwxJ7cnmarU3Spn6GP61Pa1RRc7ow34heU1XdxXNx9VGQ/E6unz
YGXaJbOJx54RHDw7bVe8iv8ka4pFu1u1bSFOO9k5/TX97N1qR+dHC1uZ686x6Opg
FkB26mlC5Tvz5mR28qekYx9Gy2eo8nJiwScwMm4UPDlu4Rh+6kG/LnWO7DcUhlg/
N7Spmgq0hLaGKbTqu9wK7064gK0LU+v504EFJcZUGQ92qFtqI4/dIo/ZFN8e3F2G
Uxh3BoJkN5uMYaQdb8eDt6I++euhIA==
=4XQo
-----END PGP SIGNATURE-----

--Sig_/f7b+zjv+outtkMDPNRhmGkw--

