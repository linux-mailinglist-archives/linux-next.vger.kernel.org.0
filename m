Return-Path: <linux-next+bounces-6441-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF87EAA3B07
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 00:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC61D7B66F2
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 22:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE30A26A1CF;
	Tue, 29 Apr 2025 22:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PeIO84G5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE44268FF9
	for <linux-next@vger.kernel.org>; Tue, 29 Apr 2025 22:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745964436; cv=none; b=VwJB2XQuamFD2iPJd0Ho0ffxPByVd5wY6si74szAN7PihJ3CaluOP9ocszqsLdXezeJC6PRkDzDvQASIkJH8rk03e/rZK1tkAP1bdZp+ih6qBP6zyBWCiOnT8ehBn1EmUsyn//YcWh3Yd1Npb9xjcD6sWhBgItlgUgXWypbkISg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745964436; c=relaxed/simple;
	bh=3zqSqmesCD3PbNksMAPcuS//tZP/IoDniNcmx2LQy6s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TrMdQaAKln+g1KxprvLQCxMqVHURn5ixOMoc0hcJcPzxMWudaQcjSszguDBWbU+iftGFxFFcRj5k1QXXHXK2KvFhMKc5hfPAsWxJURC8427TJA0zLzA6bfP2UDTeBlni8OiAoam50nLVDaOMBIyWBtWA37Qyq8NQNxzB7xKEs38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PeIO84G5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745964430;
	bh=FN8+uBgejm31/iGMA2YxDjUaaelwFcaAly2uzQJg71g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PeIO84G5jtYu3eA1kG0TnQ9v+n/0VuJPoSNtJCCJdpugzlnoGjTdvtjcDfrOGiAMH
	 ku7uEy3z9+oxnNTthaYsDOO7TPeZ4tVEyHtn4+mzbG6R74kLr2busl4iCzJAdlT1kW
	 5lmqLGrxqsvyOJzM1sB1eDZS8t15o5XQKMz7Oz8weaWWfScrNYJPumxm+oYLYfFEAU
	 sSNgEmHR7j/wYBb8SIJASbsSTluEan3I4UFxIR7yiybDrsaxPKM3Q8/Cgi0326y9cG
	 JYbWmqBWBDt2LE2B+goS5njnrmDr7Oa335wTCGB1JTm2mXPx1lpb8PKt7lx8fiSNnZ
	 5eTMru7KrpZ5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnDv227MBz4wbb;
	Wed, 30 Apr 2025 08:07:10 +1000 (AEST)
Date: Wed, 30 Apr 2025 08:07:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Haren Myneni <haren@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
 tyreld@linux.ibm.com, linux-next@vger.kernel.org, hbabu@us.ibm.com
Subject: Re: [PATCH] powerpc/pseries: Include linux/types.h in
 papr-platform-dump.h
Message-ID: <20250430080709.01e21091@canb.auug.org.au>
In-Reply-To: <20250429211419.1081354-1-haren@linux.ibm.com>
References: <20250429211419.1081354-1-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9YfBLevuRcpdpVSKiPxpuv6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9YfBLevuRcpdpVSKiPxpuv6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Haren,

Thanks for this.  I have a small nitpick below.

On Tue, 29 Apr 2025 14:14:18 -0700 Haren Myneni <haren@linux.ibm.com> wrote:
>
> Fix the following build warning:
> usr/include/asm/papr-platform-dump.h:12: found __[us]{8,16,32,64} type wi=
thout #include <linux/types.h>
>=20
> Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character d=
river for dump retrieval")
> Closes: https://lore.kernel.org/linux-next/20250429185735.034ba678@canb.a=
uug.org.au/
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>

Please keep all the commit message tags together at the end of the
commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/9YfBLevuRcpdpVSKiPxpuv6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgRTY0ACgkQAVBC80lX
0Gz1FggAmCTxcvx5Tk9yKXLWInz22A306wfzsoodDnH8Ji1hW0iPQHDLrPjLb0ok
EwQ29q6XGSSD3AmW30HPRsKLSlUEfy4wVvsi/iLGw5eDbKGh5KGWmh6UqDDm5Kok
hqRTC0beKqXn3IFdntFE2IvuoXhuQd8FSKSSj+wckNSaE6rpwWgcg1zLBLkFktIk
dNC1mb1BKlA/uD/o34B70ou4SC1ccoKYPRDzwkYdWd0q/AxCfWHO6zJ4iyBGApbl
T7S6qNxOXBJelAlCBqJrUp6cpMqflNNc7Zj0obeRzNQTq8VFM6lRm0OC1rHG2Zow
mrYBahLyLnnzpV2Phq8YnlCCBBaH+g==
=XyhN
-----END PGP SIGNATURE-----

--Sig_/9YfBLevuRcpdpVSKiPxpuv6--

