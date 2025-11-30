Return-Path: <linux-next+bounces-9276-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C39DC95602
	for <lists+linux-next@lfdr.de>; Mon, 01 Dec 2025 00:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B2253A1E00
	for <lists+linux-next@lfdr.de>; Sun, 30 Nov 2025 23:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6517D2E2DF4;
	Sun, 30 Nov 2025 23:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jcKH5ldB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2C52405ED;
	Sun, 30 Nov 2025 23:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764544254; cv=none; b=DweUcAYY4jVBoW1VnoqcNYzRsfTTm0I/cBgMfxtHajX5z3ubbDp0gO0ZtkdoeiH/nUiuXfYFlNMbS16AngQbah7us4BI4f0bhYzI16ba9jD9PYf7BzW8rW3gbAcjLxDsW4UXQmBldme3xBA/iFV5RdrKQl6uWvcVNYFnec9LVXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764544254; c=relaxed/simple;
	bh=gbp0vzhonCf2HsuDm1wqGIgjHh5RgGy5U3hJrdRNY34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZYI+fCxykhwaGIp4MtUKCS9g6mJ2K776BkeF/5GV51v7zKyLDSFBQoO7moMbKqEarPU+33HGpQqqpSsAGm1jS52pGopGu8UVsSTEZnI7GE08NCFDjoqLb2Vi8Gg/07sEMhKVwfHRMCVfexjf2vVJzcjQdmL4vOI7tEouvT9TqvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jcKH5ldB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764544247;
	bh=kAvPHcAWlYeAiD/kugr1WYfE5MlanbGIQz2+pwawAfU=;
	h=Date:From:To:Cc:Subject:From;
	b=jcKH5ldBeUkBMIc2IpPYeHZe4ES37ack+NLpOl2o+pzq6X3KGUbMyxokRHElT53ch
	 CJcFd+4e7NocaerFU9A4wiwVgtY/K1oMvzsbu5oYt36ek/80JHXZ7Pyzc4HGb0B3lZ
	 xhgWJK03DMPMLehHXS2sfVrBcpGeDU1HVs4PEUyEEgiGTyuQQo8RvYqdWEJ0SMfygW
	 9+rr8y3A36jP2TvXbUDpUXj9sHCNgbklFnlz0+va/ras7ab0jjheN1o/nVtUdK/q+B
	 llmAu92LQ2TDUEk2HVKCMLuEpLxzLn1cd7WcAsNRZUodN65ft0gzc19tCWQbckVPwR
	 vyF5M5uby5WYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dKN7C3cXWz4w2R;
	Mon, 01 Dec 2025 10:10:47 +1100 (AEDT)
Date: Mon, 1 Dec 2025 10:10:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Williamson <alex@shazbot.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, David Matlack
 <dmatlack@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfio tree with the mm-nonmm-stable
 tree
Message-ID: <20251201101046.009b0919@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M2HRHot_.+auMAJEmMNVIwW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/M2HRHot_.+auMAJEmMNVIwW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfio tree got a conflict in:

  tools/testing/selftests/vfio/lib/vfio_pci_device.c

between commit:

  e6fbd1759c9e ("selftests: complete kselftest include centralization")

from the mm-nonmm-stable tree and commit:

  657d241e695f ("vfio: selftests: Rename vfio_util.h to libvfio.h")

from the vfio tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 4628beb62453,13fdb4b0b10f..000000000000
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@@ -19,8 -19,8 +19,8 @@@
  #include <linux/types.h>
  #include <linux/vfio.h>
 =20
 -#include "../../../kselftest.h"
 +#include "kselftest.h"
- #include <vfio_util.h>
+ #include <libvfio.h>
 =20
  #define PCI_SYSFS_PATH	"/sys/bus/pci/devices"
 =20

--Sig_/M2HRHot_.+auMAJEmMNVIwW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkszvYACgkQAVBC80lX
0Gylwgf+POUjfJXla7/zlagVskEIfDzW63lyPpuxU7vGiu+Rbfpx6qXKDhDqfj3S
lTMWUh4lFLY3os6yp9OAPDfn65shGtu0jmkuDxqs3H5TMOil4CaGchU+SizJf0Ni
CH9e/R1DIzzMQFK1WELhS/0cJ0H1WNIfxTdmqeNV+a3yl6JqOc8cgxWs2rb0n9+O
fP07o9CvmfDznRzphYPzyST3wOz3cIMdYFw8owLYDJIJe7Hd1jRlWZ5wtS9E2AAh
HhzBycCfXdG0RsAiG8Iksc6R9e6nKX/Fn9YWM5hDxRsB8SwWPtBA2Zolr4viuNqS
aRSGYHAwBPpFlScheiAg5oLHUPjCiQ==
=mQ+p
-----END PGP SIGNATURE-----

--Sig_/M2HRHot_.+auMAJEmMNVIwW--

