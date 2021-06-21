Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29DF23AF98A
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 01:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbhFUXjs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 19:39:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41922 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231569AbhFUXjs (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Jun 2021 19:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624318653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V2h6ntSeAPBXrHus5BZXUFPmgMImlj4zJ8JJFLLmnt0=;
        b=NxFzAnDGhs0dDGL3LSLFTo0BqqU7dI3VOT4+DPBd3JuWqUhJHD/QrwFzyBvzXWhzvXhxWc
        irvcpw5gG0dNtSxeq++fOQudRKfX4SpMqIhgWnjGpu0u984lqrsSb/JSExw9FGGp5Ks7Yd
        P3wiBpo6DKpaw60wmfWQmceT7VDMJuQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-PpdmuZJYNAmAIbj6DK7daQ-1; Mon, 21 Jun 2021 19:37:32 -0400
X-MC-Unique: PpdmuZJYNAmAIbj6DK7daQ-1
Received: by mail-wr1-f71.google.com with SMTP id d9-20020adffbc90000b029011a3b249b10so8901079wrs.3
        for <linux-next@vger.kernel.org>; Mon, 21 Jun 2021 16:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V2h6ntSeAPBXrHus5BZXUFPmgMImlj4zJ8JJFLLmnt0=;
        b=kZiXMeIiSCjo6DFijhm3dLpyrjz1IP859NtXJbrzmf95bhdPoGh5X4l+HfmGPg1bYz
         N9+ByluDt54SBNyWNdoTukHVwttwtFjUSqkuE5fnSazvixNlhFearfIHUOP/dRHuEHLT
         wyWbygJ7jea4fqHpGx8hzeUgXKRsXHDGUvFF53qnCFK1VvCBim+4PkmNR+f6ORwgT72Q
         /3DXtyi8wEDBzClU3hAHMzjC41FFA8SmYs6hFl72wuzcQxKBQveZDk602N18ghBLYtTe
         Ne3J7jhqr3bSOtWvcPaVAOKqGlNTM6pxqUcWGORTw2+Cro7I5UGMIVc9C6T2bmJq6tSW
         CLeQ==
X-Gm-Message-State: AOAM5304QCyEqZMQMjw6KGxECB7q16e+XPUoMpaiB1R7tsgDXi6wAuMH
        aLJADbg+tKi9Wk6+X26f+oJQFkjHc87NejGzzlO83igv4whOZT+h4SKfOTtr2AKW7xp5rWFOkSi
        xZSgih/p+xoj1jNotGhM2SQsK2keKTfVtyU6m6tFeffg78CCO5C1ThgRE67Odxd8iKMogT5A3ZQ
        ==
X-Received: by 2002:a05:600c:4417:: with SMTP id u23mr941640wmn.26.1624318650892;
        Mon, 21 Jun 2021 16:37:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRzhGoq4MyZdBYJJOc6VuvbNjdwrkuj0chXTnZdAAPB32sCkLfNpTv6WHpRNsQBsgqOcoqgA==
X-Received: by 2002:a05:600c:4417:: with SMTP id u23mr941621wmn.26.1624318650692;
        Mon, 21 Jun 2021 16:37:30 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.gmail.com with ESMTPSA id v1sm9765652wru.61.2021.06.21.16.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 16:37:30 -0700 (PDT)
Subject: Re: linux-next: Fixes tag needs some work in the kvm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>, KVM <kvm@vger.kernel.org>
Cc:     Sean Christopherson <seanjc@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210622081809.13dd2299@canb.auug.org.au>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fbab918a-a6f0-b1d4-90ba-1ab0172b68de@redhat.com>
Date:   Tue, 22 Jun 2021 01:37:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210622081809.13dd2299@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 22/06/21 00:18, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    ade74e1433f3 ("KVM: x86/mmu: Grab nx_lpage_splits as an unsigned long before division")
> 
> Fixes tag
> 
>    Fixes: 7ee093d4f3f5 ("KVM: switch per-VM stats to u64")
> 
> has these problem(s):
> 
>    - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: e3cb6fa0e2bf ("KVM: switch per-VM stats to u64")
> 
> It is very hard to get the commit SHA right when the commit you are
> "fixing" is after the fix commit :-)

Yeah, that Fixes tag should have been removed since the patch can be 
kept separate (does not have to be squashed).

Paolo

