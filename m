Return-Path: <linux-next+bounces-8256-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6079B5281A
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 07:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26FE71B26F57
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 05:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BD01E50E;
	Thu, 11 Sep 2025 05:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HBUIeN8X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFF922578A;
	Thu, 11 Sep 2025 05:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757568053; cv=none; b=Mi219LFeT63SNfrDX2WKq4n3UXsUuX6ECwY50OeqdzRBuU6Um+272VH29fJadHRJ9kajJK4xs6hUBKQtmLSY1ucGhRxCBZqyiWAfB2bt3AUQjmLoDeZ0J2Rw75Wcgm3/uQ1wX9ZVdlOQl9HXc5f9nHfeOj0oD+JRZZu8PvYFTU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757568053; c=relaxed/simple;
	bh=yWfX7xC57l/61NpFwnYUaZMywsajUBJ12hZW+YPsciE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bfBoRiih68HgTeae4woCq7rydEOk8UqjKyne+VbgSWRUFhs5VF1uYE5rgUxZT15xc4JrhIoJl09E9WsJQ4166visE4qAnZSAanKDkYA1nVLvNkjnKjYEYKaGJSLlApf0H/BY9LCRw4onv+BGm3pyPhKArIUxM4EcAOwukaQN5ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HBUIeN8X; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757568046;
	bh=bbbvrQBnnjdHZrMOLZwKJ03XrmZR5bCP+TTNVPQqY2E=;
	h=Date:From:To:Cc:Subject:From;
	b=HBUIeN8X3j1H5kQTADFOtttYcw4HKanmpclOM+wYCeHSI9shM+u06STdchVqLBzFS
	 EsSw/e4rPD62rQtdaAkyI28uDqStq6JUG9+HLas8FgtbntnpG/bw9r4eTurhA0Zt2G
	 dVkwSfEq6Sc4PAT+cMBmgUM1cezO56mxeKUuJW1XuGhqRiubLZ2/DyRcuNxPrqPqfL
	 Kdec3Tk+z2W/u6tr+GYyennNaBGSEQ0nhB7xVcUfDUH67jBWFquIK6vu1i+kfNrJ0H
	 Y28u2IcOr4gd/NI2RcBTUbnxWQnNRGTZ+/X7SSh47FZwbvfO9arRI7x/9Y68OoB939
	 rP8kmI9JJaw+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMm9V057Nz4wC7;
	Thu, 11 Sep 2025 15:20:45 +1000 (AEST)
Date: Thu, 11 Sep 2025 15:20:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the mm-unstable tree
Message-ID: <20250911152044.5cefedb9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BVL6egg.gfD=1m0=n0Fee5h";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BVL6egg.gfD=1m0=n0Fee5h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/mm/swap-table.rst:39: WARNING: duplicate label mm/swap-table:=
swap table, other instance in Documentation/mm/swap-table.rst [autosectionl=
abel.mm/swap-table]
Documentation/mm/swap-table.rst: WARNING: document isn't included in any to=
ctree

Introduced by commit

  0e27c611ceb0 ("docs/mm: add document for swap table")

--=20
Cheers,
Stephen Rothwell

--Sig_/BVL6egg.gfD=1m0=n0Fee5h
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjCXCwACgkQAVBC80lX
0Gw4sAgAj/+S1inX1BwGkJsei4s5VcQ5QIk00FxwHJYQ3MsmfZWHPHJ5BtqggxbO
aRRnYsV1UqnZssHdusQwQUxVLQ5FdPKr9u4ZIZ911csuHc/04JF7P8xlxxDpIWLk
+iqRWs9mfEXJ97VAeqjThDQCFAJMAE7NjEiiO9siyHLpVHHvnSCxK/iUNjhTao78
9ZuRMExYnSS/v7HrP5xWNPDxuvS+CNg9yTBXK3bGv4rv0c/KKhBNDXJSj3Q8oh7r
Sp7BTlCy7b1hGcwKIiZBmFvkOAfU507Fw8j9nUIvbC6Yyf+IegjIEiwNaR40WZaI
xczm3fx4XfD4Rh5Rac/CC+MkAijqLg==
=r0Ta
-----END PGP SIGNATURE-----

--Sig_/BVL6egg.gfD=1m0=n0Fee5h--

