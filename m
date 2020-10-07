Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20ADD2856AE
	for <lists+linux-next@lfdr.de>; Wed,  7 Oct 2020 04:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgJGCkC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 22:40:02 -0400
Received: from ozlabs.org ([203.11.71.1]:45483 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726566AbgJGCkC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 6 Oct 2020 22:40:02 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C5dpl50DNz9sSG;
        Wed,  7 Oct 2020 13:39:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1602038399;
        bh=9/8ZpPAufnoZvpigaDUm8QlFsugRCHAfF/9+qSrtSfE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ZuLcsFkTAGc0adCAL2ANwr7Q6cy4hj+L6Jq/zRWPzUcbWNUsRQMTO0dT1kB5hkSaA
         34qvy7NPTXhPh/eXE0rSDnBmA5pbfyuPBPWTSFrQNDTg1KGsWX4H+iW/oJ2jExsfiX
         t7Pk/kvXdxZ+Rl+dPiE5SFxedlSly/44f9TNQ6eNnOmdXNUrFPWruWO2szhhBtXaZC
         +l2ZBb3krLp0VHKwmxtoAp7uxa3GGsj/RNuzgMyL/LpTsJw+b8huaZPluN6mo3pY+Y
         YiPA9+yYQpaenPoMFruLMIFYMB6GNoKzc3zz/GRhHe/XiGep2g4rVas8clddzYqsVa
         mJxw0kbWjodTQ==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the powerpc tree
In-Reply-To: <20201007000544.48aabc91@canb.auug.org.au>
References: <20201007000544.48aabc91@canb.auug.org.au>
Date:   Wed, 07 Oct 2020 13:39:56 +1100
Message-ID: <87h7r63gjn.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> In commit
>
>   3b6c3adbb2fa ("powerpc/perf: Exclude pmc5/6 from the irrelevant PMU group constraints")
>
> Fixes tag
>
>   Fixes: 7ffd948 ("powerpc/perf: factor out power8 pmu functions")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").
>
> Since Michael doesn't generally rebase his tree, this is more to be
> remebered for next time.

Yeah, if it was the wrong SHA I would rebase, but not just for a short
SHA.

You can avoid this in future by doing:

$ git config --add core.abbrev 12
$ git config --add pretty.fixes 'Fixes: %h ("%s")'
$ git config --add alias.showfix 'log -1 --format=fixes'

Then you can do:

$ git showfix 7ffd948
Fixes: 7ffd948fae4c ("powerpc/perf: factor out power8 pmu functions")


cheers
