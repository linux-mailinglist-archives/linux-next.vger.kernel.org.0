Return-Path: <linux-next+bounces-4392-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0820C9AD77F
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 00:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CC161F21DAA
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 22:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C52C1EF08A;
	Wed, 23 Oct 2024 22:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UtE6Pfi/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD424D599;
	Wed, 23 Oct 2024 22:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729722225; cv=none; b=sQY72p0Wd+swQ0K6P+1X6RPpAuvHKQymHg4UtkAuBwG/uiXm4a/QVDXga2ovVsnC4m+5tY6nGYlnATxYi8b+NK0FczF+pB5whzL78yTbzWByP8coGOFNfNb5qrb0ZVd9XZxeR8o8b1UzAeYqxz819MZLesrd3X+ZZ6Jzvk8/Rk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729722225; c=relaxed/simple;
	bh=l/hDO2rsupczTQSDkCShoIw8cjMAFjQC8ud27iPfF1M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C5WwvzQQmkfLIfch+IzC3fHYSMTDBw0Ve/9JG4QXw4Bd/2lDTV1q+PHTpdBQ0ylBOClWB9ZadghfbDSqF4VvkZZbZ965Wh0uBfCVU3MGuwZoSUq1PjbNs3JT4SRjve6rB4iJxWGpKDru0j3WOXpLm/gKXBIBXAVkHiWfS1YA4jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UtE6Pfi/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729722218;
	bh=ZNWZemPN4cKjpnMYimogI8v9Yz5gIj1eyeU3HxF99a0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UtE6Pfi/PKEc+rCagY9f+JCu54EDwnlYQGnFGU3JxGMHODFmuWygF1wLcq1iSAOld
	 ItbARQw2kbuVs78o0ffOAw9apguKYuTBX52+lRfw3fr56KksPK7/XHi8943t55Xb0G
	 ZrfpkKikcuro4IV9CtsomLHIqfxvKs8wV7i521ZbxOdvqL2LOOsZNl1wLMZBzkOUHg
	 0VODHWwu+2XXL2Ry7YAUA4EGsUv30LF09TAIc/Cp8vyO7VsCIFdDkl+p1tURNpNeFF
	 ci5xchS6XSQUTVx24TyzQWUdEzuUY3Fi192HSMhtWtmtbwjJNnzaZqgOmv9ItpuM/S
	 1JPMiQir+D1qw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYk8p3R2vz4w2L;
	Thu, 24 Oct 2024 09:23:38 +1100 (AEDT)
Date: Thu, 24 Oct 2024 09:23:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Su Hua <suhua.tanke@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: boot failure after merge of the memblock tree
Message-ID: <20241024092338.6a8f10c7@canb.auug.org.au>
In-Reply-To: <CALe3CaBU=9Ck-euohNna2hYxYJBbvA=LrmG7qDHTEeQ2rt9XCA@mail.gmail.com>
References: <20241022173921.6fdbdd38@canb.auug.org.au>
	<CALe3CaBU=9Ck-euohNna2hYxYJBbvA=LrmG7qDHTEeQ2rt9XCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AjFd7Q9eSGmq2ysPGy3OQXV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AjFd7Q9eSGmq2ysPGy3OQXV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 23 Oct 2024 11:20:43 +0800 Su Hua <suhua.tanke@gmail.com> wrote:
>
> Thanks, I'd also like to set up the environment for testing; could you
> please share the command line instructions or XML files used for
> testing?

Sorry for the delay.  I run the following qemu command line:

qemu-system-ppc64 -M pseries -m 2G -vga none -nographic -kernel $vmlinux -i=
nitrd $initrd

where $vmlinux is the result of a PowerPC pseries_le_defconfig build
and $initrd is just sufficient to get into user mode and then shutdown
again.  This latter is not really relevant here since we don't get to
user mode.

--=20
Cheers,
Stephen Rothwell

--Sig_/AjFd7Q9eSGmq2ysPGy3OQXV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcZd2oACgkQAVBC80lX
0GxnFQf7B9rN2DLW8qNubf9JR7kjE3VEOhEHupL00V+QqZIgGnzNS1OGk0o45AX+
+62PXsiypa3xGfj3JJT7GUmEgOXSrfrVTqUDML/U6ZC1lVhdhThArfSev2xOml0s
zeHXmaoba7d0r8aP+RNvAF5RemiZ8nDLXlEHAnbo626ajdzr4mqGRextMOhHMpU5
xPfHzIjCB/yCrhF9RUkF0jikse6yd+DCS4eW0Ls4f7MilSzcXUwGt0guydqO+e1G
Ampd5orjyA9uiWd1ZZ9CrnDqD0nVVeszHp5Ogm3J+4F2fLl9XNeFaRkATcM1BeV4
aRSZVGuxeTKy5eiKHgt4Mrhuguzl0A==
=V6SQ
-----END PGP SIGNATURE-----

--Sig_/AjFd7Q9eSGmq2ysPGy3OQXV--

