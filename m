Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11F8236219D
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 16:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235840AbhDPOCc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Apr 2021 10:02:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57849 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235815AbhDPOCc (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Apr 2021 10:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618581727;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CsnX1uUtSEgpJZw9F0YXVXLSEsEMxeYY82QRT9JM2Rk=;
        b=hDC6dBT8r/Llj13PHJ3cy3J7kIdRkgVlDgmfmK5a7Vo/XqRaHVkwsl/a1DxZTol04upY5i
        fPbE5dPWO3tKMPPwM31L3iho+pSrSpUEmkI3NBQhh1sku+JhnGQ5eREsiU3ZRFxAZDDC+h
        4j+HZEuIqWT2NYjDG6G67Wyd2x1/zGc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-YDTzPrK3PtyKCix5HnvscA-1; Fri, 16 Apr 2021 10:02:04 -0400
X-MC-Unique: YDTzPrK3PtyKCix5HnvscA-1
Received: by mail-ed1-f72.google.com with SMTP id f1-20020a0564021941b02903850806bb32so1116069edz.9
        for <linux-next@vger.kernel.org>; Fri, 16 Apr 2021 07:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CsnX1uUtSEgpJZw9F0YXVXLSEsEMxeYY82QRT9JM2Rk=;
        b=kVnRKkfMp2N3HSO5MYo488TuGTd1CHg8P9THCbjdtUKl8W7mdH9dPIruCZUfjdkRSf
         LkAP8qTULXkn3l9djkcDITOi+VZDZELQIKJvyVO+zII2uk/a2JKtJMnrmLjhzLo2Mcn4
         W94M9kM+DyOImunOy6sieRwHxsaXyQBnODpxugA7Ff3XNiRVgkHrO3Jf7eGYS8usBkXX
         SWrLnybws3RdNSBABR3dGx18LWp952YVQCV0cr1I8PsQk9eBqQgE/AvC7WmHBQSEOmJG
         CeNn9ddtvJOfDg7ofpZexij4pLPwvoWb0q1pzoUpXuSdvMd2+Oe990LMTW0UlgcA92ey
         D5zw==
X-Gm-Message-State: AOAM532QQ9KryjKmRGJfwh7UdhQvc6jPNlfmo6XyEBDw8FwWI2aIohyU
        mjyw4kOEn9UvB4SIndGb13WKTLa7L7Zpkhk1XI3cbenJYHHJbqmFvl2WwH/x0yjISDH0zKj9RM/
        0DS4lSlSPxG+HmtSQdWYvLumLZmwvgpfOyx+GcN2VrTxSUdaBFYcUodNl6BGAyJiWUfWUx2+oVw
        ==
X-Received: by 2002:a05:6402:2552:: with SMTP id l18mr9944480edb.71.1618581723126;
        Fri, 16 Apr 2021 07:02:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxER520adn508n7gqk1PlMU2QCKke3crrQVS65fvfRhHVdi9QlT7AtgFN9IE4YPxeKcEvIP2g==
X-Received: by 2002:a05:6402:2552:: with SMTP id l18mr9944450edb.71.1618581722818;
        Fri, 16 Apr 2021 07:02:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id jl8sm375691ejc.122.2021.04.16.07.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 07:02:02 -0700 (PDT)
Subject: Re: linux-next: Fixes tag needs some work in the kvm tree
To:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        KVM <kvm@vger.kernel.org>
Cc:     Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210416222731.3e82b3a0@canb.auug.org.au>
 <00222197-fb22-ab0a-97e2-11c9f85a67f1@de.ibm.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2b825142-fdd9-be35-6d88-bb3b9c985122@redhat.com>
Date:   Fri, 16 Apr 2021 16:02:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <00222197-fb22-ab0a-97e2-11c9f85a67f1@de.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 16/04/21 14:38, Christian Borntraeger wrote:
> On 16.04.21 14:27, Stephen Rothwell wrote:
>> Hi all,
>>
>> In commit
>>
>>    c3171e94cc1c ("KVM: s390: VSIE: fix MVPG handling for prefixing and 
>> MSO")
>>
>> Fixes tag
>>
>>    Fixes: bdf7509bbefa ("s390/kvm: VSIE: correctly handle MVPG when in 
>> VSIE")
>>
>> has these problem(s):
>>
>>    - Subject does not match target commit subject
>>      Just use
>>     git log -1 --format='Fixes: %h ("%s")'
> 
> Hmm, this has been sitting in kvms390/next for some time now. Is this a 
> new check?
> 

Maybe you just missed it when it was reported for kvms390?

https://www.spinics.net/lists/linux-next/msg59652.html

The SHA1 is stable now so it's too late.  It's not a big deal I guess.

Paolo

