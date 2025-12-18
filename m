Return-Path: <linux-next+bounces-9460-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA5ECCA6EC
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 07:20:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F0043018196
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 06:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876942FF672;
	Thu, 18 Dec 2025 06:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LnLUPnin"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41972FC86B;
	Thu, 18 Dec 2025 06:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766038806; cv=none; b=WowDz2OCYvoCYNBg6uL0PBpMtzEbp72kTxy450wbxQSvdpFTY6RWpRB8VvsTVbxlHQKbvSKS6JZxHrQtB70wYFW9+fzNAgPfjgwgl/w8Obe2REJjKzMcu3VXdr9+gvYrhzyBet963VpC90iACaDG+P92ShnEhkNQflqHFxLXUng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766038806; c=relaxed/simple;
	bh=zanl88OdP4qH8+u5i8UdZR0IrMCD5CqK/I2Z3Wpd0OI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M3k+AUIpr1gmNVAq95Tv+JyyyH2/dvdgCvtnXa4LmETYvFXdeNcMO7+YhVSJsAcasj3/HTgnxX/+qga9s+onS7Rh7bhXTtjRK/tjMPzO67Qty4/+7T96PWmXQVRNE7y9niXEFYHYHsOfcz7EGGcRbIg4K1yC/ERLpL23y7vaijs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LnLUPnin; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766038798;
	bh=jwurk9mxVsyNNCPyp0tCgt/fBa6iLHhBce/nZ1wafm8=;
	h=Date:From:To:Cc:Subject:From;
	b=LnLUPninevSRJL6dgKzODzHs9Dj3hvCSiszXe/vcygoqRSRIJth208UZtBPxHQzc7
	 Ryt8LelAqSXuXPAnUvK5t+lSpJ5eQG2gOWQVjiFXhrTNn8vLPdq86RbVYnDgoHUqHd
	 xAF7mRqnkGSGrimBrjU2kju6c9cwX247OVMO/j0oXiwC7SgMBnF/ai2hd5qmp0WvaX
	 cRbYqL2IpUWeaEUezX8z45I6lQEn6SwZKbyQpOoSx0jc7O49cz1lOvo0xes3fHlSPp
	 GGGt5uKWZCHownSjeHBqTXlDBKclqFDGGICbfqsLEscVP0uF6xDOwkiYiyfiFbqj5H
	 DHCgUv8QPf6fA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dX0rZ4Sjgz4wDn;
	Thu, 18 Dec 2025 17:19:58 +1100 (AEDT)
Date: Thu, 18 Dec 2025 17:19:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tip tree
Message-ID: <20251218171957.6d7eab70@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gBAzRSdB33z4VwNH_1fhKf7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gBAzRSdB33z4VwNH_1fhKf7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from kernel/events/core.c:60:
include/linux/kvm_types.h:9:10: fatal error: asm/kvm_types.h: No such file =
or directory
    9 | #include <asm/kvm_types.h>
      |          ^~~~~~~~~~~~~~~~~

Caused by commit

  23faa33d88df ("perf: Use EXPORT_SYMBOL_FOR_KVM() for the mediated APIs")

I have used the tip tree from next-20251217 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/gBAzRSdB33z4VwNH_1fhKf7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlDnQ4ACgkQAVBC80lX
0Gy2Xwf6A3ISEOJzyfHDAo4P+YT2Kg0iKJhG+fv3zgV39Z9dpevGDSDc4vXxLacm
hUP2YS36cLXaD1nRhGjLa8LNs+0tBcGmeTFbNz8ApxeYFxR2VJeBdZ9BpNsGPNgM
LeELboXU2W4JHt5rEkWR6zw7kAHpx+pqwYncvMSpbnKMQeKdeMz5KhF8ujVMCb0e
f4/9h+39rkSR0iASxRs/HGiITuQeL55ek0/V/czVSfEZNhhM9G7nRQj4HeO88C1A
yLn/7G9ba8aNN7J9bBB4ZfQi2bSHZbDVSeM3mYAH9CTg07irJ6C1s95SaVmwjHJt
/EoxcPR9nZZ4fHzPC4thowFUGT3FIA==
=smZn
-----END PGP SIGNATURE-----

--Sig_/gBAzRSdB33z4VwNH_1fhKf7--

