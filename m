Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35B684D4FCA
	for <lists+linux-next@lfdr.de>; Thu, 10 Mar 2022 17:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243524AbiCJQzK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Mar 2022 11:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242956AbiCJQzJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Mar 2022 11:55:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 04832E02C2
        for <linux-next@vger.kernel.org>; Thu, 10 Mar 2022 08:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646931248;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5MwC9pLk8kH+qC+K+f9j1LClRSMTrhuSRQJuKaO+wbA=;
        b=SanHc34YjdtuMTvB2dGv3bnyfxBubHi+r22t/gnxLu01NNBAWyIcnqmnlP2v6stqg6LjPU
        AYFG5irZiOh+QPn8qC+uHFFEYENvesh3VPK5F43UNgK+HxUWTyjTRlvMFyP2oePHeDR/+n
        W0gplpJRARYUJPLDqGJzHHmm2/a74rI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-NI1Ig8mUNSyCOHRw52hGHQ-1; Thu, 10 Mar 2022 11:54:06 -0500
X-MC-Unique: NI1Ig8mUNSyCOHRw52hGHQ-1
Received: by mail-wm1-f70.google.com with SMTP id c62-20020a1c3541000000b003815245c642so4300657wma.6
        for <linux-next@vger.kernel.org>; Thu, 10 Mar 2022 08:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=5MwC9pLk8kH+qC+K+f9j1LClRSMTrhuSRQJuKaO+wbA=;
        b=XvQxuolaIe03hXqABFksGRvEf87Yt+Fy74wcU2ATVyVpxWFvDSQ0CPugHWLCBDHQlY
         KVZr3qS5AiYuDHLLg5ihNdzqLQj7j8EgSssUUPOFwh86m3PP+SiJ+bR4yut0KPeevF34
         osxR92Kdqvjfvw3KIiUygDyw7dsqdAuhU4lwN1Qs6JZ+0MxZ/I+A6lFJP0JVRckr7v2N
         cf4ZBAlXvTgBZZOePCGAS7g7ZAHcRQUyz5aXux6YhZlB3DNum3x7ELUkCqHwqnEPhJVl
         cjs1grjknnJ9mtjt0QTrTCsMvT2Vyqj8Xf11LgBJafPDAslScAZYORJJByFLuIy5nqo/
         To/g==
X-Gm-Message-State: AOAM5337QjC5bCnIPcgw9fH+SqFmjSfwbUU5fCNmQUih5eOcCIyqndOQ
        xc7gDsq2Mdu9Dn6bIJdow/bCGZOKkZVQcZtQkBlByASqhIk9+GnrDfM6tcGtOifpQ3MpFeFEui4
        zlNdWwUtMEDoJp0xYYE7/oQ==
X-Received: by 2002:a7b:c759:0:b0:389:82c6:ac44 with SMTP id w25-20020a7bc759000000b0038982c6ac44mr12107085wmk.168.1646931245752;
        Thu, 10 Mar 2022 08:54:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwprMuo7fJBuzuQYrZDtLia+wgpoc1mm27QGdNvuTM/IhYDvmpe8AeQC8YG2KqJPs7x0QqE6w==
X-Received: by 2002:a7b:c759:0:b0:389:82c6:ac44 with SMTP id w25-20020a7bc759000000b0038982c6ac44mr12107070wmk.168.1646931245495;
        Thu, 10 Mar 2022 08:54:05 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:6100:d527:e3ca:6293:8440? (p200300cbc7086100d527e3ca62938440.dip0.t-ipconnect.de. [2003:cb:c708:6100:d527:e3ca:6293:8440])
        by smtp.gmail.com with ESMTPSA id o41-20020a05600c512900b00389d8c3e2b9sm2669344wms.15.2022.03.10.08.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 08:54:05 -0800 (PST)
Message-ID: <40f2a251-b844-9c6e-3e36-795433482998@redhat.com>
Date:   Thu, 10 Mar 2022 17:54:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: linux-next: panic on 20220307 tree
Content-Language: en-US
To:     Kees Cook <keescook@chromium.org>,
        Murphy Zhou <jencce.kernel@gmail.com>,
        Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux-Next <linux-next@vger.kernel.org>
References: <CADJHv_t0wMLJLCSkSh2CWTA=RKgYK0oxqqhnTdmuwtKSzdP5Jg@mail.gmail.com>
 <202203100825.8EAF86328B@keescook>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <202203100825.8EAF86328B@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10.03.22 17:29, Kees Cook wrote:
> On Tue, Mar 08, 2022 at 10:44:57AM +0800, Murphy Zhou wrote:
>> Hi,
>>
>> Hit this shortly after build the next tree and reboot.
>>
>> [   72.985994] ------------[ cut here ]------------
>> [   72.986023] ------------[ cut here ]------------
>> [   73.009468] kernel BUG at include/linux/swapops.h:258!
>> [   73.033065] kernel BUG at include/linux/swapops.h:258!
> 
> This is in here:
> 
> static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
> {
>         struct page *p = pfn_to_page(swp_offset(entry));
> 
>         /*
>          * Any use of migration entries may only occur while the
>          * corresponding page is locked
>          */
>         BUG_ON(is_migration_entry(entry) && !PageLocked(p));
> 
>         return p;
> }
> 
> Hugh, David, Andrew, might any of the recent mm/memory.c work caused
> problems in here? (Or is this already fixed?)

Maybe related to:

https://lore.kernel.org/all/8f419d19-c83d-bbcd-8936-2d64ced7464c@google.com/T/#u

which should be fixed now.

-- 
Thanks,

David / dhildenb

