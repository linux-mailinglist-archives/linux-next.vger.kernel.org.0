Return-Path: <linux-next+bounces-379-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E076810D75
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 10:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DFECB20AF5
	for <lists+linux-next@lfdr.de>; Wed, 13 Dec 2023 09:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01C4E200A6;
	Wed, 13 Dec 2023 09:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+wSfpP+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC081EB5A
	for <linux-next@vger.kernel.org>; Wed, 13 Dec 2023 09:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A085C433C7;
	Wed, 13 Dec 2023 09:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702459862;
	bh=RfT+HyZlBrFmrD9bF0uzysYjggRfcTVD2hDTBx97azQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+wSfpP+zXKQ1yX2JYdqVSWuPTx0qd83yS2kmrP/IlJIgD78K/z2Ql/lwdae3v3R1
	 ANOwICCDCkP14EWxNEMcdRHHFGNt2NasGhU2nxWvIs184l7dGJdWBE6motxv2GV15R
	 7fezrUJ13hLW/mEsxZ2rmiAYLzzTn0tC1Rb3jcEchJ0VDo/nTmExiVRKQG5sFM0FSD
	 shMkpIwI/TqhcfCoPpPpAoRdlBvh07Qba4HtanZgRKGLZvsC8bvDQWtTukwSPx9KaV
	 nN0LO2eT9QV4VXANsvkt1Z+ylVZ8m4BXIo2F5ryFwpHzdN2sw19F9P+vJ4bi35q5Kc
	 HbSglkY/HywmQ==
Date: Wed, 13 Dec 2023 09:30:57 +0000
From: Will Deacon <will@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, james.clark@arm.com
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the arm-perf tree
Message-ID: <20231213093057.GA31075@willie-the-truck>
References: <20231213100931.12d9d85e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213100931.12d9d85e@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Stephen, [+James]

On Wed, Dec 13, 2023 at 10:09:31AM +1100, Stephen Rothwell wrote:
> After merging the arm-perf tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from drivers/perf/arm_dmc620_pmu.c:26:
> include/linux/perf/arm_pmu.h:15:10: fatal error: asm/cputype.h: No such file or directory
>    15 | #include <asm/cputype.h>
>       |          ^~~~~~~~~~~~~~~

Damn, I tested with allnoconfig, defconfig and allmodconfig before I pushed,
but only for ARCH=arm64. Thanks for reporting this.

> I can't easily tell what caused this - possibly commit
> 
>   a5f4ca68f348 ("perf/arm_dmc620: Remove duplicate format attribute #defines")
> 
> I have used the arm-perf and arm64 trees from next-20231212 for today
> (since the arm64 tree merged the arm-perf tree).

That looks likely. I'll try reverting it and see if it resolves the problem
locally.

Cheers,

Will

