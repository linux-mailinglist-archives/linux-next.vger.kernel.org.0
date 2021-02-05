Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96CC63116E3
	for <lists+linux-next@lfdr.de>; Sat,  6 Feb 2021 00:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhBEXTm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Feb 2021 18:19:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29557 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231197AbhBEKLH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 5 Feb 2021 05:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612519727;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XQAmpeiwjTLNRxNDH8Fc0DNgLit8cCAihA/yreIw74s=;
        b=SmHKGsH8BlYA+/sxYVdBVLNhEUUN5pQUmzzh35IfuVRgpesEuWfyh76O/HVxp2GZ7ege0c
        vuTy2xEQg14C4D6tQaebJF5AiUnHlYYHPFy34bJq2/tMvJb/F6fdb2BgLOvZHtn8DNGABj
        IkmhUyMhS73p1JYiWeO+sI90foEkaP4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-19LXNp7RN261zTwnnl0Gmw-1; Fri, 05 Feb 2021 05:08:43 -0500
X-MC-Unique: 19LXNp7RN261zTwnnl0Gmw-1
Received: by mail-wr1-f71.google.com with SMTP id j8so5017191wrx.17
        for <linux-next@vger.kernel.org>; Fri, 05 Feb 2021 02:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XQAmpeiwjTLNRxNDH8Fc0DNgLit8cCAihA/yreIw74s=;
        b=CP8hjQG1CZdCLeOuVRPtpSwd9KFtKZiu5S4fDZ4iowMNKaUKl8rB/MJN6rSPr5RQlw
         dZI03dZyaWwTtuiShH8mA9hwzjte/0Mxe9FXnUPf8TupxX6A4ZFykKUIrOvUMMQQSpWv
         qt2LbUkNY8OceIN0YnjwXUbqta5P/k8qvDKro+BuxkAL9xdhpPwdiUnVDa0Hxwxa80k/
         LslddOaGtASTF4tTV/dmh08F0dmUwDVOWKTZG2jth7/XIQfflb/1BugaSdKQ63Yee+jD
         u2yYmmnV0iM/KC6qCtnxmKwgIloBcgx5xN4O+hxzqAq9mQVjyjsFfyP0ya/zDPhIb8Lt
         IIBQ==
X-Gm-Message-State: AOAM531jYuWUE+ves9YSdOBErIZ6wLptLTtToyM2rOdSr4vI7kSv1q3U
        i1+dhFborv0LfmXQlERcv0DqafR0IcgcLzmciDYEVtSOI/3Bjxb7XXVUTNwo/twk5P0HFJlU35d
        k3oVZljBiFg+JOG06JsKrGrdenK3BCMBBVCGFhg1jiMxU9q4eoHuMEFiaD3NhQLFKr2XVVZJfKQ
        ==
X-Received: by 2002:adf:f303:: with SMTP id i3mr4098916wro.60.1612519721787;
        Fri, 05 Feb 2021 02:08:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygnV5PVQbw8IB48V2+j6ejVS7WeCWn7No/UZJIzRZQZzqTlpByGGeGJZYMFj/b3HUjRWFm7w==
X-Received: by 2002:adf:f303:: with SMTP id i3mr4098899wro.60.1612519721586;
        Fri, 05 Feb 2021 02:08:41 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id y63sm8267192wmd.21.2021.02.05.02.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Feb 2021 02:08:40 -0800 (PST)
To:     Stephen Rothwell <sfr@canb.auug.org.au>, KVM <kvm@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210205160224.279c6169@canb.auug.org.au>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: build failure after merge of the kvm tree
Message-ID: <cac800cb-2e3e-0849-1a97-ef10c29b4e10@redhat.com>
Date:   Fri, 5 Feb 2021 11:08:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205160224.279c6169@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 05/02/21 06:02, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kvm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> ERROR: modpost: ".follow_pte" [arch/powerpc/kvm/kvm.ko] undefined!
> 
> Caused by commit
> 
>    bd2fae8da794 ("KVM: do not assume PTE is writable after follow_pfn")
> 
> follow_pte is not EXPORTed.
> 
> I have used the kvm tree from next-20210204 for today.
> 

Stephen, can you squash in the following for the time being?

diff --git a/mm/memory.c b/mm/memory.c
index feff48e1465a..15cbd10afd59 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -4775,6 +4775,7 @@ int follow_pte(struct mm_struct *mm, unsigned long 
address,
  out:
  	return -EINVAL;
  }
+EXPORT_SYMBOL_GPL(follow_pte);

  /**
   * follow_pfn - look up PFN at a user virtual address

A similar patch has been posted already, but Jason Gunthorpe asked to 
add some kerneldoc comments.  Therefore it will not be in kvm/next for a 
few more days.

Paolo

