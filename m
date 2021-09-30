Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB41641D072
	for <lists+linux-next@lfdr.de>; Thu, 30 Sep 2021 02:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346071AbhI3AJA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Sep 2021 20:09:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:37608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233873AbhI3AJA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Sep 2021 20:09:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F561611C0;
        Thu, 30 Sep 2021 00:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632960438;
        bh=qUQiW9EvGbciV6pPB+J4tZ9pRgoJph2I7kInJhXrQ10=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fpAp8C0itnmO4U0UutnjRb8wCHdDP84Vadbo6IDf721Peojnyra0QkqgUiOBn5nFW
         Ju1hpMnDTOJBRc2rqq1aZd1c5cmiOelphzePf4i00/jer+kSGuS0jvkmGyS62EUhhj
         nXsjO7U/nNYGtiAZ1YP6sawnABjfrkKq+kJKUJUkJmdfbSih6jXDUXi2wL3id6m5g0
         bBzdpdUzUFu0VENquxrbS1kKFoMJVgjsgKDFNR4SvAc34q6XaIqOwGtvzx0D79nfyp
         9ea7+e7H5GbVwEk9ZhIKK3oCY/YueckgbwAFh6WauRyKlwrQxopOROr+2fOgiUJd6z
         ZYAinJAt26hjA==
Date:   Wed, 29 Sep 2021 19:11:23 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20210930001123.GA358774@embeddedor>
References: <20210930095932.03434a3b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930095932.03434a3b@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 30, 2021 at 09:59:32AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp-gustavo tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/bpf_verifier.h:9,
>                  from kernel/bpf/verifier.c:12:

[..]

>       |                 ^~~~~~~~~~~~~
> include/linux/filter.h:366:4: error: cast between incompatible function types from 'int (* const)(struct bpf_map *, u32,  u64)' {aka 'int (* const)(struct bpf_map *, unsigned int,  long long unsigned int)'} to 'u64 (*)(u64,  u64,  u64,  u64,  u64)' {aka 'long long unsigned int (*)(long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int,  long long unsigned int)'} [-Werror=cast-function-type]
>   366 |   ((u64 (*)(u64, u64, u64, u64, u64))(x))
>       |    ^
> kernel/bpf/verifier.c:12977:17: note: in expansion of macro 'BPF_CAST_CALL'
> 12977 |     insn->imm = BPF_CAST_CALL(ops->map_redirect) -
>       |                 ^~~~~~~~~~~~~
> cc1: all warnings being treated as errors

All these are already fixed in bpf-next.

> Caused by commit
> 
>   ffea83dd8823 ("Makefile: Enable -Wcast-function-type")
> 
> I have reverted that commit for today.

I've just removed that commit from my -next tree, while I
take a look at the ftrace warnings.

Thanks!
--
Gustavo


