Return-Path: <linux-next+bounces-6188-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1829AA818F0
	for <lists+linux-next@lfdr.de>; Wed,  9 Apr 2025 00:46:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5420189C75E
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 22:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84987225779;
	Tue,  8 Apr 2025 22:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R8fvGUFs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB241EB3D;
	Tue,  8 Apr 2025 22:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744152411; cv=none; b=oCF67TvVxCGc0xkD+L0U+O7E8OVyS+wfxl/TB6ZL+fNLhll5W4v4px/k1pPUN0ZJ9bcNPlb40AbQA+tX0YwOoer2Doxdg3KXAfw0Rkm/73pUnW3U/Vxiy7T52Bbf2zxYAR2+fQj+Mz5mA3tkDfVQWivGOpJVWDXX2eJNDX7YX9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744152411; c=relaxed/simple;
	bh=2rIRJJ4S/TayJ4+nUYIORtcvDK6OxWOcGP6Kkkj7PNA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OGT4F6VKBzsdnsxc/GO80JOsyPkub2JQ+GcQ+gY7JL3UaruosFq2SFF+JktFy6In0LzXdl3DE5LAigxUbGbSwrykozNo+UshnSWhDeBospC+mDXnatXWpfuYhb/+037HZqRWS9xP6V9c/NsDO2mlEPzZB3sYYcqkhlnWPTFiyek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=R8fvGUFs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744152399;
	bh=2rIRJJ4S/TayJ4+nUYIORtcvDK6OxWOcGP6Kkkj7PNA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R8fvGUFsOVl6uXNandNtMPaQ04Ue899DwkjMyQPzH7lRfiUeWaU45WC227fUHEgP1
	 bc1zRagv7StnKg9KmYzBicImWyhftDah5CJQ+HPDhyyTc0rTC/eMsLTGWvvJ6qR0Ge
	 uDLR17cE3JYfN30SHDJl3mJZyqCxWQgpuMgltmK7T1QPjt+PSE0N529VytVnK/AdF8
	 vsLf9xbUxoVUj8k10ZGGyFHtTjzAHFBoeFXCdkv8xRbLoXIgt6hsrZHNsE34X5Uu7j
	 EhOGlg89DKTL1axQ7/StZ94ciSn+DQSQxC5YFglOutVs0EN7TJAv9sVY0dcRxaWzzl
	 hKNGrTb8x/fKA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZXLmG6lj2z4wcn;
	Wed,  9 Apr 2025 08:46:38 +1000 (AEST)
Date: Wed, 9 Apr 2025 08:46:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Jeff Johnson
 <jjohnson@kernel.org>, Balamurugan S <quic_bselvara@quicinc.com>, P
 Praneesh <quic_ppranees@quicinc.com>, Raj Kumar Bhagat
 <quic_rajkbhag@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "ath12k@lists.infradead.org"
 <ath12k@lists.infradead.org>
Subject: Re: linux-next: build failure after merge of the ath-next tree
Message-ID: <20250409084637.3bd593c6@canb.auug.org.au>
In-Reply-To: <4ae387b2-0dd7-413b-b66c-1f136455e23f@oss.qualcomm.com>
References: <20250408105146.459dfcf5@canb.auug.org.au>
	<Z_R2lEVjqn2Y3_sP@gallifrey>
	<20250408113747.3a10275a@canb.auug.org.au>
	<26cafcbb-6a94-40ab-aabf-3c9943cfb925@oss.qualcomm.com>
	<ee51a503-6580-4f46-aa38-77f1b9ba6535@oss.qualcomm.com>
	<4ae387b2-0dd7-413b-b66c-1f136455e23f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JWrGHgMrQN9liPrMPP032YR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/JWrGHgMrQN9liPrMPP032YR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jeff,

On Tue, 8 Apr 2025 09:17:21 -0700 Jeff Johnson <jeff.johnson@oss.qualcomm.c=
om> wrote:
>
> On 4/8/2025 8:23 AM, Jeff Johnson wrote:
> > NM. Since the timer_delete_sync() API is already in my tree I can make a
> > one-off patch for this. =20
>=20
> please review https://msgid.link/20250408-timer_delete_sync-v1-1-4dcb22f7=
1083@oss.qualcomm.com
>=20
> I'll wait a bit for any tags to accumulate before I merge into ath-next

I'll use your patch in the ath-next tree merge today (if necessary).

--=20
Cheers,
Stephen Rothwell

--Sig_/JWrGHgMrQN9liPrMPP032YR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf1p00ACgkQAVBC80lX
0Gx8eQgAjxao8xiJ/KRusfbqLlrG/SC2w8+UCR3vkg7lzBVX4g6YhXhfEJ/+T5dd
grSvabJh7Rj4c6NIr0FGjdFJJGf7Ho2XHlfVHKRmqlb/L5MUNn1dygTy5SG3cVf/
7Pt+Ca3Mb9Sp+nwHMXqGHs0zXIesOEMKGTi/xHth+CCmlChdPL2/VyXG3t0uJVs3
C9daLXeFes/N8CMTBOjYnN71LetG+4jnLAwZIy23IHMzXymtB4QXiZzc3S9zfdxr
DyYCbhEtCJ9BOCYn3Kcc/x9jTGQ8ECmTDQijaCKE+rAZRxI2+nFPPk8EUdqqwuA1
XOgDITwe7jU+zkLEF+IYjzvrs0BLzg==
=z9yf
-----END PGP SIGNATURE-----

--Sig_/JWrGHgMrQN9liPrMPP032YR--

