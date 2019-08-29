Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62273A2A55
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 00:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbfH2WyM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 18:54:12 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34080 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfH2WyL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2019 18:54:11 -0400
Received: by mail-pl1-f193.google.com with SMTP id d3so2321031plr.1
        for <linux-next@vger.kernel.org>; Thu, 29 Aug 2019 15:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qUSTbzZO2kMqGmRAZaxos1ctO/pRnpFMVtcldmp2qh8=;
        b=SRVvrsvO17LOhmbIl1fCFaM0K51+YMARvQB6kSckHyX3hc9/XXx14+QsBFfAa7ZYFu
         E5OwgbA268yuLsFAWxlvRK9HuqxbF6DJHoSa/nwT65+kc8A2LCq+GCt0TltWRn5KZuNa
         rpe75cufgPegma3Uq5tdLjmgG5jkuWSTgMts0gUMIm5sV6kbKWg6MABm5KxiZQM3L9zg
         HL/0h2PiMZOdeC0wzS2Hp0gTtm9el6DSSx2UdfiZ2WlrubJAdvcTYOrEJ4cC4xCfCcGA
         k6GmT5QA+3u5Gt4NZiD/51SR6paI1L+uS/RwqwUv83c/3U90Dwswui6CqP2UXMdf+CdI
         Zsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qUSTbzZO2kMqGmRAZaxos1ctO/pRnpFMVtcldmp2qh8=;
        b=h5Jrsu7knIu+8uxuclRCR3r1RDw3u5L2yqyWIfP5vigsofTHyxAWFOqtENMYump4kE
         V34Ylajy5vblPupifgs1RDI/qrxcPnjE3CaDg/5p3vGLNqinpGXAoKtI4D45XEi2ewpa
         tMOfab8SrVkggnOy/CfyKDb+81uSTcVlsMRMrFI1FH6/WPO3YU/t3Xxtk5X/erFvcjgM
         3RLHe+lxAJDhBiERPU0J8VH5IV83z3R7SP2Kz9n34ntN7Z1cmz+Kh6G5+f1LkYCrkzLG
         /NGf3T8aXFaANpBHpSkqA+P0B25w7FejttTmWEDyqg8C8cbEixvOfcElgEvNhVo20R2e
         unOA==
X-Gm-Message-State: APjAAAUsjFbvE325NOxip3dXdqqmSlmbM6wfoPo2rF7iSXzI39CC+i8b
        Ma60MSZqvkqs9sfPlYgkzn9SAjDy7egfgh/Oc0MijngwOfs=
X-Google-Smtp-Source: APXvYqxUMYTpYopPDhsRtUwAI5omQJ9hU71MPf4iSRznaeabNudsCAgEYD4sg1c+m2qEMptfhbUEK861VH/UBWo1+pI=
X-Received: by 2002:a17:902:8484:: with SMTP id c4mr12420131plo.223.1567119250624;
 Thu, 29 Aug 2019 15:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190830085227.01676c93@canb.auug.org.au>
In-Reply-To: <20190830085227.01676c93@canb.auug.org.au>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 29 Aug 2019 15:53:59 -0700
Message-ID: <CAKwvOdkRMSy7tt5Ln5rZSB4+G7srvSUuAoCxgyNbnp3zp0VmEQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the compiler-attributes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks for the report, Miguel and I decided to drop the patch.

On Thu, Aug 29, 2019 at 3:52 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the compiler-attributes tree, today's linux-next build
> (powerpc ppc64_defconfig) failed like this:
>
> arch/powerpc/boot/main.c:153:45: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__section'
>   153 | static char cmdline[BOOT_COMMAND_LINE_SIZE] __section(__builtin_cmdline);
>       |                                             ^~~~~~~~~
> arch/powerpc/boot/main.c: In function 'prep_cmdline':
> arch/powerpc/boot/main.c:166:6: error: 'cmdline' undeclared (first use in this function)
>   166 |  if (cmdline[0] == '\0')
>       |      ^~~~~~~
> arch/powerpc/boot/main.c:166:6: note: each undeclared identifier is reported only once for each function it appears in
> arch/powerpc/boot/main.c: In function 'start':
> arch/powerpc/boot/main.c:196:40: error: 'cmdline' undeclared (first use in this function)
>   196 |  if ((loader_info.cmdline_len > 0) && (cmdline[0] == '\0'))
>       |                                        ^~~~~~~
>
> Caused by commit
>
>   e81c903fb9e2 ("powerpc: prefer __section and __printf from compiler_attributes.h")
>
> I have reverted that commit for today.
>
> gcc v9.2.1 (in case that matters)
>
> The above error is from the PowerPC boot wrapper that is built without
> the kernel headers (mainly, I think).
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,
~Nick Desaulniers
