Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A13EE682F47
	for <lists+linux-next@lfdr.de>; Tue, 31 Jan 2023 15:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbjAaOaw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Jan 2023 09:30:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbjAaOav (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Jan 2023 09:30:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D34A3B472
        for <linux-next@vger.kernel.org>; Tue, 31 Jan 2023 06:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675175405;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CnMa8Dx5VcMMm/Zxziptz0YY6DNnRe7DuNVWJX2ZiNI=;
        b=dq6cG/DZ/h9RRc8J8dsNmpzxeSJVMXa2HY3RWX9clegaonSMjksa+E84RZtjEO60EMJmg3
        hGLLMEWwjZySX2shTia2O5WiL7i05qXsDzwCeAM0+5K7GvVf/HpjCjwV24bGsD1dWQnKpU
        9TdXfFXvsRczAohsF/Vf3x8936splCk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-77-H2s_3pw3MlWsGZx6PHschw-1; Tue, 31 Jan 2023 09:30:03 -0500
X-MC-Unique: H2s_3pw3MlWsGZx6PHschw-1
Received: by mail-wm1-f70.google.com with SMTP id d14-20020a05600c34ce00b003dd07ce79c8so2027485wmq.1
        for <linux-next@vger.kernel.org>; Tue, 31 Jan 2023 06:30:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CnMa8Dx5VcMMm/Zxziptz0YY6DNnRe7DuNVWJX2ZiNI=;
        b=ig9W3Dk8zoZy47d94AKcXeGmp8jqM86aYNqnhtG3+AP4DaZaAg5gD7n/F9jm7ZlX+K
         P7aZe9mpQ4KrHfmVhrmjcLDpGRVhBB1icRf8k/WqFfN4CBhhsqGPiUP88bu0BqQ7lGdx
         QEQm4hPGD23glxrPbXeCzxIrR6U/XT7yg+0Ez0HmATg0wo4VSwDwwyCURP6s51EcKaPS
         Ql+suACtXDBu5l21gEWpuRhfA4vP7oaJE26lXzW8hwrGW0P4HZ9Zh169yKf6Ah3r7kxv
         fdERI9kGMkUE6wUgmVM8x1H6rnuamFY1py1LvEwXIsnVOsZm7hfyYfwABuBVRKVJyEqr
         LvkQ==
X-Gm-Message-State: AO0yUKU0hy4MX1uMX1wb84opQ0yzf2PqNQodqii3ySDLNHJnRbtblfKJ
        igQlpowmFinsX8eSn/4BqBGnvWu9j52mGQapr9WmXJ32ANgqlyFbjFFi3mhwGCW4UL9lC9rTEZX
        BGYSK7t5GzNqauoCV0kStkA==
X-Received: by 2002:a05:600c:511c:b0:3dc:5240:53b6 with SMTP id o28-20020a05600c511c00b003dc524053b6mr10041677wms.6.1675175401486;
        Tue, 31 Jan 2023 06:30:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9UX3DPxd3+kgFucScJG+BVpFrT5/64dwE6OpUMXKnU1NbzIRaiLPyFlDQrlDicVTUBQXTBCg==
X-Received: by 2002:a05:600c:511c:b0:3dc:5240:53b6 with SMTP id o28-20020a05600c511c00b003dc524053b6mr10041651wms.6.1675175401113;
        Tue, 31 Jan 2023 06:30:01 -0800 (PST)
Received: from ?IPV6:2003:d8:2f0a:ca00:f74f:2017:1617:3ec3? (p200300d82f0aca00f74f201716173ec3.dip0.t-ipconnect.de. [2003:d8:2f0a:ca00:f74f:2017:1617:3ec3])
        by smtp.gmail.com with ESMTPSA id n17-20020a1c7211000000b003dc3f07c876sm13450391wmc.46.2023.01.31.06.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 06:30:00 -0800 (PST)
Message-ID: <72dfedd2-a26a-17f4-87c2-3d71ab3f55b4@redhat.com>
Date:   Tue, 31 Jan 2023 15:29:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] mm/mmap: Fix vma_merge() offset when expanding the next
 vma
Content-Language: en-US
To:     "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
        maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-next@vger.kernel.org,
        Sanan Hasanov <sanan.hasanov@knights.ucf.edu>,
        Matthew Wilcox <willy@infradead.org>,
        Hugh Dickins <hughd@google.com>
References: <20230130195713.2881766-1-Liam.Howlett@oracle.com>
 <97ea66a4-54a0-68a3-c42b-f3c36c69768e@redhat.com>
 <20230131142452.sfrmubta4ojejct2@revolver>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230131142452.sfrmubta4ojejct2@revolver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 31.01.23 15:24, Liam R. Howlett wrote:
> * David Hildenbrand <david@redhat.com> [230131 03:35]:
>> On 30.01.23 20:57, Liam R. Howlett wrote:
>>> The vm_pgoff was being set incorrectly when expanding the next VMA to a
>>> lower address.  Fix the issue by using the mid->vm_pgoff value for this
>>> merge case (aka case 8).  Note that this does not change case 3's
>>> vm_pgoff as next and mid are the same VMA.
>>>
>>> Reported-by: Sanan Hasanov <sanan.hasanov@knights.ucf.edu>
>>> Link: https://lore.kernel.org/linux-mm/IA1PR07MB983017D2FBA174D2FF78CEB6ABCE9@IA1PR07MB9830.namprd07.prod.outlook.com/
>>> Cc: Matthew Wilcox <willy@infradead.org>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Hugh Dickins <hughd@google.com>
>>
>> Fixes: ?
> 
> Fixes: (soon to be invalid git id :) ("mm/mmap: remove __vma_adjust()")

Ah, right, upstream was not affected ... :)

... so this should be squashed into that commit instead as long as it 
doesn't have a stable ID.

-- 
Thanks,

David / dhildenb

