Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7F1367B67
	for <lists+linux-next@lfdr.de>; Thu, 22 Apr 2021 09:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235245AbhDVHsB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Apr 2021 03:48:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58955 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235246AbhDVHr6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Apr 2021 03:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619077643;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=feEZwhZhckEp2NWHe0knkLxWYyq3yllm3KyAPbxZatA=;
        b=GlMW/pZdh3PYDwxkEyuR+ssbXt7BaDnKimD5ucCn7JX1ue1hfVf/h/+AMBcqj5RbSNYYWL
        G7HSpsfydJeHbFVLdj5T7N2RkQRs7SclPujgIsw54DgTr6W/NdeDkx+ew+YJ2hDGiU8D45
        D4A42OLHe20sPJ9NQmacg/uKKS9x5qU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-AWfEG9hzM0SQIKRTaCEhoA-1; Thu, 22 Apr 2021 03:47:07 -0400
X-MC-Unique: AWfEG9hzM0SQIKRTaCEhoA-1
Received: by mail-ej1-f71.google.com with SMTP id lf6-20020a1709071746b029037cee5e31c4so6879554ejc.13
        for <linux-next@vger.kernel.org>; Thu, 22 Apr 2021 00:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=feEZwhZhckEp2NWHe0knkLxWYyq3yllm3KyAPbxZatA=;
        b=Ig3kS4VnmUBpFdppdZbfReKZTf6Qnb3HxmhG3ODlwCpSY6GwhqtakRq40Kme+582lv
         HKOX3kDdHKySoN/KaqI+wT7K/abdVm9KBoVj9FrDO71r8DMFFdInhcYTWTBJUzr1KKRH
         QdS/SkP+btryGOxUC5GsJpF/U9StwHN80RQLnYPmf3n8vfoBItWzBTUBEUD0H1gD9flX
         lP7e9Tpf/nqnJKB7s1cF/ChDZLqbO0xOsUT9zPo4FmUETfqFnQjighkmT2NRttb+nt6s
         bweraMM8R8lhYaKRgP5ZfOVJXR3k5ubgxSm4m1oj80ZOMG1KDv6a/F6gZdC5RxFnkOrg
         71Lg==
X-Gm-Message-State: AOAM531Jb7yyiXyc8As+G1G+7UKtpHgUJXKNoJDX0e1d1IF7N1XewTYM
        XK8l8QA04hyWjuUrqzEIaBQOnm/Akg6aqtuK/7zho2B4yW4vaapdB34VTydN5VpW8k54TD0IgBs
        rpkuPF77eBze8c+tziLlPPQ==
X-Received: by 2002:a05:6402:781:: with SMTP id d1mr2225853edy.32.1619077626363;
        Thu, 22 Apr 2021 00:47:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyclzt2baCaNcGBj1gjbLknc8ok1XMcMD/HR6PAfyuesi+oGnecNQynLgSuDuyo1tmi16/4EQ==
X-Received: by 2002:a05:6402:781:: with SMTP id d1mr2225841edy.32.1619077626172;
        Thu, 22 Apr 2021 00:47:06 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id y25sm1371324ejb.34.2021.04.22.00.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 00:47:05 -0700 (PDT)
Subject: Re: linux-next: manual merge of the cgroup tree with the kvm tree
To:     Vipin Sharma <vipinsh@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, Tejun Heo <tj@kernel.org>,
        KVM <kvm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        David Rientjes <rientjes@google.com>
References: <20210422155355.471c7751@canb.auug.org.au>
 <124cf94f-e7f5-d6f3-7e7a-2685e1e7517f@redhat.com>
 <CAHVum0eQX8+HCJ3F-G9nzSVMy4V8Cg58LtY=jGPRJ77E-MN1fQ@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e6256bd5-ca11-13c1-c950-c4761edbcf4d@redhat.com>
Date:   Thu, 22 Apr 2021 09:47:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAHVum0eQX8+HCJ3F-G9nzSVMy4V8Cg58LtY=jGPRJ77E-MN1fQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 22/04/21 09:33, Vipin Sharma wrote:
> First of all, I am sorry that my patch series has caused this trouble to
> all of you. I am not aware of the correct way to submit a patch series
> which changes files in more than one maintainer's territory. Any
> guidance for the future will be helpful.

Vipin, don't worry as you don't have to do anything (and didn't do 
anything wrong, for that matter).  It's all in the maintainers' hands; 
Stephen takes care of warning maintainers of what will happen in the 
next merge window, but as far as you're concerned you're all set.

You can check the current state of the merge in the queue branch of the 
KVM tree.  This is what I plan to merge if Tejun agrees.  That would be 
helpful indeed!

Paolo

