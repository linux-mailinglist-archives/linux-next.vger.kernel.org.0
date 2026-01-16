Return-Path: <linux-next+bounces-9685-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CFED31154
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 13:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDBC8304B3D1
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 12:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0940E1DB13A;
	Fri, 16 Jan 2026 12:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGXZ96ng"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D815C1C6FF5;
	Fri, 16 Jan 2026 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566518; cv=none; b=J5GRHb1jyiFcIloStht41FuPiDlLDOdO7xC6TKKMRnHZ2PuoTktZHQH28GoAhJkbg3RQdUD9Nb79Q1k5L0yfIEzjqeqTYLVHAgdYft/xTIp4BjbzahUL3zz5L1kJ8eq/Aeece6PmDwzLy81F50QferPFFOwF0Hb6mhBpqrtPGM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566518; c=relaxed/simple;
	bh=6HzBixH6+p35Y7WPz6yMWz3jdK/WGoyCkox4foufLT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pZivQ6EfD6t17aDJpE1qmRgBTCBW2AHROQXo3WAMlNpzne5Z6M9vAYxxRvQGYFN3Dh3VSqqZVaU3CVFWJ3EOmk5TZRuYHyIFV2tSfNqIO4HAhWAQKabxpMEU5kzABSVp0mVEsJq3UNgCG+ywok7v3FnEIt1HhR7NiR4LyTRbL/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGXZ96ng; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E622EC19421;
	Fri, 16 Jan 2026 12:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768566518;
	bh=6HzBixH6+p35Y7WPz6yMWz3jdK/WGoyCkox4foufLT4=;
	h=Date:From:To:Cc:Subject:From;
	b=HGXZ96ngIUBpxIW26PstbvJ90QrYvRiA8M+QyGMihEMcQzec3n+cGTSZya8eoxw1d
	 TTwOJoAV+xAih+xvxXDWmwXW+4/E2PG8Tmbn8mtgOCFdpav8MMnB10Qprzk13FAFTw
	 06yL6GGn+rPY5m8RQLLFFGKZa9YiJSibd/uluOdAzG6TYhK+osyKj5ESSl1a0UhfMG
	 1TzCXk0DTI5tnE025av/t6I+D6LlD1ZgG2QIali6ZGwALO/EQPp64FUjgBehnFDxot
	 Or7Pupvt66L5BPWo/7koaAYkluChBNQWLlyQ0Y48FSqvY5N7CMkNFVZVk73jv/uHjK
	 lIQAJxlYiUYQg==
Date: Fri, 16 Jan 2026 12:28:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Fixes tag needs work in the tip tree
Message-ID: <0fe6b4c2-373f-4b26-a878-6bd686c55d67@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vAmK+WMzMOzgBIr1"
Content-Disposition: inline
X-Cookie: I've only got 12 cards.


--vAmK+WMzMOzgBIr1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

In commit

  69044a0cbfdcc ("x86/uprobes: Fix XOL allocation failure for 32-bit tasks")

Fixes tag

  Fixes: 1b028f784e8c ("86/mm: Introduce mmap_compat_base() for 32-bit mmap()")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

Thanks,
Mark

--vAmK+WMzMOzgBIr1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlqLvEACgkQJNaLcl1U
h9ADJAf/cJCZVnFFQaLDrwvWYVzwTVwyQx1eRwbf9SK0UUv3d5pUNhK8pO3Ne1E+
vkwokYzrlGIaIPxDvNobn5VmCi4ptYPE8FP+jE1voo0EEZZP85/Hk2CPgD8a36v5
SlcwOnmXJpDybMMbUlOw6NDQblXsNprFWPHFxD3VXY4T8LOcOTT7e2yFufFmjiaW
aMdaCBYN+0UDW3DOHtPmb8YH6SgpjW/7LAl8j2Xoi2UdFmJI7b/9RMu45rOyTJDr
1owbX7r2cynI1PJY+9vbKmMvegJ500ebKrdQ1OquQDFyEdoaJktf9vNQbzX3yNRN
afC3iSiOQYkTMkNmEvVsAI+mY5Uxqw==
=B438
-----END PGP SIGNATURE-----

--vAmK+WMzMOzgBIr1--

