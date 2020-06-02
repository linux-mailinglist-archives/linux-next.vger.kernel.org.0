Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE9C11EB357
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 04:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbgFBCai (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Jun 2020 22:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbgFBCai (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Jun 2020 22:30:38 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E8AC061A0E;
        Mon,  1 Jun 2020 19:30:38 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id v3so1868397oot.1;
        Mon, 01 Jun 2020 19:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5nwUE9Z8i6E2ejW0zfsdVtBwTJzkvaP+HsdfQdzhUFo=;
        b=GoTa0tvNcyVfHQoiRS1IavtEIBBsPQtb4VAB4lG7A1cl6uARLf+98te7A/wRqv2TLU
         UJjJBl6Nrv35pbaBTDxWrjIXTCGbP1PYuYDqRPk8mX4YAukIQHZK1aY2yMActouZLBRP
         w7bWe46McqbksRy0g38MlccKoA/QzfL/pmlazwM0BTbkDlVFusRiT8jduir7oOJWYt/G
         uvP5rM72DSBh5fa8f931flZFZr2exQS+dnjUEwDtl+Zls2sv73fvwSFS/lfferMjM9lv
         ZOsMLfgizawljvUpHvRYfr5zApXF2bScNZWNU8i+eiiEqJ+5oo5UCULOPGCRsZ287VJ5
         vaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5nwUE9Z8i6E2ejW0zfsdVtBwTJzkvaP+HsdfQdzhUFo=;
        b=c0vSv+u4elDS47thrNcvZf1y+WtTr8uZGnpuFHnwZNaIbToHS3zrIG6yhaHLf7fnYy
         dG5VPNDZSTgS3P9qXRnr8a//o4+EpF2XibYClHLyYfC4IlFeYGhJBKuqr7QMiUHjlamg
         eVE5yWSukcvbiMDdjuu77V8rD87PcxkzCGD38Fv4E4qP38R7CVPzqLo6KkBZB3ALdfPw
         4cnvv/NOTbgIf0Y+a1oKsHwD8RAzIiEUJSeNlQ4O0nE7EdGInCi0X7slraD7POUkYLIM
         JcRFV675J3JsTetSTceuDpAzVBl2W2FRQi3MYepXWeYkbdVqUa0t71U3jGaKp3aNlAiW
         RgHg==
X-Gm-Message-State: AOAM531sAtwEyFIBkicOn5lXVbaJVMhO1kGubU5F0DXXUTwCP8up3+uJ
        jqge1Z7F+zCWvCqTzDFl/bQ=
X-Google-Smtp-Source: ABdhPJxjkfLufkllmen9AVOYRsTPY7/tG9ZHPwpB8poIXA5emCmlqCUcx2P8X6jgML5lsZ2WNRWvMw==
X-Received: by 2002:a4a:3c1a:: with SMTP id d26mr1497905ooa.38.1591065036412;
        Mon, 01 Jun 2020 19:30:36 -0700 (PDT)
Received: from ?IPv6:2601:282:803:7700:c9ef:b9c4:cdc1:2f07? ([2601:282:803:7700:c9ef:b9c4:cdc1:2f07])
        by smtp.googlemail.com with ESMTPSA id y16sm365019oot.11.2020.06.01.19.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 19:30:35 -0700 (PDT)
Subject: Re: linux-next: manual merge of the ipsec-next tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Steffen Klassert <steffen.klassert@secunet.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Florian Westphal <fw@strlen.de>
References: <20200511130015.37103884@canb.auug.org.au>
 <20200602092040.5ef52300@canb.auug.org.au>
From:   David Ahern <dsahern@gmail.com>
Message-ID: <6092c5eb-6e50-97bc-90db-4f7a0ca29c6e@gmail.com>
Date:   Mon, 1 Jun 2020 20:30:34 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200602092040.5ef52300@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/1/20 5:20 PM, Stephen Rothwell wrote:
> Hi Dave,
> 
> On Mon, 11 May 2020 13:00:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the ipsec-next tree got conflicts in:
>>
>>   net/ipv4/xfrm4_output.c
>>   net/ipv6/xfrm6_output.c
>>
>> between commit:
>>
>>   0c922a4850eb ("xfrm: Always set XFRM_TRANSFORMED in xfrm{4,6}_output_finish")
>>
>> from Linus' tree and commit:
>>
>>   2ab6096db2f1 ("xfrm: remove output_finish indirection from xfrm_state_afinfo")
>>
>> from the ipsec-next tree.
>>
>> I fixed it up (I used the latter versions of these files and then added
>> the following patch) and can carry the fix as necessary. This is now fixed
>> as far as linux-next is concerned, but any non trivial conflicts should
>> be mentioned to your upstream maintainer when your tree is submitted for
>> merging.  You may also want to consider cooperating with the maintainer
>> of the conflicting tree to minimise any particularly complex conflicts.
>>
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Mon, 11 May 2020 12:57:24 +1000
>> Subject: [PATCH] xfrm: merge fixup for "remove output_finish indirection from xfrm_state_afinfo"
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>  net/xfrm/xfrm_output.c | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/net/xfrm/xfrm_output.c b/net/xfrm/xfrm_output.c
>> index 886a9b284b3a..0f4b3a5e02ba 100644
>> --- a/net/xfrm/xfrm_output.c
>> +++ b/net/xfrm/xfrm_output.c
>> @@ -574,16 +574,12 @@ int xfrm_output(struct sock *sk, struct sk_buff *skb)
>>  	switch (x->outer_mode.family) {
>>  	case AF_INET:
>>  		memset(IPCB(skb), 0, sizeof(*IPCB(skb)));
>> -#ifdef CONFIG_NETFILTER
>>  		IPCB(skb)->flags |= IPSKB_XFRM_TRANSFORMED;
>> -#endif
>>  		break;
>>  	case AF_INET6:
>>  		memset(IP6CB(skb), 0, sizeof(*IP6CB(skb)));
>>  
>> -#ifdef CONFIG_NETFILTER
>>  		IP6CB(skb)->flags |= IP6SKB_XFRM_TRANSFORMED;
>> -#endif
>>  		break;
>>  	}
>>  
> 
> It looks like this merge resolution fix up was missed when the
> ipsec-next tree was merged into the net-next tree.
> 

Thanks for catching that, Stephen. Important fix in 0c922a4850eb.

