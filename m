Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A26182D33B8
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 21:28:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgLHUYP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 15:24:15 -0500
Received: from mail-il1-f172.google.com ([209.85.166.172]:33931 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgLHUYO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2020 15:24:14 -0500
Received: by mail-il1-f172.google.com with SMTP id x15so16712922ilq.1;
        Tue, 08 Dec 2020 12:23:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Q6NWRu0JKYjkSKoX9I3d4KbPD1VXfKxekQuoiZAo6xY=;
        b=GQpkVNGzQHoAryWeOu2uD7PKDafeBbn+3P9QZtInYaggpt2EPSdhbKZej4RG6JB1Wi
         ItPS3wdyNatCYtkxHCQAMqdGpctI2K/+jTD+svhJh+qd3bTVPGeDI9aq0etXpbXCOtAj
         UUczEFTWS9SgtKcWaUOCVdwDZZJAMSoDNNikLP67/EGbMsDwRl25OkEM7Rf6oS2HDPT4
         d7cX4vXC4ZZ6GyoVQi8eov2AXZbuW1wv2j0rsmgxKuB3sjE8ek0ZPCbpIZ0zbSdRxhtz
         MuDdh4HyUNx2KVVsUcMcuj/MYpso3+EZn1sv0l41juTw2ePwTtFBTl2YaQzu4JKqfIsk
         D/eg==
X-Gm-Message-State: AOAM530KC15G2GlQiHNp9UCtE3bdgjFD9IOry6iHniiq3qpcr6IMjisO
        +Ni2DJ2rM7oBN5u2uVAkQXX+PU8G6V4=
X-Google-Smtp-Source: ABdhPJy43iErXqaJbEI+KdAzzThDnBtZL2L9D5ebJ78wffo3zIpgAH6EZzghH6bB62zYW4mWiEdN/g==
X-Received: by 2002:a65:5ac4:: with SMTP id d4mr14854746pgt.50.1607457416741;
        Tue, 08 Dec 2020 11:56:56 -0800 (PST)
Received: from [192.168.4.110] (c-73-241-217-19.hsd1.ca.comcast.net. [73.241.217.19])
        by smtp.gmail.com with ESMTPSA id h7sm19344124pgi.90.2020.12.08.11.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Dec 2020 11:56:55 -0800 (PST)
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
To:     Alan Stern <stern@rowland.harvard.edu>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Can Guo <cang@codeaurora.org>, Christoph Hellwig <hch@lst.de>,
        Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201208202853.186ae136@canb.auug.org.au>
 <20201208203859.686f83eb@canb.auug.org.au>
 <20201208175526.GH1298255@rowland.harvard.edu>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <367308ee-25e7-e40e-ba3a-6b2138c20969@acm.org>
Date:   Tue, 8 Dec 2020 11:56:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201208175526.GH1298255@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/8/20 9:55 AM, Alan Stern wrote:
> Yes, that certainly is the proper fix.  It's all to easy to miss these
> issues that depend on your kernel configuration.
> 
> Bart, can you fold it into a new version of the patch?

Sure, I will do that.

Thanks,

Bart.
