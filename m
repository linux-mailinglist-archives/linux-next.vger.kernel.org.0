Return-Path: <linux-next+bounces-4786-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 857609C8346
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 07:40:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4983A281478
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 06:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4411EBA1C;
	Thu, 14 Nov 2024 06:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Yg+AqnXx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279101E0E13;
	Thu, 14 Nov 2024 06:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731566405; cv=none; b=l9Q+JBd51pUH04K0QpfA2FTZg55dvCzXnHochBXjq2mZ8iL+u7h+8FVOawWkIcdtqwgiBq0lAfgXHwSUkmeB64Ccb0EAHX46emQQx2RLrel0IdpP+qn0C+mW5XfpqixXRp8CMbN/KaCU6/yaaWoaNo08RA1ecvLoll+D+u6QjK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731566405; c=relaxed/simple;
	bh=dOUCaWPK1D+zorbowizKIDt566IMDdrWJOcPF3XCiws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Qw8VQG2lstk85b/0js4vPJVQmORDDwIe7F2X+xACsWuASfbYNfKeqV0ttWK1BqSg9QsCVY34Z4ueUEBQk2UOMxmXkFuBNwoMJmZKapyh4af++lqTWB5D0CplsXdsOuhC92KQCr9TYsCo3MS8qVuUSAKjXfivBuzeEaCj5VZMCAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Yg+AqnXx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731566396;
	bh=YleiJNYL5eXW+jEREvFEwpoCjupq1xMfDclSi4Ksdkg=;
	h=Date:From:To:Cc:Subject:From;
	b=Yg+AqnXxXOpMjI5KqHt8WP2JgfUQ/LYRZxSZDsxZxUJwt/WEC4krnsdZfxovrNJqj
	 lvAiDx/Cs5/y63+os1aieZn3fZ0HSbmlxm976cQd1gaZuR9KsOjrObvfv6y5lBwnRl
	 NxuTjcR5oWfFSjvda7vjOMQzsQNi4yc9A7do/wrcYF8XMNhwTY09atV0ubZzMXoBlj
	 RUeV4vlTlb34eOznJc2JQ3Gpu/NlRWPQWxLKf09RFgdRxklu79Jx945sHAOzlt6cEK
	 8PcwFLCxJcE9/cga6UxjHQHAzRIEnSYcEfdI3uQXesPGez2qK8t4wGanNcJYuMLb/V
	 5zuD8TtjTeYZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xpr9m2qfZz4wb1;
	Thu, 14 Nov 2024 17:39:56 +1100 (AEDT)
Date: Thu, 14 Nov 2024 17:39:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoph Hellwig <hch@lst.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the configfs tree
Message-ID: <20241114173958.6cce33ce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D+PmA0WGjZf5..qFSCqD3kZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/D+PmA0WGjZf5..qFSCqD3kZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a591497f6b3d ("cpufreq: intel_pstate: Rearrange locking in hybrid_init_cp=
u_capacity_scaling()")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/D+PmA0WGjZf5..qFSCqD3kZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc1mz4ACgkQAVBC80lX
0GyGDgf7BZIZWqWSO+HS3h0Hr01i7ewEnZeKrvDQSVPecbcPiXLtbozI4cEWpShn
VsOfb1PLkJHT/oc8Kc07EQceFCqRBUFLk5Kd8LryDYhVV41xfQPSR+X+Mfvjjedg
CaTPrbOOhEU4hngGyNDop12ijQlgAOxgykkjwPeyoUupp7MmpTUl38lwDkC1pK1f
kO85vlSedUahX1A3QeP5+Tpxld/vSmH684W9GLYzHijS2rreny7AVA0GRL/WmIuQ
3pLIYy4Tg8qkvmKi7EzAwiIuQji60DKnWWqDt4hoqcPNg5KjhuQzx98vU2+53WGm
eE3tEJYZAp2QKbBxrZfp0PuuUYwLPw==
=DaRF
-----END PGP SIGNATURE-----

--Sig_/D+PmA0WGjZf5..qFSCqD3kZ--

