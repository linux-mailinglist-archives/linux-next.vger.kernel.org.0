Return-Path: <linux-next+bounces-7619-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD538B09CCF
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 09:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29FD93A4C7B
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 07:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3C1265632;
	Fri, 18 Jul 2025 07:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DrsCZPWV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9151A8F97;
	Fri, 18 Jul 2025 07:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752824500; cv=none; b=PmGxOsSWRRUAX9WIcjszIcsl6HS6lavDtzq832Bz29dcARi6HahtrZWnjGlStfCDZ+gLmvXmueuhickjMVc5Ynvo4VWsTOL5U5OxM8hHLVF+INI++T8AMjhf0QXZA9xVmWXsVJSAFXCxwx7P5j5tXxRmNCr6VERBspIOL1hxlv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752824500; c=relaxed/simple;
	bh=DBRrDPjjJCAJJvjIoXT4IRhy4aeAiLAVYjmPrRjNqa4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pGJL3tt0O/7rxkNpzXpAtfNhldcFLWxHTrBY+UVdbBN/2YsHjP8FNuoK8BIXIxSYIB4sxqQXQEWPm8Qb+mcA0Qt9oM7lwqfCJkmgZrIIWKMqoVImGdzpyZM7Wcw+wXGAaiwWHxLfw9L3wRyRy+MUql0YNeXFSKNXiOVaAhml1gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DrsCZPWV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752824362;
	bh=AIpWda2E220FOW6F82WfdaJSrQ3wFJNKx4jt/syUAq4=;
	h=Date:From:To:Cc:Subject:From;
	b=DrsCZPWVBiKdZhVskpqqPs+ovl78ayq1QZSF+XslaHLqqsff626hRv+AjnIVf1L0a
	 +MXe07HEwA/WvAiuj80LyIoRIDnrp5cxdrRaIrtStR5k2P40vMSmTYJBrQ51M9gVUO
	 r6mesubJzM1oNUpA+oHIFr4cU/7cMqrt6BKUpvufkgRakUEb79f9tb8jm8WCrFGWDi
	 BZAY8AgcQMl2fq8JTp7GXF9i/BmAdPUQXAXHLVwsg9KT0VflGHJ4cWBOVpWoUyTi7E
	 GrwZmhOynlpZn0yeDpFiqshOf2KSkghs4NrzdQrd0KdOJd7wwV1IX/ul0z0wUjWCtE
	 xl7sY8uTkJNnQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bk1rn6nP7z4x4w;
	Fri, 18 Jul 2025 17:39:21 +1000 (AEST)
Date: Fri, 18 Jul 2025 17:41:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Moritz Fischer
 <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Wu Hao <hao.wu@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the char-misc tree
Message-ID: <20250718174129.24c0e968@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hP.6A9S_zW0NKuMgR/AJ_8I";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hP.6A9S_zW0NKuMgR/AJ_8I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the fpga-fixes tree as a different commit
(but the same patch):

  29f4103b2585 ("MAINTAINERS: Update FPGA MANAGER maintainer")

This is commit

  1c6a132cb309 ("MAINTAINERS: Update FPGA MANAGER maintainer")

in he fpga-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/hP.6A9S_zW0NKuMgR/AJ_8I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh5+qkACgkQAVBC80lX
0GwAagf/adkVfq2x5v10vALIIpHb7y4NKg7IQPPoGOuxnpZDnYT8w/KoYSgKfMTl
b5Rx7DXQwR9/1nYS/BgPYzL9PwWEVek07CCh46ePfjRiJW7Dny+mJI84T84t1eH2
oxUA1mMgSiDuNRqjpjlmAc5fdianQ2jrU5baWRlG/IBLT0+3EsrV/SGhxwL+e7Nb
PJgruhWHObXRJCRHySVxmOFCQ+zUE5xBabBq40ZQQqtIXcleQ+bpxndrhxNzwhZu
PFMkJyDs+4FTRcbHxpe3tnBps+k+chn5HVOBbLjL0RvK+9uApCSgzo+/Tj9BFG5n
faLKP3DoTTbdvmmy5JGL2UdhK9NNQg==
=QCL9
-----END PGP SIGNATURE-----

--Sig_/hP.6A9S_zW0NKuMgR/AJ_8I--

