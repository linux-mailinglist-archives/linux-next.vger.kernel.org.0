Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DDA53B240B
	for <lists+linux-next@lfdr.de>; Thu, 24 Jun 2021 01:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbhFWXoN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 19:44:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:39604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229812AbhFWXoM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Jun 2021 19:44:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40BB3611AC;
        Wed, 23 Jun 2021 23:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624491714;
        bh=iKHrbK2LLQgN0Vdey8aEtJKullSH9rF7grmndIc1hdY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GsX1V/vmv/e6V3h7NTdfNlp+jfqOcZGm3yVnqd3kI1/3zE72MTKA9bBbIj7kv1+j8
         zcPkeIsOT370uT2evCiRmEA+HPJJtffjEISbtB3/8karSfOmlVN4tZdpOtj/+8Gm2K
         W1XZfEL6OCprmSI00HPByWVM/xPHRWS8mRhmBUPqLEPdyIp4QzhK7oBBUphieUIbAu
         Os3ijOSqu7fw/kUPclFm+rYsG7SqEmTxQA4uOfnjqhK9L5iSq1q+GKuBjepkJ7IONk
         ptBVQLXKevt8gOFZi1R/3NqWLoTE3Cf58EjJQAc2nr2gJXz0gTfWv8G5r9So741Iew
         K88cgu6YBRioQ==
Subject: Re: Build failure in -next
To:     paulmck@kernel.org, aneesh.kumar@linux.ibm.com
Cc:     linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        sfr@canb.auug.org.au, elver@google.com, ndesaulniers@google.com,
        clang-built-linux@googlegroups.com
References: <20210623223015.GA315292@paulmck-ThinkPad-P17-Gen-1>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <5b55b544-67de-871d-465c-af3c8be203c3@kernel.org>
Date:   Wed, 23 Jun 2021 16:41:53 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623223015.GA315292@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Paul,

On 6/23/2021 3:30 PM, Paul E. McKenney wrote:
> Hello, Aneesh!
> 
> Yesterday evening's next-20210622 testing gave me the following
> kernel-build error:
> 
> ld: mm/mremap.o: in function `move_huge_pud':
> /home/git/linux-next/mm/mremap.c:372: undefined reference to `__compiletime_assert_395'
> 
> Bisection landed on this commit:
> 
> 257121c5aabe ("mm/mremap: convert huge PUD move to separate helper")
> 
> I have no idea how this commit relates to that error message, but
> reverting this commit on top of next-20210622 really does get rid of
> the problem.

This was reported by Naresh Kamboju last week:

https://lore.kernel.org/r/CA+G9fYsWHE5Vu9T3FV-vtHHbVFJWEF=bmjQxwaZs3uVYef028g@mail.gmail.com/

It seems to be related to the fact that older versions of clang cannot 
figure out that the HPAGE_PUD case in move_pgt_entry() is never called 
when CONFIG_TRANSPARENT_HUGE is unset so it is not eliminated, which is 
problematic because flush_pud_tlb_range() evaluates to BUILD_BUG() in 
that case, which is called within move_huge_pud().

> The following reproducer provokes this error:
> 
> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --torture lock --configs LOCK07 --build-only --kconfig "CONFIG_DEBUG_LOCK_ALLOC=y CONFIG_PROVE_LOCKING=y" --kmake-arg "CC=clang-11"
> 
> Run the above command in the top-level directory of your -next source
> tree, and using this compiler:
> 
> $ clang-11 -v
> Ubuntu clang version 11.1.0-++20210428103817+1fdec59bffc1-1~exp1~20210428204431.166
> Target: x86_64-pc-linux-gnu
> 
> Thoughts?

Aneesh had a patch in that thread above that would resolve the issue, it 
just needs to be sent to Andrew for a fixup patch.

Cheers,
Nathan
