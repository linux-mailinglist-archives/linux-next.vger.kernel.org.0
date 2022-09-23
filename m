Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32C2F5E7581
	for <lists+linux-next@lfdr.de>; Fri, 23 Sep 2022 10:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbiIWIPQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Sep 2022 04:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbiIWIPN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Sep 2022 04:15:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638A933A20
        for <linux-next@vger.kernel.org>; Fri, 23 Sep 2022 01:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663920910;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=51Kyuo7AJKV6gUq3xeGcAOBKueLhJINvkabwk/dQKks=;
        b=bXEdHMiQTtJJvBb82fy9VQRifefuvEjE2o1QhMCt5aPAelV9TlVs9FUAIicDY1pcslU914
        41ocfOaeAOp2w5J7/vp6jJ31NMFkeGhghcOzONc599dF+Q/1eflG5AnuUO04GiplNpmmgq
        tR7hi1hzxcVTMeh2JO2X8DEuWI8WEqg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-31-h-IzBEr2PpmL-ETMUPf3BQ-1; Fri, 23 Sep 2022 04:15:07 -0400
X-MC-Unique: h-IzBEr2PpmL-ETMUPf3BQ-1
Received: by mail-wm1-f69.google.com with SMTP id p24-20020a05600c1d9800b003b4b226903dso2367981wms.4
        for <linux-next@vger.kernel.org>; Fri, 23 Sep 2022 01:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=51Kyuo7AJKV6gUq3xeGcAOBKueLhJINvkabwk/dQKks=;
        b=5ztc1R0tJeLiAMk4vpJ/auAMdj7caLh9NgpOCdAlfmFv1mfL24KdEhhOKZFYnQKSm6
         cXtyk8FmPzcHh7UX7WXt7qgWcqPR3BWuklMcetf4HBc2j0qL1s9LOqrocyyaaGEpkSIy
         rwBYNgEzO+HQG0aTH5sh6Cjs1PHXpfZY9rEH8EL8ztTdx+xj5URjICZm4a7BJx9zZk69
         zrmbNI6zDFn/c+efIN+lXw/9NWwmY8XUsk3HutXLQbe5bybY2JoTVUKsVV5/p4v+ZjPf
         4NGsFYBJqLFniBcIMcfj3T6we6yvrOaZagdWxBpoQL8+6jchv+pYinFSwA+1HF1Jo2zn
         ISeg==
X-Gm-Message-State: ACrzQf3BRogDIBn368OlTpheTp5ldlsPRSSbxD+b9SH2QMHl0EEta23A
        J7U6STqP4likUVo4unumfho8nhAgasJ0aaVDPbxf2BzR08haNROYpCADXOPRGSpuywwnmuQRkR4
        IUNtufkgubbno2oDUPWJk8w==
X-Received: by 2002:a5d:5406:0:b0:228:db0e:a4d3 with SMTP id g6-20020a5d5406000000b00228db0ea4d3mr4195371wrv.8.1663920906556;
        Fri, 23 Sep 2022 01:15:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7N7PjOmTOcCq8bdyx+znheLafsJG6H/pTVCdHu+S1sg9WCHhM8KmqpAUjZN0hCppOKKZesCw==
X-Received: by 2002:a5d:5406:0:b0:228:db0e:a4d3 with SMTP id g6-20020a5d5406000000b00228db0ea4d3mr4195357wrv.8.1663920906249;
        Fri, 23 Sep 2022 01:15:06 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:cc00:4585:a83b:64f2:ad21? (p200300cbc704cc004585a83b64f2ad21.dip0.t-ipconnect.de. [2003:cb:c704:cc00:4585:a83b:64f2:ad21])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c05d300b003b3365b38f9sm1772470wmd.10.2022.09.23.01.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 01:15:05 -0700 (PDT)
Message-ID: <cefc89fc-72cf-7f03-670d-f5649a68b99f@redhat.com>
Date:   Fri, 23 Sep 2022 10:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: linux-next: build failure after merge of the mm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220923181245.004d9278@canb.auug.org.au>
Content-Language: en-US
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220923181245.004d9278@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 23.09.22 10:12, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm tree, today's linux-next build (htmldocs) failed
> like this:
> 
> Sphinx parallel build error:
> docutils.utils.SystemMessage: /home/sfr/next/next/Documentation/process/coding-style.rst:1213: (SEVERE/4) Title level inconsistent:
> 
> Use WARN_ON_ONCE() rather than WARN() or WARN_ON()
> **************************************************
> 
> Caused by commit
> 
>    13ea678a035b ("coding-style.rst: document BUG() and WARN() rules ("do not crash the kernel")")
> 
> I have reverted that commit for today.

Thanks, an updated patch is already in the works as that issue has been 
raised independently.

-- 
Thanks,

David / dhildenb

