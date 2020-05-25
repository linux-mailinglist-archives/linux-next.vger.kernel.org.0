Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5EB81E1491
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 21:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389954AbgEYTDE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 15:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389838AbgEYTDD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 May 2020 15:03:03 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5022FC05BD43
        for <linux-next@vger.kernel.org>; Mon, 25 May 2020 12:03:03 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id m7so7753325plt.5
        for <linux-next@vger.kernel.org>; Mon, 25 May 2020 12:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HbVv4aVBbMuxxYm4AyxD7plwOWcCN2YOtp3b/6I1E2s=;
        b=vPxhvtqzNJ83GlMqdEFjYDfYZUQq7lW/PCu6DWIthNO/2r1OnkKVvwr+IbZ/LLlqa8
         kBVkrRTlCcLeXVJnUNEwjVAPpY87TCYlnzWo1YejT1s47jHwHi3JJAleRYfbWiNfxohl
         rE1duvx6sraOorFiXgkB43q1R0NUPaurzXpzHRyB/tNXtaYO6Y9nEMDv4VyQrMxybiS0
         xPKoIaQN3L6on8cYHCcPnSK3X9XnTL2P4GCoOc2bSwsZli8yttrDHVtc94lZe9LM6HMi
         uMUhffKpYly18Vu1lsXIukwG1MLoVWgZfWUi0M42hfzp/wtgWqdaT6i+QYr/uMBRdtgS
         Sbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HbVv4aVBbMuxxYm4AyxD7plwOWcCN2YOtp3b/6I1E2s=;
        b=nr++GpvkaHyYiRKvqTTEMWXUYGyB2ys9U1vmt8HFXxVwjJ23sfdP89HEDJV4Zedkeh
         G0ccsWo0K0MO67+PlTcHRwnokyXkpShIZWpn4spg4kyMqfTXYWfc39moKoAHQOGnG5OW
         xJiwIoiCKvbRC3cfo/U/Y5Rc8kEaawt35N8x4AB+RnC15JYDCa4CExbh/Q95f4DlS4K8
         U119m5mYu24hz/mANGUi95X2hUucdSq1y+Pv34Q/WXjIsXS4TBG2zmfBUv9N2qPHdXHH
         GoUXNno8m1eqHf9pHQ4RfHse5ZsWsCYCrMJN0Hyx+Fnlb5TNoPzKSZDKaAhC+/sFg4uh
         2vyg==
X-Gm-Message-State: AOAM532J09raAs93PlRy9D5MsEFReewHsy0qWRzFimflzM+mX2Hx6We5
        wG5kaHD/bEQMWzEOB92kcj3W5w==
X-Google-Smtp-Source: ABdhPJwnMTUduCySMeV7hX8omxwQ3DhroAc/Kkp597bsG2qsDS6hU9gt9andEX1YZKWM03Lsd/OUIg==
X-Received: by 2002:a17:90a:3563:: with SMTP id q90mr23076563pjb.0.1590433382546;
        Mon, 25 May 2020 12:03:02 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:3c00:cb1c:41a3:c8d? ([2605:e000:100e:8c61:3c00:cb1c:41a3:c8d])
        by smtp.gmail.com with ESMTPSA id z21sm13440594pfr.77.2020.05.25.12.03.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 12:03:01 -0700 (PDT)
Subject: Re: linux-next: Tree for May 25 (fs/io_uring)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        io-uring@vger.kernel.org
References: <20200525224923.41fb5a47@canb.auug.org.au>
 <7fbfc86d-bda1-362b-b682-1a9aefa8560e@infradead.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <f7a9445f-1619-08aa-3e98-5bef9e4409df@kernel.dk>
Date:   Mon, 25 May 2020 13:02:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7fbfc86d-bda1-362b-b682-1a9aefa8560e@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/25/20 10:35 AM, Randy Dunlap wrote:
> On 5/25/20 5:49 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20200522:
>>
> 
> 
> on i386:
> 
> ../fs/io_uring.c:500:26: error: field ‘wpq’ has incomplete type
>   struct wait_page_queue  wpq;

Missing pagemap.h include, didn't bite me on x86-64. I'll fold in
a fix, thanks!

-- 
Jens Axboe

