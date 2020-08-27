Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9FD254B78
	for <lists+linux-next@lfdr.de>; Thu, 27 Aug 2020 19:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgH0RD4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Aug 2020 13:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgH0RDz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Aug 2020 13:03:55 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8DEC061264
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 10:03:54 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d22so3991145pfn.5
        for <linux-next@vger.kernel.org>; Thu, 27 Aug 2020 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=VdlKRWAYiWH7aKzpIghVWZrmLNU8AEzG/Co4MAt2Y8A=;
        b=jz0jrysRrFtf/raS4GKGdoe89ArXeoPqY37vy/lf9q7hC1dPzYrXzA7FQg1GxNoSx9
         45sI9wAD+tgmlr+4TRjRy7KymBhpuGnQhdOezR7Iji0nDV4LHV6FZa9XYTwyqI7K5ywo
         wZW4a8krMN8wUAFvWxBTRuvn0QzrMmbFzyALo6zd9iPiVjYXO08aHo24023L8s2S2miN
         fSBNMgoX7M1YmR4ki4uaKST0hES5XubV5AUI379ZwuQSy+yn34/KVq80YDGHALdqwTC4
         D5bltMawbgbptzmTJG/fA7IDtDYZ5aBE5bZGX+w8WcIZl7cfNsgcjR3BVcPdMri/bQlR
         CI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=VdlKRWAYiWH7aKzpIghVWZrmLNU8AEzG/Co4MAt2Y8A=;
        b=E+InWnc/Lrm3UKqNdEdBoaHfKPCF8NuoZ0oMpoti/1bhEnnV7VU+LjbwHCwsPCCEK9
         Y1PvJg8xX0Bv3VqL2a/+UPh9C37sPdtd0IsuXBc6gbGoQ+5hCh4w2sggn+7oWRIvJcU6
         IQ9Yf79uT/zV0d0GL1Hr441o5tvqDX9XQBeckeBbBldSdq4Ap6jc3+r/4I4AntQLF6YJ
         ovOHaRf1gifzupH9VkuZHqVC0GrXkvsRIv9MrSlO22bnKrDhARRml56J6h6fq/1QL+8n
         28oXPMx8N+z6E4E7nk1ajJyY6qbeVl+6XbLeT7C9naa4IpOBIboI5kAEiMIOE3tL7lxa
         AMFw==
X-Gm-Message-State: AOAM531V6fksrQ1CwcYOJGDwRa/IVYHp6HQIiYjmj/jFlsZZj1dMLgra
        rlNJ0S5dIsfped/oJo/aEllm01CyHE+Uww==
X-Google-Smtp-Source: ABdhPJzh87b1e1c3qz49gLw9m5Qn9DxARjR19PlbS5t4MeaJtCJCaCf1OukqFVW6zxLubVLXUWN6HA==
X-Received: by 2002:a63:a53:: with SMTP id z19mr14876176pgk.67.1598547834087;
        Thu, 27 Aug 2020 10:03:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id v10sm3402662pff.192.2020.08.27.10.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 10:03:53 -0700 (PDT)
Date:   Thu, 27 Aug 2020 10:03:53 -0700 (PDT)
X-Google-Original-Date: Thu, 27 Aug 2020 10:03:52 PDT (-0700)
Subject:     Re: linux-next: Tree for Aug 27
In-Reply-To: <fa8a133517704eff9b0f2369c1b7b5bbc8517916.camel@wdc.com>
CC:     anders.roxell@linaro.org, Stephen Rothwell <sfr@canb.auug.org.au>,
        anup@brainfault.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Palmer Dabbelt <palmerdabbelt@google.com>
To:     Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-16126c08-fe1d-43bf-bd48-9f1cdcdb5a57@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 27 Aug 2020 10:02:57 PDT (-0700), Atish Patra wrote:
> On Thu, 2020-08-27 at 10:37 +0200, Anders Roxell wrote:
>> On Thu, 27 Aug 2020 at 07:11, Stephen Rothwell <sfr@canb.auug.org.au>
>> wrote:
>> > Hi all,
>> > 
>> > News:  There will be no linux-next releases next Monday or Tuesday.
>> > 
>> > Changes since 20200826:
>> > 
>> > The net-next tree gained a conflict against the net tree.
>> > 
>> > Non-merge commits (relative to Linus' tree): 2901
>> >  3429 files changed, 100496 insertions(+), 37081 deletions(-)
>> > 
>> 
>> I built riscv on todays tag and I see this error:
>> ../arch/riscv/kernel/setup.c: In function ‘setup_arch’:
>> ../arch/riscv/kernel/setup.c:74:2: error: implicit declaration of
>> function ‘early_ioremap_setup’; did you mean ‘early_memtest’?
>> [-Werror=implicit-function-declaration]
>>   early_ioremap_setup();
>>   ^~~~~~~~~~~~~~~~~~~
>>   early_memtest
>> cc1: some warnings being treated as errors
>> 
>> I think its due to commit 3d109b0e0949 ("RISC-V: Add early ioremap
>> support")
>> 
> 
> Yes. For some reason, I never get this with the UEFI support series
> applied on top 5.9-rc2 in my tree. But I get this error with linux-next 
> tree.
> 
>> It builds with this fix:
>> 
>> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
>> index 5ab185130cae..41ef96d0d97a 100644
>> --- a/arch/riscv/kernel/setup.c
>> +++ b/arch/riscv/kernel/setup.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/smp.h>
>> 
>>  #include <asm/cpu_ops.h>
>> +#include <asm/early_ioremap.h>
>>  #include <asm/setup.h>
>>  #include <asm/sections.h>
>>  #include <asm/sbi.h>
>> 
>> 
> 
> This fix solves the problem. Thanks.
> @palmer: Do you want me to update the patch and send v7 ?

That'd be great, thanks!

> 
> 
>> Cheers,
>> Anders
> 
> -- 
> Regards,
> Atish
