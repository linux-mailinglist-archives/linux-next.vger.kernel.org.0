Return-Path: <linux-next+bounces-5028-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57046A01C3E
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 23:58:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 436E1162339
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 22:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3469C1A8F95;
	Sun,  5 Jan 2025 22:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KbmohTcz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DB9145B2E;
	Sun,  5 Jan 2025 22:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736117915; cv=none; b=VmoJRgdtQqy/iVfRHJxR2QxTMvEJgMEgYkI5MqaAspTon9V9/x6jdVi50Z07MJvoJVgz7U6U3ZgBbGoFbJN/UlniLkuDyiRySSpmmFNwJBpCSR949W+wRf/hRcrPLNxm4PWj/4NlKgc5ErchYFAmLzXz73YGMwSP7iFqHbM9g3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736117915; c=relaxed/simple;
	bh=Pmc61qG8hDZC9WtWZ9U/J+qNK7szBVcsKCq05katOoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lDN+aD1vESNFCiiyYtJL7ShmnIyVg4W+RuAqPSCT+I1632WH2F9uGLT+Jmx65MfdEISvD0wpVzcZ/ky1nEhT6LzSDkRFqpkt97/d9UEx/zeGCHZP5PmXtTWQsJfubMbzpi1Yv/2aQMtDi+Nn0r3LbhPawXaLEHNOtKn1dOflvI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KbmohTcz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736117902;
	bh=3aBjaEfjJsPH7jT1QKB9LH1Zhl5OzwtD3Bji1D7HOP4=;
	h=Date:From:To:Cc:Subject:From;
	b=KbmohTczXmOPbB8RTw4y1El9l0+HD2fvwIkBAldKYTbZzLnyixftH2W3FNFDTac6X
	 hjpsdeD58PWOhDjphgmHypSHuL9I3GuVJ9G+AS+BBWxFbmtzIK2/WXC68cEino2jTq
	 BPpKWmxd/KW9LJEDUTGxNuGcgieBfpQEk/eVqOcOcwScRXmibWAfrX2pCWaZsSaJGX
	 fsxhMY67/caP1OUA7QFtQvun/Q6A1cnhDDr5Okh/sSVSaA0TfuPHD+XzAC1sL/lRvC
	 pM9pC/9HinuARZajzB/R8ax25hs2SAamNwLm2qIFgeSk142aA5vihcs1nDpqKdW3oe
	 3Y/PpJklMcA2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRCQj3f1wz4x4t;
	Mon,  6 Jan 2025 09:58:20 +1100 (AEDT)
Date: Mon, 6 Jan 2025 09:58:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tamir Duberstein <tamird@gmail.com>
Subject: linux-next: manual merge of the jc_docs tree with the mm tree
Message-ID: <20250106095826.140c01cb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KuX8WthF82DR/D6sTDU2axU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KuX8WthF82DR/D6sTDU2axU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  scripts/checkpatch.pl

between commit:

  253f01394dc0 ("checkpatch: check return of `git_commit_info`")

from the mm-nonmm-unstable branch of the mm tree and commit:

  6356f18f09dc ("Align git commit ID abbreviation guidelines and checks")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc scripts/checkpatch.pl
index 744328d21eb8,f7087dda9ac9..000000000000
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@@ -3237,12 -3237,12 +3237,12 @@@ sub process=20
  			my ($cid, $ctitle) =3D git_commit_info($orig_commit, $id,
  							     $title);
 =20
 -			if ($ctitle ne $title || $tag_case || $tag_space ||
 -			    $id_length || $id_case || !$title_has_quotes) {
 +			if (defined($cid) && ($ctitle ne $title || $tag_case || $tag_space || =
$id_length || $id_case || !$title_has_quotes)) {
 +				my $fixed =3D "Fixes: $cid (\"$ctitle\")";
  				if (WARN("BAD_FIXES_TAG",
- 				     "Please use correct Fixes: style 'Fixes: <12 chars of sha1> (\"<=
title line>\")' - ie: '$fixed'\n" . $herecurr) &&
 -				     "Please use correct Fixes: style 'Fixes: <12+ chars of sha1> (\"=
<title line>\")' - ie: 'Fixes: $cid (\"$ctitle\")'\n" . $herecurr) &&
++				     "Please use correct Fixes: style 'Fixes: <12+ chars of sha1> (\"=
<title line>\")' - ie: '$fixed'\n" . $herecurr) &&
  				    $fix) {
 -					$fixed[$fixlinenr] =3D "Fixes: $cid (\"$ctitle\")";
 +					$fixed[$fixlinenr] =3D $fixed;
  				}
  			}
  		}

--Sig_/KuX8WthF82DR/D6sTDU2axU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7DpIACgkQAVBC80lX
0Gzvfgf/QPIpqT5BnEhlyFM1CAAMmes0F/deqJI/QiHcnfiuAwceiuQy8T7JBOKh
lg7tihvdes+eWKucixrkK0RH6jXSTXGbZRAlC3nQw3aJ9j53qEJcVFMT6f8eY4qj
Kji5X4cLaQFB/1RG/fZ7ZQES3ItsThTmIJklVQad/ljk8D/UWkrZQTR/yKzzx/6X
ZZfgyw/QSbc8tmC2ZRhM8BdmhbmaU4iWKfGECoIhmHoUR4/z2a20OFSbbPAhfo1E
GrEPM4d/NeYFInhUlpNFbsFLUPyq9rtoXk4x5O6u9dpWHtzv8HfyJTVSeLBr/cpQ
sv7xE6rgWQjB9RZof97c9i/vavmIng==
=S+j0
-----END PGP SIGNATURE-----

--Sig_/KuX8WthF82DR/D6sTDU2axU--

