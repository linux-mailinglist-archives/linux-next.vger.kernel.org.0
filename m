Return-Path: <linux-next+bounces-8532-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 349B0BB3B61
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 13:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1B7D3AF84C
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 11:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771C630E83E;
	Thu,  2 Oct 2025 11:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/LUfL1/"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA342EC099;
	Thu,  2 Oct 2025 11:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759402874; cv=none; b=qlZBuSyEYrOh6LseEukbuw2KExkwi/32pgcuvBblRmqfxD6SIjCE9PWz9xegunE/1LhOh7iyd93VZgKRhTr7OwqogJ9I0/vOacgdAJOtACAIa17snoaMwGbQEU0fxs/1Th2ZR9Rqcu+N0CYdJNw4bcGCtGy3R10T3iYf8hounRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759402874; c=relaxed/simple;
	bh=pk/48UpRrRa23Lf9Q185/Cp97Z1r5/8ZUJ+++SzNE7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fgQPanDHsyE5j//txQDmxjkevK055cnfLLLM4HLtvycflxCTQcUg1dC3lXOzO5Rl86FiFUrJNIfiNigFu3tZOib26JrRnnhryq0YKuHfAHCohN1x86betgik+/aOmGmi7X7NqdG8MjPtr2b0g+q3yCxsQbogldArXW1gIpywhIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/LUfL1/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB561C4CEF4;
	Thu,  2 Oct 2025 11:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759402873;
	bh=pk/48UpRrRa23Lf9Q185/Cp97Z1r5/8ZUJ+++SzNE7Q=;
	h=Date:From:To:Cc:Subject:From;
	b=X/LUfL1/tVKVOhuFUToJeN5laqK+81jfuEDXwYMTv7P+AJ5lVIwYtWuLjXWM0EDNh
	 98zqHbLSG1q8UlGP+p/YwE0KZHtjr0TtGtFQVmCtLQbv+8ETfb8hQ2rjFEc3YIx3Oh
	 iDQXQ/1ubsHu+6UmUxea+X30GShHnEkTlF9xK0snpqjum1vbh4LiOLlRlp1V5Cl7+a
	 OrRbsO+23EglyaL7GMyqJ+ZkTr7dkkUtOpActA2ViolDC0l5cyUSNW1XqmGZDbbabd
	 NmvDOsh3bJ5yX8J6Wl0W/yDCV93NhQ3hMd82MPfgRyWYpLbx5Bu+unberpxHSonRDA
	 oswfGi9ioW6Lg==
Date: Thu, 2 Oct 2025 12:01:06 +0100
From: Mark Brown <broonie@kernel.org>
To: SeonGu Kang <ksk4725@coasia.com>, Ravi Patel <ravi.patel@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org, Linus Torvads <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the fixes tree
Message-ID: <aN5bct_vDSzAfcnu@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v5Xs/sG2VZotuRqT"
Content-Disposition: inline


--v5Xs/sG2VZotuRqT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's build of Linus' tree (arm64 defconfig) failed like this:

In file included from /tmp/next/build/arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dts:12:
/tmp/next/build/arch/arm64/boot/dts/exynos/axis/artpec8.dtsi:12:10: fatal error: dt-bindings/clock/axis,artpec8-clk.h: No such file or directory
   12 | #include <dt-bindings/clock/axis,artpec8-clk.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[5]: *** [/tmp/next/build/scripts/Makefile.dtbs:132: arch/arm64/boot/dts/exynos/axis/artpec8-grizzly.dtb] Error 1

Caused by commit

   b176376991772 ("arm64: dts: axis: Add ARTPEC-8 Grizzly dts support")

I have reverted that commit for today and also

   639f8e36baf1c ("arm64: dts: exynos: axis: Add initial ARTPEC-8 SoC support")

which depends on it.

--v5Xs/sG2VZotuRqT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjeW3IACgkQJNaLcl1U
h9DzDAf9GiyXv8FJAoxRJVlXJrWK6CxqOzFfXB4qLZDUvqskCDxJGl6ysr6yF9y0
1mneINDuO1pWD8IHwNmMOh9rXfyAccEWfe74hlqkEZef6YpI+KLfNOOTypit8kZc
eF2zMXlcjyW6u7sgo7W6PVEbCRx9UloGm9+T9jf9w3UBdCHbg/4ZodFzaRB01dDG
pryWfxLfbcZtRHlxTLqWXgEQdfuCA1EOBCTMY+HJiiUuhVorbzjCslT7VyhGhvbb
nckfP196bwhn8sP46gcG0fjv8XqYdRESLJZsNBXaB9+xc/6fre7RjlVV2sO/k8dG
HOKYi0kcOPzgHkFlWKYdOBQWciJiUw==
=sigG
-----END PGP SIGNATURE-----

--v5Xs/sG2VZotuRqT--

