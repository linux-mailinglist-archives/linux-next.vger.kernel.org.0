Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3DB3586F7
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 16:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231883AbhDHOTC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 10:19:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52901 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232216AbhDHOSh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 10:18:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617891505;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=heAoMXR13ua17Y0mBk6t6RCTDm/2YpK2rKLhCgGdEp0=;
        b=dQWe5+xrQ2Gj6VnwW+PJDFzYyd1nk0F9AJn/Hj0U0a1qowRfeOLHieACjZsrPvn0jK9Lsc
        zZO+pplBzT8Q3xkuQ9FaOzuiHxdT/l5u3ZBafko8k4JAcVC19gljT6JO6PINKcWABIIUP3
        2X7fhTYkoPIB0aZD1L+gYnPcHe3DWHg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-ydCSjxNPOum4lC9BkM8lrA-1; Thu, 08 Apr 2021 10:18:24 -0400
X-MC-Unique: ydCSjxNPOum4lC9BkM8lrA-1
Received: by mail-ej1-f72.google.com with SMTP id kx22so920535ejc.17
        for <linux-next@vger.kernel.org>; Thu, 08 Apr 2021 07:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=heAoMXR13ua17Y0mBk6t6RCTDm/2YpK2rKLhCgGdEp0=;
        b=MmZNcib03RKvxv0qPCQw7ptEGZPiHFqB3SZnzjr6RD7hfvH4n9XKfdwkK4bB9YzNZt
         wh6mi2cykw+PjmTpzBFmNztKy/51mPUEHyMHSjEBcdV1TwfifcHc7z6nWJgmFUvfV3Q4
         bHAN77t/5htrItY6jJbXvYiv4OlsuFbNp8l3xgI8jt4uB5Jwv9cIOrQ9r6EYGPau0NJ5
         2R/a2XglzbqesQKdQNOVq7RIN7EQm+plAfdQIofeM3Tmdrhcgnu7bGWTNnGJXmEk9HHk
         hBRTQJdvv8aM/+bMKhDxS57mPAmne2oAhVJ8l23B8IuYLXfO8JClCIhE79Ceaput+kiI
         CR+A==
X-Gm-Message-State: AOAM533pyCN4PkuNyhJrF1nKUpTvirfT6old6ZfDH6GMzB7x2fVsJ6CD
        WWTcVTsjxsm83/tIymWs0WX6kJ+AirM8zKZDuXRjl8z6V/kqzPbVPENN2OJRlNi4jglVxfL4kSx
        od56koisiAQ7QzWWhXbQDoeDnF2m7l039Q5i0TdkIxD8AM1rjB1P4+dusjIX6MoTNuyXBf9Yn9A
        ==
X-Received: by 2002:a05:6402:138f:: with SMTP id b15mr11776752edv.121.1617891502838;
        Thu, 08 Apr 2021 07:18:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4EfxI4NdtRYH0iSGE+S/zrp2Jbq9CkjnDLXHxuU4gU0RGedNvtVEtWlXMpnCJvIKx5DOCOA==
X-Received: by 2002:a05:6402:138f:: with SMTP id b15mr11776728edv.121.1617891502647;
        Thu, 08 Apr 2021 07:18:22 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u13sm9057314ejr.100.2021.04.08.07.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 07:18:22 -0700 (PDT)
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <mark.gross@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210408221334.63262fbf@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <08996ca7-c927-8261-d71e-e509815b5442@redhat.com>
Date:   Thu, 8 Apr 2021 16:18:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210408221334.63262fbf@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

On 4/8/21 2:13 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   11cccec79c60 ("genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()")
> 
> is missing a Signed-off-by from its committer.

Ugh, thanks for letting me know, this was supposed to come from a merge
from an immutable branch from the tip folks, but I did a rebase -i
to fixup a typo in a commit message and that seems to have flattened
the merge :|

I'll redo the last 3 commits in pdx/for-next to re-add the merge
and do a forced push.

Regards,

Hans

