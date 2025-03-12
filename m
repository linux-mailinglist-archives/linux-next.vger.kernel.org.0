Return-Path: <linux-next+bounces-5777-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62159A5E03D
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 16:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3034C189480C
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 15:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABBB91D5CFB;
	Wed, 12 Mar 2025 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Yyt9NHql"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F53F1422DD;
	Wed, 12 Mar 2025 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741793093; cv=none; b=jDx7bGw4ggurCqgKpzyP4a3WTl3bMV/oK/DTwL5ywj9G2n5xHleJO4AiwX5yf5nE5Daf4O99v/pRcijQSP8VWuw+wpCASZ+qzegfJYGgkPcV4pGGVPY3DSh+/H16LtF9n+5Ycmc4myqTJajwJf7OTbQaD7DwRWGGyq0GA3bPHgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741793093; c=relaxed/simple;
	bh=mEoDUVPPutgutXY1Vzi7nEKf5bB8dmOAKFe3iaVICh8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rotdI9FCLTMhlON5HPnSw6xMop0ueqKLCMHmBLX+5BLL4u0Fb7kHTlBfCBe0sVVXmrBcG6Plz+nQG2KnHCT/mME8UFdT536cvjk+96EKWbUpgCm7fXcGbkv/8vRR5OEvaUWnppsWjL7XJr9hcFxHmiXmHenPJTbSXrPArigk7Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Yyt9NHql; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC20BC4CEEF;
	Wed, 12 Mar 2025 15:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741793092;
	bh=mEoDUVPPutgutXY1Vzi7nEKf5bB8dmOAKFe3iaVICh8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Yyt9NHqlBvi1bxR3t/vaSfVWiH3aX6Rxmw8yamzc2tohbz9cqewH3+lFfn1e1LtAv
	 +LFoi2w+EEGEGofpMQeB2/uXTCQv1DxwRddH6e+LQFAevPYVMj6NSWufjidBw/jlf5
	 w1oivhJ2Ud/53c+b9jKofDEQAmqGJVJVx4UGlWGw=
Date: Wed, 12 Mar 2025 08:24:52 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wei Yang <richard.weiyang@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Shuah Khan <shuah@kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-Id: <20250312082452.604def384a3adf379625cacb@linux-foundation.org>
In-Reply-To: <20250312113612.31ac808e@canb.auug.org.au>
References: <20250312113612.31ac808e@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Mar 2025 11:36:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the mm tree, today's linux-next build (native powerpc perf)
> failed like this:
> 
> In file included from arch/powerpc/util/../../../util/pmu.h:5,
>                  from arch/powerpc/util/pmu.c:5:
> tools/include/linux/bitmap.h: In function 'bitmap_alloc':
> tools/include/linux/bitmap.h:83:69: error: unused parameter 'flags' [-Werror=unused-parameter]
>    83 | static inline unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags)
>       |                                                               ~~~~~~^~~~~
> cc1: all warnings being treated as errors

Maybe we should turn off -Wno-unused-parameter for tools/.  The rest of
the kernel extensively expects that unused parameters to inlined
functions are acceptable, for stuff like this:

#else /* CONFIG_SWAP */
static inline struct swap_info_struct *swp_swap_info(swp_entry_t entry)
{
	return NULL;
}

static inline struct swap_info_struct *get_swap_device(swp_entry_t entry)
{
	return NULL;
}

static inline void put_swap_device(struct swap_info_struct *si)
{
}

so why do we make tools/ different?

