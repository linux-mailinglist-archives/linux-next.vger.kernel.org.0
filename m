Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2B154D0466
	for <lists+linux-next@lfdr.de>; Mon,  7 Mar 2022 17:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244286AbiCGQpl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Mar 2022 11:45:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244275AbiCGQpk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Mar 2022 11:45:40 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABCD793BB
        for <linux-next@vger.kernel.org>; Mon,  7 Mar 2022 08:44:45 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id b23so13740585qtt.6
        for <linux-next@vger.kernel.org>; Mon, 07 Mar 2022 08:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/XL/lMkKaAjZT+R1nP8H0cffa2vVj0nan43syJIwKEM=;
        b=NGAxo4l6dVw4MjmbICDgizGHfOi4yre3b0pLfDORn6QkKhVCbfHF+rNemWGokfFRxH
         NtY+yd2RUni7Od++YThC961zb+L5Yk2ElgJ+DYjcJKhNfNR2yIQmfScjlsvMIyDNMYQe
         AXKXSlou68f/jC4mjOwJ8vmxzk+JY0I2UNLGmLBpfdJ5GRjidPgS/tcNepdp8+ee/Wmk
         nr/FiTR9dxmfDbfhxRCDvHtnaGF39JYKTcY2bfSB3ZQERE5C1i1Es81mqkd3t5U9xMkN
         VQwtkviAPHBlrajVClNPPqQ5qArz2i0+t0c+F1W37SpZXYWAeoHUyQ5m6fXR46JVYbnt
         /Z1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/XL/lMkKaAjZT+R1nP8H0cffa2vVj0nan43syJIwKEM=;
        b=sPQKu2bdK+urorlx0gmrhmw4Pty58Is8Z3eF4xNBZr24gp2SbMSzWcZBwa6vTaNzJH
         sL/12HiCVYQd8A/NTAWYkJe6G+gujQAG7MedYoo1AIJZDMYM4iteUXZguQ4Ju/2ITp98
         ypnXBGM3baToc/Q4H8WoWvQwK+27LhQ/eVDqFhVrzimQNLDLbbjFKxkX5vssZAkm5qlp
         Xtjk+KaVmpunfn9nWy6qMnFuM8n8WAF4XmpLEQ30K4Oec/MUqAsRyMcpoiHzVGiOBPl6
         xL/4DufBcLPN0WYoA0LCbDwBzFjWi2Sqvp/D1Lz0KwLNxwCdV2uPZ+rUY2D1lGlx91ct
         myFA==
X-Gm-Message-State: AOAM533i5FP56O+F4vk9Sv0NzNZgO5e8+fC+jVBs7Ki8jzvoNRhn9o7X
        U3fglskVOgVynriUWaGil1HZlw==
X-Google-Smtp-Source: ABdhPJxUlGfyQuqHLZdnpfRoANxV+0hXCfHucRHiuTC80Gc6WFLFnVnTTEp8Y7BcKFfazeg0zyoF8A==
X-Received: by 2002:ac8:5c10:0:b0:2de:2dac:1ea1 with SMTP id i16-20020ac85c10000000b002de2dac1ea1mr10272361qti.600.1646671485033;
        Mon, 07 Mar 2022 08:44:45 -0800 (PST)
Received: from localhost (cpe-98-15-154-102.hvc.res.rr.com. [98.15.154.102])
        by smtp.gmail.com with ESMTPSA id u14-20020ac858ce000000b002de89087e7dsm8747493qta.78.2022.03.07.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 08:44:44 -0800 (PST)
Date:   Mon, 7 Mar 2022 11:44:39 -0500
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Shakeel Butt <shakeelb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Nadav Amit <nadav.amit@gmail.com>,
        David Hildenbrand <david@redhat.com>,
        "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [next] mips: madvise.c:55:7: error: 'MADV_DONTNEED_LOCKED'
 undeclared
Message-ID: <YiY2dx5F0pEbsxkU@cmpxchg.org>
References: <CA+G9fYvPdufo6c3MgPjAMBrkTqoLDO+2LN1PV3V8rTsqN5XSFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvPdufo6c3MgPjAMBrkTqoLDO+2LN1PV3V8rTsqN5XSFg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 07, 2022 at 09:45:38PM +0530, Naresh Kamboju wrote:
> Following build regressions errors/warnings noticed on mips architecture on
> linux next-20220307 build.
> 
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=mips
> CROSS_COMPILE=mips-linux-gnu- 'CC=sccache mips-linux-gnu-gcc'
> 'HOSTCC=sccache gcc'
> 
> mm/madvise.c: In function 'madvise_need_mmap_write':
> mm/madvise.c:55:7: error: 'MADV_DONTNEED_LOCKED' undeclared (first use
> in this function); did you mean 'MADV_DONTNEED'?
>    55 |  case MADV_DONTNEED_LOCKED:

Thanks for the report, I sent a fix in reply to Stephen:

https://lore.kernel.org/lkml/YiY2KYyjsCaANwo0@cmpxchg.org/T/#m58a9804edb680303b7351fb7cf6d9c93096ccaad
