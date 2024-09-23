Return-Path: <linux-next+bounces-3948-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E07098397C
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2024 00:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04A211F219CA
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2024 22:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267174AEF5;
	Mon, 23 Sep 2024 22:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pEKiAn4/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50F82C95;
	Mon, 23 Sep 2024 22:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727129058; cv=none; b=rH2127nr09x8mfwGaggjPIaD3zW45+QsTlAOlrgJthK19hBDeYqbfmzDcul+P0FVrCXuKytomuyYtB+eaxICp5+eBXmh97JPTi2Stn9myZP4u/0uTGfXouzu5u5PlfGnvgdq1JanJEvIkQb3c/y6CaMbao5h7sYDnfZXr5Me0jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727129058; c=relaxed/simple;
	bh=pzFCRHNp0mc+2cKy20a/wfrsoTjLPAC8p/E8amOqeWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mV7yohDLu3GYBnsy2fMvii6pMAn0MbvjxOgZNV5rtvlSNZCvWcOZwKrfk86wSmqaa2XqIF976y/trtlp6x48JKcUeUSjB7cvxjqmpl52qBtNjYao9LjXF+v+jIfXH/TSGP6omfaXkmnsNXji/oPQNfan5CZBPosa9c2sLJfoa+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pEKiAn4/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727129050;
	bh=hj0BGSBtZaNrA+6zVkWLNdX/pfDpas0fdf4l4ZI2RG8=;
	h=Date:From:To:Cc:Subject:From;
	b=pEKiAn4/47wvWxfA4qxQjiWJDHZ0kUUfC+GGxI9WuVkWcogl2n/KZD+SV5IGWOdJ9
	 ZyxaOPLRh7w+m2ixq87L0SqYb0rDAHPYCVu07X4Z3scKbkN9wsL+akmtj87LI+lG7D
	 jY7QBT38Q75A/OlCtar7uJGuhezcQNCJylemdh3pF/Snb6TGl3hBUY1iYXXBYcKgOe
	 ws2/EwVzH6ACg5jZe/jnxAxh4GiIlH9Ucxeqde1a8G41up18I5O+lp+hzalBk1UxMQ
	 F3xuhsyZSKGP2CE1GC93TmTlXfES9eX7JQ1wYEgcHI4R3SMfMg8Md+Z8HH6P8WHiJp
	 Z9hSMo1BE4r1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XCH8B1Bw6z4x7F;
	Tue, 24 Sep 2024 08:04:09 +1000 (AEST)
Date: Tue, 24 Sep 2024 08:04:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20240924080409.1f5570f8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Q1n6Q9V_K.w=9b8=hBySQb9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Q1n6Q9V_K.w=9b8=hBySQb9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  8c92c9840a6d ("btrfs: tree-checker: fix the wrong output of data backref =
objectid")
  90cee4871c72 ("btrfs: fix race setting file private on concurrent lseek u=
sing=20

These are commits

  b0b595e61d97 ("btrfs: tree-checker: fix the wrong output of data backref =
objectid")
  7ee85f5515e8 ("btrfs: fix race setting file private on concurrent lseek u=
sing same fd")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Q1n6Q9V_K.w=9b8=hBySQb9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbx5dkACgkQAVBC80lX
0GxMqggAnPGmU7DlZshIHw019cZdClStBfyQHsEcOoQ937ziTrx1S+b0t9kgfLK6
NXWqZuinxmWm4l8e2BLCWPsNsE2OK9yB3UNWhZ4N4vOSp91ZZuMG6xe7n+ERiu62
sfgXP5x4XWqJhq60whKhl96eDcB0mCHOih88KMma7Z/mP1EjqdX3amdUFA3wmX/T
G23r6WvM7m2fqkOhlgVHKZv3uJD6lYxJ5KYb7iBM0lS9k6mFCVTHmWWpnyjg8ZIE
dECB63DbZnZQfAQqxE9ttNSOQPkcCL7ap2qA2CrChy865l/tz3u0KscBw7PivdRR
iwO7Ua4tx3+h5gMsEp+2DlEBYje1rw==
=f+B7
-----END PGP SIGNATURE-----

--Sig_/Q1n6Q9V_K.w=9b8=hBySQb9--

