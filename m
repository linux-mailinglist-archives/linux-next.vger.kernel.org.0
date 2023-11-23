Return-Path: <linux-next+bounces-48-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB087F68F2
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 23:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F12A7B20A9C
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 22:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA9F2F868;
	Thu, 23 Nov 2023 22:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKMxBFRS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BCF2E82C
	for <linux-next@vger.kernel.org>; Thu, 23 Nov 2023 22:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F3AC433C7;
	Thu, 23 Nov 2023 22:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700778019;
	bh=7fbNeoSMHGpALMDdzLxM+bodY1JGWwrIvuAaw9hIlVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKMxBFRSCbc1AhzJCTfyxCJGH9spH6AU5XXJT/6hmCckYdBHdNEQFIm9yeYjY6T4R
	 xSqnbMlvgV98aEbiEWOxVf88Ma50ve43eOWjuafrNDaK5nx5f+AEPaVJdOhvgbFwic
	 JEyDNn1gYA0qVPxCAee08U/D/pA/yExlMNVnoAxED6qsOQjeKFDkGcOQR862sR+W4F
	 EMuwqkzFrl7+3SfTn3cMAylMFPWj+QwZvyETBSYpCiXNguDN6Lgr0YcvXGEzNmnhQ9
	 KR132/cjSFM9rdXqUid9d59MzYdmyP7w2+wlLRNGFa7GVv9lERIf+XKs/5A0b1AAsz
	 mXPAe2zOnCSZA==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 73F1B40094; Thu, 23 Nov 2023 19:20:16 -0300 (-03)
Date: Thu, 23 Nov 2023 19:20:16 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the perf tree
Message-ID: <ZV/QIFsBVmn8BXKJ@kernel.org>
References: <20231124091458.535a0437@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124091458.535a0437@canb.auug.org.au>
X-Url: http://acmel.wordpress.com

Em Fri, Nov 24, 2023 at 09:14:58AM +1100, Stephen Rothwell escreveu:
> Hi all,
> 
> The following commit is also in the perf-current tree as a different
> commit (but the same patch):
> 
>   a399ee6773d6 ("tools: Disable __packed attribute compiler warning due to -Werror=attributes")
> 
> This is commit
> 
>   57686a72da08 ("tools: Disable __packed attribute compiler warning due to -Werror=attributes")
> 
> in the perf-current tree.

Yeah, We're in the first phases of versioned co-maintainership and when
I tried to test perf-tools, now being maintained by Namhyung, I noticed
a problem that had been fixed on perf-tools-next, that I'm maintaining,
so I asked Namhyung to cherry-pick something slated for 6.8 to the 6.7
tree.

- Arnaldo

