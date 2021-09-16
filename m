Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0890D40DDDB
	for <lists+linux-next@lfdr.de>; Thu, 16 Sep 2021 17:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhIPPV5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 11:21:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:44782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238632AbhIPPV4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Sep 2021 11:21:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53EB361216;
        Thu, 16 Sep 2021 15:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631805635;
        bh=E9H0v3G3Ov/ePc/WdqGiURbGTrVRQfMaWxyj/2lWf6I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XiR3lBfDdxd/En6kpPAMzQsptVKe9VXUdRghpBhphmlpPzEYGfazTxq6ntH535oSZ
         jyjChXMEuLLSlyg0Sr0HsMn7DojUU8OLIbe7lClxZ4CNm7dWFM0cMJgLI14CQg/hlQ
         q5J5HSsuSbzLfAjyP80+pDZUDOF8/0P3+WW7w/JA+54avH6JLdlmc9wLO1Cf7EXGE7
         c4fZthPYB6XmkoD7HfpP2ir237FGFxbMesZfju9vTobJoGtk11tctDvYQ2NHpUwCbf
         Vrg1/HFl2eB/ZwniWOjo0PhntuLL+8z4IJIj26zTh/gzxCUoYDR4G+TWWKeKr1XYGZ
         ZOM6kG47xS7LQ==
Subject: Re: clang: error: unsupported argument '-mimplicit-it=always' to
 option 'Wa,'
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, lkft-triage@lists.linaro.org,
        llvm@lists.linux.dev,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <CA+G9fYu0dngeohP9M39Odj5-5ax97ZgA=KqV8_g2yYLdOGMQSg@mail.gmail.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <c3a29fd8-e743-868c-3705-460fd38b7add@kernel.org>
Date:   Thu, 16 Sep 2021 08:20:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CA+G9fYu0dngeohP9M39Odj5-5ax97ZgA=KqV8_g2yYLdOGMQSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Naresh,

On 9/16/2021 6:45 AM, Naresh Kamboju wrote:
> Following build warnings/ errors noticed while building linux next-20210916
> with clang-10, clang-11 and clang-12  for arm architecture.
>        - allnoconfig
>        - tinyconfig
> 
> But builds PASS with clang-13.
> 
> clang: error: unsupported argument '-mimplicit-it=always' to option 'Wa,'
> make[2]: *** [/builds/linux/scripts/Makefile.build:288:
> scripts/mod/empty.o] Error 1
> make[2]: Target '__build' not remade because of errors.
> make[1]: *** [/builds/linux/Makefile:1329: prepare0] Error 2
> make[1]: Target '__all' not remade because of errors.
> make: *** [Makefile:226: __sub-make] Error 2
> make: Target '__all' not remade because of errors.

Thank you for the report. This is caused by the implicit switch to the 
integrated assembler in commit f12b034afeb3 ("scripts/Makefile.clang: 
default to LLVM_IAS=1").

Prior to LLVM 13, -Wa,-mimplicit-it=... was not properly handled by the 
integrated assembler but Nick fixed that:

https://github.com/ClangBuiltLinux/linux/issues/1270

As noted in the above Linux commit, please adjust arm clang-10 through 
clang-12 builds with TuxSuite to pass 'LLVM_IAS=0' to make, which you 
can do with the 'make_variables' key:

https://github.com/ClangBuiltLinux/continuous-integration2/blob/a998b85bf1d2ce4150005b225f4cde535fe12af5/tuxsuite/android-mainline.tux.yml#L207

Sorry for not giving you guys more of a heads up about that switch.

Cheers,
Nathan
