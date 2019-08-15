Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6571B8E340
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2019 05:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727659AbfHODmV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Aug 2019 23:42:21 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34345 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727217AbfHODmV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Aug 2019 23:42:21 -0400
Received: by mail-pl1-f193.google.com with SMTP id i2so588814plt.1;
        Wed, 14 Aug 2019 20:42:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JANJxBWQQ/lmx3e6gQBBNY3HZrSKplwd+VTRdmaTTlA=;
        b=m8pmtReVir4X9hTmwI/DVm70xLq/sckFKZ0fxqepBQyDnehARfhvK3FzAhvKWKTR3M
         MiWzaYrEunYOfWRD2nLbGfOk5R54jXdfUdd0uPbb80XK+kLgMtH694whbUBtWqtnK+JL
         yzJCaUKHpRNkBlAlwGPZy5zDpHaatVsZHRfcBDl2IzuoC/qFj80ARE4n/VKkBZ/p/CTx
         9uNnJjME1Gy8hmI6iBjkYFSZO0Rr+NAwnurbTb2uctc3k5NbUHYKJr5PZ5C0bXdWG15z
         HgMc96l56wn5cTFPSznZMKiFq7k7VD/lbsLfr1dl81RhgsHeV+NxFXCuwbX7uASNPwYE
         y4dg==
X-Gm-Message-State: APjAAAXBR/ew7ZjQCV1DBtQBBcprSWh7+82tZFaw1ZsZ/0bKjL7B/l+z
        2jXnxD0jr4fwcgLUcdMwCcXQHJxqN0A=
X-Google-Smtp-Source: APXvYqx81wrPhXH/lYFj4J2/x/boo2UlT8ODFpdBydweGYIHtn18VNQq90jQEYeDTlyS2mxJb39Ung==
X-Received: by 2002:a17:902:8302:: with SMTP id bd2mr2539863plb.9.1565840539761;
        Wed, 14 Aug 2019 20:42:19 -0700 (PDT)
Received: from asus.site ([2601:647:4000:7f38:138a:21ca:d24:734b])
        by smtp.gmail.com with ESMTPSA id y188sm1376690pfy.57.2019.08.14.20.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2019 20:42:18 -0700 (PDT)
Subject: Re: [5.3.0-rc4-next][bisected 882632][qla2xxx] WARNING: CPU: 10 PID:
 425 at drivers/scsi/qla2xxx/qla_isr.c:2784 qla2x00_status_entry.isra
To:     Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-next <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        martin.petersen@oracle.com, hmadhani@marvell.com,
        sachinp <sachinp@linux.vnet.ibm.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <1565801523.6908.6.camel@abdul>
 <cafb1d40-a11e-c137-db06-4564e5f5caf5@acm.org>
 <1565803123.6908.10.camel@abdul>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <7fc59d4c-b3d5-5ec8-cb7c-51cb863f2a77@acm.org>
Date:   Wed, 14 Aug 2019 20:42:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565803123.6908.10.camel@abdul>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/14/19 10:18 AM, Abdul Haleem wrote:
> On Wed, 2019-08-14 at 10:05 -0700, Bart Van Assche wrote:
>> On 8/14/19 9:52 AM, Abdul Haleem wrote:
>>> Greeting's
>>>
>>> Today's linux-next kernel (5.3.0-rc4-next-20190813)  booted with warning on my powerpc power 8 lpar
>>>
>>> The WARN_ON_ONCE() was introduced by commit 88263208 (scsi: qla2xxx: Complain if sp->done() is not...)
>>>
>>> boot logs:
>>>
>>> WARNING: CPU: 10 PID: 425 at drivers/scsi/qla2xxx/qla_isr.c:2784
>>
>> Hi Abdul,
>>
>> Thank you for having reported this. Is that the only warning reported on your setup by the qla2xxx
>> driver? If that warning is commented out, does the qla2xxx driver work as expected?
> 
> boot warning did not show up when the commit is reverted.
> 
> should I comment out only the WARN_ON_ONCE() which is causing the issue,
> and not the other one ?

Yes please. Commit 88263208 introduced five kernel warnings but I think 
only one of these should be removed again, e.g. as follows:

diff --git a/drivers/scsi/qla2xxx/qla_isr.c b/drivers/scsi/qla2xxx/qla_isr.c
index cd39ac18c5fd..d81b5ecce24b 100644
--- a/drivers/scsi/qla2xxx/qla_isr.c
+++ b/drivers/scsi/qla2xxx/qla_isr.c
@@ -2780,8 +2780,6 @@ qla2x00_status_entry(scsi_qla_host_t *vha, struct 
rsp_que *rsp, void *pkt)

  	if (rsp->status_srb == NULL)
  		sp->done(sp, res);
-	else
-		WARN_ON_ONCE(true);
  }

  /**
