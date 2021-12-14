Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0523F47485A
	for <lists+linux-next@lfdr.de>; Tue, 14 Dec 2021 17:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236123AbhLNQj2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Dec 2021 11:39:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236091AbhLNQj1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Dec 2021 11:39:27 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181B1C061574
        for <linux-next@vger.kernel.org>; Tue, 14 Dec 2021 08:39:27 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id n17-20020a9d64d1000000b00579cf677301so21462947otl.8
        for <linux-next@vger.kernel.org>; Tue, 14 Dec 2021 08:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A1RKIABzLXozSTYS++5X2nHFwuaAyVJUV7kAQnW/Xd0=;
        b=D91xl2OmQ74oHpYWWwhABoBP4k1YJA4auMst9K+kAAgId5wpMHVlK/k7aGk0rsNgTZ
         G6W5k9ZEGoWTTtfM4DNODVuEsJzADZCnPixQ/2Y6abECGOgIg80eHVlue2LxysmfPSah
         GP/w4RvwT9XFOVgYwQgsdXpU+LyjLu7jV4efo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A1RKIABzLXozSTYS++5X2nHFwuaAyVJUV7kAQnW/Xd0=;
        b=pqj15JSReFdNA6p5NuWD4Eayc9X0fR5x/6phpTWfi9xVKkMcYD07sTPHt4p5Zrs+27
         68HpflBS2Y9OEM25QUy+Rcr2UPqd5b+M0vfDXiy7ksk/I7YkIWMVngrShaBqONqvEXEW
         9Hq9WYYi1kipowwMlORPqtV52+FvTM17fzIt6+Kn5vN7eKcfcm1TeS5eiBNzvXRDJkrx
         yYvOBLsSQ37HoqQfxQauY+/EG5bFJxKjNakl001u4AtEkLhOKtjh8uPgNxDBUQ0PmBSw
         CjW5P2ybn0y57I8L0q34ThycKHAY5c3W+p7mNA8cHtlBEJYB7EnRETguqP7nFxQvB/1E
         kY+Q==
X-Gm-Message-State: AOAM5339pRwZ3sHO07Hc/dtbVsX0lTmIX+wqefjM3/JbURt8XL8hnwdD
        F0ODuAJ3FOb7gOf7uCB+TAcWblN4kg2+Nw==
X-Google-Smtp-Source: ABdhPJz1b/E9tBP/pB4bUKn2ekqxvbKXfIAzaBvJQMlh60PGDAN1MGP18Ag/jAVnbMNq0n1H/1vbpA==
X-Received: by 2002:a9d:7459:: with SMTP id p25mr5038261otk.247.1639499966418;
        Tue, 14 Dec 2021 08:39:26 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id j5sm64501oou.23.2021.12.14.08.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 08:39:26 -0800 (PST)
Subject: Re: linux-next: manual merge of the xarray tree with the kselftest
 tree
To:     broonie@kernel.org, Matthew Wilcox <willy@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20211213222443.474487-1-broonie@kernel.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <1dcd2d43-cf39-3b4c-49b5-138d94f34433@linuxfoundation.org>
Date:   Tue, 14 Dec 2021 09:39:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211213222443.474487-1-broonie@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/13/21 3:24 PM, broonie@kernel.org wrote:
> Hi all,
> 
> Today's linux-next merge of the xarray tree got a conflict in:
> 
>    tools/include/linux/kernel.h
> 
> between commits:
> 
>    d6e6a27d960f9 ("tools: Fix math.h breakage")
>    066b34aa5461f ("tools: fix ARRAY_SIZE defines in tools and selftests hdrs")
> 
> from the kselftest and origin trees and commit:
> 
>    f2aa11fd51440 ("tools: Fix math.h breakage")
> 
> from the xarray tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc tools/include/linux/kernel.h
> index 9701e8307db02,3e8df500cfbd4..0000000000000
> --- a/tools/include/linux/kernel.h
> +++ b/tools/include/linux/kernel.h
> 

Thank you. I will keep track of this when I send pull request.

thanks,
-- Shuah
