Return-Path: <linux-next+bounces-5334-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85878A201F9
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2025 00:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E18011644E9
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 23:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D511DF98F;
	Mon, 27 Jan 2025 23:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCMwsfGE"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2DF481A3;
	Mon, 27 Jan 2025 23:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022180; cv=none; b=Y0f4a5IOcGyt0FS/Pf7fW8yoDRTVbKb1ttX6C44rUafycGlDEwCo+5NXcDVjm+xNoMFdvgOMJk0NeFqTbz3cqQ0wUFaz6MFCAPFR+PYMOZg7QetEU0+g+X1eLDW9xkdhNrf6MGsoNGkyvepP6vj/7HpzfKujs7o+mOtc0DB/evk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022180; c=relaxed/simple;
	bh=eDB1XHt16yKba92lbcPIXLSm/tl9VODDxjIwrGmbhb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h7+q9W6b6XsA2GqIxbThKk1/wJUHv6+GXaWcytJs7s8pGmZnGEHMTIxlFmaGYYNXKZFj+lxhhl2vK2G4qbcA3WfHchok5I9yLdmCiDsTWzpnVKJ5Y0btFrNpj6HijYIqyfvLkTrRgGE1oNMXHEzzIr1hjxFTQrjF/PR+2UjOdjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCMwsfGE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F4CC4CEE0;
	Mon, 27 Jan 2025 23:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022179;
	bh=eDB1XHt16yKba92lbcPIXLSm/tl9VODDxjIwrGmbhb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cCMwsfGEu++juGjYpL/ACyPyh6d63nK9NfrHisPtlDqdt9/HRZ62ZBI0OrwBiYf3q
	 A+fVemYenqE2ecK2O6g8yqBaXSPkEbwJJM2sh8Nzok/SXEWZXEtZGnXW5U40VYtemW
	 FfQ8lcZtsN4N2XYMVgOCXSqiXETbybazGUOxAb4cF52OZhRp0yFvXvOTxgkQCJ0ZGN
	 kQq4brl43OFctGluCrwSuY2h6EtepxlC2Ta90IyRu59lZPUVFUg+A0uJc8EgNvlLWN
	 FojInWIyKFnpDWA0OtD5ypGWze1V1SY4EAYvgCLzj08BQN9Zp/hmekg7Pzov2LYjKk
	 BvwllKqMkxggA==
Date: Mon, 27 Jan 2025 15:56:17 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Ian Rogers <irogers@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the perf-current
 tree
Message-ID: <Z5gdIQmCuHACmI-Z@google.com>
References: <20250128081222.0e16ae68@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128081222.0e16ae68@canb.auug.org.au>

On Tue, Jan 28, 2025 at 08:12:22AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   191f1bd6492a ("perf annotate: Use an array for the disassembler preference")
> 
> is missing a Signed-off-by from its author.
> 
> Looks like the SoB was after the '--' separator in the original emailed
> patch.

Oops, sorry I missed that.  I'll force push with SoB soon.

Thanks,
Namhyung

