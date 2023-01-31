Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4719168269D
	for <lists+linux-next@lfdr.de>; Tue, 31 Jan 2023 09:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231337AbjAaIha (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 31 Jan 2023 03:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbjAaIhN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 31 Jan 2023 03:37:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C8416330
        for <linux-next@vger.kernel.org>; Tue, 31 Jan 2023 00:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675154132;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gEXPkm2deTpGOq986t/LPngut+HkZZrd809/PA2mKmo=;
        b=Qy8W6uMn0jLUXx8+WCHwV9CW4hPzXa1XBf1ccZJtuC/durdbK/u2g0/FVs+tlG50wbWcXc
        ArdpKGsTB8j8Eo/aCg3kPzPU/EGdyXikZN1D1ZR8iQ97OH1R7HzuFrlXusumr0QU8HiI1R
        sf8xmVMFS41kOqWDmnzf90hh0ZJ6G68=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-IR3PhVQKMXyeKroyn0fRQw-1; Tue, 31 Jan 2023 03:35:29 -0500
X-MC-Unique: IR3PhVQKMXyeKroyn0fRQw-1
Received: by mail-wm1-f71.google.com with SMTP id bd21-20020a05600c1f1500b003dc5cb10dcfso2240910wmb.9
        for <linux-next@vger.kernel.org>; Tue, 31 Jan 2023 00:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEXPkm2deTpGOq986t/LPngut+HkZZrd809/PA2mKmo=;
        b=3bzxAVDGg1znBrwSsBzTL6AL9j5owyov4CkqpDYkFktoQIx4r9magpmzmJPwydaL6Y
         RAnD/K10Ejv+YpjBdA3JU0S06et8IGUP7zg88LJkpFFOxurnk/6NozOY+VdEFr0DIOM7
         6eMuANzjCFvE0Ng35uv0o9t1IcKoGEzhuqj+Q1wW0aPYptwT+bvSLMmQTmr97h7Dxz3V
         wAQkQTgnve+fd/92f68WgsRMcbcL+XrHxo0xxKi4FQRFTtVxpULkaCKYoxd0XsG3qlKO
         qdXZqy+PJqcIg/A4yIwbul5c4odM5x4Hx+ATbpWb5b7e0LkBW/RIITODB2wvQkfqtHnV
         lYPg==
X-Gm-Message-State: AO0yUKXgRRDwf3iKmqcmHx7tc48TyMF0UZG+nF+l+h+jlDJXkE3uD2oN
        Y8igDOcmv+CJ2k9Z3X1VwTBR0V1F+vRCdML64mWZ1dUv6P7PiyD53isQiyuDxgvWen1xR7caPi2
        1meSB9gRnQVPzmXBlt1Kmww==
X-Received: by 2002:a05:600c:5022:b0:3dc:3398:cf7f with SMTP id n34-20020a05600c502200b003dc3398cf7fmr16251592wmr.26.1675154128202;
        Tue, 31 Jan 2023 00:35:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/dIaNpMyEGuks53GD0rMx/xrUMoKEqNRXDdjxBQr9skCTr2hZwU95hHfmGy6R/UmFYPxh3oQ==
X-Received: by 2002:a05:600c:5022:b0:3dc:3398:cf7f with SMTP id n34-20020a05600c502200b003dc3398cf7fmr16251575wmr.26.1675154127920;
        Tue, 31 Jan 2023 00:35:27 -0800 (PST)
Received: from ?IPV6:2003:d8:2f0a:ca00:f74f:2017:1617:3ec3? (p200300d82f0aca00f74f201716173ec3.dip0.t-ipconnect.de. [2003:d8:2f0a:ca00:f74f:2017:1617:3ec3])
        by smtp.gmail.com with ESMTPSA id y21-20020a05600c341500b003da28dfdedcsm9456694wmp.5.2023.01.31.00.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 00:35:27 -0800 (PST)
Message-ID: <97ea66a4-54a0-68a3-c42b-f3c36c69768e@redhat.com>
Date:   Tue, 31 Jan 2023 09:35:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] mm/mmap: Fix vma_merge() offset when expanding the next
 vma
Content-Language: en-US
To:     "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-next@vger.kernel.org
Cc:     Sanan Hasanov <sanan.hasanov@knights.ucf.edu>,
        Matthew Wilcox <willy@infradead.org>,
        Hugh Dickins <hughd@google.com>
References: <20230130195713.2881766-1-Liam.Howlett@oracle.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230130195713.2881766-1-Liam.Howlett@oracle.com>
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

On 30.01.23 20:57, Liam R. Howlett wrote:
> The vm_pgoff was being set incorrectly when expanding the next VMA to a
> lower address.  Fix the issue by using the mid->vm_pgoff value for this
> merge case (aka case 8).  Note that this does not change case 3's
> vm_pgoff as next and mid are the same VMA.
> 
> Reported-by: Sanan Hasanov <sanan.hasanov@knights.ucf.edu>
> Link: https://lore.kernel.org/linux-mm/IA1PR07MB983017D2FBA174D2FF78CEB6ABCE9@IA1PR07MB9830.namprd07.prod.outlook.com/
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Hugh Dickins <hughd@google.com>

Fixes: ?

> Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> ---
>   mm/mmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 00d90bbc250e..614ea2d93b0a 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -978,7 +978,7 @@ struct vm_area_struct *vma_merge(struct vma_iterator *vmi, struct mm_struct *mm,
>   			vma = next;			/* case 3 */
>   			vma_start = addr;
>   			vma_end = next->vm_end;
> -			vma_pgoff = next->vm_pgoff;
> +			vma_pgoff = mid->vm_pgoff;
>   			err = 0;
>   			if (mid != next) {		/* case 8 */
>   				remove = mid;

Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

-- 
Thanks,

David / dhildenb

