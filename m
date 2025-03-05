Return-Path: <linux-next+bounces-5649-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C59A4FA8A
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 10:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F7663A8DF6
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 09:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BAC1DDA0C;
	Wed,  5 Mar 2025 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gOdJUsPP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEFA1FCCE8;
	Wed,  5 Mar 2025 09:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741167974; cv=none; b=pCl0Nuhh+1kBJ35M+NHilQMnpEEHbYrMsc1+RjGyQ/Af68NnTDOAfD26eYY9a9RaltVZ0k5OuBCjlxCr67YvKqGg0re+/2cFPDCJbx3OtfoaeSywOFJYzcfwza1Y4qRs2UuyCpx6uh3zsBrkeDUOz4jyd+m6GmBty6xiyEHYmbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741167974; c=relaxed/simple;
	bh=Kbh54lUmjGIQEV9Z+S046yWHQF6mX5mCkffxwogPYLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lzo3Q/kLzQI+6cSDyMfV5IpU2qsp7zqizifgS8e8NskeJYnHmS6qDP4kh9RDOPbrs4yZcsm6Jl36fQw2Iaxtg8rntOocidHfx0j4wb6xgNbOy/jQq1+oPk7Fr0PTYYPpaeQIM/EnkBozqXhocNfKeP9jsR/NGQLPMCREsZG5GdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gOdJUsPP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741167970;
	bh=0Gu1V4/nJxO2iA8JXqIJ5mOf1MVk4F+sy+iz/DXJbxY=;
	h=Date:From:To:Cc:Subject:From;
	b=gOdJUsPP1k4kHTHRjNR/R6ovuXI8p4RNms5/SB0H8KVcBfrDee1Rca90hRfn1jcBc
	 vxa353VK9s5rjK3spClxLuq3k5KVoIt7uCGem3qjOp+9S1A9tLSMhkkympBTwJHT0D
	 ljNjPQt/tS76RGRMqysLBXH3+GZsZdEd3vOzjEkbdhSjKVvhNEr41FXm1WL06hxIJV
	 YZowLCYxGpYzbpuhfJOem2Ax6fz7e9PWzGPyivpxkZwC8zm2cYO+/isXeG7PrFSCxi
	 mzU5VlPyEHexmMTKGPhLjAoUwvi2OOfZGkQrb0n3PpNlwUoGOpJtaNfwwlus1A2XD0
	 VuQxG/Qj+fmbw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z773Q4Vhzz4wgp;
	Wed,  5 Mar 2025 20:46:10 +1100 (AEDT)
Date: Wed, 5 Mar 2025 20:46:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of Linus' tree
Message-ID: <20250305204609.5e64768e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jjg3g/lzvcleZ9axxS/mtzj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jjg3g/lzvcleZ9axxS/mtzj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging Linus' tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/pipe_fs_i.h:118: warning: Function parameter or struct member=
 'head_tail' not described in 'pipe_inode_info'

Introduced by commit

  3d252160b818 ("fs/pipe: Read pipe->{head,tail} atomically outside pipe->m=
utex")

--=20
Cheers,
Stephen Rothwell

--Sig_/jjg3g/lzvcleZ9axxS/mtzj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfIHWEACgkQAVBC80lX
0Gy+mAf/Sx863aHt2WG2LV71U10QgzZ7PLG5zyJxcnhjryR8Z6Rk7qsdZsgKfwLh
Rp6x63Wywk8DOgWh5ZzY/VmFdx8nIOuNp89hBXGDculcCE7N/VRdUEmMusNRGcCr
1BzqMhFPUUYUXyYyeU03UgYW23zWJFRNeIJi7qFVFwTH6JN6KWEuDk2a7eoEivcg
ap2kAXUE6Zzcuar/o7d5roPe+ilr18crSg74/F9yMHxpcKDoYfUK1+DzRGLZripi
A5YrOHQA6RyIDjDNdFpCQ7TD+JVB+Gk/T3m2bg9D1rYfr+FrubYp3RgVMLEeUA1S
BCOxvmqKyjXRncbyMH4onBn5v8hb5Q==
=0X+q
-----END PGP SIGNATURE-----

--Sig_/jjg3g/lzvcleZ9axxS/mtzj--

