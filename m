Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E3930ED8A
	for <lists+linux-next@lfdr.de>; Thu,  4 Feb 2021 08:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234712AbhBDHkN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Feb 2021 02:40:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32169 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234633AbhBDHkK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Feb 2021 02:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612424324;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UQ0eTVPL8hjhBEzJ8ELtfQWdOLooTVyajO3Fy8uNSZ8=;
        b=UJI7kkUhslW0gxJmlNJfci5wKcRbJZX5Vy1aJclFfYGOJIeCpFrRrJXfOXgFmMDHwS95bk
        EYVPWejsocMes33JEgMudxPPO4I+VF83XiT8Gmgf5YzSLuusjXCaeNJdkGqXsNEiZ+ckhn
        MlTUvPw/SzcZ5szNqBBqvuuazKdk7cw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-aBlIyxrMO0GYd_N0hM7Nnw-1; Thu, 04 Feb 2021 02:38:42 -0500
X-MC-Unique: aBlIyxrMO0GYd_N0hM7Nnw-1
Received: by mail-ed1-f71.google.com with SMTP id f21so2096953edx.23
        for <linux-next@vger.kernel.org>; Wed, 03 Feb 2021 23:38:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UQ0eTVPL8hjhBEzJ8ELtfQWdOLooTVyajO3Fy8uNSZ8=;
        b=piGEn3r+raEp86UZSO1Aq8LdhZag09PW9Qib0ipYfotulAvfrnpOclAW5WtKbA4fyd
         QUxuFQYrPCH8xykEIIzUqK3+YpKTNUrLIGquyJFC8rK858AX+C2udNgfNzPqc6boCu1K
         XX+MyKjpTlLFapCIwuF2TonSJgHs1xI/QrMVhJsJXWaGj+05lFbP/llGcw9jrIM2wzji
         TcbaphjIDxIYSDDahKLEti8vDwiiKbM+8qJ2C/0mcAhWoSE/M6iqwRliHShKE8+VTdgi
         LeQNcE9BvSzslybenORCTU5JLx/DgMTypAIfAJ4g8QAavTa+eoz+OsIPx7GuIx6f3H3S
         ab7w==
X-Gm-Message-State: AOAM532Wb4ZBZLQ1MHgs3WSR1/G4xMDGnbLoheJuX5mNLv89dPTEWbxD
        zdEnVNsDUVazLc8Jcko7Q+eiOveVrCCbIV3YUWkP+2BQGCs1RzdvWrLTCcrY5Bbp/UAPnGt8R+b
        JGX5r1MbxMVUmcAYqq2VaEeTab+q6cH4UsAuUGHe4RyoLHf6JJn49Xl/uH9Xiqkyy/D+7vTeCLw
        ==
X-Received: by 2002:a17:906:7191:: with SMTP id h17mr7044016ejk.54.1612424321404;
        Wed, 03 Feb 2021 23:38:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqMJ/NojtP+0ID/tXGNmwGoEtk5rny6JED/4q/QSBepALPvSdTcf9hvXY/ZLz3BCvMVUv/9g==
X-Received: by 2002:a17:906:7191:: with SMTP id h17mr7044003ejk.54.1612424321208;
        Wed, 03 Feb 2021 23:38:41 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id a15sm2009838edy.86.2021.02.03.23.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 23:38:40 -0800 (PST)
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <mark.gross@intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210204161351.5c934ea2@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5461d70a-39a0-0322-e2ae-6434e0d1e0a3@redhat.com>
Date:   Thu, 4 Feb 2021 08:38:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204161351.5c934ea2@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen, Andy,

On 2/4/21 6:13 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drivers-x86 tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/platform/x86/intel_scu_wdt.c: In function 'register_mid_wdt':
> drivers/platform/x86/intel_scu_wdt.c:66:28: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>    66 |  wdt_dev.dev.platform_data = (const struct intel_mid_wdt_pdata *)id->driver_data;
>       |                            ^
> 
> Introduced by commit
> 
>   a507e5d90f3d ("platform/x86: intel_scu_wdt: Get rid of custom x86 model comparison")

Thank you for the bug report.

Andy can you send me a fix for this please ?

Regards,

Hans

