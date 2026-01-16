Return-Path: <linux-next+bounces-9682-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C12CD30EFB
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 13:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 930D4303B1B7
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 12:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E140638944F;
	Fri, 16 Jan 2026 12:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+F8sllC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBA238944E;
	Fri, 16 Jan 2026 12:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768565641; cv=none; b=VmFVofJAZibCOEgvUVeDh2ptoalCfiXdjQvF2uf0TutGWx/KOL1M6JxG5F7LvV+xZD8v+s8XXosxQiPFBZYhmLG3L2UF0iqtchVpfQ/nbYXNoCmoxaQJgnoLMuLbPVTbv3hMXDApZbBirje1LYDJ26Acxbo37StcpuIPW66DfdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768565641; c=relaxed/simple;
	bh=PMtJTAbm8kt/j/Vy4ICBtlkyhZ1ldOsVgQrKTeYUVjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pz9R0LH4CWfOlZGoQP7VoFD6OsgJZPhGp+KtiWO5dJlD4x87O7amZqkC3kmzqiW2wF7wpiYK4KT/seOIlZHostOqLbaXTg2JnV2Z6cLhRot0UMueY2b2UKDqdBxVPhvASZb3Q6PJFpWIH+Z95Npcdzo44BM5ooBpZEpTt+OkvO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+F8sllC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DE7C116C6;
	Fri, 16 Jan 2026 12:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768565641;
	bh=PMtJTAbm8kt/j/Vy4ICBtlkyhZ1ldOsVgQrKTeYUVjc=;
	h=Date:From:To:Cc:Subject:From;
	b=p+F8sllCuoW+sH8o515TSYt+vCIp588zQ8YJtGvjO9ERP1FwfMpNDqZDo673tFdee
	 rg9Ne41gurAYvtE8XUNbx1OnSDV5c9Jg1HhWj+p2+fP8kWST6ob66sV11AxKF3qJB0
	 wlXcuW9gzjH/72MkwA7yv8SGeQNxH8zidSjzhgaRBJfQy6B4Ji6DsUAeOVOTBx+148
	 gFz9G4ynK3XTi8UkuBYzNWBlJA1MRP+JQgmBJzyUDQ4A2IobNYTOHc/75aKM64jPu9
	 PIvj+8qAssW/+H52Kc8yDf8hd+4SSFVgwrSTF4/6EXiEowpycW9wBFVUWOe1EsYUCG
	 Wvvma1CMcqPbA==
Date: Fri, 16 Jan 2026 12:13:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Missing signoff in the loongarch tree
Message-ID: <f09d2255-5f3b-48df-a0a6-04c5345c680d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0OW/qJ/onYnfRKqI"
Content-Disposition: inline
X-Cookie: I've only got 12 cards.


--0OW/qJ/onYnfRKqI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Commit

  9421b1777403a ("LoongArch: Fix PMU counter allocation for mixed-type event groups")

is missing a Signed-off-by from its committer.

Thanks,
Mark

--0OW/qJ/onYnfRKqI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlqK4UACgkQJNaLcl1U
h9DlMQf9HN9WSEXg4qi3Mcqdm/l9FnVxPiMvOg4Z4t9OUDV5G4MlSvOyDdB+2RId
y0j12K9LcTEm81P5zgQ2Oxnec25gRQdGKJejI+PjuEvJ8EF9ZF0U+GocLM5f2I8D
LNdAX2hkii6WeFO9fcTmfX4IQvxIvcRizYUHSdzacFzLD33/5l/qKi0z3qUgmvhx
REibWEjYw8qO23uDAi6PYa8ugqimbA5p0ujMVM6WyRGw7Lzma4x/VOe4tnQOCnyQ
LWxe0I0zIgHJMaH6kyIvciu6YMz9jIze+7CiszL5o2xG/TFtWhkWe/fZ+Jz3mYDN
hUyyXYLYJokOhBfJWpe0LAPVh8Ejng==
=eWKh
-----END PGP SIGNATURE-----

--0OW/qJ/onYnfRKqI--

