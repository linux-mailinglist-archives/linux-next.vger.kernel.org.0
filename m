Return-Path: <linux-next+bounces-8644-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED349BEF1E2
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 04:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D0653BF7F4
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 02:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A901D6BB;
	Mon, 20 Oct 2025 02:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QLGLIkeD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2F57E0FF;
	Mon, 20 Oct 2025 02:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760928323; cv=none; b=TMg2OG/i3HQzJF21H+FPcEjUJFlGbhE8nF6uOn7Q78DJaVOTAm4B3CjTyo4+lRmzlzxdRbxiuNL182RunGqiDPsoEKi/H6EHuoprHyWrRsjdZpf4M4g+tUxlOigARAT2HiIQmGIzDvbjx8dDLJUoV2yGzlWrY+BzjKb395UH2uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760928323; c=relaxed/simple;
	bh=s8VkByx8xHrckqHyNH60vbCSjBYDsOwme3OBp4Uzpbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tSjP/0UkHtfE1TgoNXTemrKA/htDOWIM6JfAxn6vyjgmGcZ1a6HZGNHkqKzZNTBXOP4N9N+5zDy9j6CUHq52xm9I89lT/UrUFrmemny3U7ByBWG0itdVahtgfsz0gIDd+Hx1NaiaquHEfHSxUgbkwvum7zdd7ojOUeKNeMsqAXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QLGLIkeD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760928318;
	bh=8RARKvph0luG+8QetcLMljgsGxPDDnzOLyFJtyDmky4=;
	h=Date:From:To:Cc:Subject:From;
	b=QLGLIkeDVHNjhFYGTpI9E4Eomxmd3Ht1mDOjHiv1pcQMKFGDrV+O/KG0KsRw/k/fY
	 l/pdenxQQRhHeq0VtcQ8ABJraIBGim4OATkaVbCjEMZn/bEufWxM0GaYtpyYdNoqjX
	 DloB9BZjcPIOlB1YvD7foALd8USiid9li0v5GbkCV6ucPKlNAtEeA4qpf3HIqeLY3A
	 yOSNCjMYg+eel5DY3AhQmaaqPjqgQ5uuSNK8h9YjCOOHhhcvUjWNbL70V+2UG7MZyv
	 MLpG6n2PCpSYVn6lcSe2wshZ6ZnbmIrGsULw0omAKeiesoRi1pTrjVhY1bnU29EqiH
	 7Yvy/xNrFC3Sg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqft62JGdz4wB4;
	Mon, 20 Oct 2025 13:45:18 +1100 (AEDT)
Date: Mon, 20 Oct 2025 13:45:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <bhe@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm-unstable tree
Message-ID: <20251020134517.795a133d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_K1a0xfQKhKBQ+c3.FQeHWo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_K1a0xfQKhKBQ+c3.FQeHWo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/admin-guide/mm/index.rst:24: WARNING: toctree contains refere=
nce to nonexisting document 'admin-guide/mm/swap_numa' [toc.not_readable]

Introduced by commit

  9e1d0b5b7f28 ("mm/swap: do not choose swap device according to numa node")

--=20
Cheers,
Stephen Rothwell

--Sig_/_K1a0xfQKhKBQ+c3.FQeHWo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1oj0ACgkQAVBC80lX
0Gy28gf/Ywa4c2IbumURWjuFyNc40FP57Yi7ltDjRvcVBLRTF0Zgh0QpkaLkjzNq
NtDAs/6rGHOv3IdijXpptJdkggtua3aMTAmN12h5DYUWWRexvUSQkyaS/qm49jNW
2rzMOhCWkO7G3dJ0O4+DDol15kRccJj6UPlOoZBlFtE8D7uRprfvxZ9npPp7vpzG
Rs7YxgIXeqey2fyvIAvBkXxY/M9uw/PstCLzvzSXJNKh4u9ALLLJCXqFqWKk7nTY
cOyrOFo3wRDYZEHswcCtr3VAzE1otFrV+CFaGd3HiqDyMmfTFIiquD8LSxK7FqN9
ABvqxv53qcgbul+UwMgprZR+Tcp6qA==
=hGaP
-----END PGP SIGNATURE-----

--Sig_/_K1a0xfQKhKBQ+c3.FQeHWo--

