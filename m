Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 318D051E8E2
	for <lists+linux-next@lfdr.de>; Sat,  7 May 2022 19:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444050AbiEGRWI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 7 May 2022 13:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236727AbiEGRWH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 7 May 2022 13:22:07 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3993D252AC
        for <linux-next@vger.kernel.org>; Sat,  7 May 2022 10:18:20 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id a11so8811581pff.1
        for <linux-next@vger.kernel.org>; Sat, 07 May 2022 10:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eKNedDDZfJ4ci5b7bFFqS85iYr1ECe/8cGsLZUJPlMU=;
        b=OunbZzN9WxFNeLIyIWFxffNjd70Cv2S8fskn+yi3F/zqKhfW9VTmAVBh2EOwpDTKs0
         i7JdXP207AWKuPuMr4sSrZ6J0xM34xHkOJIVYVb8OLmkP4rBOEjkaYWi9HagX8wvjJcu
         DZVToWU/ZfhoHgCwW4X7JSc6pJG/vANOBgfhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eKNedDDZfJ4ci5b7bFFqS85iYr1ECe/8cGsLZUJPlMU=;
        b=i+WWD+dhKHkI9bC7M5qOJwhwWT/JODJEnb8XJ+TTl0GmD3pRI/VN31spOeajnkUNlz
         nfio6KTe+ikOuYRKREWo9GRQD8MJKHj9zrMZJarNhkUydMarnV/CzQ7ns/Av8N1/iB5z
         jR+1yPusMEfvw+Y7bb+hlWj3/0o4JrAracpMUKup7pVggnzqY9nPX9P+amRHyxtvWSp5
         WCKhP0PSzk9nSHX7SpoEn1cF7Br/gxQNKw/JvXA9H/TRd4FPj0C7ZVQ/rAOSIJYiXw4K
         8GTJogUyd6Memsl+dsrKt6k6vd2J4SGfQBaBYSPSVBS3cNh2WONgMyEvq0IvbvZan8e3
         M1VA==
X-Gm-Message-State: AOAM530VvEUZ1QKzJE2/1ZTimZWkgbxzAr6Y3B5NVyPl/syJlWNHzxIU
        G3Cfd3EWz9kOmwJAoy19GJbIaQ==
X-Google-Smtp-Source: ABdhPJzZud4xEczlEpaWj6i0hJdD2WC6JoekhZsoal2NcPjLhS9Axq5tyLRHzLkzraChV7ItFkPPIA==
X-Received: by 2002:a05:6a00:23ce:b0:50d:823f:981 with SMTP id g14-20020a056a0023ce00b0050d823f0981mr8861123pfc.10.1651943899731;
        Sat, 07 May 2022 10:18:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c6-20020a170902724600b0015e8d4eb2e6sm3839174pll.304.2022.05.07.10.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 10:18:19 -0700 (PDT)
Date:   Sat, 7 May 2022 10:18:18 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202205071017.A93125B0E@keescook>
References: <20220505174025.07cc9967@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220505174025.07cc9967@canb.auug.org.au>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 05, 2022 at 05:40:25PM +1000, Stephen Rothwell wrote:
> After merging the kspp tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> [...]
> 
> Caused by commit
> 
>   f4cfacd92972 ("lkdtm/stackleak: rework boundary management")
> 
> or maybe commit
> 
>   cbe7edb47d3c ("stackleak: rework stack low bound handling")
> 
> CONFIG_GCC_PLUGIN_STACKLEAK is not set for this build.
> 
> I have used the kspp tree from next-20220504 for today.

Thanks! Sorry for the glitch; Mark's fix should be visible now.

-- 
Kees Cook
