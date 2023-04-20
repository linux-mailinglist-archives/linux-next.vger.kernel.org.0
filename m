Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE9456E86A4
	for <lists+linux-next@lfdr.de>; Thu, 20 Apr 2023 02:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbjDTAjY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Apr 2023 20:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjDTAjX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Apr 2023 20:39:23 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54688199F
        for <linux-next@vger.kernel.org>; Wed, 19 Apr 2023 17:39:22 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5052caa1e32so441959a12.2
        for <linux-next@vger.kernel.org>; Wed, 19 Apr 2023 17:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1681951161; x=1684543161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jq2MxTD2oPHOP5sXkC216p/J7z0rPCBfe+ys3QDaYjo=;
        b=KE4e62tbG7me4bC2SY0kaLf9CVR0kKqYb9Uhrc7DUxP7nUIL2e6TRqZKUfi9lxhj1K
         BrzW1kwHkfR94WEwuMpElgEW9o3lvmQxaz124A6ptkNWHuJJvaDQKE867GaVgAFpqpkt
         9SlPwvg0+m09lYirtAFXrcmw9KIOM7znIa/xs7C4YvAKFGxyw0vO9BoLaZE3kncXar5q
         nWTggFrTUlynpXkeXAh1iRhDbFY8B/ekpRUme1e2mA5501CLrV3ZLxYvtAnCiR7c4NS8
         txaBwyGC5J5nvPw2QHWsjaKjxd80Sj85TzpzIhFpjkgM4QLdUqvww9eAoguXrvKrb4Wx
         HlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681951161; x=1684543161;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jq2MxTD2oPHOP5sXkC216p/J7z0rPCBfe+ys3QDaYjo=;
        b=caaQ6592eBhy6YRQ9onynhh7ePaRWTaVQIkfK66FTjT2z0bCH/B1y+IYZkLG/Z5TVu
         z8NtQq/jUzGEJVQ42E+hNSYeC8QsoAwpWABbVwVkQhyZPqMB9h85r9jYpEMu3mmOchbV
         6Y41DhORP5TZ8loHRlHl76p5ZAH+r/DA0Qm2TuQHa2SaNBTCJSHz3BxVn8ls7PpbHneH
         KeitKtSylsVNeenemr9Dt4UDdZ02MOdZ9593kJo3Gv2OH42fmwmewunt2GFK4eUFofbw
         u90jypyD4HwsPSh0FnQ/mhKw05xXXhhhLUflf8JU/0Y0Kb/a8DUMM3Znel6/st/tgrBP
         k73Q==
X-Gm-Message-State: AAQBX9cI8IuO7IpI1VlTf7rw2Y0nV5fcdH/Sk4Gw4o+FQLjSHA4T98/M
        h4ozTN8YosVAOX4WcN+0JSpI1f60X3LqUGWqJAW8IA==
X-Google-Smtp-Source: AKy350ZCHNqxdGPWY54tCrAan29d8uA+6QCxUFt/vbEZ9nDVZY2M2BX7PFJ36Esq7wrUYVaLfJwPeWXulw/2chJpTS0=
X-Received: by 2002:aa7:cd0b:0:b0:504:b177:3eee with SMTP id
 b11-20020aa7cd0b000000b00504b1773eeemr6323677edw.33.1681951160818; Wed, 19
 Apr 2023 17:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230418085516.1104514-1-tmricht@linux.ibm.com> <233a0b88-6857-0a1d-3609-6a74fa50c28c@iogearbox.net>
In-Reply-To: <233a0b88-6857-0a1d-3609-6a74fa50c28c@iogearbox.net>
From:   Quentin Monnet <quentin@isovalent.com>
Date:   Thu, 20 Apr 2023 01:39:09 +0100
Message-ID: <CACdoK4K=zU8dqpVM33sCrLq1aWRxg1x=3Rg2RYgm+SY4NDtM_Q@mail.gmail.com>
Subject: Re: [PATCH] bpftool: fix broken compile on s390 for linux-next repository
To:     Daniel Borkmann <daniel@iogearbox.net>
Cc:     Thomas Richter <tmricht@linux.ibm.com>, broonie@kernel.org,
        hca@linux.ibm.com, sfr@canb.auug.org.au, liam.howlett@oracle.com,
        acme@redhat.com, ast@kernel.org, bpf@vger.kernel.org,
        linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 19 Apr 2023 at 15:51, Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> On 4/18/23 10:55 AM, Thomas Richter wrote:

> > -                     __fallthrough;
> > +                     fallthrough;
>
> The problem is however for current bpf-next, where this change breaks CI:
>
> https://github.com/kernel-patches/bpf/actions/runs/4737651765/jobs/8410684531
>
>    [...]
>      CC      /tmp/work/bpf/bpf/tools/testing/selftests/bpf/tools/build/bpftool/feature.o
>      CC      /tmp/work/bpf/bpf/tools/testing/selftests/bpf/tools/build/bpftool/disasm.o
>    btf_dumper.c:838:4: error: use of undeclared identifier 'fallthrough'
>                            fallthrough;
>                            ^
>    1 error generated.
>    [...]
>
> I would suggest as a clean path that'll work for both to just change from
> fallthrough; into /* fallthrough */ as done in objtool, then we can also
> work around BPF CI issue and merge this change in time.
>
> >               default:
> >                       putchar(*s);
> >               }
> >
>

Thanks Daniel for pointing this out. I just submitted the patch you suggested:
https://lore.kernel.org/bpf/20230420003333.90901-1-quentin@isovalent.com/

Quentin
