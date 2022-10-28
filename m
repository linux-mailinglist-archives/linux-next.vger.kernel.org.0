Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0BE61166A
	for <lists+linux-next@lfdr.de>; Fri, 28 Oct 2022 17:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbiJ1Pzb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Oct 2022 11:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiJ1Pza (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Oct 2022 11:55:30 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35E8F7D1E1
        for <linux-next@vger.kernel.org>; Fri, 28 Oct 2022 08:55:23 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d24so5200103pls.4
        for <linux-next@vger.kernel.org>; Fri, 28 Oct 2022 08:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eKtdiD5asKcGWot3PAICGzT56u80z6HIjVaZyNSw2rU=;
        b=I13VML/uh+kpbw0loNqqGGtHcl0MU3xDY7M5+O+4t94zrswJ/AafsezCP1INGzrkol
         kyMoBR16m2ZSRmmbNcD2kHnxgAD2KZ8K6/chntP49loRvF0PNfC24xjLe0nRiSzoV2hi
         Mm3wE5/gacRneLCq9+pxLNp/+NIKG2OYeAeTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKtdiD5asKcGWot3PAICGzT56u80z6HIjVaZyNSw2rU=;
        b=yBi49BjJukAGPg6YH9zgVXgs4JJqDubNEqEvp30Z+UaJDBd5sLt1dQtZYwoqLLpI1W
         K6YKlHIOM7CVG77hcEeetbXqyfAOlc+c5SP947YG02RLEp3Zb/mYOeon8PKQ9U6BleLq
         j7m6ZLWtQvfRtR0V3A4l3OwJ6dBEmwizcLLO4UK1ksh5sRnzGFmlqOOMTI+m2HLmDhU8
         qP0UfpZm1k5+5JViNe4SVIT8Me6mxmTl9gxn5FeIpqNqrH9+SBwu85JuR+GbThxhEASm
         SckeQaHqdjkhZpqZAbkoM++vcL3hvP7lA0COr/90Bqe5I53Guz/YpypolsPfUHOMvd62
         cp0w==
X-Gm-Message-State: ACrzQf3TCpG9uSAyPnoao29bDrZLxhXdcfMikJmNbGfFbLAo6z2rO1TU
        G6fkMcWYQWdnfJ38Zq3TflZJjQ==
X-Google-Smtp-Source: AMsMyM76iHfon276M7DiZpG6PeoABKRPBat/8o0gplD0ZsjUdnkI3K3VC2rsQzxNgPypVSewqGRHEw==
X-Received: by 2002:a17:903:22cb:b0:186:a8ae:d107 with SMTP id y11-20020a17090322cb00b00186a8aed107mr27503882plg.119.1666972522809;
        Fri, 28 Oct 2022 08:55:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q11-20020a170902a3cb00b00174f7d107c8sm3180484plb.293.2022.10.28.08.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:55:22 -0700 (PDT)
Date:   Fri, 28 Oct 2022 08:55:21 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Terrell <terrelln@meta.com>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: Coverity: HUF_buildCTableFromTree(): Memory - corruptions
Message-ID: <202210280854.5DC7284@keescook>
References: <202210261704.A5AAF0C@keescook>
 <2B7F32C0-2068-4191-AB35-8BA6C3B94935@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2B7F32C0-2068-4191-AB35-8BA6C3B94935@fb.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 27, 2022 at 11:07:42PM +0000, Nick Terrell wrote:
> > If these are false positives, please let us know so we can mark it as
> > such, or teach the Coverity rules to be smarter. If not, please make sure
> > fixes get into linux-next. :) For patches fixing this, please include
> > these lines (but double-check the "Fixes" first):
> 
> These are all false positives.

Okay, thanks for investigating them!

-- 
Kees Cook
