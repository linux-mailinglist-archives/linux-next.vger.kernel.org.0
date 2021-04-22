Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2048E3679EB
	for <lists+linux-next@lfdr.de>; Thu, 22 Apr 2021 08:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234645AbhDVGab (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Apr 2021 02:30:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46321 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230228AbhDVGaa (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Apr 2021 02:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619072994;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B6EiPZu3q42UgnLk/MTSD3xsxXo/x21R/hyRmF6Gxlg=;
        b=TJaAEJYeW29n/VDDSimqW7xt0zrBzL0cCUILYjCd7XYa42MQEkjeli4jQ9c/cgGofmKum1
        pRTD2gi9elb7sDDZh8TabgBdRn7gh4eC6Uj4tFWfM9mv1YqAuyYBO7WO8TapaVHrVcYpRy
        z5hlqfOedVPLetyvox7vkLHXl/mGjHk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-yge1uPNaN_KrphTL5kL4zA-1; Thu, 22 Apr 2021 02:29:53 -0400
X-MC-Unique: yge1uPNaN_KrphTL5kL4zA-1
Received: by mail-ed1-f69.google.com with SMTP id l22-20020a0564021256b0290384ebfba68cso12334940edw.2
        for <linux-next@vger.kernel.org>; Wed, 21 Apr 2021 23:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B6EiPZu3q42UgnLk/MTSD3xsxXo/x21R/hyRmF6Gxlg=;
        b=QZL9UEuCYX3/+X/eL8MdDxC8fOIs0NFU2pE2k6MYi0DSYvNJlCUtOXIDtA60SdAovf
         EGvl09c9wIEbZFn+sBdsA+0UaKKVSx9hXNK0hiwSpvnXNXLMWcB3aPsgFXjpy8sBC/tK
         phJ1ZGDZg8FZqSOV5pmwg0/DFKzoHcS8fZLij3gfle/kW5hPRkANP0LV1wAz8uePrJIA
         wWtL/tCZ7D7rYdyb0iK+soiwXEhcHt2WxAMSiL+7a+2njre0CrLDAJHouIRY7+93/eWt
         dyiVh1FbGrYxzi+JyD3UEogAdF2HMEeL3634itZ0xgrY3/1DjXc3d9KKbEi9CDYkeBG/
         T3iQ==
X-Gm-Message-State: AOAM5307+PNaU/YXsUe4te3lsHbK05QvxPnTriNo9ftwEdbLVqviSH8m
        OSoEDcUeA/c9we7L/kfi1v42OsRaDW1aFFVCP5jujdoQzx4upoXcGhUi6dDKAfmNbzyopNdsA0t
        +s0/WOHPCoeKhDhHqCpj5Ag==
X-Received: by 2002:a17:906:d8cd:: with SMTP id re13mr1734328ejb.141.1619072991940;
        Wed, 21 Apr 2021 23:29:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysC/AMNwvEFPxfj5p+ELMpnF7pi7Egg3tU8xa4jD4gt4Fb63vh/8/sWYrJjGjhAPk/n/OQcw==
X-Received: by 2002:a17:906:d8cd:: with SMTP id re13mr1734316ejb.141.1619072991741;
        Wed, 21 Apr 2021 23:29:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id ca1sm1162161edb.76.2021.04.21.23.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 23:29:51 -0700 (PDT)
Subject: Re: linux-next: manual merge of the kvm tree with the tip tree
To:     Nadav Amit <namit@vmware.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Wanpeng Li <wanpengli@tencent.com>
References: <20210422143056.62a3fee4@canb.auug.org.au>
 <142AD46E-6B41-49F3-90C1-624649A20764@vmware.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e69ecd92-f87c-eb8b-c288-83efb13bb3eb@redhat.com>
Date:   Thu, 22 Apr 2021 08:29:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <142AD46E-6B41-49F3-90C1-624649A20764@vmware.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 22/04/21 06:45, Nadav Amit wrote:
> 
>> On Apr 21, 2021, at 9:30 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi all,
>>
>> Today's linux-next merge of the kvm tree got a conflict in:
>>
>>   arch/x86/kernel/kvm.c
>>
>> between commit:
>>
>>   4ce94eabac16 ("x86/mm/tlb: Flush remote and local TLBs concurrently")
>>
>> from the tip tree and commit:
>>
>>   2b519b5797d4 ("x86/kvm: Don't bother __pv_cpu_mask when !CONFIG_SMP")
>>
>> from the kvm tree.
> 
> Thank you and sorry for that.

No problem, this is a reasonable conflict to have.

Paolo

>>   static void __init kvm_smp_prepare_boot_cpu(void)
>>   {
>>   	/*
>> @@@ -655,15 -668,9 +673,9 @@@ static void __init kvm_guest_init(void
>>
>>   	if (kvm_para_has_feature(KVM_FEATURE_STEAL_TIME)) {
>>   		has_steal_clock = 1;
>> -		pv_ops.time.steal_clock = kvm_steal_clock;
>> +		static_call_update(pv_steal_clock, kvm_steal_clock);
> 
> I do not understand how this line ended in the merge fix though.
> 
> Not that it is correct or wrong, but it is not part of either of
> these 2 patches AFAIK.
> 

