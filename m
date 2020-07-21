Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D3722840F
	for <lists+linux-next@lfdr.de>; Tue, 21 Jul 2020 17:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgGUPnf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jul 2020 11:43:35 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:34905 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726029AbgGUPne (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Jul 2020 11:43:34 -0400
Received: from mail-qv1-f43.google.com ([209.85.219.43]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M2etD-1jyAkE0sXv-004BZO; Tue, 21 Jul 2020 17:43:33 +0200
Received: by mail-qv1-f43.google.com with SMTP id m9so9518939qvx.5;
        Tue, 21 Jul 2020 08:43:32 -0700 (PDT)
X-Gm-Message-State: AOAM532L3zrQpzZLgtOdI9YiVBJSlxTSn4pknaM0n2ypfxuSgHilWTvR
        MrmL7ERPH1BJ8rttFIySlKdpp6aCEdsKzYShxMg=
X-Google-Smtp-Source: ABdhPJy29R5Cz+4RaSNXe7LuLnSYNvFSpIXEreYS6NgwThe5nMaZYbF4N4CTUGK2Prnn8c4H8IEPbqJMB5aE6TnWUkM=
X-Received: by 2002:a0c:f802:: with SMTP id r2mr27049618qvn.197.1595346211925;
 Tue, 21 Jul 2020 08:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtYPA7jHPNB5D+JFHpmtB5+Wj+YG8W33GhffHjmFaMiUg@mail.gmail.com>
In-Reply-To: <CA+G9fYtYPA7jHPNB5D+JFHpmtB5+Wj+YG8W33GhffHjmFaMiUg@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 21 Jul 2020 17:43:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1DYvyzkFQDPPnK1p4yUZ-Zp+Pg2Lg9QKO_wnjbnHygnw@mail.gmail.com>
Message-ID: <CAK8P3a1DYvyzkFQDPPnK1p4yUZ-Zp+Pg2Lg9QKO_wnjbnHygnw@mail.gmail.com>
Subject: Re: arm: tinyconfig: entry-common.S:156: Error: r13 not allowed here
 -- `bic tsk,sp,#(((1<<12)<<1)-1)&~63'
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Vladimir Murzin <vladimir.murzin@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:I0nmTvYr/K2nuig8/iC2CExRaC79OFfavlJCQNo5DbXwZ69xYCQ
 K38KWSDh+rdyd+Nc8pDjxh+27wdkrM6dTmnMezAYH5UyEa4a9u7k/ZrMIdOOy41hh7bnrxu
 QjMHo8zgKu2VW+krZGUgrqtGYbqGnEscQ0TIPB+Ceap/LKWhEdzWM0FrZ2G/ZK5j91TKJqM
 KBOYmYgDQu2dai3KHxacQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LNlUSd8ytUE=:BsENBj13KerCpCFPV54Uzr
 ozThJjBSXw05MVasj9WEQnVcqltjd2mtbbvlV2KbsGHbCIAWEFAMm+Nlgi0hvGVNYuQ5eLVvc
 liFM3RZ/SbOxHZ/mh7Augdw2p5qvh7XbxonfYGipzppn6NY+uIv8m64dleHD3vcGdt4e+Yxed
 u8XdtTcEOm8nMYzogsWly/c3XGKmqPnPK1ICl8fNIcZwC3BXrbQgyGKpnswPuxfF9DLemD7TG
 t/nFAQzqMBo+eumNp82VsgJ0579zzzKrrrI5pogEULS1Jsvda67tgBrwFflvAY761iLLQZ9GT
 E8E1ZYTshbWib0L7xmIMK3VY+5eHSyLIr5dDxqMz08Mh/5Gj3miEtJ6pyUF54fmhAl3X4SySX
 WJ9AjAyl0Ac4YM5N+qpHEelUO+SNOvcER3XInXVCH6AHZvk5IfM51C4Xv4geT7kg2pdoB9l48
 Ud6/PSHDtXxTFsMqe2WfiNf4ZbiBT42r8QsvH9eTh+/IIxRWsHTeyUB5sW/BpvoO5YCrl1dNC
 B8KEMlMRHYJWN2VO74yn78KOhf8/BYQPiFgG8eEigxqoU1yf4pEZMFPSgi48BRdIL0diRXCO8
 27smn9Ieeh+s3VKBf+D867weobwZvBidsCsMthEKGS9Hz7BDVhWLcNE6KPrcPH9AP3B3kChUi
 HYMh5oXRfmpsY+mVXsmLQMN/BAdStXIJIGJSityyIhe00fqM/yN5KNNWux/a+5NaGcke3jHs8
 h4XZyLphaYudfWiQY5FfOr8605KhsoIRzbQ/7IAGLH6MKx2a7Dwp6pE4oSBkuiYRXHinEdKms
 n0voHtmYEm8ziYCrRzpQYDkLRvjgOaacb0CgOYgxYRajYp6RWSbPRO32lceqkLNo292jDz9H/
 wSlVsq0oG+imMUpTd/1vvXmILKzz2AxIZvEU992t40FkICDPEC2gbzy8zuRP4KCfuUi9dPZVt
 enYdqMNf/2gLenvJZxLrrMDdIQZWxrCRtXvTRt0s7hmMvAunIzio4
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 21, 2020 at 5:07 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> This might add little value.
>
> arm build sets failed on linux next 20200721.
> The defconfig ( +config fragments ) builds PASS.
> The tinyconfig and allnoconfig FAILED with gcc-8, gcc-9 and gcc-10.
>
> make -sk KBUILD_BUILD_USER=TuxBuild -C/linux -j32 ARCH=arm
> CROSS_COMPILE=arm-linux-gnueabihf- HOSTCC=gcc CC="sccache
> arm-linux-gnueabihf-gcc" O=build zImage
> #
> ../arch/arm/kernel/entry-common.S: Assembler messages:
> ../arch/arm/kernel/entry-common.S:156: Error: r13 not allowed here --
> `bic tsk,sp,#(((1<<12)<<1)-1)&~63'
> ../arch/arm/kernel/entry-common.S:243: Error: r13 not allowed here --
> `bic tsk,sp,#(((1<<12)<<1)-1)&~63'
> make[3]: *** [../scripts/Makefile.build:361:
> arch/arm/kernel/entry-common.o] Error 1
> ../arch/arm/kernel/entry-v7m.S: Assembler messages:
> ../arch/arm/kernel/entry-v7m.S:60: Error: r13 not allowed here -- `bic
> tsk,sp,#(((1<<12)<<1)-1)&~63'
> ../arch/arm/kernel/entry-v7m.S:86: Error: r13 not allowed here -- `bic
> tsk,sp,#(((1<<12)<<1)-1)&~63'
> make[3]: *** [../scripts/Makefile.build:361:
> arch/arm/kernel/entry-v7m.o] Error 1
>
> full build link,
> https://gitlab.com/Linaro/lkft/kernel-runs/-/jobs/648560264

This must come from
ac5bb8f8445f ("ARM: 8983/1: asm: Rewrite get_thread_info using BIC")

Adding Linus and Ard to Cc as well.

       Arnd
