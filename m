Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5561FB250
	for <lists+linux-next@lfdr.de>; Tue, 16 Jun 2020 15:39:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbgFPNje (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Jun 2020 09:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728716AbgFPNjc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Jun 2020 09:39:32 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A564BC06174E;
        Tue, 16 Jun 2020 06:39:32 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id x202so19239000oix.11;
        Tue, 16 Jun 2020 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fFJ7hsEAkS/er/cOkupwhFskmRsM/1kcPNiWDueIbXY=;
        b=j4iG10ZJifpYKgHpxFg8qDzEBlYXgdm5VO3wEMk8Djzreb8/1M+1D7JoUvD+ARWnFt
         G/SsOAgt4h0aBFko3AXQB1u7pJqWzSxUUZC9cCbmSLzZH5NLXim0G4AjEITGtSHgVKJy
         UY/lYyd/w8zNFuRzD8S40PqTIWex5Hn0QXyRGFqPQab6t3gAxvxe3cXZFr6P8Li+eHYZ
         3VmLm+lqKSyU0Z3EljWvxHULynn7RzS2CJbdL9eCNKMz5Q2k/tigvbQApqqU80wC+XHw
         ikhqWydTWX6w2+JVtRzyd1YJ+khzJuiM52nj4HyQV+I0z4Pvo+iztULHcpnK4YuISVOe
         e6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fFJ7hsEAkS/er/cOkupwhFskmRsM/1kcPNiWDueIbXY=;
        b=TcINAV2I02Dhm5SADOLLb914w2e/7EiGO7pyrvC8UN8QdXhf9L/yXwaiJkkdmK+KAs
         ddHT3Pi66Pu51qYQlGxmlPsMC6IrMkuOcvg8ryb+IbWLNMK/c6wM2YzRMhrN2V+jhI8R
         dPlC0T5UvMajvNbDzUPTR3eLtVOp3nZgLxM8OZzK2wrYeLsrAO3yhcceLugTnEqPHRjC
         yA+7AXsP6awtcrDDrADw/WCHDM5VH2xRkj+8vLyt7r87XtV7+3UIrfPTbMPBFPuGpStd
         Yrwsy3iuq3+9qM8qNxI8IXVGV+6u3VhSy3FXYkrKtWkHsUaMzTKx8Lz7Qj6M1xKM2q8R
         UY7Q==
X-Gm-Message-State: AOAM5312Vo+sdSQDejr0C/C7LEiNyq2gf4puId29bcS0kubB/PKziGO9
        AVUFKLe4KfRgOuGtOhPtdfLH5Z19
X-Google-Smtp-Source: ABdhPJxtZIDe/h3o9urGKjOgErmOyZ1VU5ofx7gTkZNlYtUfz7ARyL6yCCPMT1iittVSZRKV7w6VLA==
X-Received: by 2002:aca:4145:: with SMTP id o66mr3234036oia.154.1592314772040;
        Tue, 16 Jun 2020 06:39:32 -0700 (PDT)
Received: from ?IPv6:2601:282:803:7700:b48d:5aec:2ff2:2476? ([2601:282:803:7700:b48d:5aec:2ff2:2476])
        by smtp.googlemail.com with ESMTPSA id 35sm4028981otd.68.2020.06.16.06.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 06:39:31 -0700 (PDT)
Subject: Re: linux-next: manual merge of the ipsec-next tree with Linus' tree
From:   David Ahern <dsahern@gmail.com>
To:     Steffen Klassert <steffen.klassert@secunet.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Florian Westphal <fw@strlen.de>
References: <20200511130015.37103884@canb.auug.org.au>
 <20200602092040.5ef52300@canb.auug.org.au>
 <6092c5eb-6e50-97bc-90db-4f7a0ca29c6e@gmail.com>
 <20200604112606.25ffde35@canb.auug.org.au>
 <8d943a28-2e9f-9c61-9cff-899e907d6b86@gmail.com>
 <20200604064149.GT19286@gauss3.secunet.de>
 <9b338449-e342-96ab-0ba1-a73058fac037@gmail.com>
Message-ID: <2aab8efc-783d-8502-d268-ab435f566b06@gmail.com>
Date:   Tue, 16 Jun 2020 07:39:30 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <9b338449-e342-96ab-0ba1-a73058fac037@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/4/20 6:44 AM, David Ahern wrote:
> On 6/4/20 12:41 AM, Steffen Klassert wrote:
>> On Wed, Jun 03, 2020 at 08:55:01PM -0600, David Ahern wrote:
>>> On 6/3/20 7:26 PM, Stephen Rothwell wrote:
>>>>
>>>> And now the net-next tree has been merged into Linus' tree without this fix :-(
>>>>
>>>
>>> I took a look earlier and I think it is fine. Some code was moved around
>>> in ipsec-next and I think the merge is good. I'll run the test cases
>>> later this week and double check. Thanks for the reminder
>>
>> The setting of XFRM_TRANSFORMED moved to xfrm_output() and depends
>> on CONFIG_NETFILTER. So I think the fix is needed. After the merge
>> of the net tree today, I have both conflicting patches patches in
>> the ipsec tree. I'd apply the fix from Stephen unless you say
>> it is not needed.
>>
> 
> Indeed. I must have been looking at -net. Both -net and -net-next have
> it conditional, so yes a fixup patch is needed.
> 

I see that both net and net-next still have the conditional in xfrm_output:

#ifdef CONFIG_NETFILTER
                IPCB(skb)->flags |= IPSKB_XFRM_TRANSFORMED;
#endif
                break;
        case AF_INET6:
                memset(IP6CB(skb), 0, sizeof(*IP6CB(skb)));

#ifdef CONFIG_NETFILTER
                IP6CB(skb)->flags |= IP6SKB_XFRM_TRANSFORMED;
#endif

Did you submit the merge fix? If not, I can do it today.
