Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E7F3B0AAE
	for <lists+linux-next@lfdr.de>; Tue, 22 Jun 2021 18:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhFVQyc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 12:54:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60820 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231320AbhFVQya (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 12:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624380733;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4P1PfITd6m9CRCYryDXbjzGuOd03lvZO6GwMrQOOd8k=;
        b=RZ3jyMWVgsKGixQcFMbjo5Z+S7U83pEDWFWf4lMkpCbG+R4YDQBDAC5FrithoqJn9oKb5w
        owPvco3JHsZmGLFD/ksbfduX6SzRnW6BXkf2cx05CfN0v+/LEhp35l61OwdVxMJcoGyMv0
        EFS0LpgcXZEie1J8glLLUVa4TiCdlso=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-QsRs-AYLOw2zLbcp0VO42Q-1; Tue, 22 Jun 2021 12:52:12 -0400
X-MC-Unique: QsRs-AYLOw2zLbcp0VO42Q-1
Received: by mail-wr1-f69.google.com with SMTP id u18-20020a5d6ad20000b0290123314c5505so1120103wrw.20
        for <linux-next@vger.kernel.org>; Tue, 22 Jun 2021 09:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4P1PfITd6m9CRCYryDXbjzGuOd03lvZO6GwMrQOOd8k=;
        b=NPbWTYj1oTnbrAr+TGKiSme7LHQRR4MjiLCcic1goA5w1FxbdO/MxCM/a++/Lvlpgf
         reRRWPkedNmkLdYzer2fxgyqlfRckeL9LfJdzcLWCG3iz8ybnlMvAqdoPwOiAWCex9gq
         D+sY+IGpqvJKZgMSTWB5cAo7NursSw138YFWszrJZ9Rgy3Qrm05B1rWH3enEwlsGBug3
         Pw9tiXkFuQ8cD/c06/bdQ6gY3sBuCQCUovYKYsDM7OfLPurkiCx9VEe2JeEFF6RerhDF
         PT17IHVCM3xrNf43RwINe07uAJqe+vj1MNcgE2ADcyLEFoeduKtM7tTA17TxmUti3HQB
         +beA==
X-Gm-Message-State: AOAM533aIG/I1rW2wtfnCfJuHqfXfba0ILzkxXjqQF47dWdEfVikYGz6
        2HYMIH/hZbLOrPpvjZDyIQRSDPzbDE4SwtSXOzwdXI1M3BaZu6COE5Ng2jjQ4m+g6yppEtpsI+s
        fsVlwWV+qACg77fYP+Zi5NQ==
X-Received: by 2002:a5d:4904:: with SMTP id x4mr5938994wrq.202.1624380731193;
        Tue, 22 Jun 2021 09:52:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHwvAETSGbesb6gzKh+dnovh/8/FzEzs9O+mu8f0VjdUXRziEiWzP7ITmfJWkfwxeiQrPAIQ==
X-Received: by 2002:a5d:4904:: with SMTP id x4mr5938982wrq.202.1624380731048;
        Tue, 22 Jun 2021 09:52:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id n18sm3132025wmq.41.2021.06.22.09.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 09:52:10 -0700 (PDT)
Subject: Re: linux-next: manual merge of the kvm tree with the powerpc tree
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        KVM <kvm@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     Ashish Kalra <ashish.kalra@amd.com>,
        Bharata B Rao <bharata@linux.ibm.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>
References: <20210622152544.74e01567@canb.auug.org.au>
 <9c2dbe56-4c64-0032-0acb-2e2925c7a2ab@redhat.com>
 <871r8u2bqp.fsf@mpe.ellerman.id.au>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <479d2898-07d6-9a40-70e5-f33c91943d52@redhat.com>
Date:   Tue, 22 Jun 2021 18:52:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <871r8u2bqp.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 22/06/21 16:51, Michael Ellerman wrote:
>> Please drop the patches at
>> https://www.spinics.net/lists/kvm-ppc/msg18666.html  from the powerpc
>> tree, and merge them through either the kvm-powerpc or kvm trees.
> The kvm-ppc tree is not taking patches at the moment.

If so, let's remove the "T" entry from MAINTAINERS and add an entry for 
the kvm@vger.kernel.org mailing list.

>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/ppc-kvm
> 
> The commit Stephen mentioned has been rebased since to squash in a fix.
> But what is in the topic branch is now final, I won't rebase what's
> there.

Thanks, I pulled it.  Anyway, if the workflow is not the one indicated 
by MAINTAINERS it's never a bad idea to Cc more people when applying 
patches.

Paolo

