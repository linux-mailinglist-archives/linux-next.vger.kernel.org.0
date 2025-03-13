Return-Path: <linux-next+bounces-5783-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBDAA5E916
	for <lists+linux-next@lfdr.de>; Thu, 13 Mar 2025 01:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2A9913B6F54
	for <lists+linux-next@lfdr.de>; Thu, 13 Mar 2025 00:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5105C134AC;
	Thu, 13 Mar 2025 00:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ix95HM3/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F02BFC08;
	Thu, 13 Mar 2025 00:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741827034; cv=none; b=bBr05J9BJv4uaihR1pMbu6DPHnrs/mjDIk8guLsIkoLilmiUbMVQIztY5LJB1MP0amgygc3Y7UVslVdRqAvUh3SnLUBLISX9F8wGkGAkx5MNuxDt3RGGRc9lSHRs8WsK5b27DajdUCmMbv21ir1kNntd6waujxgsYUsAAvxB04M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741827034; c=relaxed/simple;
	bh=uSWU7YbpJPSRCdTrfoofH3oGsBFDWJynw7Fl1bsS9Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cO4bNOD1DqE6cdFtbWDOOSS/dfoC/Ono9fLKOtg36SA/lm/F3J3OhYK1mGyQQQ2zuU+a80UpcwqPXEfvXZVPBFppNvASlBQ3JjJoV2VZraHZGKmZotwE/6ZOeqEpweF1FAZyJDhFKuLqLf/2FJOMTszNJ7DxqDA0DvcDVA9ulqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ix95HM3/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741827027;
	bh=gksQLsFK3xEmPdGx4cciaG59VNFXG1v4I0md9ekMYRc=;
	h=Date:From:To:Cc:Subject:From;
	b=Ix95HM3/0J0alc8pX2SJoy2mkdYZ3nt3FdFxD8eOpzAopioaYMOkf5ULjlTUjqYE0
	 c6G180SDtompEktusttLxyIztmdQmH/pFJ5Jz3pIu8PP28MS2b+PJ3bd72BAtsuYj+
	 8OX5tGd7k6gQWVJ2qRR/OnAmgvGKKbgEN2PpQ9SA+oi4BbF18t2jg3c2VFPYXbW7xo
	 EhtSAhaxL/B3fqe5FWq682nxV/cr+rg8JVxHtm0ISwu6ReSiL5IWM/K/tzkBvzQWyG
	 9ToTojX2VjfbD+oiWCYzqDvMMvMYvQb0p+Mq00v5qu6//Q3WScp1CB53FS3blZbKkJ
	 4Z0xpbGIgp4Xw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZCpnb3nRSz4wyh;
	Thu, 13 Mar 2025 11:50:27 +1100 (AEDT)
Date: Thu, 13 Mar 2025 11:50:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jan Kara <jack@suse.cz>
Cc: Amir Goldstein <amir73il@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ext3 tree
Message-ID: <20250313115026.364a8147@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q2JCpQJIx2bO3W3eCRsdp=B";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/q2JCpQJIx2bO3W3eCRsdp=B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  c27bb2f1343c ("Revert "fanotify: disable readahead if we have pre-content=
 watches"")
  4fea134e1712 ("Revert "mm: don't allow huge faults for files with pre con=
tent watches"")
  e28a4bdddc53 ("Revert "xfs: add pre-content fsnotify hook for DAX faults"=
")
  df4447e2b3ef ("Revert "ext4: add pre-content fsnotify hook for DAX faults=
"")

are missing a Signed-off-by from their author.

Reverts are commits as well, so need reasonable commit messages and SoBs.

--=20
Cheers,
Stephen Rothwell

--Sig_/q2JCpQJIx2bO3W3eCRsdp=B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfSK9IACgkQAVBC80lX
0GwgBAf9Fc/fn0R/W89wDQxExaTs4bwEXqspamptYhChQj85vdYfVkMTaS2EJ4q8
dEHRGPMDlVNyl7qjBo3Z5tXl+cH5xslZr1EqtgtFqLMdG2i9dNOXv7OVpeQog9c+
Bk8xqFDmPc/L3fG8jGTgKc9tPvL96ijjwVqxBVUEqG2pB9Xa1GCaR9RWaTr47ey9
jitW9+6GApkzUdrHVGG/zQ7B1ACxZfer9EcFtOVMpS6fUZunKnC+1tkcB17UkwNj
+NPpoxHSIVbI3vNRFVYB3fK3dNgwUNREkV5QYZVw/3RfPgTO/n4vOdB5dvm7jTRq
PWu9KaqcHlUtfUzznhK0Py34+hvL7Q==
=0CwP
-----END PGP SIGNATURE-----

--Sig_/q2JCpQJIx2bO3W3eCRsdp=B--

