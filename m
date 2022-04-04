Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6C94F201B
	for <lists+linux-next@lfdr.de>; Tue,  5 Apr 2022 01:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243860AbiDDXQt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Apr 2022 19:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243981AbiDDXQn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Apr 2022 19:16:43 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9013531375
        for <linux-next@vger.kernel.org>; Mon,  4 Apr 2022 16:06:38 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id ku13-20020a17090b218d00b001ca8fcd3adeso758400pjb.2
        for <linux-next@vger.kernel.org>; Mon, 04 Apr 2022 16:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=CelcVZZcgILGJ3xGR4O1/qMCdW8m4dEbepwQO7O3y4o=;
        b=CRhyzMykAr9K9V9LswpGk8W5gFe8aVbt1GaKdQUMl1PrWCmX789G8IQ4szOobgjV7y
         HHpKg5Pwe4EK16rajap6IYmJu2XXP/8dI9ae5wZcGhvawbq2JK2kXTJ1iWJUVdGx6h6x
         LYT6z/WOdVDQWlNB9sezx5jAYIBSRqnSdepRaNm9G4ZKvlqp6trr5YCUpuOm8N0+jFOT
         D9a80sDqgcAe//66b+28KcteAtVjLO3NVzg47cJm7LH4qWoJXNJvtgo+yRgdTLWvNwfS
         ls2NUlhYnnerBBTVQZzSyL7dHyUTZt5u6AGvmSMWs+YJFAj5+bHCU2SD8L7P3RDOEJWs
         Jhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=CelcVZZcgILGJ3xGR4O1/qMCdW8m4dEbepwQO7O3y4o=;
        b=Mcw5DkO+UCyKMUj1FHxBZxr8bCRt3FqVtSnXLhcZtiI+9BWQbFBkR9Oy7ZN6U84M9f
         WRueBEHP5snviFuW+ATwzfhKydcvXNWxuPxMkEHkIPf70auMnIhVHtKWCfUeOFI82lue
         E2HNn+lldupsqXVGpY0udgVcFDOlpZcZ+2fwRzWoiW/I6IS2UHcBNae+Gft5LqdtbaJT
         esG/VzUshdRG45I1cnk9oJ0dFk0D3WJ7RsRg60AHAeBX4H3Kigo0pKqiPol/LxmlGQQz
         C85hOYLM4RkBVurwhTv2nDCFPkWRAZRKeeUKZ/AN2qAd83hKhtiSQ+bxgty6OLQGcrdJ
         PTyw==
X-Gm-Message-State: AOAM531kLBhO9GwVebzMppRoNhejOmUFkmtRpGQGAnJe1AW50AmyuhDs
        erc/Pl3PuU3Hx/JbpLdckPPaJQ==
X-Google-Smtp-Source: ABdhPJxMte66ZHmMF/EVN6GWcVOq+nGEvu7yOTygAC80MkZr2vEd9FlF/FRc+iKnj01U1TOeM3sobQ==
X-Received: by 2002:a17:90a:ec13:b0:1ca:8240:9e4b with SMTP id l19-20020a17090aec1300b001ca82409e4bmr631786pjy.164.1649113597976;
        Mon, 04 Apr 2022 16:06:37 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id cq13-20020a056a00330d00b004faa1fffd18sm12675204pfb.124.2022.04.04.16.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 16:06:37 -0700 (PDT)
Date:   Mon, 04 Apr 2022 16:06:37 -0700 (PDT)
X-Google-Original-Date: Mon, 04 Apr 2022 16:03:57 PDT (-0700)
Subject:     Re: linux-next: manual merge of the csky tree with Linus' tree
In-Reply-To: <CAJF2gTRc-NtpRS4ScQbgZAzN+thSejRXgHUuPwm3avYOCpPX2w@mail.gmail.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>, ren_guo@c-sky.com,
        anup@brainfault.org, anup@brainfault.org, guoren@linux.alibaba.com,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     guoren@kernel.org
Message-ID: <mhng-7164298c-95f1-4c8f-aca2-bfe679d272de@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, 03 Apr 2022 20:54:55 PDT (-0700), guoren@kernel.org wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> 于 2022年4月4日周一 06:24写道：
>
>> Hi all,
>>
>> Today's linux-next merge of the csky tree got a conflict in:
>>
>>   arch/riscv/configs/rv32_defconfig
>>
>> between commits:
>>
>>   d56201d9440d ("riscv: defconfig: enable hugetlbfs option")
>>   f6e64b66629e ("RISC-V: Enable CPU_IDLE drivers")
>>   c5179ef1ca0c ("RISC-V: Enable RISC-V SBI CPU Idle driver for QEMU virt
>> machine")
>>   2e7451fb5763 ("RISC-V: Enable profiling by default")
>>   6f562570b9c5 ("RISC-V: defconfig: Drop redundant SBI HVC and earlycon")
>>
>> from Linus' tree and commit:
>>
>>   0f6ffeaeed8f ("riscv: Fixup difference with defconfig")
>>
>> from the csky tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>> I am trying to figure out why all these commits affecting the riscv
>> architecture have suddenly turned up in the csky tree (and just before
>> the merge window closed).
>>
> It's not for csky pull request. I just missed the 5.18 chance to merge
> compat feature for riscv. This series also contains several other arches'
> cleanup. I just want to see any other conflicts in the series. Thanks pay
> the effort to take care.

[Sorry for missing this, Lenovo keeps putting broken motherboards in my 
laptop so things on my end have been a mess for the past week.]

IIUC that's not usually how this is done: linux-next is really meant for 
stuff that's ready to go in (and into the upcoming release), not for 
experimentation (doubly so for the next release).  I usually push stuff 
to another branch on one of my repos where autobuilders pick stuff up, 
which is how I've been seeing the build issues.

IMO it gets kind of confusing for everyone when patch sets get mixed up 
like this (spinning a v2 of the generic ticket locks with some SOBs 
missing was similarly confusing, is that single-patch multi-arch fix).  
It's already a bit of a headache getting these multi-arch patches 
through, having extra confusion on when things are ready to go 

Specifically: I'd been operating under the assumption that this would go 
in through the RISC-V tree, as it's mostly diff in arch/riscv/.  There's 
some refactoring in other arch ports that's not been acked, which I 
don't really like to do, but I figured Christoph and Arnd having 
written/acked it was close enough.  That said, I'm definately not going 
to put it into my for-next when I'm getting build errors from arm64 
autobuilders on the standalone branch.

LMK if you had something different in mind, otherwise I'm just going to 
proceed under the assumption this is going in through the RISC-V tree -- 
I see a v11, I'm going to comment on that.
