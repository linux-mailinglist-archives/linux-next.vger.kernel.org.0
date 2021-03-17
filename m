Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7976533F9B5
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 21:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233383AbhCQUEf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 16:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233322AbhCQUEN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 16:04:13 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32AAC06174A;
        Wed, 17 Mar 2021 13:04:12 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id z6-20020a1c4c060000b029010f13694ba2so2018929wmf.5;
        Wed, 17 Mar 2021 13:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iXDvF5CUz9LOByKR7QUQdMqBawMPMdYTHD7CyIz+LY8=;
        b=SoQ9fIej6WAb/cTw/E+DBPWmxxkWmCVSO1U2BMavkYOCUtgtRzU2wOpl/QTaUaWdTS
         qdv8xdybwJk9eCQvrxxJomawpMKRHCKIQzvbXIbiRSXg2y1w3PDzoOZT2pLl5BGaOHve
         ioBTexO6bAiHDeRboes6n7AKUDRGX73rDeRFc3lIMbID59iexHVj2bK3E8pFQGH5fbZn
         BX81qVJOQlkA4yQwuTZVJ6nNxuAWACpw4YPwWUZ2UrA7ek1jJIjgK+8WGo0qJ5PSS23t
         Dh9AI76CDPDA3F4aJwIWZRzxOLQIWw1JEdrZGGOwUMZfOU2vWbkpZXJm/DCHo37AeWRI
         54eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=iXDvF5CUz9LOByKR7QUQdMqBawMPMdYTHD7CyIz+LY8=;
        b=YeIQmi5pjnyVu8FhUht05u7Ph/+RsG0RV8dpTPpSrWNdji+ugBKtjXSpWtv2D/813v
         w5KUK20/YaExyCW80SAFTUb6dfPTS6Jyo+rWe4v1Q3dOKqurIfLHRegT7GMY1ngwMNJt
         DiWJKFGPSDbUCTVIn6AdezWrR5xQNsahMsJ2g1GAVWityiDpKeHDjuQ5TPa+vniLv0MO
         61konzNrGouQWRMNEEoFNvFQAb5QKbAM8haXzLFMSMSPhQ6C3w8GYQKzG3tNFWgMs09m
         V7vKIf5dINqGbB1UCbE3RkcRcKAhy9IEVAhYqYf1UWYgsv04PdgnJcvuuVKLfxqozlja
         3EsA==
X-Gm-Message-State: AOAM533j5N7IyeHiwDDal0Rfy3NOWYDw7dnntnlUPZrPw1sZHpmEib4b
        PzDFd2prI86mOehgyFSaQVA=
X-Google-Smtp-Source: ABdhPJzPkFdf4EsXz5AUD5fk5N6/OYaKJgTNyZTrBNhI/8FFZ/4P7IND3sEyBX26ZZYicY23xkvyxg==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr474793wmi.112.1616011451404;
        Wed, 17 Mar 2021 13:04:11 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id s9sm3520343wmh.31.2021.03.17.13.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 13:04:10 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Wed, 17 Mar 2021 21:04:08 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Borislav Petkov <bp@suse.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Ian Rogers <irogers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20210317200408.GA3830960@gmail.com>
References: <20210317150858.02b1bbc8@canb.auug.org.au>
 <20210317105432.GA32135@zn.tnic>
 <CAP-5=fWKCtJq-9zd5A-XALJWNf8tsds44m-G07sc+kCUoXB8zg@mail.gmail.com>
 <20210317180236.GF32135@zn.tnic>
 <20210318054921.64c0fc75@canb.auug.org.au>
 <20210317191847.GG32135@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210317191847.GG32135@zn.tnic>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Borislav Petkov <bp@suse.de> wrote:

> On Thu, Mar 18, 2021 at 05:49:21AM +1100, Stephen Rothwell wrote:
> > That fixes the powerpc build for me, thanks.
> 
> Thx, adding your Tested-by and pushing out.

I've pushed this out into tip:auto-latest as well, so that tomorrow's 
-next should pick this up automatically. (Assuming everything else is 
fine.)

Thanks,

	Ingo
