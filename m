Return-Path: <linux-next+bounces-8540-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 996AEBB4669
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 17:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B8B319E3EBF
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 15:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CE6230D14;
	Thu,  2 Oct 2025 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dTXq6h0R"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C409460;
	Thu,  2 Oct 2025 15:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759420242; cv=none; b=flX2IzuznlLFKzso5QAj4nhNgpkq1O4F+22y3A/FlBHL9uHbeOX6XB2OUcLvkmoIRozvXJHlI5r4ms/cSQSfhRJ6rVsNBHyFDxBAL+7K8+u3/3OvIwIXWD4yTBI88W5bJXDavVrNzT15wh+Bl1uXzYT5Gd6HKlJE5MNVd/ggsEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759420242; c=relaxed/simple;
	bh=6j7P7D3ZdZkPkhxVe8Nmu9oVhF1XG9K7nmEmMeTv89Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ihsTNyF0tk5HOlF4VpKOdL48vd3qZg8WIeZEs6gUzPgV0XC9HjWGLwWIW4sGTlh0TaJGZ4MN6nfg+FzHK06FHm/SaXX08AR1BtrZryq1piP8c4vTHoWd9W7s+XMt/EGdAqa/YoqnpdH8dBvYgRRI4GLomCSn8M33iRDOxeocl0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dTXq6h0R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7144CC4CEF4;
	Thu,  2 Oct 2025 15:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759420242;
	bh=6j7P7D3ZdZkPkhxVe8Nmu9oVhF1XG9K7nmEmMeTv89Q=;
	h=Date:From:To:Cc:Subject:From;
	b=dTXq6h0Ra/+xNtrMd5p0t7ZbW6GK2Gg3LNaKclFlMIBLBZP9ZF4awXNbzjhEzlWMp
	 aGd6rQrdbjngzSFRuUj+skIV67IgNMgtWNe+BZbd5dq1ryx9qh+L+RIVLwoX3PMscL
	 xUlTdniBZHM+AwqBvAAauRQw4Cf9y0zC9nlLkT3jIjJvEQDlrAcaXB80OIY9lRg8Dk
	 iAKjppuV2/ItAobjY9iOHmXpqIsR8SszsaNOsYjnaqYU6E6qpjkFOaSN/kH+DmkF2S
	 ubOCPjMpI9Y2qB9VwhPp63/gnolPoe0NONfC2OX30E5vap4BLAue73pjRnJkUZ+mEF
	 SOF+u726FRkuw==
Date: Thu, 2 Oct 2025 16:50:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ftrace tree
Message-ID: <aN6fTmAjD7-SJsw2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EwFsy2jw2jwPnioe"
Content-Disposition: inline


--EwFsy2jw2jwPnioe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the ftrace tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/kernel/trace/trace_wprobe.c: In function '__register_trace_wprobe':
/tmp/next/build/kernel/trace/trace_wprobe.c:176:20: error: cast to generic address space pointer from disjoint '__seg_gs' address space pointer [-Werror]
  176 |         if (IS_ERR((void * __force)tw->bp_event)) {
      |                    ^
/tmp/next/build/kernel/trace/trace_wprobe.c:177:35: error: cast to generic address space pointer from disjoint '__seg_gs' address space pointer [-Werror]
  177 |                 int ret = PTR_ERR((void * __force)tw->bp_event);
      |                                   ^

Caused by commit

   eaa7b0b3b9875 ("tracing: wprobe: Add watchpoint probe event based on hardware breakpoint")

I have used the version from 20250929 instead.

--EwFsy2jw2jwPnioe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjen04ACgkQJNaLcl1U
h9Cf8Af+PZ5qUtPpN6WMrntSRp4SaSZ6DHsn5zGJeJ0STwHBYxYHr7Jrt/d6JLpI
B7gyOe6NtBb3IREl2+awUs3fVj5D48OJLtH9+5h//XBgafZuu6b21l8yLt3KUrjs
FuzQqcdL7CelhM8timPwZWNxOCnzJYDVgKcfV/6LcaFNPzKZmgJIRMxc3tHwM+so
cN+0se8C5kAEdX/VlCsTyZ8oYeKlB5I7ZcOkOm1mjcZ2x8YrZ3OAAp4p67NKZaZ/
CsBN+HTU79z/NrsJ+xDPU5m81ClLAlGObLeJxKtv/qHAq8OWICW7dHZXdbFj8UWR
09UBeXJiDJXO51MVj1RK02olT7ym5Q==
=+1z9
-----END PGP SIGNATURE-----

--EwFsy2jw2jwPnioe--

