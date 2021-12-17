Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5FD47926C
	for <lists+linux-next@lfdr.de>; Fri, 17 Dec 2021 18:07:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239651AbhLQRHU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Dec 2021 12:07:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57858 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239649AbhLQRHU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Dec 2021 12:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639760839;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2+WRMJfHlXftJ9YeoYXvWKoQ/evPaqEvHg4A06Tryvs=;
        b=g6jzlncyysZwniBw6OvSxPpYehBt7fIKm0NOjpEKa+g5g0nRT4/5jj0rYuSf9Wm+tPHfR6
        ZeC8YkF04IJPICKMJByOpByri79iaViy/GAPkqSxLO3Jkk7s/btKTALMftRaqgj8+E8oY7
        zRRM0J1sClDS0k4Yr+n5vVQixeYPfmU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-DDqa_lPRMz-zo3OwIq4pQw-1; Fri, 17 Dec 2021 12:07:18 -0500
X-MC-Unique: DDqa_lPRMz-zo3OwIq4pQw-1
Received: by mail-wr1-f69.google.com with SMTP id f13-20020adfe90d000000b001a15c110077so809352wrm.8
        for <linux-next@vger.kernel.org>; Fri, 17 Dec 2021 09:07:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2+WRMJfHlXftJ9YeoYXvWKoQ/evPaqEvHg4A06Tryvs=;
        b=0fj4cbIK2plZA+SUdnE2bYHE1iWDgIukubuVeBHKHDtIfwfNbQNcEUyb91Vw72eCjB
         TIRo92BudIwEeJvJtJUiMGAKEijs/9EEVg2+zvpdnrmuS+59Bjb2d0/fCYqTMDc+/8gg
         szn2VJK1UryYKmu3nrVZJCHa7CtvavneMJfwvWb63F9+s94/RA74QYlwWYJaxukTM9Dm
         M1ElLjSIo8u7peTGXI5RxN4wckDquBgZUv/JYlGEv2K1bOQ6/kHOQDszC2qDo1ip5V/A
         1aH3bl8zocgx7DryShhi9nx8c4nPMTTPq0Izu1gIEGbgB+JuXiS3ImLmhNaugQrlL9Os
         lC3Q==
X-Gm-Message-State: AOAM530YHSsmuHtjdsYeKUQlX71/s9l1/c9S0UqZoDqRUxcMOUpEKnm3
        sTCcTk2MROfwGaYVCuAsHopPO4dUuzTDOcOP9Id+ByEisrFPerkMHdCwR99q0ubfbK1ViRBziut
        Y60nG2rPuuyJxNknxVdLoTw==
X-Received: by 2002:a05:6000:1d1:: with SMTP id t17mr3197094wrx.569.1639760837288;
        Fri, 17 Dec 2021 09:07:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPrYWvecakOGWsrLS6D0tWwhJI2tzgqzCBikFjyuarJQEgYziFKpjwXCffRMF6yVCr1Gcj9A==
X-Received: by 2002:a05:6000:1d1:: with SMTP id t17mr3197082wrx.569.1639760837095;
        Fri, 17 Dec 2021 09:07:17 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312::ac3? ([2001:b07:6468:f312::ac3])
        by smtp.googlemail.com with ESMTPSA id s8sm9077955wra.9.2021.12.17.09.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 09:07:16 -0800 (PST)
Message-ID: <6e2518c1-78d0-8103-69ea-40a625259ef8@redhat.com>
Date:   Fri, 17 Dec 2021 18:07:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: linux-next: manual merge of the kvm tree with the kvm tree
Content-Language: en-US
To:     Michael Ellerman <mpe@ellerman.id.au>, broonie@kernel.org,
        KVM <kvm@vger.kernel.org>
Cc:     Alexey Kardashevskiy <aik@ozlabs.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Maciej S . Szmigiero" <maciej.szmigiero@oracle.com>,
        Sean Christopherson <seanjc@google.com>
References: <20211215131033.2541027-1-broonie@kernel.org>
 <87wnk5kvfz.fsf@mpe.ellerman.id.au>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87wnk5kvfz.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/16/21 05:47, Michael Ellerman wrote:
> broonie@kernel.org writes:
>> Hi all,
>>
>> Today's linux-next merge of the kvm tree got a conflict in:
>>
>>    arch/powerpc/kvm/book3s_hv.c
>>
>> between commit:
>>
>>    511d25d6b789f ("KVM: PPC: Book3S: Suppress warnings when allocating too big memory slots")
>>
>> from the kvm tree and commits:
> 
> That's from the powerpc tree.
> 
>>    537a17b314930 ("KVM: Let/force architectures to deal with arch specific memslot data")
>>    eaaaed137eccb ("KVM: PPC: Avoid referencing userspace memory region in memslot updates")
>>
>> from the kvm tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
> 
> Thanks.
> 
> Paolo, if you want to avoid the conflict going to Linus, I have that
> commit (and others) in a topic branch here (based on rc2):
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/ppc-kvm

Will pull, thanks!

Paolo

