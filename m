Return-Path: <linux-next+bounces-9475-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD05CCE028
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 00:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12A0F301C951
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 23:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37362F39CF;
	Thu, 18 Dec 2025 23:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I6y4OWGi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F290A1E991B;
	Thu, 18 Dec 2025 23:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766102259; cv=none; b=huNHcpS3GT27+fRe71IsSjaUKuT740Lst3boSU/aHz1uXr6UEVuTsLrwg+Rp3mCm+DgW2/pj7GU6vtFK1XblorT/XH9pw0K65cPQTn+JT+efc0K/MQ4S/7EMg/cZEmwSVLf3zB491FsX40DUEekhVMiLVVf0jHjZJ5potrcwe/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766102259; c=relaxed/simple;
	bh=N83fQ1V/uAfnhvMLJtwJNEoKy81kdtDZmjcwq18G/Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7N5h6lo/fttq5EEHKEPGqTNxXqt1maAu8bPA49vSABlkGgnTXabWG2siKjwkOg7TJw1RwXyCU2/cKM90vP5tV2Wzu8i1QkdFSn4l4ndc7GEYJfCPv2T68Lkhi3JkvwCSRb6trRQgKcGZYY8eS0FsT3eReu0JA/jpofvdukm1R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I6y4OWGi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766102253;
	bh=vrSeew+tm9BXWSrtoYScXhNSqwu40mWihL6ECFz4J84=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I6y4OWGi9bwKc/+xCa47RxacWbBJSpX96ujS93FHh2TfzUFXIXE5nd3BG36bL70Wp
	 hM40UWWwjTGOAh2lL+ftWrTqI12HBWvsefeMNYwifwkYBE23jnyChheTbigCUrjJFZ
	 1Hw6lzT8dVluR7KMmE/U4bmErNLAlaMGuK+kI+dSvhF4yZscc3NcZcs6WIdnLel+9G
	 CmWidYRSfpxYuctplwOpO6An+KMeArbr/YDg27Y4IT84b6W0NNWA0a0ZPjMwnABosu
	 tFrRF7esWhZDRtDDsRTg/AzfNAfFd3U5BFneswaZFsKbAxMY/qmIAwwPovnT1i4FAm
	 9XpsuC4tAwffQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dXSJr1LFDz4w9j;
	Fri, 19 Dec 2025 10:57:32 +1100 (AEDT)
Date: Fri, 19 Dec 2025 10:57:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Andreas Larsson
 <andreas@gaisler.com>, Christoph Lameter <cl@linux-foundation.org>, Chuck
 Lever <chuck.lever@oracle.com>, Dennis Zhou <dennis@kernel.org>, Dipen
 Patel <dipenp@nvidia.com>, Gabriel Krisman Bertazi <krisman@collabora.com>,
 Ingo Molnar <mingo@kernel.org>, Jean Delvare <jdelvare@suse.de>, Lee Jones
 <lee@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Matthew Wilcox
 <willy@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Oded Gabbay
 <ogabbay@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Tejun Heo
 <tj@kernel.org>, Tyler Hicks <code@tyhicks.com>, Uwe =?UTF-8?B?S2xlaW5l?=
 =?UTF-8?B?LUvDtm5pZw==?= <ukleinek@kernel.org>
Subject: Re: linux-next: trees being removed
Message-ID: <20251219105730.256a7a57@canb.auug.org.au>
In-Reply-To: <87zf7f4aw9.fsf@mailhost.krisman.be>
References: <20251215184126.39dae2c7@canb.auug.org.au>
	<87zf7f4aw9.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K0iDqNQT_ROGS=4fwYVwYg=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/K0iDqNQT_ROGS=4fwYVwYg=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Gabriel,

On Thu, 18 Dec 2025 18:40:06 -0500 Gabriel Krisman Bertazi <krisman@suse.de=
> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>=20
> > unicode			2024-10-11 15:02:41 -0400
> >   https://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git#f=
or-next =20
>=20
> Please, preserve it.  There is not much work going on in fs/unicode, but
> occasionally there is a fix and it needs to be in linux-next before
> reaching Linus.

No problem.  Easiest way to keep it is to update it to each new -rc1
that comes out (if nothing else has been added to it).  But I will take
it off the removal list for this round of removals anyway.

--=20
Cheers,
Stephen Rothwell

--Sig_/K0iDqNQT_ROGS=4fwYVwYg=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlElOoACgkQAVBC80lX
0Gzu7Qf/d7oaX27mg+wLyJ/kZ0Hg2/5akVTLo0k1aaim8CStlGlK7Ihe4ZFdPagZ
QewE2HPmDew3u2EYP/7aTM+FSPl1qZyU52knAF7FfXqeNzMUTM3Bp8u4JiqteKET
KB3vnDOAA+Glr8OZvatUuVpsoCLk+I6t6qsTnN2kr32wfy+OyTp9+uwbOFZeJ9Bg
tSkwOsSoFzqEKuEpvcUT0Dcb1QyZcMJnt17fwyrTPdDDS1Up+HIzMSfGwvQ/X/JP
V1XQoW8Xk0ov1a2iFEMnkNyMXH0Z2CmvAC9KyUx3IfTQvYNB7eQ7f81SteH3xyS5
rqZAkhdtkIURAI1uOWiSmDHOSiJw2Q==
=Wh2k
-----END PGP SIGNATURE-----

--Sig_/K0iDqNQT_ROGS=4fwYVwYg=--

