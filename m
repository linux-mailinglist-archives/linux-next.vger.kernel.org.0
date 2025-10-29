Return-Path: <linux-next+bounces-8755-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D1597C1DCBD
	for <lists+linux-next@lfdr.de>; Thu, 30 Oct 2025 00:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C16A54E2C2A
	for <lists+linux-next@lfdr.de>; Wed, 29 Oct 2025 23:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C038F21B192;
	Wed, 29 Oct 2025 23:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BtOeITD8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C20637A3DA;
	Wed, 29 Oct 2025 23:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761781788; cv=none; b=b/E+RKwZbt1l1JPIBMRYmfmt5BmanWVhhyX9PdmG2zaYKSyhElWC+F8uRCrf3LWdCfhYuzF0+8W3zuklMhi2f5wKw1F3p24WG5cRmgaoa/VFaPxUKyTfkMS8xAQdLDa3qpUHvVV3zTf62a1tx66r1P9lvZapyY7Z7kNJAiPTG90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761781788; c=relaxed/simple;
	bh=ZqTdvt1N9eD4bfApC9wcyuYvCWM1f8MZDRnTpqZJtHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qIr5qFF5M9c7MdNfYNwPJX07nQ8pNsY8hsw5Sv2cVbygHzSnROJP5A/RpdwH9w0z2/JujuDg4s00KnZFPLq7lhGG7HExvoBT7021256KxxInZ79LcPsrTWX8PSsb/FDnkKYN7nszWOvc/u7LSm67c9jGs0UITJNu7XFsuDEe4cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BtOeITD8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761781775;
	bh=B9HW6ZgbXpDoH+ctEvtQ+GY/7oMLiHekUBbkRdwq928=;
	h=Date:From:To:Cc:Subject:From;
	b=BtOeITD8i1/evtsFeeVU5yAj+ED8wv7ICYzKHArTkJB9CgxoW9P4hWd/f7CfxhcZ1
	 l5Xo/xNIfcuQGEg9kRtUPPnCkZTlyqMjhA/UGP2/mfupZmYKzo+0cqDBA3GvD/793g
	 OqGPlw4PkD3laZ3avr37b2nH5INN/er9SG2VUDlXK95jmkR1mOuXgNDCNjlqaNy94y
	 7zFm1GsVcuMvqUFXL4n3u+HiShZe91CZlK3vkg0harysWEkS9awMKJrziGc1224H5W
	 MweRAH1nRML3Yj++gVCVj9y8l8qROT9a8Xu/fVCpeh4fEPPCXR0wjr3UW4bLf/z/CU
	 IwfQku8QPQMEg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cxkVl0fvJz4wM9;
	Thu, 30 Oct 2025 10:49:35 +1100 (AEDT)
Date: Thu, 30 Oct 2025 10:49:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-brauner-fixes tree
Message-ID: <20251030104934.4d52c7a7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P1HDyGj36InMA/jyxKNIuFC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P1HDyGj36InMA/jyxKNIuFC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotfixes tree as a different commit
(but the same patch):

  60a7b9983b80 ("fs/proc: fix uaf in proc_readdir_de()")

This is commit

  e48de8eb75bc ("fs/proc: fix uaf in proc_readdir_de()")

in the mm-hotfixes-unstable branch of the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/P1HDyGj36InMA/jyxKNIuFC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkCqA4ACgkQAVBC80lX
0GzvlAgAjIaMKzz/+FZ/tQXVPm/eBi+BxWS6sFuhnRvXYOJCYkbgjQe98KkMtP2D
umj+RmlCbhWAnxqlJkMXvOe69IT4lIWfrWYx+GlLZVDjL7wDZi3cFLrnthCthgik
7CIWaowXLxS61W0td9OK2rYpLDN+a9erisn814OllF2n1TIZ7RE9QHrRM25JiwXV
JkX5dejOqEXKbp4yi6xgmgBcNUpcVgCw91Ua9rjwz4P8/+Wf77tsoQOmpY53tRSu
hIkMiOsbwgv6zsgLch26KxmDznUhI67u7ldIJ3vOHBYBAOKYeGojyNP8/qTTDFz5
pcpscXAAkUe1gGLBWhDuphfGDBsVEQ==
=vrfW
-----END PGP SIGNATURE-----

--Sig_/P1HDyGj36InMA/jyxKNIuFC--

