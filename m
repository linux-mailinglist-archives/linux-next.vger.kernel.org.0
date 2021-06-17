Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 748B13ABB23
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 20:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbhFQSFE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 14:05:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:43024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229972AbhFQSFD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Jun 2021 14:05:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC61561241;
        Thu, 17 Jun 2021 18:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623952975;
        bh=fcHJRF+HkDvnIqayIlyJg+KA7dLX7hNwPHMpsiYp03Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pT7MmJp04q0a1YmU0Q9w5QFKIXr18Znz39NDDpzPBUSZabZOlALqxHXtHdV/m1ebc
         P7wQPiegEviQb0zFiQ5FHFsNcmEAivSeKnNrXfqRXZFi3b2ozOJM2hnrExcwDUUE2K
         4VhteZg29OWN1IthoCRAM5CJNYKbmqTE/veRMbA76lz3QQAgsEwIGO+lkCcMn8jHyM
         vLxKzJXXpBD3RvlFSxPKaHzzO6y3iOzG5ybLmoQke+aIJHbLnZtPTjRjxqoF4MQOh3
         4F90jcmKKhZ5pIk3f/7so+RahCpv9eUm3LTJ8Rem2NgbANQ/jdXymYHs8QKc17qMue
         mnjZ8lBWhP1wQ==
Date:   Thu, 17 Jun 2021 11:02:50 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-next@vger.kernel.org, clang-built-linux@googlegroups.com,
        lkft-triage@lists.linaro.org, linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [next] [clang] x86_64-linux-gnu-ld: mm/mremap.o: in function
 `move_pgt_entry': mremap.c:(.text+0x763): undefined reference to
 `__compiletime_assert_342'
Message-ID: <YMuOSnJsL9qkxweY@archlinux-ax161>
References: <CA+G9fYsWHE5Vu9T3FV-vtHHbVFJWEF=bmjQxwaZs3uVYef028g@mail.gmail.com>
 <CA+G9fYvvf+XTvZg1sTq4_f9OrVFsCazGo0ozaEbjVYgSeKCkWA@mail.gmail.com>
 <YMtTdU2b9fI3dnFD@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMtTdU2b9fI3dnFD@casper.infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Rebuilt the CC list because most people were added based on the
incorrect bisect result.

On Thu, Jun 17, 2021 at 02:51:49PM +0100, Matthew Wilcox wrote:
> On Thu, Jun 17, 2021 at 06:15:45PM +0530, Naresh Kamboju wrote:
> > On Thu, 17 Jun 2021 at 17:41, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > x86_64-linux-gnu-ld: mm/mremap.o: in function `move_pgt_entry':
> > > mremap.c:(.text+0x763): undefined reference to `__compiletime_assert_342'
> > 
> > The git bisect pointed out the first bad commit.
> > 
> > The first bad commit:
> > commit 928cf6adc7d60c96eca760c05c1000cda061604e
> > Author: Stephen Boyd <swboyd@chromium.org>
> > Date:   Thu Jun 17 15:21:35 2021 +1000
> >     module: add printk formats to add module build ID to stacktraces
> 
> Your git bisect probably went astray.  There's no way that commit
> caused that regression.

My bisect landed on commit 83f85ac75855 ("mm/mremap: convert huge PUD
move to separate helper"). flush_pud_tlb_range() evaluates to
BUILD_BUG() when CONFIG_TRANSPARENT_HUGEPAGE is unset but this function
is present just based on the value of
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.

$ make -skj(nproc) ARCH=x86_64 CC=clang O=build/x86_64 distclean allnoconfig mm/mremap.o

$ llvm-readelf -s build/x86_64/mm/mremap.o &| rg __compiletime_assert
    21: 0000000000000000     0 NOTYPE  GLOBAL DEFAULT   UND __compiletime_assert_337

$ rg TRANSPARENT_ build/x86_64/.config
450:CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
451:CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
562:# CONFIG_TRANSPARENT_HUGEPAGE is not set

Not sure why this does not happen on newer clang versions, presumably
something with inlining decisions? Still seems like a legitimate issue
to me.

Cheers,
Nathan
