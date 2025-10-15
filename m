Return-Path: <linux-next+bounces-8602-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DEEBE0DF9
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 23:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25E1F547CF5
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 21:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE6F2D24AC;
	Wed, 15 Oct 2025 21:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="THNiNvxi"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF63226863;
	Wed, 15 Oct 2025 21:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760565217; cv=none; b=YJ9Lq1yfLuc/0ZnetsEoIzTGA6BVqg6ECW+IUsmJQ4NrIA6Nyt6D68VszGj93w4OvCPSfxTMOF5g1LP8y0i+Tel56RUW3CX0qjgDkfeGRoxmqW4qboZiTzf0IcAqiml+ywVlWdSifB0Gv3VAZtfOFnfY7n2CqgjWC0YeANWtZUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760565217; c=relaxed/simple;
	bh=vqqYmwW/qB7w/dAAFgMDjUeaNmw05d6FAFwNJXgCpmA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h7wjjXv3+2Ty4S8kogMFfPTI/H56wWthU+6ZCzfxW8kNG8v8FwQOWjr5c9hl4wgSZ6fFqTSP0xw8nvq2+/cuirIEkZnuxw6KaxRNlZlRwjRNamCpVL2G5DjGLsl5dGn87jSj8ighTi9SklRRcLgcw/2cpkwSyqGhlQv1ZwJU3h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=THNiNvxi; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8F6B040B34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1760565214; bh=RYhF06pFtI4vtm/AMksQCSyoyLIJFqOu90ym0QRg0Ww=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=THNiNvxiQx9TvTwJTasCKwMRjz6fCvessJf7ntMmGAb9TBeHW/Kx9F9hhY7ONMO+B
	 QhuiXVf8NpOQb1oKoRli4O1mwkjcmld+svaPuv3ziMBmBTfMIZnLZF/7Wx2+HB6PKK
	 mchCfvznMyWqaTRKKKWQS/VkCYWk378jz92RWWyHswFswT6YsBa3JQjkQ2G6dWz2Pm
	 6EFmJIKhxd//hogsL62NnQM0vH4CEkMSVdlasaKqDVFakFce6Jr+kwiHtWDY2gslWN
	 hTzZjeBVirwlUHuDxTGo8xm0iCIVzCFmhQh3F4rR6E/AW57zb0vUE/scCLdzC3Fh1c
	 W0EbOk+aL+5DA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8F6B040B34;
	Wed, 15 Oct 2025 21:53:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, linux-next@vger.kernel.org,
 broonie@kernel.org
Subject: Re: docs build problems
In-Reply-To: <20251015184416.4340e8f2@sal.lan>
References: <c9e9134c-97a2-405a-918d-41aafdd92fa1@infradead.org>
 <87sefj7tom.fsf@trenco.lwn.net> <20251015184416.4340e8f2@sal.lan>
Date: Wed, 15 Oct 2025 15:53:33 -0600
Message-ID: <87jz0v7rxe.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Just did a rebase. Those patches are missing:
>
> e2c3ba36aee2 tools/docs: sphinx-build-wrapper: -q is a boolean, not an integer
> 0ce66e3f9c8b kernel-doc: output source file name at SEE ALSO
> 9b34d25a58ae docs: Makefile: use PYTHONPYCACHEPREFIX
> d5da902cc340 tools/docs: sphinx-build-wrapper: pdflatex is needed only for pdf
> 1cad2682b785 docs: Makefile: avoid a warning when using without texlive
> f0a4ad647aad tools/docs/sphinx-build-wrapper: allow skipping sphinx-build step
> fb4771ad4ff4 docs: Makefile: fix rustdoc detection
> ed7faec0095d tools/docs: sphinx-build-wrapper: fix compat with recent Tumbleweed
> ab7dde2453af docs: conf.py: get rid of load_config.py
> 8f421d0c327f scripts: remove sphinx-build-wrapper from scripts/
> 9a20d16551af tools/docs: sphinx-build-wrapper: handle sphinx-build errors
>
> Want me to re-send them?

*Sigh*

I forgot to pull the build-script branch back to the desktop machine
once I got back home, so I was missing everything that I applied while
on the road.  That has been rectified, and the needed patches are now in
docs-next.

My apologies for the screwup.

jon

