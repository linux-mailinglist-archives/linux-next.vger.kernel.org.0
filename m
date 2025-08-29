Return-Path: <linux-next+bounces-8140-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AF2B3B101
	for <lists+linux-next@lfdr.de>; Fri, 29 Aug 2025 04:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52F621C25518
	for <lists+linux-next@lfdr.de>; Fri, 29 Aug 2025 02:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A5081E32BE;
	Fri, 29 Aug 2025 02:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p0qwMLOH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDC21BC5C;
	Fri, 29 Aug 2025 02:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756434237; cv=none; b=jQUGQhRDOMjeiRfIjvdZv0LyqKNUTw8cwXrNSl7dc1O2oLR7bndSccuY7cOeaLFrzkmJvTnj5k44qQUUCjJe7ppwYRjLjFhh/vmAPswLgoXgbS9H0IVR6V4iWLp3XtUy270Dvy9aZ9MxqwCcRSY1lenRLPLBjgC6ADrRPTXiHRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756434237; c=relaxed/simple;
	bh=jw7OBQb3BSABPFoYHfJTXnTPfnWrNySCKlEvH+92O20=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cQ306tK9j5SxQnoixj/b/buf6/ymiylx6qrhijiTaVLifX8qw7ax7ZXWMsshlYewlS3yaPYXfk2iQqQZYDKM4Q9LH4Sfkx8RjJb9NivDhdTVmecxjb22oVc/MKlnwXC1a7WGCrNp2W9CX94I3e4K5v4ZCg8yissdKbJtAqjt83A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=p0qwMLOH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756434225;
	bh=UHRA4gGEGjTWcsmrfjcfYxxL2gmHi/bqcEFXtmpy7Kc=;
	h=Date:From:To:Cc:Subject:From;
	b=p0qwMLOHs6YcbWy7GVJu/S40VlvyXA2q+nIZrB7rk1fTIINyYPUW71fiZ8xb9UKfq
	 UradhSBBhwCIQ66WBkxR7fQkusmpaChy5x25SDUDAiybqRePgOz+EEWoSToxFoIu8j
	 Sjb6rw/slXBoKYHeXlgg6b8s6W1JfrJgH2iv3p1G1f8YlW6GzZ+bPhyFGtRfKXV5wX
	 oa8ULY0TH6eypszEv/Qn5WO+dbvadQ+Wi8nHS+wqgsGVYR6IAzUIERPc7yGnoEu5P1
	 0x49D3VMWsQ7V3oXKKvOgASq3hKwmpvonA9C53tTa7XD6Ykfe2ALPWlgdB9K7UqJqT
	 kr2BnkagCWgww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cChsD6Rjzz4wfl;
	Fri, 29 Aug 2025 12:23:44 +1000 (AEST)
Date: Fri, 29 Aug 2025 12:23:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20250829122343.4b31642f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dbmPQnu+I=eNxOB/okb+t/_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dbmPQnu+I=eNxOB/okb+t/_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/tests/drm_exec_test.c: In function 'test_prepare_array':
drivers/gpu/drm/tests/drm_exec_test.c:171:1: error: the frame size of 2136 =
bytes is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
  171 | }
      | ^
cc1: all warnings being treated as errors

Possibly caused by commit

  e7fa80e2932c ("drm_gem: add mutex to drm_gem_object.gpuva")

I have used the drm-misc tree from next-20250828 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/dbmPQnu+I=eNxOB/okb+t/_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmixDy8ACgkQAVBC80lX
0GzsnQf/aMPMRMWvoXVvkr/0OOseZGxrEsTbLfDhThTKjMWEWKrq3PVFUnVyzWzL
iqanDcSr+7NHIRP+S1bKH/alnMdSdtYpwYUARwfEJUVvTpWmFkjX8FM3A52r6ahs
uQhPHzZN6AgnYHv1H6aKg3ZthwAMSt2OO+pRZRVDkbJNZNbDctSloJ+s3oUNAXNC
7eSO+MP35OaKkz6VklGCoQfRhJXonAZeQoCdECi+U7ybdYk6kgbOP0XXprWCmTot
/U2bBYKlTli++XtKiTvjnEG9vAJGde7+thjHEDFKYuWUwaaOHDGlevWgaZMOm6f1
WzSFbbBA1nWC2h9HOiQyssb6GjeYxA==
=RbTf
-----END PGP SIGNATURE-----

--Sig_/dbmPQnu+I=eNxOB/okb+t/_--

