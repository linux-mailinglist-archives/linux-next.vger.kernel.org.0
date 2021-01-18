Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6232FABF7
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 21:58:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389259AbhARU5E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jan 2021 15:57:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29535 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389125AbhARU5A (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Jan 2021 15:57:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611003334;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3QKbyvj73XCe/MDKPB/Jw/LXd8vcFI9HePDMlmpidHc=;
        b=eE3rm/Xu4oGxRGSuk0BX0xg5v7ophhAH3S2/Ixt6zek2gvXFVRfVhOdYYRUPnDa8wTK+Q7
        kSTTEE0xVOxpgi2yJwtbRv3OJgORYedttJbYUYr/UUIAPUVyx8UN5DOKSg6eSI1oSj6FX0
        ueMnuXNbfv2gRpgoegfnwrTogCBVm6Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-MbmAXEtMPzSrGJZbyerzkQ-1; Mon, 18 Jan 2021 15:55:32 -0500
X-MC-Unique: MbmAXEtMPzSrGJZbyerzkQ-1
Received: by mail-ed1-f69.google.com with SMTP id ck25so4480017edb.16
        for <linux-next@vger.kernel.org>; Mon, 18 Jan 2021 12:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3QKbyvj73XCe/MDKPB/Jw/LXd8vcFI9HePDMlmpidHc=;
        b=XHVbTky269SjHBIn+k2EA/DPt0I1YE89/rWnjVd1M7KOCdz1ZoTFmnyVQ+U1oaN+YC
         G86CzLo0IMfKWtLbtPNwO0SSAnZYBo78DL7wuXQHrXvoTW2lI+l3C9HiMU8X0RlYcXCh
         qBAlZwb9cNLGEgGw0Y+MYxSB505MDUtB8w2fR/6GvvWXlFEh+G2q1rPl/rkxUj8lskzd
         QXSZme0+Qveq3D+jANE35dWjyW4/gnaSr0m22518MmhM5K1Uv7YnM5Taw/HlG2L0RPFq
         451xVhzV+oJra7SQjus9a7Hr+xc2gGKKGJktvH0AHpnHeDbct6N51kWSkcYbcy4xaozL
         0Khw==
X-Gm-Message-State: AOAM532V2J8WbUbJFqllGcy4IseFasyUkPrvgo/DfWPlBo+40V4qwPxo
        Wt33ATigGVx9dkf20i8lwbAlOd1l1Dm1lOyStCdQWKxUlLkpi1+Nc7TGN2IiKcjEJOTSZiMopwA
        tHoivLgJ5tWL0ZyhXwth9IqbVS+Ckv2VqaCtZa8IRbSetkiHeIfGeZo4Fk8BxAC1mzKCc3+FazQ
        ==
X-Received: by 2002:a17:907:20d5:: with SMTP id qq21mr989512ejb.340.1611003331342;
        Mon, 18 Jan 2021 12:55:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5+D2EB8eE0wOHWnl3vEYmX/7VnbaEKYyrxBiaWPrjt8oKmWU1YMJI+OGWrm2dwvryDZHIkw==
X-Received: by 2002:a17:907:20d5:: with SMTP id qq21mr989502ejb.340.1611003331140;
        Mon, 18 Jan 2021 12:55:31 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id c14sm10145610edr.46.2021.01.18.12.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jan 2021 12:55:30 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the drivers-x86-fixes
 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <mark.gross@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210119062758.75f9f8bf@canb.auug.org.au>
 <20210119063909.3dd6f6a5@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <86f9149d-d824-99f4-2d73-620aef2fa699@redhat.com>
Date:   Mon, 18 Jan 2021 21:55:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210119063909.3dd6f6a5@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 1/18/21 8:39 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 19 Jan 2021 06:27:58 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> In commit
>>
>>   99d53ba0d0d9 ("platform/x86: hp-wmi: Don't log a warning on HPWMI_RET_UNKNOWN_COMMAND errors")
>>
>> Fixes tag
>>
>>   Fixes: 81c93798ef3e ("platform/x86: hp-wmi: add support for thermal policy
>>
>> has these problem(s):
>>
>>   - Subject has leading but no trailing parentheses
>>   - Subject has leading but no trailing quotes
> 
> This is also commit
> 
>   b96705325421 ("platform/x86: hp-wmi: Don't log a warning on HPWMI_RET_UNKNOWN_COMMAND errors")
> 
> in the drivers-x86 tree.

Sorry about that, I've fixed it in both the drivers-x86-fixes and the regular
drivers-x86 trees.

Strange enough checkpatch does not catch this, while it does catch misformatted
commit references in the non tags part of the commit message. I will mail the
checkpatch maintainer about this.

Regards,

Hans

