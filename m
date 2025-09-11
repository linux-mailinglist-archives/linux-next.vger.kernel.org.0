Return-Path: <linux-next+bounces-8257-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8631FB52825
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 07:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D7D97AD4F1
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 05:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83150242938;
	Thu, 11 Sep 2025 05:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iQuPNJJK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA51A168BD;
	Thu, 11 Sep 2025 05:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757568207; cv=none; b=HtGo5EBnA3iy0akrjRyYqc7FbWKsLoJqSGjBMAWhVCXsns9p9x+yVta5N1lOwJRNAC/Feq9IHVAsoPVzA2JjZpwasZfcQ7lNfI3/X4O7P7UsNfohKkq3fJngwIslAGmZVhb1A2UiEW4fIgF84dCMlQEdIPE7YgAp7e90G19d9nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757568207; c=relaxed/simple;
	bh=mSJr2kbL5NOMJXttnajDENwtmq4Fx5blKs9ZXF3c0RU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RLXEM2xaccxWXx9cPwZltU5WiUk+y4BIKPj6C+cva1rUzF5M6K7ExCTzgOGg7NaP8zdv3x0DVZS3To6MLAsV72WKGBoAICKBkWEV/RcP8X0ZXL/rrO0dGr3qyG5MoO8tTm3/fRM1o1B1yDnbLoIzn9i02rbShJxDiP29gYpH4SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iQuPNJJK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757568203;
	bh=7vPMSOWZglH8mtZgEHRli4IIlpEELVi7LU30fH70aI0=;
	h=Date:From:To:Cc:Subject:From;
	b=iQuPNJJKxQTey8d2RJ2cOtzH4eUF+3xa3wehN9NapNkoMXb76hSQPQ109gD5K8FZS
	 K4EcQzlDxwAmyToYKvVwMy+i4RqCwDAC/ivR7vknkK8bFFX4DF1OHmADtrGpC61FwQ
	 7vDwhz/AuRjPPGGu+QiLJPm0SEMecbwWbTyu63ctFQggWKLYUY8A03pHkIem+YI5At
	 s8ldUhF/vgHKQgsEi4Q8VO1Mj1jjj+3XCw0dktEqptSb/PULSJ8v6pim/WjuKzL12F
	 uFAzmn6x5+V7uhwbNVtYYLh1iWaYOWLqYsqnDysWhFCutOMuMhRnNuggZYkL/t3hBS
	 qKsxGwx9Cg4lg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMmDW2HGGz4wBG;
	Thu, 11 Sep 2025 15:23:22 +1000 (AEST)
Date: Thu, 11 Sep 2025 15:23:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs tree
Message-ID: <20250911152321.33d65277@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V5BKP3VNmrHIsW3e=Dk4Nqn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/V5BKP3VNmrHIsW3e=Dk4Nqn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs tree, today's linux-next build (htmldocs) produced
this warning:

WARNING: include/linux/fs.h:1249 struct member '__f_path' not described in =
'file'

Introduced by commit

  d0e2192a8844 ("Have cc(1) catch attempts to modify ->f_path")

--=20
Cheers,
Stephen Rothwell

--Sig_/V5BKP3VNmrHIsW3e=Dk4Nqn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjCXMkACgkQAVBC80lX
0GyeRgf7Bw/Jw8cfSSWT91PCLhaS5g5DiM9k5Ms+TT/gMvOosggzrZakR1z/ET9U
Zl8ri6ACn8h/Rq2ecNhNMUPy7kQ6Gt0O/mE1Igrr7S9fIcwNebVeILpmn2nLnfpY
SbPZJu2VuJpITva9e3HFlQnC1bi8oQi4Sp5RE31+XSIKW11iuxRUHkAwvuI4JpOq
ycquwMHd54T0BWjUTdAAf9gp00VZlxLxJE+G3HDO8xACcHuoE3xlG9p/7rjeGpdE
apQrUlFa7bQmofoSni9YQ2ZcpuidWJZoFAn3RwdIyXeB6PPrD8rAoCeDYfT5LGgJ
vWlCGVQYfkFO245AUQ9aik8LXCuAag==
=vY8b
-----END PGP SIGNATURE-----

--Sig_/V5BKP3VNmrHIsW3e=Dk4Nqn--

