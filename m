Return-Path: <linux-next+bounces-2314-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 414738C6014
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 07:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1F5BB209AA
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 05:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04503B297;
	Wed, 15 May 2024 05:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kJtNYsd3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F8F3B28F;
	Wed, 15 May 2024 05:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715750005; cv=none; b=fYs4Qda6WT47xDPuAM6358DW0/AM7C1zov+B+jbVsT0QyDrL9tFQm3mbNb1fFb55E4w8LogShmStRV2rkpHwUCV04wRvJHZtzEIOnDDHLDUHewKA+pHcXcCjq76DZuYFSbXQwqyov+2EkWSMFMrer7vmv68i/aG+Qd50X/pk10M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715750005; c=relaxed/simple;
	bh=VC5Tcqurx4qfoJsddCUfvfus1NHt+g9/aur4I7+jmkE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M+4JZOfM1iynKXwghcYsJ5EG98wvvaDhTqMWUurbxJ+pm/TpWsXerN3rxFcLjMkHwnmbBuZdUEtSQtRGgwn06VIzlpBgakmo/TsG53DCql5IlgyfYrmqSINxUBqbtdowf/CeD8RvHf608RNyoBhxaaV6+8wY8y9cFE6nKwpIK9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kJtNYsd3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715750002;
	bh=qxDWmJU5OsVyx3dB+gbPm2icDF+NP4AkHk6ljS13CV0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kJtNYsd3va8DvNkhaSmAv554B5szCYJJygEjwllWoBS52MBq0sQkfV1Fa5bAck1NT
	 SvhzZG82x74KrefDLCA9zo8Tq4PlRQcBbF3zzZ0QHhEzvdeXpeGsLE8V+uv7NcQP/O
	 wKSHv5Rf22Wit0Gty9Q2vI05ixat5gOLOGFFL/aWOwFZ/3OFSMz6fmQ1sSt1v8a2cU
	 nLNJ4tCJzVgOTYoVb6uF8lrHHyy6+zxbZIhCn/jTtsy96kLFyHqbatqdyudSYmKukZ
	 COOmVNr1T+M+e/K5LKQNNrizpQ6H7I1bP4SKu76HjlCco32/iUOclbhpz8tckZkLzF
	 +ouHT2+eoeP+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfLwK6Vlkz4wc1;
	Wed, 15 May 2024 15:13:21 +1000 (AEST)
Date: Wed, 15 May 2024 15:13:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the ftrace tree
Message-ID: <20240515151321.08eed1b1@canb.auug.org.au>
In-Reply-To: <20240515151114.3a3c541e@canb.auug.org.au>
References: <20240515124808.06279d04@canb.auug.org.au>
	<20240515151114.3a3c541e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oEVjgmnGGQoGk1UFj.Txz0p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oEVjgmnGGQoGk1UFj.Txz0p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 15 May 2024 15:11:14 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
> This became a build failure on my powerpc allyesconfig build, so I have
> used the ftrace tree from next-20240414 for today.
                            ^^^^^^^^^^^^^
I meant next-20240514, of course.

--=20
Cheers,
Stephen Rothwell

--Sig_/oEVjgmnGGQoGk1UFj.Txz0p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZERHEACgkQAVBC80lX
0Gwuzgf6Aga+YLRT4n+i6nAtULLC4WLFx5KhqqOQxqkNO0fpSGXe8TlPd5RwZpB/
KqcUpdIP9x6MSUFlkEB+kuBiSpPFpURsK6TrcSba7UuN9PgKhzEPVrmtf/pdvaLr
UQlNhe2V/wcdPAGzUoihJn7NnUUdTBPaczqsXnNBeyL9VPKh2JjOR5gupZtuc6rp
VQ7JvXnuTiIpY+ach+bSGBSKnP5u+f/bpCUM0AfVXs8EP/yD7M/WB+WpOpb0jVsu
7UplgE6GFlBvCtvGQLGuzZ1p/GyG7GJAyrn4SqSucxoqBD2MsLCC75njOqY9g1y5
nbQoCPSDnO4jsLL20H3ifl3RySMsHA==
=OXUG
-----END PGP SIGNATURE-----

--Sig_/oEVjgmnGGQoGk1UFj.Txz0p--

