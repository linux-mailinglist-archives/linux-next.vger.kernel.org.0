Return-Path: <linux-next+bounces-8892-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E80C3E5E6
	for <lists+linux-next@lfdr.de>; Fri, 07 Nov 2025 04:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C46824E78E8
	for <lists+linux-next@lfdr.de>; Fri,  7 Nov 2025 03:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89458227599;
	Fri,  7 Nov 2025 03:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZG1QFATO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156ED13D891;
	Fri,  7 Nov 2025 03:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762486756; cv=none; b=KvqR/D9yOCxWMz+Tr94P7/7/cutJLsTirO+yc4AnvZfQ0FdYzDjFyUTlON/3uuKF5a3o1rQfZlxVEa0m+0lfeVegc3K2opsLqld1rmFDP1XayWdRiOi8cBoLlodj1sPhgwJ3O2VpkDWxBJ9YyJod+G80P3yTvNsq+/Ejn/coBVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762486756; c=relaxed/simple;
	bh=jSEasZ+YqPqRjMTo8flbc7Mj1pDXMhX5zTTJKl+oLmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dqv4xL8L7AaHtxpKOzplZY645fFX7LX16AjKWLGENrf8Pum+O6Q0IeI+3zFYLlh1IBPe/k76+PFtTCUYyVu3Q/UdspNm9rICPCZTZ3qh7BTYg8RqEJ/oVS/eGB9/7sX1x38apsjWgV/OLIXCZQsYZJPQhD/FuaUUjRXb7WOfVMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZG1QFATO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762486750;
	bh=JzVHEzolMayif19UnFovp3pM12hVksx0RmzuUY6vNWA=;
	h=Date:From:To:Cc:Subject:From;
	b=ZG1QFATOspflQJ3IuHAaUgc8hFkhIccW2JlDocmPH4RiffcUOXo1iiNIwpDUO+qRN
	 ld5u5fw1xBCoOPNUFbGvsyxsGANmzshUp5mNLJNMUjd5HUZnguMcdIq0XSmF3B5x0A
	 QQYWDeqbw3mQ777oqyYuu5STiqYdIeP6f1IePoj92pNFFn9DEs1Kw/cl7B3f0YfwZ7
	 i5LBxtrKSbaAN5Rv8QU9+cYenNZKZ0lKHpfgnZxMtLTEYc4ySInFUz0XlVdunIqbsn
	 4SbGxrwolot4Dq1tnICQoa2d+zdeexTsrjpIswNi6LM388124sjvltwW93bNEO/LFx
	 UYkt3r9pQ5oYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d2lCx4jRtz4xGc;
	Fri, 07 Nov 2025 14:39:09 +1100 (AEDT)
Date: Fri, 7 Nov 2025 14:39:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm-unstable tree
Message-ID: <20251107143908.48e3e29e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7dQt1bKqUJVLCEjHd5BEU/_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7dQt1bKqUJVLCEjHd5BEU/_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build (htmldocs)
produced this warning:

WARNING: include/linux/mm_types.h:302 cannot understand function prototype:=
 'typedef swp_entry_t leaf_entry_t;'

Introduced by commit

  1b8c333c0d1c ("mm-introduce-leaf-entry-type-and-use-to-simplify-leaf-entr=
y-logic-fix")

--=20
Cheers,
Stephen Rothwell

--Sig_/7dQt1bKqUJVLCEjHd5BEU/_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkNadwACgkQAVBC80lX
0GxVugf/ZvFjHFgVZ9Hlw2L0UH61x7wvac3GyJPkzYwT5TRPZdFUwRdX43KbNXZf
xCrFofmLHtoaetm4ZOKv8qt6DEfLAVbxsSKA7eoaSLGuMHY9UjBvsUnASfqE9uOq
cvO2O+Y6uXOOsdvGPfEGbvd6B8KQvldKhTELsyQQ9miIeUWnfahES6Mg2P+9AEef
J26Pb0rlzDeuMPQkIapdrljpODYkAY6Aq2PSfiD433h6QovARTheFRJcKpSk+1Jn
uMYjzZd4qKMvibKTIjEvaiErA0jpFeifcQRGjTz2VsO58kV5+VeL7eM78U+TBwVB
rCrS/+QNIXe3ZzUmIsZR0TPsHa6wNA==
=EJzH
-----END PGP SIGNATURE-----

--Sig_/7dQt1bKqUJVLCEjHd5BEU/_--

