Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42CDD4748DD
	for <lists+linux-next@lfdr.de>; Tue, 14 Dec 2021 18:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233739AbhLNRGq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Dec 2021 12:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235956AbhLNRGp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Dec 2021 12:06:45 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB21C06173F
        for <linux-next@vger.kernel.org>; Tue, 14 Dec 2021 09:06:45 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so21538918otg.4
        for <linux-next@vger.kernel.org>; Tue, 14 Dec 2021 09:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IemfCDmXWx/SPnnub7QAI6IhttPGClVQvWol1/Vo8hE=;
        b=RfVV6DnVFt1imQzcrX+WIWydNs7BF19SXFkIHEtUg1n/CkWAkas8Z4tcWA0qcqEAPn
         igA5N73E1RtEwHAS6CeM+ooIhpZdT0yw826Tf6CocThL1ho6KQHjWocZkVD7HClqKvNr
         cY6G4qwOvCEaLjAmOvtoU0M4H/VJuFm9HRAa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IemfCDmXWx/SPnnub7QAI6IhttPGClVQvWol1/Vo8hE=;
        b=Lac8ThkUyqYNE+g7prikfQ+lWT6qBPh4D7o+r41/c7BzNNErwlsimRf5KdiHpLUUCW
         oFz/eEKTY8YQIL/gbig5Cb7+47DM6qP3SQI6qYAidWSNYcCeYwiHoB1QW6mChZTRfbvy
         RvLSsuYoSlGNsrJV75ReOW6VcBP72rgE4QkhPMpk9nWCT0q90GiwP9SbEyVH3HfGoDtZ
         rBNGpJ7gljNLIOGRTJGJiJ3D+pR/OVVRsc6pk8uX0NRDXmTS3dywqGYfs9lvnfdc59rX
         9IdfHOzKyuLfHYojF2c++kr7R36fLqU13WzDpupVrvKKCkOlLvNA7jhOVfxVaxHDZmt+
         XFpw==
X-Gm-Message-State: AOAM530bP+O3dHEfb+p5F1TgqyRKkAeTLiRNzM7qMMkBRdhPN1zP/ofC
        HLGzp9eN1/YubAaDK0uibptVCg==
X-Google-Smtp-Source: ABdhPJzPXw827om0Y5Cd811nXaXL7/9e41CMccQTS2B8fiI1FTev8YKMtcA3PITQyHJiKz1ClqAf8Q==
X-Received: by 2002:a05:6830:1d7c:: with SMTP id l28mr5241205oti.372.1639501604855;
        Tue, 14 Dec 2021 09:06:44 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id bl33sm76949oib.47.2021.12.14.09.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 09:06:44 -0800 (PST)
Subject: Re: linux-next: manual merge of the xarray tree with the kselftest
 tree
To:     Matthew Wilcox <willy@infradead.org>
Cc:     broonie@kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20211213222443.474487-1-broonie@kernel.org>
 <1dcd2d43-cf39-3b4c-49b5-138d94f34433@linuxfoundation.org>
 <YbjMLHCRXNMwp4nU@casper.infradead.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <2ee0bba7-879f-40e2-dd7d-d9b264d4d493@linuxfoundation.org>
Date:   Tue, 14 Dec 2021 10:06:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YbjMLHCRXNMwp4nU@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/14/21 9:54 AM, Matthew Wilcox wrote:
> On Tue, Dec 14, 2021 at 09:39:25AM -0700, Shuah Khan wrote:
>> On 12/13/21 3:24 PM, broonie@kernel.org wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the xarray tree got a conflict in:
>>>
>>>     tools/include/linux/kernel.h
>>>
>>> between commits:
>>>
>>>     d6e6a27d960f9 ("tools: Fix math.h breakage")
>>>     066b34aa5461f ("tools: fix ARRAY_SIZE defines in tools and selftests hdrs")
>>>
>>> from the kselftest and origin trees and commit:
>>>
>>>     f2aa11fd51440 ("tools: Fix math.h breakage")
>>>
>>> from the xarray tree.
> 
> I've dropped that commit from the XArray tree since d6e6a27d960f9
> was essentially f2aa11fd51440 applied to Linus' tree.  The only change
> left in the XArray tree today is a documentation update.
> 
>> Thank you. I will keep track of this when I send pull request.
> 
> As long as what you have merges cleanly against Linus' tree (and I see
> the "conflict" -- __round_mask() is defined adjacent to ARRAY_SIZE()),
> then it'll be fine.  You might want to rebase to a more recent Linus
> tree to get rid of the conflict.
> 

When I applied on rc4 base, I didn't see any problems. This is a minor
one - I can mention this when I send my pull request. Shouldn't be a
problem.

thanks,
-- Shuah
