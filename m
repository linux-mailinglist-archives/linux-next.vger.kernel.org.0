Return-Path: <linux-next+bounces-7118-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 550F3AD2CBB
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 06:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EA6016AF12
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 04:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5AF1F8691;
	Tue, 10 Jun 2025 04:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D4C4nhJg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B920378F4A;
	Tue, 10 Jun 2025 04:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749530033; cv=none; b=qlvUU8ObEUH2udQLf+On1jhyMfef09BXPSB2kIeVXiPBNUuV/b/PsArkONv/QjV/nZUt8JjE9u8xyJrZYUsKkT4wokajKE+/elLdEHgr2tKtbi7n+1SFVbUmuU65kZpYO3eb0lIO2eYQtsP4lVR7+i+ZN7Ieup+ly8ON0No/9V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749530033; c=relaxed/simple;
	bh=bZr4TnF3zRGWaT6TAonRw1uL89q2sdIocSzKO4AJrN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AnsJJr2B3rgj3+aJ1O+4D/+kBz6rv8P7fJR4GDQvhfwHjCt8fyUjVDsWm0acaPxYyKriKulNFWJ6g8FW2T8661NTOUrSax7krgcG+ioHQJlWiZeqFhAUk4+64haNe0sx5Ovue9wZdfBMciLCDI2M3NfI3BPrFyds1UifWgECHQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D4C4nhJg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749530027;
	bh=fE5J6TVemewHbihBVd9UeGMAflFHwscV4R+73R1R+EA=;
	h=Date:From:To:Cc:Subject:From;
	b=D4C4nhJgN3E3Qq3c6gv3OZTdhXy3ShRqoNyENhtUSQaAkjVgtX9F+f4ISPBYELuoQ
	 xOQJsCaTddhKqDnH1s+we+0wLhaDMPDLa41M9BOhcEUyXWAhswftNvyefGrfSmtcVD
	 R7kOLtEauQ3jQeDbLjGL4YAGvxZ5yLzSNf1dfS+uejJpRKiM1jHnGGUDxPQyLMMBA3
	 avj/Zjk9mEgHew9VyXMCfA42p3uewD1MkDY2dx0ShuZX6uQLCCnktULNqMTuPkA2BE
	 TTDg+DN0sNgy3PJy90EPKIDDUOAWltriiuwfEi0KaNgDvxwlo2BNrgaSRTOfEvGZik
	 2c6YGabkexsSg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bGbXC2RZvz4wnw;
	Tue, 10 Jun 2025 14:33:47 +1000 (AEST)
Date: Tue, 10 Jun 2025 14:33:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm-unstable tree
Message-ID: <20250610143346.588f9acd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p8JH4gnRfRt9QHJhnNwY/pJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/p8JH4gnRfRt9QHJhnNwY/pJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build (hmldocs)
failed like this:

mm/shmem.c:1551: warning: Excess function parameter 'wbc' description in 's=
hmem_writeout'

Caused by commit

  7140d202bf58 ("mm: stop passing a writeback_control structure to shmem_wr=
iteout")

--=20
Cheers,
Stephen Rothwell

--Sig_/p8JH4gnRfRt9QHJhnNwY/pJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhHtaoACgkQAVBC80lX
0GzWaQf7BNlmN05t4779m1o843AKo0OYY5ObDn+bsy+aN+VhXQT6hrhOXpcvzTOP
dWH7FJX84tWnFwjoZ+feSaPjX9n8rlV5NWU5TljiG9dtOj1OZlOQjwzXjBq7qY+q
1yfUHaONvSwXxWYtAoRDM756lwSzl0ttjFTeM6Vbmgi8RhFLmUzn9vqxwBEkifgh
W9IfFvQK+wYZEz3K2ercxE+kMTZ894Un/2dNYS2yuH019k+UkV8zDpiKtcS+aqyK
xodJHVeROEM8ATRzxf8MWiJhVEfqu0N4ZPdXxrzzqkQWmvvze20W/+neTJXD89gP
X3sqmKGbYHClIFazSAZU/xmDn0PU6A==
=u+Zl
-----END PGP SIGNATURE-----

--Sig_/p8JH4gnRfRt9QHJhnNwY/pJ--

