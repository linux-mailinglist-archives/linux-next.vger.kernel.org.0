Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99B76E52F2
	for <lists+linux-next@lfdr.de>; Fri, 25 Oct 2019 20:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731266AbfJYSDQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Oct 2019 14:03:16 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34818 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731263AbfJYSDP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Oct 2019 14:03:15 -0400
Received: by mail-wr1-f66.google.com with SMTP id l10so3361724wrb.2;
        Fri, 25 Oct 2019 11:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sRSIHOYVf7qsnfaK43V65CarnMxSZE8djVm9tqub2po=;
        b=UOxfDy9ZzHGAxhNjRVvaf0zjdR6eD0x87dUCgE/m3lOw8syrbLC0jl6VTQAuAd0ajR
         sU6K5U6RmcCdPEwdWbOYTyN57Zr5igBt1h17+uNappPUeBSms0Cf7DBAVCJMIdpu3gDY
         lTHkMThgdz+wvmS0YmRDl1dOfJFZNQOaRC6mXfFMvLnQPutF17vMJ8QEu67M6jhwO51Z
         6Xz0oy05cwgQO06HJS925Jq4KcDAo8Gddpuj0W8qvf7DhP5tPrW8i+o/ODPoTorI6H7p
         VNeyeRHmw8oLr+SQusaGAzd2JzOC/QzWKxcoo5tdRjEsY7K+/1XJCA5V3rNKhiGw4e/6
         rWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sRSIHOYVf7qsnfaK43V65CarnMxSZE8djVm9tqub2po=;
        b=Xxa9Sds1WHaquAmfk/6OIhiboOSwKeARlMhVvvjN0XOowT5JOa3my73vcbrLKnTy28
         5RtiV3Lw3kShClp0F3EYSXwHGQJeuCDt3/C79yzLHY1I99B53i89vD2sGzDM29FpVclw
         N9KyKuHBKFQgj6drtHiFPt5Gkg7Oi/N1OYL/WP3ZbKw7mgYTW1e6UWYGCqAKnWrNGg//
         0QlBFPsevrhT3pbU4QSBUVZNE/sEcmlUwXj26KV1AAsPZFGv+2NsQR3XAzNZWDuzyCoj
         P4FgqwgSx85sZ6A/kOQV9QVZJ4fCjVNib89Fxxn/nOGJWrrINkaI2emn2Bde/Kcw+4qA
         vYPA==
X-Gm-Message-State: APjAAAXs23/qluFd/9WeSLkHEkLuAqaz0DJqzUlydKrun6B+7VbF3nx/
        28KR4jtSgt2Vm+4i2QiWEk+9mn67
X-Google-Smtp-Source: APXvYqwkRYq2HbhgxrRAmcfZOalDe3reg9s9NfmT4jljb9+TLvoLV1/HugYILjPVCiYVeX2qzzOhJQ==
X-Received: by 2002:adf:ffc5:: with SMTP id x5mr1090391wrs.93.1572026593089;
        Fri, 25 Oct 2019 11:03:13 -0700 (PDT)
Received: from [10.69.45.46] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id z189sm4141012wmc.25.2019.10.25.11.03.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 11:03:12 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191025140736.0c9e9d64@canb.auug.org.au>
From:   James Smart <jsmart2021@gmail.com>
Message-ID: <13203518-3fc5-bce9-3ed7-9487cd81a9f9@gmail.com>
Date:   Fri, 25 Oct 2019 11:03:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025140736.0c9e9d64@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/24/2019 8:07 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scsi-mkp tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/scsi/lpfc/lpfc_debugfs.c: In function 'lpfc_debugfs_ras_log_release':
> drivers/scsi/lpfc/lpfc_debugfs.c:2109:2: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
>   2109 |  vfree(debug->buffer);
>        |  ^~~~~
>        |  kvfree
> drivers/scsi/lpfc/lpfc_debugfs.c: In function 'lpfc_debugfs_ras_log_open':
> drivers/scsi/lpfc/lpfc_debugfs.c:2150:18: error: implicit declaration of function 'vmalloc'; did you mean 'kvmalloc'? [-Werror=implicit-function-declaration]
>   2150 |  debug->buffer = vmalloc(size);
>        |                  ^~~~~~~
>        |                  kvmalloc
> drivers/scsi/lpfc/lpfc_debugfs.c:2150:16: warning: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   2150 |  debug->buffer = vmalloc(size);
>        |                ^
> 
> Caused by commit
> 
>    95bfc6d8ad86 ("scsi: lpfc: Make FW logging dynamically configurable")
> 
> I have used the scsi-mkp tree from next-20191024 for today.
> 

I will resolve this quickly...

-- james
