Return-Path: <linux-next+bounces-8143-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D90B3B554
	for <lists+linux-next@lfdr.de>; Fri, 29 Aug 2025 10:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7D615641DB
	for <lists+linux-next@lfdr.de>; Fri, 29 Aug 2025 08:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6752222C2;
	Fri, 29 Aug 2025 08:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZbow2as"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EC019CC28;
	Fri, 29 Aug 2025 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756454499; cv=none; b=KG5v9XXli1K71v3hHkaO11h5h97ivwa2+K669N92S2AYwrmYQoywiWI8d/EoDUzncMS61gWbeuqOrjg6Ky5ZRW7tiA05ZABJyINCt4oUHiOCSsCXxekH6GcXJhJoH6obWPtF3+CdSG7h8QQK1EBYMW73YynPR2oNtTGNnicXB9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756454499; c=relaxed/simple;
	bh=JsqSYUFY71T/FozS0NYvmOp7npQw+HrhzSRNRp5JVCI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=iSUinavgaWuel5DIvgpiOxAl3b34Qr35Aej7CZbiOr/bG8YDwtSyfUyfOOqyyfsrFT+EXp4/7wYGNRzT9wXfiZfV5SMKIQgjcQVyiqCaihtr71yy++pf4EBPFmTloyenI+uylmtrv+MAqGe8xDyBF23xcs5Dpa27PVZvKdwLS4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZbow2as; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EE6C4CEF0;
	Fri, 29 Aug 2025 08:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756454498;
	bh=JsqSYUFY71T/FozS0NYvmOp7npQw+HrhzSRNRp5JVCI=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=lZbow2as6el92Vbw1I33IWpZPr5TY2TotYichgG3/9fDybdxNE4idD41qglrSrGJw
	 qM6NW/rpfbTfdWZ6ABMeq0KRItNiVkvWbGfwx49Ds9WIbzJzqL9YW+nr+y4eVpfZjF
	 6O9z6dxwgbXRx/ga1m7jTW//0PiL5RXXi/6abvlDxFFztSATnN7X7tMCq5M6l+UHRb
	 HLACyGyr9t7TFWihKt9tmcZmnqS3KHliJilubUhjSsbyZtoiosdCaSGyJHWr1hannD
	 4ciZwl2uVaRXE2HtOIWge99Pzs+wjLqB3EDG95cgcGhdgl4/jJ8M7DLFUye2+0qNoJ
	 NfV1MAzBz3QZw==
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Aug 2025 10:01:35 +0200
Message-Id: <DCER5JXJYKB0.2FVV3H6S55YQN@kernel.org>
Cc: "Simona Vetter" <simona.vetter@ffwll.ch>, "Alice Ryhl"
 <aliceryhl@google.com>, "Intel Graphics" <intel-gfx@lists.freedesktop.org>,
 "DRI" <dri-devel@lists.freedesktop.org>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
References: <20250829122343.4b31642f@canb.auug.org.au>
In-Reply-To: <20250829122343.4b31642f@canb.auug.org.au>

On Fri Aug 29, 2025 at 4:23 AM CEST, Stephen Rothwell wrote:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/tests/drm_exec_test.c: In function 'test_prepare_array':
> drivers/gpu/drm/tests/drm_exec_test.c:171:1: error: the frame size of 213=
6 bytes is larger than 2048 bytes [-Werror=3Dframe-larger-than=3D]
>   171 | }
>       | ^
> cc1: all warnings being treated as errors
>
> Possibly caused by commit
>
>   e7fa80e2932c ("drm_gem: add mutex to drm_gem_object.gpuva")

Thanks for reporting!

Unfortunately, it didn't happen with my configuration, but I could reproduc=
e it
with a simple allmodconfig. I've send a fix for this [1].

[1] https://lore.kernel.org/dri-devel/20250829075633.2306-1-dakr@kernel.org=
/

