Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5571EE4B1
	for <lists+linux-next@lfdr.de>; Thu,  4 Jun 2020 14:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgFDMoO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Jun 2020 08:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgFDMoN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Jun 2020 08:44:13 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BC0C08C5C0;
        Thu,  4 Jun 2020 05:44:13 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id dp10so2795805qvb.10;
        Thu, 04 Jun 2020 05:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SjLnQZ46lUbHvc3PkUxiHDXKl5I0zjvuEJ2uPwsxzI8=;
        b=pgR/6JaOszrzbplONJz2cHfFaCUGS0thtHFez6ULWs8Iosj/kMc4w+SGq+CzSVwxgj
         n/8hUyIny/XflYy1ZN0HjwftKbam5yhism9DK3FilsGSqlpAEmlZ5+SeOEtKVKY1ofEx
         9FNLoWnJq/8biZCB/1FE4C1rHzhKMp++V0/l4fIKaCaod7ZMHVYjDS2EsHCv2p95PVmz
         1xS16UWAD6YAcR7WGtMJFjfjtRM4fYx1OXKQOeuymN66xeLMHGdBI+guTLYFvBXlF1rH
         bYpYriPRDvRWVyMA5FQpk8XHGZrfEGXQ1lc4aKBtUjJCUiOVtdmA6fPu0poJHP7gJaqk
         X7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SjLnQZ46lUbHvc3PkUxiHDXKl5I0zjvuEJ2uPwsxzI8=;
        b=Y5FmMBBj+BzF4aclC3zUjOuy1TrzhWEqjFqMlzFt1nmMRkv8N6ohcJ+PGkHhNgICUT
         KrLuZglZ5CKU7rpxscD+05uyDFeR+IXVK2ZX58NR9CPwWBW0wRmBcaJZV8ZBom/lpA9u
         Kz5jm3pAmP+NngWD7/qBRlqP0XhaxQlB4o5X6g40BtAE005JZhOocft1cZU4GofsHVyL
         15FvNtcw9y0AGe/1Ep9CftYxgNSMnZ9nVpk2yyzoWSnE06CpWDDtkbJkkakh8YaMuT6i
         lobENuu5BUj1XC3b/zUtmVHuv2G29oQN8+tKAdMGvmhDqKNWLNdMqA5DErjSCWhOMAuh
         SrWg==
X-Gm-Message-State: AOAM533MYN+t9T5X9CQPo30nwEz7wnxQghXRTTqepqZkzwu/2V6WUo71
        /C+/Xz2H+hjObPY2+GM3RW6JzTXe
X-Google-Smtp-Source: ABdhPJwk9NDtjNNxuy+/sFNOoOaj07rkvuAtcSdE6Ozd3bA8dTGYOjcG4WiRbf2pwSalhdjb1NJmYg==
X-Received: by 2002:ad4:5512:: with SMTP id az18mr4537708qvb.51.1591274652710;
        Thu, 04 Jun 2020 05:44:12 -0700 (PDT)
Received: from ?IPv6:2601:282:803:7700:1172:51aa:9d42:fe87? ([2601:282:803:7700:1172:51aa:9d42:fe87])
        by smtp.googlemail.com with ESMTPSA id o3sm4806783qkj.97.2020.06.04.05.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 05:44:11 -0700 (PDT)
Subject: Re: linux-next: manual merge of the ipsec-next tree with Linus' tree
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
From:   David Ahern <dsahern@gmail.com>
Message-ID: <9b338449-e342-96ab-0ba1-a73058fac037@gmail.com>
Date:   Thu, 4 Jun 2020 06:44:10 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200604064149.GT19286@gauss3.secunet.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/4/20 12:41 AM, Steffen Klassert wrote:
> On Wed, Jun 03, 2020 at 08:55:01PM -0600, David Ahern wrote:
>> On 6/3/20 7:26 PM, Stephen Rothwell wrote:
>>>
>>> And now the net-next tree has been merged into Linus' tree without this fix :-(
>>>
>>
>> I took a look earlier and I think it is fine. Some code was moved around
>> in ipsec-next and I think the merge is good. I'll run the test cases
>> later this week and double check. Thanks for the reminder
> 
> The setting of XFRM_TRANSFORMED moved to xfrm_output() and depends
> on CONFIG_NETFILTER. So I think the fix is needed. After the merge
> of the net tree today, I have both conflicting patches patches in
> the ipsec tree. I'd apply the fix from Stephen unless you say
> it is not needed.
> 

Indeed. I must have been looking at -net. Both -net and -net-next have
it conditional, so yes a fixup patch is needed.
