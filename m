Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3F93495DDD
	for <lists+linux-next@lfdr.de>; Fri, 21 Jan 2022 11:42:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234824AbiAUKmN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Jan 2022 05:42:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28419 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350082AbiAUKmM (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Jan 2022 05:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642761732;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CdPdILngPzGrQBwtZZKW+7ixKah3Wpht/KCyewnhlCg=;
        b=E2QK4XXt/0wjkP32B5b/QnbINlfL7E02PHIne200FVc+8BYe3VdhMKgIhqVHnWhByIW8/Z
        cawFlFcUL24Khn0y9RkzyU6GVsWuvboEMwyCata0lDrJVJjqhryun117fRvPT6mwY+qcas
        Z8Jet5vlP6q9fTi9514oNMyvqi1ESvg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-CQRcnKm1MfSHL2uiqJYmQQ-1; Fri, 21 Jan 2022 05:42:11 -0500
X-MC-Unique: CQRcnKm1MfSHL2uiqJYmQQ-1
Received: by mail-ed1-f71.google.com with SMTP id p17-20020aa7c891000000b004052d1936a5so4375737eds.7
        for <linux-next@vger.kernel.org>; Fri, 21 Jan 2022 02:42:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CdPdILngPzGrQBwtZZKW+7ixKah3Wpht/KCyewnhlCg=;
        b=rU3cOtgsim9qFIHn4SVsls5M2saharT4JSDGxHsWysDIgqGCSNiuHgT9IEUw5vwUOF
         z2t0oETxPD6Lrf5SqEv0ldzIE8HaS+4mEv4fnorMh5ii+pijkYxAtf1El45agRXLByLe
         rBG1OJFpRles6PJGzpZVor3dTPKNvdz6bYHP5GAOLI81AE6NdGqN1AUkgNmMy5HZjKOj
         MCxTpWrtmCR3Tybeen1aD3WBDkZTbtxhPgRponJ8FPMTLesmDfPkaCsyQ7kh3ZiAepP/
         oat6vljeJtPJq/nY8Wma0GU6Po6d7fnmhFVa88sfHUfPep8ZLxmu7gK7Pw8w1ccOyeEO
         ogPQ==
X-Gm-Message-State: AOAM530aU+3LPBjEYjTThR/Y8YBHlmc9ptca6DO/zkBpeAP5jgLZTWPp
        yI0ierTn3RTHVd05tz9o7oiAR4nohApDJftLvfKvCNeSZ0veKAbJ4QRMbqeEKzuJT/ays7AAKOO
        +c7rlUgaiTF+zyOuPhT/G2g==
X-Received: by 2002:a05:6402:31e9:: with SMTP id dy9mr3680089edb.65.1642761729926;
        Fri, 21 Jan 2022 02:42:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwip9Cp2oVEYL+pg2NbsXqt2zQcoTWCMHysfXzR0VjzDHu2yy8g2b0X+EK52vUarXS+yjY5QQ==
X-Received: by 2002:a05:6402:31e9:: with SMTP id dy9mr3680084edb.65.1642761729806;
        Fri, 21 Jan 2022 02:42:09 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id z10sm2504846edl.54.2022.01.21.02.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jan 2022 02:42:09 -0800 (PST)
Message-ID: <faa591e3-19f3-1a8d-4e64-bc8cc94b82dc@redhat.com>
Date:   Fri, 21 Jan 2022 11:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211015205422.53bec93d@canb.auug.org.au>
 <20220120141851.5503b65a@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220120141851.5503b65a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stepen,

On 1/20/22 04:18, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 15 Oct 2021 20:54:22 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the drm-misc tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> Documentation/gpu/drm-kms-helpers:451: /home/sfr/next/next/drivers/gpu/drm/drm_privacy_screen.c:270: WARNING: Inline emphasis start-string without end-string.
>>
>> Introduced by commit
>>
>>   8a12b170558a ("drm/privacy-screen: Add notifier support (v2)")
> 
> I am still getting this warning.

Sorry I completely missed your original report on this between
all the other kernel related emails.

I'll prepare a fix for this coming Monday.

Regards,

Hans

