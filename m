Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33AC237BF1F
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 16:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbhELOCV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 May 2021 10:02:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51640 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230196AbhELOCV (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 May 2021 10:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620828072;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gowrrLL3ysBs8u2zKiC3M3lu9rDb9/E0MQP7c4fvgzI=;
        b=f2esKJSS38Nvdt2OyqSKWJbz+Bbrly1+Zu3HMWUWoRToPDyHMPGUOdDkFi7CT/jNFQ1CJ5
        8ZQZWeG/FhYoKVTLye3qPI3sKiCiCed95BrH3YCJKoniRew5dfZA+VJywbM5dj3jGIVM9u
        prvwtWlDL4lX27Ghu+DqZTQeP2mcNo0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-iLO6wEUANHeFheB0bz3w3Q-1; Wed, 12 May 2021 10:01:11 -0400
X-MC-Unique: iLO6wEUANHeFheB0bz3w3Q-1
Received: by mail-qk1-f199.google.com with SMTP id n2-20020a37a4020000b02902e9aef597f7so17343005qke.21
        for <linux-next@vger.kernel.org>; Wed, 12 May 2021 07:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=gowrrLL3ysBs8u2zKiC3M3lu9rDb9/E0MQP7c4fvgzI=;
        b=UucgXycwfAv7+M9jGCzoqDlago7eRwU9IIn6CMKnOfnf/u5kx75+lsyR/mvxCohlAg
         1CIVlDwhWJ0B6DoN7N49TQfq/kSkynMhGcoAl3w/p2n5ArdR4r5lE2bfRQo4gfUmyz6G
         OTsrosnS5qzqizO8Xx18wxIqUmLnYRjpczbuone7YF1ok+m3+bUwAd6J2RJc1u+PrzV4
         629Bhe1SZAqX1WZZB8QQHrObnxH5hPuA59CVQHOlmf/+3EVPd1TXbwWBc3apoidKy7as
         iRfM8i2XHbdPlKIUJe5K9lmSTxf2prDsiGejvhL63/MZCHRmbAB8DRYZ2Z7Bk/DuJ01P
         6RHw==
X-Gm-Message-State: AOAM532HG4DJXTDpX0IVASVanOqsvIdZXgtZaw+bizrM+ucHvNAk7/3+
        TokWmJqM0PoolVRBY+oMxOxpFWeny3spNNv1TY61DEAN+2cD21JEg/BxiEuR9/NuOjlChiyrFs9
        //JIMppZ1dn9j62NryNh975N75ZMqL6h1AozOmiYeq/wS+O5grDC8njwFBWc2LYgPRe/sKQ==
X-Received: by 2002:ac8:1093:: with SMTP id a19mr33433653qtj.365.1620828068098;
        Wed, 12 May 2021 07:01:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHSgHXU1mg2XTAmCZ8AesRnZrgozE7BfPtumfVlzE2V5i/gY9cW3Q94iB0M+SOMnXPuu6Blg==
X-Received: by 2002:ac8:1093:: with SMTP id a19mr33433611qtj.365.1620828067840;
        Wed, 12 May 2021 07:01:07 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id h10sm78321qkh.47.2021.05.12.07.01.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 07:01:06 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210512152806.2492ca42@canb.auug.org.au>
Message-ID: <6e5a8e32-9b9d-67db-cfc5-8eb10ce6c87a@redhat.com>
Date:   Wed, 12 May 2021 10:01:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210512152806.2492ca42@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/12/21 1:28 AM, Stephen Rothwell wrote:
> Hi all,
>
> As Randy also reported ...
>
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> mm/slab_common.c:764:8: error: array index in initializer exceeds array bounds
>    764 |  .name[KMALLOC_RECLAIM] = "kmalloc-rcl-" #__short_size, \
>        |        ^~~~~~~~~~~~~~~
> mm/slab_common.c:776:2: note: in expansion of macro 'INIT_KMALLOC_INFO'
>    776 |  INIT_KMALLOC_INFO(0, 0),
>        |  ^~~~~~~~~~~~~~~~~
> mm/slab_common.c:756:39: error: array index in initializer exceeds array bounds
>    756 | #define KMALLOC_CGROUP_NAME(sz) .name[KMALLOC_CGROUP] = "kmalloc-cg-" #sz,
>        |                                       ^~~~~~~~~~~~~~
> mm/slab_common.c:765:2: note: in expansion of macro 'KMALLOC_CGROUP_NAME'
>    765 |  KMALLOC_CGROUP_NAME(__short_size)   \
>        |  ^~~~~~~~~~~~~~~~~~~
>
> and more
>
> Caused by commits
>
>    4d57437a3d3c ("mm: memcg/slab: create a new set of kmalloc-cg-<n> caches")
>    0727bf117622 ("mm: memcg/slab: don't create kmalloc-cg caches with cgroup.memory=nokmem")
>    d795c307bd3a ("mm: memcg/slab: disable cache merging for KMALLOC_NORMAL caches")
>
> At least they are the commits I have reverted to fix this.
>
Sorry about that. It turns out that construct like that below doesn't work.

enum kmalloc_cache_type {
         KMALLOC_NORMAL = 0,
#ifdef CONFIG_MEMCG_KMEM
         KMALLOC_CGROUP,
#else
         KMALLOC_CGROUP = KMALLOC_NORMAL,
#endif
         KMALLOC_RECLAIM,
#ifdef CONFIG_ZONE_DMA
         KMALLOC_DMA,
#else
         KMALLOC_DMA = KMALLOC_NORMAL,
#endif
         NR_KMALLOC_TYPES
};

The first ifdef is fine, but the second one will reset the enumeration 
count back to 0 if CONFIG_ZONE_DMA is not defined causing 
NR_KMALLOC_TYPES set to 1. Will send a new version to fix that.

Cheers,
Longman

