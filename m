Return-Path: <linux-next+bounces-3067-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D04934753
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 07:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 694E41C2165C
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 05:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6E12746F;
	Thu, 18 Jul 2024 05:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="j5YpFonX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1CF63A;
	Thu, 18 Jul 2024 05:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721278908; cv=none; b=Ip/rzzLk3blNWswndtLv8OBdvPLswWDZV8BLm2eOuVGRJQMD1u4hkOPaYY1rKFLjhTS8epFVnQV6SF5++fgzM3TVC6fRd9fsUYhFveHvMnvuy+aoB5EaGidOMA0ihJvJguk1yxRNoG3jLf9MnghHIcmygby2T92Eau6UTLDwbZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721278908; c=relaxed/simple;
	bh=3IsrN2GMyCmTrWqAnVDpFkzVI8+nI8HtjMYumLKLcQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R+C7ZJ6jtEkJVEE8d/B1V2trRDCVgeg6cP3Mj3JF1qyTjTzV/OXVZkxbuiwHCfy1MG7xRNQL932KCtiduaNyS8nzC/pn/szXsqhrLzwQWGH30rrNFsytBoOBrWfYEucCeoZOHe+x3i2BSe7DCHOXN3yZSa+iCWAKcqn2hHQ/atU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=j5YpFonX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721278902;
	bh=RpX8psbBjt1eyBCMYFZzGdaQiaV9JlBmfVMFvmm7VQY=;
	h=Date:From:To:Cc:Subject:From;
	b=j5YpFonXxiH1SYslgcimizZ6E21zz3JIfXe14l5z07CXOTMd0eqeSVRpyhPkOct5w
	 HPRnB9Xq9dRnMCL12g31TSb1nHpadtJEqQmsNeD/GvWgtlYA4Y2nHdkP37tvhs8c0M
	 myFnEkjxh6LdUxVuC2Go4Q+JxKx9/LUfXPG/aqxSIFSw0PcgICC23/EaZb4+NxZa/+
	 U3R1ADp+Lvf01bzuj6Kumwv59wsz4rmBP9N5Zj95nTf7iprC0IllxJfBlvGS1NDFmT
	 ylUQAVLou0pli690+uD7sPwDIhpZQk8ctkP+zglLDczH1zUSxs6KejPqhQPDqXYY7j
	 hpCQn4agp9DcA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WPgdK4f4tz4w2N;
	Thu, 18 Jul 2024 15:01:41 +1000 (AEST)
Date: Thu, 18 Jul 2024 15:01:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>, Greg KH <greg@kroah.com>, Arnd
 Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vhost tree
Message-ID: <20240718150141.49349347@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YMOnmi+ULyPuQ2TvjPaOczY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YMOnmi+ULyPuQ2TvjPaOczY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the char-misc tree as a different commit
(but the same patch):

  69eced9eb49a ("virtio: add missing MODULE_DESCRIPTION() macro")

This is commit

  89067019d7db ("virtio: add missing MODULE_DESCRIPTION() macro")

in the char-misc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/YMOnmi+ULyPuQ2TvjPaOczY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaYobUACgkQAVBC80lX
0GzAzwf/TFk92u+7DCPuE1r6jLtxQq8euXFRfUYErjJzKUESpkZr/aad3TqYJlk9
hFAJjcvnaHQPZDXi9rn0YIdHImJWhtV2Api3xKny5AsWzKxeTSYHGdzwJBSwhyAa
ssUiBLbKYFxGKeeCn7ihHIPiksK7ptuJDJVomDgyNyn4gKiDhLTanQvAIEcnTjNV
VXOTrzt8HZMHviw8vZOFzn2GSZYFtxWLNY/AsiPkO1TxEvcFBPwdk6+Adcl0a+My
GekORMwI9XidxjSdSje1ioEmvYw5sLqayr6RvxqNb3IxswgOSFKGSxiHKn4AxGdx
b8Kt9ExpLRfToC5D9ZCHLBIhQ3mkaA==
=VC2X
-----END PGP SIGNATURE-----

--Sig_/YMOnmi+ULyPuQ2TvjPaOczY--

