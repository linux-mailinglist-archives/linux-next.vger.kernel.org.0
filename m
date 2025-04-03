Return-Path: <linux-next+bounces-6153-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6F7A79BF6
	for <lists+linux-next@lfdr.de>; Thu,  3 Apr 2025 08:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7AD83B1989
	for <lists+linux-next@lfdr.de>; Thu,  3 Apr 2025 06:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A761624E0;
	Thu,  3 Apr 2025 06:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c6mDfxlh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE9828FF
	for <linux-next@vger.kernel.org>; Thu,  3 Apr 2025 06:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743661788; cv=none; b=UssG51PdbB84wnwc8K20sLqvfBV4sR/3ckL291ujjk5POjnLa7RsH4n47Voq5vGKTAqeYHF3nbHWFpRab8bwRQvPxAFsC8HUHTlzGtGCdudRBbPp4MPu/i3eoW0olbsWQfBlIERi+f8QIUZPLzKu3i5dKFhQA4P8nJ8C7PpMP1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743661788; c=relaxed/simple;
	bh=3VMJD9M4qwwCZAnuMeXC+JixiDn1kJwilDGaeSamM6M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWEpbZBEwzMPLGjWWPMwDRwPKvcVxxvSWB6GypeVYVz9gHrGsx/HzBXN+jGQ/f/OAdkM1FwdZ4rTJvzJx6GoTCJCAcQnEANw4vOLqF1+/DxAIDCCkB9E5GHA1ZFBxawgF3i62cHdhTbXWpRGb57wMBQ7FdmkYjDkomgt6a0Keuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=c6mDfxlh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743661781;
	bh=3VMJD9M4qwwCZAnuMeXC+JixiDn1kJwilDGaeSamM6M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=c6mDfxlhkscF/au++bbbYVWEDfE5JmC9IBB9JnPw2pd3+sQ3TBByr5mPJhTBJdnBp
	 vQfoab64e5gEfywL1z/4GVsdK9tLkIrAQixkWOfrFbUZgmdo6beyJcbQGmhgNhm+XR
	 /gwkLGwSd11+VLjo18vpzjSg6mki2liBpJqVHSNrJPio8Cr9ZHWCny8kh+5f58PamH
	 v8iTWSlbpc5vGN1baFhtSjPWLLbMGFU35z+WZoDjALY/HX5HI98SYeECpsq0zYGpXg
	 KFVEuTNy+cynEJyw0fxfGjvRJmnZUyxkDnPvyc53iSbW06jzYwhJRcqzP42xr4M/gy
	 gCSH/vVEnqNBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZSsKJ5899z4x3p;
	Thu,  3 Apr 2025 17:29:40 +1100 (AEDT)
Date: Thu, 3 Apr 2025 17:29:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Linux Next Mailing
 List <linux-next@vger.kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: Please add powerpc topic/cxl branch to linux-next
Message-ID: <20250403172940.3224efe9@canb.auug.org.au>
In-Reply-To: <878qoiht4k.fsf@mpe.ellerman.id.au>
References: <87y0x3dibs.fsf@mpe.ellerman.id.au>
	<20250318002643.71ef29f1@canb.auug.org.au>
	<878qoiht4k.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=VNAbOBBRZ0a4lxNf0yen0j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=VNAbOBBRZ0a4lxNf0yen0j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, 03 Apr 2025 13:32:43 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> This branch has been merged intoo mainline, you can drop it from
> linux-next. Thanks.

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/=VNAbOBBRZ0a4lxNf0yen0j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfuKtQACgkQAVBC80lX
0Gy2+Af/YKjP118KuxHZJ5MQag78XZYte7irr12ssyoYNvksOz93QaTMZ/pFWo3G
J5o+Wn2CNWficMbtfZaFJhtnt3vIwZ9gMeoySj77MP5w70SnIGxOXPKDZIusbira
qZsMmLFC/dsVOqoCjaCc+2fPMCo/aAOHjeEU0ku9s8uwbCAUFKJA9ocMrTqQkev+
X82RKu9+J3tfb/Ahs+pKzKA8PBZpLO3+HZs+UqwgmW32FxZQB2I+SP8HtHwvg/ew
mDpluCEAxxh3Px6qQ1caA22D/iu47kqSsSUVKdWP3825rYCutd13a0+dCK4HRABs
D29wbveCEMCup3R1yOLHEmoWabcd1Q==
=/p0+
-----END PGP SIGNATURE-----

--Sig_/=VNAbOBBRZ0a4lxNf0yen0j--

