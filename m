Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDC817589C
	for <lists+linux-next@lfdr.de>; Mon,  2 Mar 2020 11:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgCBKrd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Mar 2020 05:47:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:37670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbgCBKrd (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Mar 2020 05:47:33 -0500
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8497921D56;
        Mon,  2 Mar 2020 10:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583146052;
        bh=dIm/8ZZbZ/vIbNAl5/mRzUMYkjtj7nHnXCU8Ya7cEEk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NOQO/NZtL0iQxyV8FJpHMBe0DIw5gIywHkUiNL/Mn4PBX9uRr0W402PY+xkr1Qkz7
         CA1Uurs+XJw02igcsNJ54u+hPE2rXZmpKut4qZ70A27HW8lnlUll7fz24dzO3LOTat
         K+ar5QSV44POmbLSAi4E4Tm7sd9XpmI83PztLP3Y=
Date:   Mon, 2 Mar 2020 10:47:27 +0000
From:   Will Deacon <will@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        anshuman.khandual@arm.com, catalin.marinas@arm.com
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        rppt@linux.ibm.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>, lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        suzuki.poulose@arm.com, Anders Roxell <anders.roxell@linaro.org>
Subject: Re: Linux-next-20200302: arm64 build failed
Message-ID: <20200302104726.GA7995@willie-the-truck>
References: <CA+G9fYtAM-m0jygud+i0ymU+XknV9_GcAbDQChiD2NZjvQ+D3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtAM-m0jygud+i0ymU+XknV9_GcAbDQChiD2NZjvQ+D3w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[+Anshuman and Catalin]

On Mon, Mar 02, 2020 at 01:58:26PM +0530, Naresh Kamboju wrote:
> Linux-Next 20200302 arm64 build failed due to below errors,
> Suspecting patch causing this build break.
> 
> 87d900aef3e2  arm/arm64: add support for folded p4d page tables
> 
> Error log,
> -------------
> arch/arm64/mm/mmu.c: In function 'unmap_hotplug_pud_range':
> include/linux/compiler.h:284:1: error: incompatible type for argument
> 1 of 'p4d_page_paddr'
>  ({         \
>  ^
> arch/arm64/include/asm/memory.h:270:45: note: in definition of macro
> '__phys_to_virt'
>  #define __phys_to_virt(x) ((unsigned long)((x) - physvirt_offset))
>                                              ^
> arch/arm64/include/asm/pgtable.h:629:42: note: in expansion of macro '__va'
>  #define pud_offset(dir, addr)  ((pud_t *)__va(pud_offset_phys((dir), (addr))))
>                                           ^~~~
> include/linux/compiler.h:293:22: note: in expansion of macro '__READ_ONCE'
>  #define READ_ONCE(x) __READ_ONCE(x, 1)
>                       ^~~~~~~~~~~
> arch/arm64/include/asm/pgtable.h:628:52: note: in expansion of macro 'READ_ONCE'
>  #define pud_offset_phys(dir, addr) (p4d_page_paddr(READ_ONCE(*(dir)))
> + pud_index(addr) * sizeof(pud_t))
>                                                     ^~~~~~~~~
> arch/arm64/include/asm/pgtable.h:629:47: note: in expansion of macro
> 'pud_offset_phys'
>  #define pud_offset(dir, addr)  ((pud_t *)__va(pud_offset_phys((dir), (addr))))
>                                                ^~~~~~~~~~~~~~~
> arch/arm64/mm/mmu.c:827:10: note: in expansion of macro 'pud_offset'
>    pudp = pud_offset(pgdp, addr);
>           ^~~~~~~~~~

Looks like we need an implementation of unmap_hotplug_p4d_range() to
walk the dummy p4d level. Unfortunately, we don't have the folded p4d
patches in the arm64 tree so we'll either need a common branch or the
hotplug patches will need to be dropped for the moment.

Will
