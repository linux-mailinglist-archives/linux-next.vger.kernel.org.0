Return-Path: <linux-next+bounces-5405-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F073A2E362
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 06:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59FF73A505E
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 05:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B7B15A85E;
	Mon, 10 Feb 2025 05:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hPpKWy+e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D69D2F2A;
	Mon, 10 Feb 2025 05:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739164076; cv=none; b=FJT2MoagWjIthzCwND+RtVIwpk1VHs9057+N0KEGUzCuDmscHF5EnAUYYRSfpget3l/vv5msAo5vgPS544LS7M3MvNyqsNtJPxzYfKHUkmcJxydd0gPIpho0ZJraQ7aVL8SfVvw0fZRofqA8V6x2xhqpy1IRkxkcsNYsCPFwhbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739164076; c=relaxed/simple;
	bh=ANO9oMWAe9WVlezDq1z5oOTTNnIfIcxIryQuVjmqVX8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gUTramfmB/gJxu+FdnP5eY2UIYsCxO8n7p1Xrff+KR9jvGiA3jYgXvN0Z/qWeff99kNaUqEfeuIn0MOO7EcrINHZ7EEpKW9IkY8bknDkNc2eChADomlkp+yHugsUbX8GN68xk+097YHWQhLJ2BB+EgrC1s2ioNMWctBjY8iwGXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hPpKWy+e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739164068;
	bh=0DU1lW0OzqBKiYkfpzAiSmzVXvZR8o2Im4Sez63qh3g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hPpKWy+eYnHl1rehrAqFpQqwScYXLmjJ041HUn2dU9SUZ20gL4PJwIDPXlj9OtszF
	 CyZ6DckAwybcvqA2FdGBURVgQH3GTY3mJgHhF80WKUyU2LjS0mSq0zrgErBKyQgKx8
	 yZecBA/UWg+OWcKUerL+8rF8XY0z171jKjEd2soE9uCKFLxMzhvaW3LbbXm2YsOLLR
	 b65yYih7qNY9+St/gGPoWVLBWmKmk3GXMWGGgfRUV1ZsMtF7/5troNqdR5T2N38z41
	 +yL9H7rsvXPsTFKSC7lZzk2IhjAVQMZLZbz8j04Qur0aaaSermgfwLHArLLbqTlHZK
	 JPGLfHkKW+D7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yrsyr1fByz4wbR;
	Mon, 10 Feb 2025 16:07:48 +1100 (AEDT)
Date: Mon, 10 Feb 2025 16:07:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Feb 10
Message-ID: <20250210160747.4db5c984@canb.auug.org.au>
In-Reply-To: <20250210152940.1bff8e43@canb.auug.org.au>
References: <20250210152940.1bff8e43@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=M7vtFD.FdynQRZMxf.zzzM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=M7vtFD.FdynQRZMxf.zzzM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

There will be no linux-next release tomorrow.  Sorry for the short notice.
--=20
Cheers,
Stephen Rothwell

--Sig_/=M7vtFD.FdynQRZMxf.zzzM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmepiaMACgkQAVBC80lX
0Gxw/ggAlHmC5Vz3DjHbPmqBR05MSm2ApE584JYAVqHKy4KFlW5SwLnvfjP3zRMc
oWl3/4ePpFTWAI1jjH05lZAWo7+iH5i/VEK1R2dbwsMQsX5/soSVg3D/oIjFt0eO
UTaq9sEibed/WzsRVGEEuyaXlbNBIZh4B/W7iyW3rcvJiiDh1KA15gP3zFAtLDfT
tp2gfEakXinNLSf+d8im1W5ytkmDsq84f1/H96ufNFH2BSSiD4uapjHoW5DUuoes
cVLwnfGWl3wUvjM3pInO+AzMiKDTDdzp7G/sl2KMd5LajY8SCuicpRw79UmfSWEj
qg2RDYhdRd6o/i+SNGKvzD7RZLBwWw==
=FMVI
-----END PGP SIGNATURE-----

--Sig_/=M7vtFD.FdynQRZMxf.zzzM--

