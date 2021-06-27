Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70AAC3B5534
	for <lists+linux-next@lfdr.de>; Sun, 27 Jun 2021 23:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231518AbhF0VOl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 27 Jun 2021 17:14:41 -0400
Received: from mail-pf1-f173.google.com ([209.85.210.173]:46971 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbhF0VOk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 27 Jun 2021 17:14:40 -0400
Received: by mail-pf1-f173.google.com with SMTP id x16so12328467pfa.13;
        Sun, 27 Jun 2021 14:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cR0LSa7hQHxDZ8gB3Did0Bb+VeSNqfYHg3w0G+AVSOY=;
        b=lwV52RKs7/jFSfkdsUKmIcUUevnMY7hSw0SVquuj/G89S6iNNNDEfH3QnLT7uRo0Wd
         RIHsAtiaRTqT4ZYtIFM131VRG45+duv1XallWN2iVGXej2y7LHzoOm2bxa68VTdWWHKV
         BJkenvJAxsahl4zGa+BurQKk5M22jaz12tuFDmG73qyRlLqVMApAd2vw87QclkCEbcaa
         0Sw11R5tHW3E9pE2Msjsi5BnsW2clJh29c/jpPNecZHYAQMqGyrX/XL78s/7FnB2nULV
         mVO5PF3b5EnB0lLRpWzuNTkX/ZAHDjo49b/2nLepW6ez+SUkf5mFEhUiB2RZxueWeKF8
         uVbg==
X-Gm-Message-State: AOAM531VVjCye/79hiSNCPlJuN9mzeJqGfzQFl5YSMWYlz7CraPty/a7
        ZKgmbwDiYgX50Da4Xxjj8lgiENUDjHY=
X-Google-Smtp-Source: ABdhPJz2dvDEjoTFobY6u4OvX1N/qlgiX9LWwds3dVb5opirv0byCScSz57eVmf9KYDYqsVvc2ZtXw==
X-Received: by 2002:a63:191d:: with SMTP id z29mr20515543pgl.126.1624828335119;
        Sun, 27 Jun 2021 14:12:15 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id z26sm7862066pfk.112.2021.06.27.14.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 14:12:14 -0700 (PDT)
Subject: Re: [powerpc][next-20210625] WARN block/mq-deadline-main.c:743 during
 boot
To:     Sachin Sant <sachinp@linux.vnet.ibm.com>,
        linux-block@vger.kernel.org
Cc:     linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        axboe@kernel.dk
References: <74F24228-8BC7-49FA-BD43-A9FB90269E76@linux.vnet.ibm.com>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <d9bb36b5-fb81-8394-e80c-1dc4562376e4@acm.org>
Date:   Sun, 27 Jun 2021 14:12:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <74F24228-8BC7-49FA-BD43-A9FB90269E76@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/27/21 6:30 AM, Sachin Sant wrote:
> While booting 5.13.0-rc7-next-20210625 on POWER9 LPAR following warning
> is seen [ ... ]

Please help with testing of the patch that is available at
https://lore.kernel.org/linux-block/20210627211112.12720-1-bvanassche@acm.org/T/#u

Thanks,

Bart.
