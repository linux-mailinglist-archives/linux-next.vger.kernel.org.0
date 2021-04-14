Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 071C935F5AC
	for <lists+linux-next@lfdr.de>; Wed, 14 Apr 2021 16:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233512AbhDNNz7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Apr 2021 09:55:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48096 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233385AbhDNNz6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Apr 2021 09:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618408535;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DY+SJmwqzy9pScD0ZnL49s9+9nX3murcsvXTUnJnDjs=;
        b=a8kcyX2co6DtrnK/3LVyprEJbJIeijYdWZOZPHtk8+Mbu4cwHOjjXTvHWjzW2VfOnMgJzq
        cw2cGOaFPxLP5+1JDlNQmY9vXB6KBIqOQ5o7revY45KP8Y3/d9Ha6G+PjRPI1TaCDvahLD
        lmo20bUt9R97jU7wpWBxhsiiv41E/1M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-NESm34qJOLuhNaRGg6EZEw-1; Wed, 14 Apr 2021 09:55:33 -0400
X-MC-Unique: NESm34qJOLuhNaRGg6EZEw-1
Received: by mail-ed1-f72.google.com with SMTP id t11-20020aa7d4cb0000b0290382e868be07so3382417edr.20
        for <linux-next@vger.kernel.org>; Wed, 14 Apr 2021 06:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DY+SJmwqzy9pScD0ZnL49s9+9nX3murcsvXTUnJnDjs=;
        b=j+f8w+ldQbovYdBr/iOD3TJBNn5SKZvu8yQe7scPayuoZEA4VklrfPgbVnWq0TLj3A
         GtYvHElECZMCm7U4d5s1i3qTe8NHbIC8Gh0klFYO4CXwpf0jM33gushM18H4pKa6e3Np
         NwG+PI1Zeu7X1zjuMXGdkgZwSiaaJun8kSMirF91xkJ9jhK5UP07McwCMp0Hxv4geOz/
         /YjjVwSYYjAFo7+tdwCnjeasb8D28nOfe0gwQlVXkE3GH26dNIUZi+pDaHQjNqqAn+Xh
         rOnGjFpHHHfAGym0plFdNZpan2uWNoOu3rZsj0fwHLyeiVUH3mvFseyjozvJOkQMLYUZ
         qq1w==
X-Gm-Message-State: AOAM530c11mKPukKK7MiRF6lWS7wYVc4GAjbr89OTW1ThYVkh17qoPqc
        m1t+asA3HitRBfMYIuJFLcGvQFERKcYRScX5N1jjOP/IegzhK+mbb68g9d1RW+9VeGu2qTwSgWl
        oO9tfwsZYtysV09xN5hUJ7c5a+3FfAhXUCCHJrN2U8v8QeC3p0PLCMZvy979ZCAA52LsTdw7zAg
        ==
X-Received: by 2002:a17:906:86c2:: with SMTP id j2mr26675971ejy.257.1618408532218;
        Wed, 14 Apr 2021 06:55:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzvAeULmVyhZcKCCs1PkUpgfyjPG3yNQyDn6Hf9TfUDPIgW/x7gMwVao60zmdm7CknTuj9Jw==
X-Received: by 2002:a17:906:86c2:: with SMTP id j2mr26675952ejy.257.1618408532010;
        Wed, 14 Apr 2021 06:55:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n3sm9857238ejj.113.2021.04.14.06.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 06:55:31 -0700 (PDT)
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <mark.gross@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210414235123.4ebcd479@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b96a2e6a-3752-a7c6-a78a-3ec0d9301b0e@redhat.com>
Date:   Wed, 14 Apr 2021 15:55:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414235123.4ebcd479@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 4/14/21 3:51 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   ff57cfaa3d68 ("platform/x86: pmc_atom: Match all Beckhoff Automation baytrail boards with critclk_systems DMI table")
> 
> is missing a Signed-off-by from its committer.

My bad I somehow forgot to pass -s to "git am", this is fixed now.

Regards,

Hans

