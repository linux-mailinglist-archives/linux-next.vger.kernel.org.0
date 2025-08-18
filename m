Return-Path: <linux-next+bounces-7967-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6F4B296D9
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 04:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 954DC1967842
	for <lists+linux-next@lfdr.de>; Mon, 18 Aug 2025 02:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2D8247280;
	Mon, 18 Aug 2025 02:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R+M8/Gy9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F1D246BA9;
	Mon, 18 Aug 2025 02:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755483302; cv=none; b=q+wGtifWcvoTh0UfMF26YjOY00c/epn0ikARQkwbrkNPejiBjpFvwJWj9tHkiKesKNcNMZlQ3lbeRqKKdDWSnVhRjtq85RlMSzcEFGsPU1WNPBt6djqdFPfjQMvTxmUFm8+0a0sy45hNGJdzU7HFGvFNVJON9Radhnj93HnMQgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755483302; c=relaxed/simple;
	bh=5mRQ015KOwCmGHwAwwbn8SiIH5i5USckFEd5TCrKBAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CrYXatxDkRIcIzUi3GbMQHO9Il/n8s7+bJzQPICX75uhhkzy4T2OUCdhzVjbhRjR6zGqURJPErLSTXAcTlAX2uY+bhdfcQSGrV4me/UIypFBljZnfy74J4zpMOdP6iSbexGZnNv2Xks55kGpODpPBKyCeWYRmbF9WU6IoXiDJr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=R+M8/Gy9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755483298;
	bh=5mRQ015KOwCmGHwAwwbn8SiIH5i5USckFEd5TCrKBAc=;
	h=Date:From:To:Cc:Subject:From;
	b=R+M8/Gy94vUIG8lj9Pph63QnLeXJrdyGTNG15uUE1R1C42sTxjkUTGIQTX+iipRAn
	 3xIjmMy3tweovEM2EYpD6CzFhTBME/wnjxe3trz85wXO4r0gua6epXZ9uMYtVL2Xwo
	 vBgjk2DwKcX4grCbTyFNGOYwVpEkIuKy7p77nOx+2Hx8UREhQ+caP2eb1jFo6h4bIl
	 qEq0k4Ojyv74b0ty5VKWcHeNxcxR1/c0IxTt1JO3RbW8iyWdlrMaUg4RPDzfUTTxZ/
	 1l4TJZGvWQEjH/gcjN2m2DNIXyMLyO/PIhLaOY5fYf2qU8BksQMkt0Qt9E3E92Y7RB
	 lQyfx2FBmpv9g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c4xB90ylNz4wyh;
	Mon, 18 Aug 2025 12:14:57 +1000 (AEST)
Date: Mon, 18 Aug 2025 12:14:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Kosina <jikos@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe
 Lawrence <joe.lawrence@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: please clean up the livepatching tree
Message-ID: <20250818121456.378af88b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LFe7Hxf3rmWc/LAHZhsrINp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LFe7Hxf3rmWc/LAHZhsrINp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The livepatching tree
(git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching
branch for-next) only contains 70 merge commits and appears to not have
been updated since March.

--=20
Cheers,
Stephen Rothwell

--Sig_/LFe7Hxf3rmWc/LAHZhsrINp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiijKAACgkQAVBC80lX
0GwP1Af+M712UWJp1NLF+G6hp28SiPz/wziOqHrnEndLpHjaxIYOXVgXZOQaoN+R
GroXD8AX0EguyfsLmh00cTn9CZVAOYQDhvfr1XZidV9FQOzmCZnL97zOF/uiMW7l
UB17/WqHGWi4H8JvYewUeqo7ObkWL4X8TOR1F2ARlH3F7Ulpra+ad6GVqo3I4HAK
e9a5TueBxeziiUjhuaiZuw24sX4n2h3D7PTU8IutPx6UxQr9GvwBgdcW25H7IUyA
WhRnWDovFQHenTbWN4HIPjeb8SIJJFSuDQY6S4vejXnWcJmQzSCrzgjHifyvAV1w
JUABOldUKh1aFoqasMLRzkF/erO9jQ==
=vXu2
-----END PGP SIGNATURE-----

--Sig_/LFe7Hxf3rmWc/LAHZhsrINp--

