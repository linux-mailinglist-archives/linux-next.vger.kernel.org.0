Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE03335911C
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 03:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbhDIBCS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 21:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37331 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233059AbhDIBCR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 21:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617930124;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gjzhrqiGT9uDkHxaFDu80q6quLDp98xQp9iYXchZfto=;
        b=QL5RjOfNlC0chRWo+VaGB9OcYBtiYJRxff8H+dK4IIIaDp3ma/dDxRekFkdGfMLT42EdOz
        eY5lN2+69U8Fz6oSduQoBVPemiH6qSfDlUIVgA8z726nQdm9LaM1cSqRwv0CZ/U1eWNt5f
        0IoJqbdTDyns+8IP0UtqXCu0djVmSbg=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-fiXqxkhaMZeSGdGbflsH6A-1; Thu, 08 Apr 2021 21:01:58 -0400
X-MC-Unique: fiXqxkhaMZeSGdGbflsH6A-1
Received: by mail-pg1-f199.google.com with SMTP id z13so2225424pgi.12
        for <linux-next@vger.kernel.org>; Thu, 08 Apr 2021 18:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gjzhrqiGT9uDkHxaFDu80q6quLDp98xQp9iYXchZfto=;
        b=ghGFgo78WNID370YQ4XaRB70WX3EXRLYOeTDwCsztexf6aix6lf+77qdN44qVbMah9
         0QC1tdlpjZF4iPpbwwlKxs7jrsVXXkj7DKbCMLU4nLOdQToZbInjVnqVDfdfDemgO7yT
         T/bYYbP+5dDyTTunVzbaJiU0W1+c2HH7+JKEcmmcJtb8c/GhQra7DL+d599lTXABk8P1
         ycXWmurVUQWz8O+TyY7gJpA+/NBFcvwHKd2ySzCyGRZmRheHOUvTLGRKb1OSg9mFC1S5
         nD2YHUFaB9f4+emdZjHzy1mvjGq3CP+YoRTv0q68J09hungfn6ZcB8IKMrkod/rN8Sys
         MFTQ==
X-Gm-Message-State: AOAM531TJSdGJr4f2kejTT/T5913v7go8JJWqYn47D+E7ndmxWuhiaEb
        c04Bo9wsdp6hgpedNaoDX7LOzJu0JqfG1qD1GgUPuUvEYQwaqdzPyRcdF8yEKK3zmHF8Y0237PW
        nbxJr6Rdgcd9TI8ktpnGr/w==
X-Received: by 2002:aa7:8a4d:0:b029:211:92f2:658c with SMTP id n13-20020aa78a4d0000b029021192f2658cmr10230511pfa.29.1617930117654;
        Thu, 08 Apr 2021 18:01:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNDlqE+vc2tXr8jHylGjh+EYkyC1utKYUB6N+7iZBWIRC/0bCBh3Z+Bk7oH8xbjOPTuq6+rA==
X-Received: by 2002:aa7:8a4d:0:b029:211:92f2:658c with SMTP id n13-20020aa78a4d0000b029021192f2658cmr10230489pfa.29.1617930117370;
        Thu, 08 Apr 2021 18:01:57 -0700 (PDT)
Received: from xiangao.remote.csb ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id c14sm528286pfj.46.2021.04.08.18.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 18:01:57 -0700 (PDT)
Date:   Fri, 9 Apr 2021 09:01:46 +0800
From:   Gao Xiang <hsiangkao@redhat.com>
To:     coverity-bot <keescook@chromium.org>
Cc:     Chao Yu <yuchao0@huawei.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: z_erofs_handle_inplace_io(): Uninitialized variables
Message-ID: <20210409010146.GA689534@xiangao.remote.csb>
References: <202104081709.43BC2DB@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202104081709.43BC2DB@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Thu, Apr 08, 2021 at 05:09:14PM -0700, coverity-bot wrote:
> Hello!
> 
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20210408 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
> 
>   Wed Apr 7 13:17:55 2021 +0800
>     c660a3a86e7e ("erofs: support decompress big pcluster for lz4 backend")
> 
> Coverity reported the following:
> 
> *** CID 1503704:  Uninitialized variables  (UNINIT)
> /fs/erofs/decompressor.c: 160 in z_erofs_handle_inplace_io()
> 154     	}
> 155     	kunmap_atomic(inpage);
> 156     	might_sleep();
> 157     	while (1) {
> 158     		src = vm_map_ram(rq->in, nrpages_in, -1);
> 159     		/* retry two more times (totally 3 times) */
> vvv     CID 1503704:  Uninitialized variables  (UNINIT)
> vvv     Using uninitialized value "i".
> 160     		if (src || ++i >= 3)
> 161     			break;
> 162     		vm_unmap_aliases();
> 163     	}
> 164     	*maptype = 1;
> 165     	return src;

Thanks for the report!

This bug was reported by Colin King before (next-20210407), and has already
been fixed in (next-20210408), see:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/erofs/decompressor.c?h=next-20210408#n157
and
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/erofs/internal.h?h=next-20210408#n405

Thanks,
Gao Xiang

> 
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1503704 ("Uninitialized variables")
> Fixes: c660a3a86e7e ("erofs: support decompress big pcluster for lz4 backend")
> 
> Thanks for your attention!
> 
> -- 
> Coverity-bot
> 

