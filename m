Return-Path: <linux-next+bounces-6415-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 315E2A9EE82
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 13:04:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B7C718932DA
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 11:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2EB25EF87;
	Mon, 28 Apr 2025 11:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Jcbqxn6h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF36B4A35;
	Mon, 28 Apr 2025 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745838290; cv=none; b=W1GXqgXWickKxwdcMAbIj3j9ck0b9lcSIo727O6BZWdgt8cbLJo+BNNLcl6n5xCwVY4a6DRq8X4l58GGhmncwTZrwgD+xxRYISF6epNcYedxEKlEV5JdF9Drzu1TywCN5+nOODcZbyZjyylJthspfXgX+E0VMRu/Na4sh12UGx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745838290; c=relaxed/simple;
	bh=q5zZi0aUWe3r475rrXeK9cxriShpo9G2mmjL2HRBgDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fvctB074WOlTNGMnIBtHH84tmCYCC1hWMYccohMKuzxEbBLmQLb70ox1cfWWXlXW4wc6fY0CN1VZbl057X1FIBqVLX6QtaqZI0i+ay+4RWuf4GGvRz3sIkJQWwG+kYOvdOW20q5A81eBSsIHFRmg8YF6+LGI5dJm8sH/7MfXjBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Jcbqxn6h; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745838283;
	bh=IrY5kEdc+aYZpaufMFStyDcPI4cWFTKNnMwE6pAXdas=;
	h=Date:From:To:Cc:Subject:From;
	b=Jcbqxn6hFHIPsTKqRYHxxRh1Q0in9sjX/9bPOZ+/syquXvVgM7OwsrxFEJnJ3hise
	 bgwtb9BGQPluX4KUIwIluUqnGpObxi7XsmxZcZdmwVNtLe2kmDCtL6LVta3wwE9fpb
	 m2++D74l/RkYyTBJkInSOFzwzHGvMfHAdFB1C3Egx9xSdeBwwFHY1v8JEPfrpECcd0
	 TV1Ure3SXsoQqgKL5B6yc1WKxWCE4/bFuhkrJFuHyByB/4lPfHxNHkEqdxd9anzKal
	 UdpxJE2qEQwYwjWMMo91l9/9KvACjPjJL5qbH1kwGdnYqy0PwJHy2UzWzxZSov++Pa
	 ajJ7TmGPzDDhg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmLF75cndz4wj2;
	Mon, 28 Apr 2025 21:04:43 +1000 (AEST)
Date: Mon, 28 Apr 2025 21:04:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the memblock tree
Message-ID: <20250428210443.72682a35@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2M_H_0NOnENxBkyAWu3EruD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2M_H_0NOnENxBkyAWu3EruD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotfixes tree as a different commit
(but the same patch):

  06eaa824fd23 ("mm/memblock: pass size instead of end to memblock_set_node=
()")

This is commit

  94e4e8adbc0c ("mm: memblock: fix arguments passed to memblock_set_node()")

in the mm-hotfixes-unstable branch of the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/2M_H_0NOnENxBkyAWu3EruD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgPYMsACgkQAVBC80lX
0GyHwwgAlFnTDuINGEVRhMVL2avKh2SQBzosjEN1wi7Wy4YX48aTcTEC7XlLXYPV
Zl3vwhHIMqQ7O2miwXVuHWYb5qmWvqTmQCUHVDdI0fBNicaOCmUfkf1VDNXnu2Fp
J68h2Vd+nHMJa4HKbuzfk0RMpr1p4LEIR+qTyc36GnY3YD6ggpqC4g+2efWx2gxO
BnnaZzGZetZ2RrFxvSjGOzHKib9At6zAsdYpLzx7VIpdcz3mYzasTILKRtM0I4pA
fmD7KlEizMoLPUrNNza238WPnaFBFIHJqTxUh8IJH8LaGULpaC1nUdsIMdvN+lzp
OgabcGDCukERYDTn9iIuk5XiPYQIVw==
=sdqz
-----END PGP SIGNATURE-----

--Sig_/2M_H_0NOnENxBkyAWu3EruD--

