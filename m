Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7890A062B
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2019 17:22:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfH1PWY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 11:22:24 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46232 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726440AbfH1PWX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Aug 2019 11:22:23 -0400
Received: by mail-pf1-f196.google.com with SMTP id q139so1916580pfc.13;
        Wed, 28 Aug 2019 08:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K1Wo1uryMad+JJHaOOhI3eSiwsKm2WkRf/8nzV4iG5o=;
        b=GFysR3J8M2/ErxWakUhYzi+sSNmBeOJsqfZEFYbxE1KjTRbEdMgPJwDSY2sfWBF4M7
         m554SzdeYG0q9h/3O3YP6S2ney8bZM6NSUhhOs+BcEYtnRmLb27/zrn1sJZtev1TbNe8
         Ai8qsV+khBr3j4Yeyz+kBWE8P0eeENZ+6OFFzS80tsvOSrP0xUaSlO1uH6C13cFJ1009
         cxRzDP706pd2EsdANnd/MK7GNAPYq8p3tpJ8PjWaOCxXwYlQQGvYBgvVjchn42TnWe65
         11Wwhjjeaz6joh+i8Sr2d4JPadlNYYU7M2Bgrc23JlOSFDz4XSx0ovXC/EBXU/ZO9zLX
         +74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K1Wo1uryMad+JJHaOOhI3eSiwsKm2WkRf/8nzV4iG5o=;
        b=mA55HSv0Se57jG3Smf8xcDnDsb55Wi8iZw7c1XJAxvmvFayCRQsdNxWOG89H1wLmsl
         /jjAqiPQGxWTtzEfkz8MB/i1FcWdv5DTmoP/3Ya2Y4hlYKRcX2y+u3bg6j2yyC6O9AS+
         D3QQh00Mtg+mtPzYIkNYUT1glDoXzIkL+pgpmNgSLw55p4jFtg3oKm9i4yDeSOS227ob
         /tYbZzngkVcMssFlFWmn+Jm5awiaTSCdkfQGzpvZ618+k7PNyx1ywOxAmZqvmmOzUijF
         JVs5vtv/X41IjG2NKM5d7uFqvWtIGBiRVWkEFBecpBuMaXxKMsPB6Xb4JHYcTVDURxa0
         mZ5A==
X-Gm-Message-State: APjAAAWadgk1gS3+qg177cxjmyai4lXba9L1Y+ER5UGbkiKb+TTHDTg2
        d+Cy+LwWKxVe7Tcn+4PxG443nPPb
X-Google-Smtp-Source: APXvYqwMulwQmSKyJYZ5XStrF/EheQfqT2YR1ENZMg7+TqRcL/vGToHCYNsXooYGBikFTAvDL3sR0g==
X-Received: by 2002:a17:90a:bc06:: with SMTP id w6mr5002407pjr.130.1567005743009;
        Wed, 28 Aug 2019 08:22:23 -0700 (PDT)
Received: from [10.69.69.102] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id g1sm3330822pgg.27.2019.08.28.08.22.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 08:22:22 -0700 (PDT)
Subject: Re: [linux-next][BUG][driver/scsi/lpfc][10541f] Kernel panics when
 booting next kernel on my Power 9 box
To:     Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc:     linux-next <linux-next@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        sachinp <sachinp@linux.vnet.ibm.com>,
        manvanth <manvanth@linux.vnet.ibm.com>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        dick.kennedy@broadcom.com,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        dougmill <dougmill@linux.vnet.ibm.com>,
        Brian King <brking@linux.vnet.ibm.com>
References: <1566968536.23670.9.camel@abdul>
From:   James Smart <jsmart2021@gmail.com>
Message-ID: <601365f6-c753-96f6-5d61-481f54d95440@gmail.com>
Date:   Wed, 28 Aug 2019 08:22:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566968536.23670.9.camel@abdul>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/27/2019 10:02 PM, Abdul Haleem wrote:
> Greetings,
> 
> linux-next kernel 5.3.0-rc1 failed to boot with kernel Oops on Power 9
> box
> 
> I see a recent changes to lpfc code was from commit
> 10541f03 scsi: lpfc: Update lpfc version to 12.4.0.0
> 
> Recent boot logs:
> 
> [..snip..]

see  https://www.spinics.net/lists/linux-scsi/msg133343.html

It hasn't been tested yet, but appears to be the issue.

-- james
