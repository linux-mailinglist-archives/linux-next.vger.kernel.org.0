Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC1A644FB0
	for <lists+linux-next@lfdr.de>; Wed,  7 Dec 2022 00:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiLFXhJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Dec 2022 18:37:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLFXhI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2022 18:37:08 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E61E3E099
        for <linux-next@vger.kernel.org>; Tue,  6 Dec 2022 15:37:07 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso19552611pjt.0
        for <linux-next@vger.kernel.org>; Tue, 06 Dec 2022 15:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=otCW253l7ot84a9vVRmiVoG+lIxgrQNkYbdDhCOtC9c=;
        b=haGQ+FidVA17wTfx2NQ/Pqq/OpXe0/1Dzr59IUgqxAZNDk/WVBWDpcWJ3Z0fulUStb
         c9584Lh0t96uOzS0fNsUaG3BeUFW/tFfU14Y5naNZYWEGRdecx0Ipv+sGXFNxH6hWuys
         qqWvECLFxx4lkR87n0Itr+zaBfL1HXV8FGs7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otCW253l7ot84a9vVRmiVoG+lIxgrQNkYbdDhCOtC9c=;
        b=T1fGC4+eBrOzl4UMs5YR4fAWpeihZ22DY3EvPxXFRv2pZwvUjgg/h/E40YVt+XU7el
         7kMUV6OVyauRWISnKE5LZBQTIgPi+cjNJTVpnN/ZO8Hyw2PBcB3bgrhA/stxr8eQWKCg
         c2yT+koC23fHiLuf1eSqHOnzCaspFR8IE6AEN6rkO6i6sgjzjs2VXnrmvpuQa/yP7cwM
         /TKi2jO1ekQHPVp3z9IQvXLCPrwXfY5WZE//2ANFc19MXqnzo2BPaJ+DV18kxN2bxFvP
         OdT87B6BJ6y5ZRPFKWNa5bnGx7qS0iJkq1eeUkz6d02JZmchbM2bg5k7GZSgvZc4XujM
         mONg==
X-Gm-Message-State: ANoB5pmx/jHx1QYPBwr6j68p6+vpMFAyyKRoa3Hs1H/yEIL5nWUaibWF
        5XqbviBG03UM5wDgRdNYw0K5nQ==
X-Google-Smtp-Source: AA0mqf4q1OYKyKIO9N36w2rvWCO+pr3fDJLBXlCWFivm02RH39BnlErnrXEIOx2DhnvBhvDcTwOt7w==
X-Received: by 2002:a17:90a:d383:b0:219:c8d3:c503 with SMTP id q3-20020a17090ad38300b00219c8d3c503mr14436340pju.65.1670369827082;
        Tue, 06 Dec 2022 15:37:07 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w10-20020a62820a000000b00574cf11aaf3sm12178022pfd.208.2022.12.06.15.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 15:37:06 -0800 (PST)
Date:   Tue, 6 Dec 2022 15:37:05 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Ryder Lee <Ryder.Lee@mediatek.com>
Cc:     Shayne Chen =?utf-8?B?KOmZs+i7kuS4nik=?= 
        <Shayne.Chen@mediatek.com>,
        StanleyYP Wang =?utf-8?B?KOeOi+S+kemCpik=?= 
        <StanleyYP.Wang@mediatek.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Howard-YH Hsu =?utf-8?B?KOioseiCsuixqik=?= 
        <Howard-YH.Hsu@mediatek.com>,
        "gustavo@embeddedor.com" <gustavo@embeddedor.com>,
        Evelyn Tsai =?utf-8?B?KOiUoeePiumIuik=?= 
        <Evelyn.Tsai@mediatek.com>,
        Money Wang =?utf-8?B?KOeOi+S/oeWuiSk=?= 
        <Money.Wang@mediatek.com>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
        "nbd@nbd.name" <nbd@nbd.name>,
        MeiChia Chiu =?utf-8?B?KOmCsee+juWYiSk=?= 
        <MeiChia.Chiu@mediatek.com>,
        "lorenzo@kernel.org" <lorenzo@kernel.org>,
        "kuba@kernel.org" <kuba@kernel.org>,
        Sean Wang <Sean.Wang@mediatek.com>,
        "kvalo@kernel.org" <kvalo@kernel.org>,
        "edumazet@google.com" <edumazet@google.com>,
        Sujuan Chen =?utf-8?B?KOmZiOe0oOWonyk=?= 
        <Sujuan.Chen@mediatek.com>,
        Chui-hao Chiu =?utf-8?B?KOmCseWegua1qSk=?= 
        <Chui-hao.Chiu@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Bo Jiao =?utf-8?B?KOeEpuazoik=?= <Bo.Jiao@mediatek.com>
Subject: Re: Coverity: mt7996_hw_queue_read(): Integer handling issues
Message-ID: <202212061535.5D3DA489FB@keescook>
References: <202212021411.A5E618D3@keescook>
 <786eff1a1751a5bc0dc68d6567be585b635bddb1.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <786eff1a1751a5bc0dc68d6567be585b635bddb1.camel@mediatek.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Dec 03, 2022 at 04:40:09AM +0000, Ryder Lee wrote:
> On Fri, 2022-12-02 at 14:11 -0800, coverity-bot wrote:
> > Hello!
> > 
> > This is an experimental semi-automated report about issues detected
> > by
> > Coverity from a scan of next-20221202 as part of the linux-next scan
> > project:
> > 
> https://urldefense.com/v3/__https://scan.coverity.com/projects/linux-next-weekly-scan__;!!CTRNKA9wMg0ARbw!jBOoj6LMqqA8E0AyjKQTa-0rVzcFiZ3BbpciEIn7so974kcMBeG4zZm-QU4AudLXY7-jNUSt0unzAt2zirSF$ 
> >  
> > 
> > You're getting this email because you were associated with the
> > identified
> > lines of code (noted below) that were touched by commits:
> > 
> >   Thu Dec 1 17:29:14 2022 +0100
> >     98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi
> > 7 (802.11be) devices")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1527813:  Integer handling issues  (SIGN_EXTENSION)
> > drivers/net/wireless/mediatek/mt76/mt7996/debugfs.c:460 in
> > mt7996_hw_queue_read()
> > 454     	for (i = 0; i < size; i++) {
> > 455     		u32 ctrl, head, tail, queued;
> > 456
> > 457     		if (val & BIT(map[i].index))
> > 458     			continue;
> > 459
> > vvv     CID 1527813:  Integer handling issues  (SIGN_EXTENSION)
> > vvv     Suspicious implicit sign extension: "map[i].qid" with type
> > "u8" (8 bits, unsigned) is promoted in "map[i].qid << 24" to type
> > "int" (32 bits, signed), then sign-extended to type "unsigned long"
> > (64 bits, unsigned).  If "map[i].qid << 24" is greater than
> > 0x7FFFFFFF, the upper bits of the result will all be 1.
> > 460     		ctrl = BIT(31) | (map[i].pid << 10) |
> > (map[i].qid << 24);
> 
> u32 ctrl = BIT(31) | (map[i].pid << 10) | (map[i].qid << 24);
> 
> Hmm ...where's type "int" (32 bits, signed) from?

	map[i].qid is promoted to int before the "<< 24".

-- 
Kees Cook
