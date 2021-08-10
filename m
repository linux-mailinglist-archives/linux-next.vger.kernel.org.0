Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9CE3E5A9A
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 15:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241066AbhHJNB7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Aug 2021 09:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238155AbhHJNB7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2021 09:01:59 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95922C061798
        for <linux-next@vger.kernel.org>; Tue, 10 Aug 2021 06:01:37 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id e19so7342436pla.10
        for <linux-next@vger.kernel.org>; Tue, 10 Aug 2021 06:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pSUZ1V/TT3GxnZ/SQCtnrpNBlM+RKsjso4hfU/Kzd+M=;
        b=seVT7c78HqYysBY0+TO7yVtcssykcqXRPxR4swEdDLNIkiVACBQO7y8Zs/cxbyqDcP
         RGIbuMcKu8DndKAPDzCHUHXE3cQ+nMGa81IPBQOAgnIuOKR5ep4iBfl5CTqBbG2knG5+
         +Z/wSlWaevje/G3ktuzZ14oZAXi+gyozYBZLjvZr6+4JL8x6nrjcOpLpLvWZWccZQGHa
         g8dvZCXPjlGWiqLsHUwGelCWtoH5nn5gTn3k7lepQahjkBEWtbEV8G3E2EGDg2e8Kj91
         9tiXvWZV9a2Gi+ANXDw/j6EYiVPXOdivfZj5kl09P12mhCEBxQN9Fwwn+SB/gMfNwAkw
         CjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pSUZ1V/TT3GxnZ/SQCtnrpNBlM+RKsjso4hfU/Kzd+M=;
        b=nZjp23IYL/0hBdovv2PzkULA+Ze/mkpOSxTDWWh2Z0T53KV1cn4FB++6iTCDzK6FOt
         kri8zYeWVtuFJvtrfZHMoQqQxb5rIOuUJMlxUJCkSs15B2HsRJSy3WTipzywDSxFo2Tb
         x3YuNrYBhvlutzLhOhVFpByQOnFvC7xwtKwAolUZHISROslrmyUatjhnp8doKK1j588/
         qsPVG/9dlPc5lMsnrihK6G7vyNouctz/i/u6zAv7I4mxLenvFN6T2X5cF+pMG6Ms7yFI
         RQcbZXTVYRU5C8tMSwWeX73n2LRB1FlUZZfswcsHMYnLWqpC5QrtpXJBxJrVGSejDEX6
         LEGA==
X-Gm-Message-State: AOAM531E3fm+tkyCaR9Zx/6p65EVrPlXD06aqkl6fGs+xvxB3mQEzrHJ
        MBWChl4o54o8lKQYugIJXv56AvK/biy8RwUM
X-Google-Smtp-Source: ABdhPJyMtSRuDNVK02DsgMAnla5RRq9IyzqIWOXPwpSmIGPzjS2YjIqAyP5ag735Uktpxwnm0Ynctw==
X-Received: by 2002:a63:c04a:: with SMTP id z10mr862519pgi.99.1628600496790;
        Tue, 10 Aug 2021 06:01:36 -0700 (PDT)
Received: from [192.168.1.116] ([198.8.77.61])
        by smtp.gmail.com with ESMTPSA id n11sm3260977pjh.23.2021.08.10.06.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 06:01:36 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the block tree
To:     Christoph Hellwig <hch@lst.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210810203135.7eb7b01a@canb.auug.org.au>
 <20210810125813.GA9836@lst.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <2d4a112b-8ea0-3440-6c63-c3d1463b7577@kernel.dk>
Date:   Tue, 10 Aug 2021 07:01:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210810125813.GA9836@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/10/21 6:58 AM, Christoph Hellwig wrote:
> The patch below fixes it.
> 

Added, thanks.

-- 
Jens Axboe

