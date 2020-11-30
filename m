Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56CC32C88DB
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 17:03:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgK3QBi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 11:01:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:49034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726614AbgK3QBi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 11:01:38 -0500
Received: from gaia (unknown [95.146.230.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4591C205F4;
        Mon, 30 Nov 2020 16:00:55 +0000 (UTC)
Date:   Mon, 30 Nov 2020 16:00:52 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will@kernel.org>, andreyknvl@google.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Collingbourne <pcc@google.com>, steven.price@arm.com
Subject: Re: [next] arm64: mte.c:176:17: error: 'struct thread_struct' has no
 member named 'sctlr_tcf0'
Message-ID: <20201130160052.GF3902@gaia>
References: <CA+G9fYuTS-Kmwy4wfNrFMLnon0v5No3KQeu262c9L91wOrcxkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuTS-Kmwy4wfNrFMLnon0v5No3KQeu262c9L91wOrcxkA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 30, 2020 at 09:12:58PM +0530, Naresh Kamboju wrote:
> Linux next tag 20201130 arm64 build failed due to below error,
>   - gcc-9, gcc-10 and clang-10 build FAIL
>   - gcc-8 build PASS.
> 
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/2/tmp ARCH=arm64
> CROSS_COMPILE=aarch64-linux-gnu- 'CC=sccache aarch64-linux-gnu-gcc'
> 'HOSTCC=sccache gcc'
> arch/arm64/kernel/mte.c: In function 'set_sctlr_el1_tcf0':
> arch/arm64/kernel/mte.c:176:17: error: 'struct thread_struct' has no
> member named 'sctlr_tcf0'
>   176 |  current->thread.sctlr_tcf0 = tcf0;

Thanks for the report. There is a bodged conflict resolution, it should
disappear when Stephen updates the -next tree.

-- 
Catalin
