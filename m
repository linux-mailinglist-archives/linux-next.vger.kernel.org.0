Return-Path: <linux-next+bounces-3877-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F8E97A688
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 19:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E4D61F263E2
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2024 17:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42454158870;
	Mon, 16 Sep 2024 17:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iguana.be header.i=@iguana.be header.b="urL8RVFW"
X-Original-To: linux-next@vger.kernel.org
Received: from infomag.iguana.be (infomag.iguana.be [185.87.124.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFAE15852F;
	Mon, 16 Sep 2024 17:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.124.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726506831; cv=none; b=Csjf+qTR+30VpcA/9ZO/MUijvnIpel904Ih2yIoBld/P0fN6fYnKV0cUVWleIhKvlGWe4Y7MHTkKbKmrQ7Q+gfwHOaaJ7fuTwZKB/qXNOmWCGkEoST999oMnP3F0hbAC2/6IK/YSJnO1zQEOAUtm/7s+XgY8zoaQENN6X7giNdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726506831; c=relaxed/simple;
	bh=bs6H9LVoKvWDPryXbzuVFI1ASqkGV4XKUggrjo3zfiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQ142duhRaX9Mf7+zzTwOay+qKbl5Qy2VdpMtiTi7vNFFA80gtW6H0TgByI4qVH/PKoLjtECKwnPNnfM7LQCsu8+QY/bmJ8AXu4Q8vHhs93MkfPUrBWJhpz9HiCrbw6mclkFPju9/qtjbl30KDuU1owHkFteqcC+WePXuJkAWjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iguana.be; spf=none smtp.mailfrom=iguana.be; dkim=pass (1024-bit key) header.d=iguana.be header.i=@iguana.be header.b=urL8RVFW; arc=none smtp.client-ip=185.87.124.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iguana.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=iguana.be
Received: by infomag.iguana.be (Postfix, from userid 1001)
	id 7045F603CACE; Mon, 16 Sep 2024 19:04:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 infomag.iguana.be 7045F603CACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iguana.be;
	s=infomag-20180602; t=1726506269;
	bh=bs6H9LVoKvWDPryXbzuVFI1ASqkGV4XKUggrjo3zfiA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=urL8RVFWwZBSYYBubkVtaJaoukvFNMA0k+tDNNxUixT17/Fl63ksNXcAiG2WgKXHk
	 90/txqQl78F+T4Up2uOASzJ9VP9MtBveoj/HPSS8Sj5Kk+HwDACZzuYfwAiQweHZpZ
	 rxnYNOGWRHb/l3jIcLeJiWQ/9WlZpuLtoWFCIQts=
Date: Mon, 16 Sep 2024 19:04:29 +0200
From: Wim Van Sebroeck <wim@iguana.be>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rob Herring <robh@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the devicetree tree
Message-ID: <20240916170429.GA16395@infomag.iguana.be>
References: <20240916160127.60a93bdf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916160127.60a93bdf@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)

Hi Stephen,

> Hi all,
> 
> The following commit is also in the watchdog tree as a different commit
> (but the same patch):
> 
>   0a543ac529fe ("dt-bindings: watchdog: qcom-wdt: document support on SA8255p")
> 
> This is commit
> 
>   f051e2e409d6 ("dt-bindings: watchdog: qcom-wdt: document support on SA8255p")
> 
> in the watchdog tree.

Patch removed from the linux-watchdog-next tree.

Kind regards,
Wim.


