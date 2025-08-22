Return-Path: <linux-next+bounces-8076-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A567B30C15
	for <lists+linux-next@lfdr.de>; Fri, 22 Aug 2025 04:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03AFEA2851E
	for <lists+linux-next@lfdr.de>; Fri, 22 Aug 2025 02:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE3C223DE7;
	Fri, 22 Aug 2025 02:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="s43dOsKM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A3C222590;
	Fri, 22 Aug 2025 02:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755831358; cv=none; b=fDn/shKzUJ87I0ZuJ/W+hOqQdlHxZvd4R3sXpkrXJm9ArSyt2B0bCoBqfrIta7Hk1f3dSAGpiWSUxAYggSJMWba65OF4vOrL3IRJrckYms6KPS0Gip3lSkAsRlzTgTg2jGMZduDHnJ3Ia4nmJ2nQOE+Pf15o7hpsVlf62T8G2i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755831358; c=relaxed/simple;
	bh=hvgpQkDH0XuJ5k7RjKoml28762mjFyjZ3XvdDtU9DEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TjD07v+cmuEfqZ8YToPUWBAsW0CgPsdnP5MRNHAPyU7sfjbBivxmPb9S/REKukrx9EE56Dpn8c0elrFh0MGK9HMbXSz2qUtjSLjxJfFDLDigeLoVqhEMIo6hkk/FrQMc5hBzVQGdifTlykTRZftCpUCe+8oFmgCF2hAgdor6Wl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=s43dOsKM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755831345;
	bh=i2kSDLNqk87Ar27/QS976iuNHVXu4ctYP0V8CFTWyl0=;
	h=Date:From:To:Cc:Subject:From;
	b=s43dOsKML1bqkEG7f+UeuSPCfprbtUWFqAqjMLPfkzkqiUFNdFTztqQFwL8yVJLDP
	 M0sIoM8Kt2KBg/NoftOZjJf/E4ntdzp8I3ea5o5E5hDr9g7M7IDyFSnrXGZttNgkNF
	 +oRcgrIeFpmF+DlMoT8T6W5uzs5GUzamgeMUj2QoFP83fFdhvz+nFgJk9UtEljZ1tz
	 PDU4R8yiHUPgSQjMg6Jw6N7ISreYZ3sBLDGpV9tosBXUWQxWcrPAWJY3dViXYsUmLi
	 /5hdmS0ZA2/KwUFx5xlyr9G2OOJhU4bp8GqPt2bVwTcBWaXpNDVuzjO2M9JxDfdjRD
	 PyepRhMiOCKKQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c7PvP2Ynmz4w23;
	Fri, 22 Aug 2025 12:55:45 +1000 (AEST)
Date: Fri, 22 Aug 2025 12:55:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bcachefs tree
Message-ID: <20250822125544.722ee8ef@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x=tDU02.7/DBlnFuT2Awd2D";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/x=tDU02.7/DBlnFuT2Awd2D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-unstable tree as a different commit
(but the same patch):

  8e9bd2a6953e ("bcachefs: stop using write_cache_pages")

This is commit

  321888737229 ("bcachefs: stop using write_cache_pages")

in the mm-unstable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/x=tDU02.7/DBlnFuT2Awd2D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmin3DAACgkQAVBC80lX
0GyEfQf/dIFxFMI98vg6PTVv7DtbjZKbZ3iUqYx+V4tDa+MDQhHCjIEiX0CTuMvA
i3ytZ7zolTa2XdyKGs8UOTqO6RF2WI5TsG9lZpkWHSSXEK8d5QKbEow4txAHE6VW
V496sn0tlC0mdQUGRefC1VTLRDfZOSrz8OMxpU4I/o/Sxq1QZ7vevi5ymeRIvRaH
yIzYWxT0B8ZFiqPJZ4c3ITBDLhpzONx3vwfdj85tYLoAXKgdffPZBi1jHrnEpfkK
hsWj0Zgr/+UEhlyPxpyAfIU53IC0zRRYdA32RxXLh23/pqclqB3t9sJQbHu3pg53
3HdnQxGAV+1CrajHK19jaql98cY4NQ==
=IXAE
-----END PGP SIGNATURE-----

--Sig_/x=tDU02.7/DBlnFuT2Awd2D--

