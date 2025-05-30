Return-Path: <linux-next+bounces-6998-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8575CAC982B
	for <lists+linux-next@lfdr.de>; Sat, 31 May 2025 01:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 099BFA27865
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 23:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B7D328B501;
	Fri, 30 May 2025 23:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jewYcAyn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227DA28CF4D;
	Fri, 30 May 2025 23:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748648020; cv=none; b=UmiEoAWIfruFTORHsuTMpVmLR6gyLmbuPOJnmfKptwP4XPCijHd65leiBoF6hd6mIhFp5UAu1c6deWQlSXpMGzN0oRo1x1Na2ep6XL2YTfAzxe4B5j0MZjPhlIoEMQHdrQ1zvkz7mJPZCLQy2cMiLjDqeaZk586ALpMhfwnIm/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748648020; c=relaxed/simple;
	bh=vtPnrrm44SvAUNI2ykBmLnAahJ+LTbahtj8ND1+Ec1E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=CrudYv/z9fxs5jpnt2zMP21lp0S5ojB4a8POgL5YcQkvtNWfXtTb0vdlYQpjG9RBypUpRkpI71cOpNVBBVmGHNlDym+9FkZjkCdNmvdWEbh3DYknl/8jmwKwV6euHJIHBMAf7dHSL/zdmTu+qCyHVHhMQhEZgQaSeScRY7lKQWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jewYcAyn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748648006;
	bh=vtPnrrm44SvAUNI2ykBmLnAahJ+LTbahtj8ND1+Ec1E=;
	h=Date:From:To:Subject:From;
	b=jewYcAyn5N1XkgZPOMTwbj+ZJrAHMKcCwTRBu6mnrAdLln72/silOOo9X7KzkpUV1
	 50Ykr/DEzBvoAOOcmLZJOXWypdUEP0wSwIaTINEDjVls/IZvqmjdb9EzRinIs8pzw8
	 8L/rzLGtngQv9IUvcZY07JkJzZoKMbhxiUR0BnawWOHhmJADRUrYLadJoidilmwv7d
	 TNpqxCa46Vm/C8QHqBxaNxsGKusj3fSCgYgDfj3D/1OxmcVpROiplRHD+hrT9IjHo1
	 NQlcqq73v1UDoutoEy/QrmPocpnUMnFtntq8mZjMT0RsuUnY4s8hWYWi64XQ1fOvAg
	 36BrK2/MQThAQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b8KLG4Fkfz4x0C;
	Sat, 31 May 2025 09:33:26 +1000 (AEST)
Date: Sat, 31 May 2025 09:33:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: no release on Monday
Message-ID: <20250531093324.605449e9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WO_t0PslDKdAGSD_LPlR9tr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WO_t0PslDKdAGSD_LPlR9tr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Sorry, but there will be no linux-next release this coming Monday.

--=20
Cheers,
Stephen Rothwell

--Sig_/WO_t0PslDKdAGSD_LPlR9tr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg6QEQACgkQAVBC80lX
0Gzbqwf9HpF2MR9rdtJjE3DOJRrkOu3lVfD0lny6dZrVTtgyuXTnaDrQGBgWjzjK
2gOX0XwtKfX7KoZS5veLOgmpO7lPpzhLIKA+rnq1T5IffUsfQ1lRIi1hCeJHY6XV
VqKeXvmT6lBtHCjrzywxiUK4/WW+Q2LFLQeEfEgxSoVpm3aqu5E/H4WTMJ9sNuAq
OH6f04/iOOwUIgEAG9SekaZvlezS593sB1+7gl3b9u/Rp9xxIa1n2SJNgfwBFkSK
AepYa0uofCn8ujYtPDySZ/DpNmr57bIQiLVUQp7jxlcei1m7qJfV3yv6EqR+ndHs
BqHYJY5FnOIZlKgCiy5pxBUh/tJdwQ==
=uEoJ
-----END PGP SIGNATURE-----

--Sig_/WO_t0PslDKdAGSD_LPlR9tr--

