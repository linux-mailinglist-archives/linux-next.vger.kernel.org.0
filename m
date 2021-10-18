Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6446431692
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 12:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhJRK4S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 06:56:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21657 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229519AbhJRK4R (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Oct 2021 06:56:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634554446;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0UGHEy0KSirReAesLAC81k90uijHa8m3tA+7RLpvJyE=;
        b=cE0Xt1kVHlmDMIKUmLQ97Ifn/F9tNi76Hl/HO4D25UQgRUEewHZfA/ngA6BGNO8ec3g6Hv
        Udbr5l1Ky1tuQhvrHqnOv/g9wgixPs8pr5/or5zprknkuonrgOGqjVfdtq7KTYRJxjR1v6
        qBwAh4sr88rWU7IKrcmu/pSGrdIVIv0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-cas-atjSN0O19gJCuWbx9Q-1; Mon, 18 Oct 2021 06:54:05 -0400
X-MC-Unique: cas-atjSN0O19gJCuWbx9Q-1
Received: by mail-ed1-f69.google.com with SMTP id c25-20020a056402143900b003dc19782ea8so10497396edx.3
        for <linux-next@vger.kernel.org>; Mon, 18 Oct 2021 03:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0UGHEy0KSirReAesLAC81k90uijHa8m3tA+7RLpvJyE=;
        b=Nrekf8udYIynIlNSmzoa0zCUMBDf6wXgSZDnmBGyK+/lSAEw476s0gw0FcKaWQ825V
         MvwUWGta1/oSt70Zpa3zuAJpFDmAPQChp+K+g1gvpa7XSvL6F0AmnZkOAJJ/xty0CePg
         /2dwOTdHQjdjPPNPIu0p4hUVuKu7KC+IBLXEcDdGaH4OKvOp51whpCL37hHLtcZdXr44
         NRa+67sQYbGOEL7G5c06xjtdxAVfO4vjPp2oeG1RarF0IDvg0l6hoAQ9yyZlI/bgiWYE
         4UEKgxXyx2B10AyMYcIjmzitePl38WY616C88vJXvqsQhM4sxnp4KDPDvOq/tm0f2gN2
         ig7g==
X-Gm-Message-State: AOAM532SJNbZA6aZRTXhMAh+IhJWu5hHnToUITwKw6coHvdObEa2Y2fn
        KT6FfDDH7jUSvLxxr5HrHmxPBu49Oexla9vyS7K6pmEm47QpeYrlfewunVwQjz8xzle1aE+1PH9
        99prosa0GtMV48nHLsQIx1g==
X-Received: by 2002:a05:6402:5c2:: with SMTP id n2mr43155543edx.239.1634554444232;
        Mon, 18 Oct 2021 03:54:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbl37EsBUhONWzuO27hrT5ZHC1cXxi9YO8Bwu86QC8GVaSRChD1xgLAyG+l/wNJUb3pkjEiA==
X-Received: by 2002:a05:6402:5c2:: with SMTP id n2mr43155511edx.239.1634554444025;
        Mon, 18 Oct 2021 03:54:04 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id t19sm8824456ejb.115.2021.10.18.03.54.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 03:54:03 -0700 (PDT)
Message-ID: <3da8fd50-bdb3-93bd-3d27-0b3f961bd531@redhat.com>
Date:   Mon, 18 Oct 2021 12:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/8] KVM: SEV-ES: fix length of string I/O
Content-Language: en-US
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        thomas.lendacky@amd.com, fwilhelm@google.com,
        kvm list <kvm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, oupton@google.com,
        Sean Christopherson <seanjc@google.com>,
        linux-stable <stable@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <CA+G9fYt7FMXbp47ObVZ4B7X917186Fu39+LM04PcbqZ2-f7-qg@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CA+G9fYt7FMXbp47ObVZ4B7X917186Fu39+LM04PcbqZ2-f7-qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 18/10/21 12:21, Naresh Kamboju wrote:
> [Please ignore this email if it already reported ]
> 
> Following build errors noticed while building Linux next 20211018
> with gcc-11 for i386 architecture.
> 
> i686-linux-gnu-ld: arch/x86/kvm/svm/sev.o: in function `sev_es_string_io':
> sev.c:(.text+0x110f): undefined reference to `__udivdi3'
> make[1]: *** [/builds/linux/Makefile:1247: vmlinux] Error 1
> make[1]: Target '__all' not remade because of errors.
> make: *** [Makefile:226: __sub-make] Error 2

Thank you very much, I have sent a simple fix of changing the variable 
to u32.

Paolo

