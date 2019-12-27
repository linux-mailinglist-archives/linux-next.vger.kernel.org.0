Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7C3C12BB27
	for <lists+linux-next@lfdr.de>; Fri, 27 Dec 2019 21:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfL0Uot (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Dec 2019 15:44:49 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45189 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfL0Uot (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Dec 2019 15:44:49 -0500
Received: by mail-pg1-f196.google.com with SMTP id b9so14949845pgk.12
        for <linux-next@vger.kernel.org>; Fri, 27 Dec 2019 12:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K3t/ohIv/1G+WXqJcypJAaEvLAckbPW2YDllGhef+jg=;
        b=NrlQUp55qjuTWmG4zxNnwmGiH2cbRYVQAgaYI8viwPpkM5MD2dELR+DWGHj7w4qopD
         GxnJoKs89NmUZaRvdbJn/aQX9DMAizGCQ8g3C99/OMiwMWFLCnZq0zd6q1w9FZVA3xOF
         yCViPNnFTfXbnTAb5ucJE8DrUGeOFMgdbPW39KPBqKf02YYKoqkJ6D83F+ujHqBwNP69
         lwUFEXxXKXAbo55h5PPwMpvx4JyHEnb8EkeXz0DYT4dQFRfBKFRXaDCDCdvP6gSPyglM
         YmplgRBUnNvouwHmt3mpy41e7xJtnEG6+g+YAyOGglg4fG3B0GWIMefVB8yM493tYfS8
         sMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K3t/ohIv/1G+WXqJcypJAaEvLAckbPW2YDllGhef+jg=;
        b=HX/Wl/rD20xbTcgj6gPFNQEpGIQX1/ZGqzl6fSZBoLZ2OC6M+x1EbD4c95zOF27W4l
         sSri7K8fPJ4sUToVQFepBkm4kfiv4OGXlTcMnO2yX6bWS6uLvUZQks3+Igh3zfyzL3/y
         t4WX4sedcVyAImOddw+7NeDvGA4K1F2jJI4loPuTJU1Gdtu4nGzzaSIGavo369ASSfL8
         FyLDwLYFd8Fe4ywWU3w+kq9VQEk3Cl3KVY1EbZUyOO8x+/7FYJeea1/hP4TC6DAKttI0
         M/xttSlR6t86jj7dN0VZ7CkzYg8KgZ4qJ9/erQyI/nXXXbaZqFdc22YXV9l09uW5m7eF
         K+1A==
X-Gm-Message-State: APjAAAVKpDuQu1/8jBdUXhGoKLFhsGRAaORp985cXOf2XXzyWxCreEBo
        HzY9SLjzN0ZuxNr/DjR96bBGYQ==
X-Google-Smtp-Source: APXvYqxc7C7eewp3ErxbsMZ6Knsx+oorqN/G7EpqO42ipWXz2vQtGfB+8BkiA1RjIp9yu8Fyby/fyg==
X-Received: by 2002:a63:6946:: with SMTP id e67mr55167556pgc.181.1577479488986;
        Fri, 27 Dec 2019 12:44:48 -0800 (PST)
Received: from [192.168.1.188] ([66.219.217.145])
        by smtp.gmail.com with ESMTPSA id r37sm15855702pjb.7.2019.12.27.12.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2019 12:44:48 -0800 (PST)
Subject: Re: linux-next: Fixes tags need some work in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jaedon Shin <jaedon.shin@gmail.com>
References: <20191228065553.6ba5d28f@canb.auug.org.au>
 <45665759-a76f-5631-51bd-488b04f6bf03@gmail.com>
 <d3ae7893-9b60-ecc2-4a31-65d009ecbb95@kernel.dk>
 <20191228073959.5b3e73b5@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <3e6975e8-0509-c888-5b90-489ca0f40456@kernel.dk>
Date:   Fri, 27 Dec 2019 13:44:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191228073959.5b3e73b5@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/27/19 1:39 PM, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Fri, 27 Dec 2019 13:29:40 -0700 Jens Axboe <axboe@kernel.dk> wrote:
>> On 12/27/19 1:27 PM, Florian Fainelli wrote:
>>> On 12/27/2019 11:55 AM, Stephen Rothwell wrote:  
>>>>
>>>> In commit
>>>>
>>>>   1a3d78cb6e20 ("ata: ahci_brcm: BCM7425 AHCI requires AHCI_HFLAG_DELAY_ENGINE")
>>>>
>>>> Fixes tags
>>>>
>>>>   Fixes: 9586114cf1e9 ("ata: ahci_brcmstb: add support MIPS-based platforms")
>>>>   Fixes: 423be77daabe ("ata: ahci_brcmstb: add quirk for broken ncq")
>>>>
>>>> have this problem:
>>>>
>>>>   - Target SHA1s do not exist
>>>>
>>>> Perhaps you meant
>>>>
>>>> Fixes: 1980eb9bd7d7 ("ata: ahci_brcmstb: add support for MIPS-based platforms")
>>>> Fixes: 7de3244530bf ("ata: ahci_brcmstb: disable NCQ for MIPS-based platforms")  
>>>
>>> Yes, those are the two that should have been used, the two commits were
>>> extracted from a downstream tree where the upstream commits ended up
>>> looking slightly different, my script does not (yet) rewrite those, Jens
>>> would you want me to resubmit or can you rewrite the commit message in
>>> place?  
>>
>> It's too late unfortunately, Linus already pulled it. So we'll have to
>> live with it, at least the commit titles are correct so it should be
>> manageable.
> 
> Unfortunately, even the titles are not correct, so they took me a
> little time to find the correct commits :-(  This means it will also
> take the stable maintainers a bit of time.

Yeah I see, the 2nd one is not. Gah, that really sucks. I'll let stable
know.

Florian, please ensure that future submissions have both the right titles
and shas.

-- 
Jens Axboe

