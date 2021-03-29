Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B54C134CCF0
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 11:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231490AbhC2JXQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 05:23:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:54964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231587AbhC2JWv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 29 Mar 2021 05:22:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15BAC6192E;
        Mon, 29 Mar 2021 09:22:49 +0000 (UTC)
Date:   Mon, 29 Mar 2021 10:22:47 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rich Wiley <rwiley@nvidia.com>,
        Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Message-ID: <20210329092247.GA6556@arm.com>
References: <20210329092940.6363f0bb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329092940.6363f0bb@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 29, 2021 at 09:29:40AM +1100, Stephen Rothwell wrote:
> diff --cc arch/arm64/include/asm/cpucaps.h
> index c40f2490cd7b,9e3ec4dd56d8..000000000000
> --- a/arch/arm64/include/asm/cpucaps.h
> +++ b/arch/arm64/include/asm/cpucaps.h
> @@@ -66,8 -66,8 +66,9 @@@
>   #define ARM64_WORKAROUND_1508412		58
>   #define ARM64_HAS_LDAPR				59
>   #define ARM64_KVM_PROTECTED_MODE		60
>  -#define ARM64_HAS_EPAN				61
>  +#define ARM64_WORKAROUND_NVIDIA_CARMEL_CNP	61
> ++#define ARM64_HAS_EPAN				62
>   
> --#define ARM64_NCAPS				62
> ++#define ARM64_NCAPS				63
>   
>   #endif /* __ASM_CPUCAPS_H */

Thanks Stephen, it looks fine.

-- 
Catalin
