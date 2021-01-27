Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE6F530619E
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 18:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhA0RNq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 12:13:46 -0500
Received: from mail-1.ca.inter.net ([208.85.220.69]:47850 "EHLO
        mail-1.ca.inter.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235456AbhA0RL0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Jan 2021 12:11:26 -0500
Received: from localhost (offload-3.ca.inter.net [208.85.220.70])
        by mail-1.ca.inter.net (Postfix) with ESMTP id 16AD32EA526;
        Wed, 27 Jan 2021 12:10:40 -0500 (EST)
Received: from mail-1.ca.inter.net ([208.85.220.69])
        by localhost (offload-3.ca.inter.net [208.85.220.70]) (amavisd-new, port 10024)
        with ESMTP id BL49C9vmT2qc; Wed, 27 Jan 2021 11:56:28 -0500 (EST)
Received: from [192.168.48.23] (host-104-157-204-209.dyn.295.ca [104.157.204.209])
        (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dgilbert@interlog.com)
        by mail-1.ca.inter.net (Postfix) with ESMTPSA id 63FDD2EA1B5;
        Wed, 27 Jan 2021 12:10:39 -0500 (EST)
Reply-To: dgilbert@interlog.com
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
References: <20210125151310.20e71400@canb.auug.org.au>
 <17ccd90b-8616-1f20-ad5d-e250834c02fe@interlog.com>
 <20210127180145.5b955898@canb.auug.org.au>
From:   Douglas Gilbert <dgilbert@interlog.com>
Message-ID: <551e1ed2-74f6-315d-1000-fe03aa601bec@interlog.com>
Date:   Wed, 27 Jan 2021 12:10:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210127180145.5b955898@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2021-01-27 2:01 a.m., Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 25 Jan 2021 00:53:59 -0500 Douglas Gilbert <dgilbert@interlog.com> wrote:
>>
>> On 2021-01-24 11:13 p.m., Stephen Rothwell wrote:
>>>
>>> After merging the scsi-mkp tree, today's linux-next build (powerpc
>>> ppc64_defconfig) failed like this:
>>>
>>> drivers/scsi/sg.c: In function 'sg_find_srp_by_id':
>>> drivers/scsi/sg.c:2908:4: error: expected '}' before 'else'
>>>    2908 |    else
>>>         |    ^~~~
>>> drivers/scsi/sg.c:2902:16: warning: unused variable 'cptp' [-Wunused-variable]
>>>    2902 |    const char *cptp = "pack_id=";
>>>         |                ^~~~
>>> drivers/scsi/sg.c:2896:5: error: label 'good' used but not defined
>>>    2896 |     goto good;
>>>         |     ^~~~
>>> drivers/scsi/sg.c: At top level:
>>> drivers/scsi/sg.c:2913:2: error: expected identifier or '(' before 'return'
>>>    2913 |  return NULL;
>>>         |  ^~~~~~
>>> drivers/scsi/sg.c:2914:5: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
>>>    2914 | good:
>>>         |     ^
>>> drivers/scsi/sg.c:2917:2: error: expected identifier or '(' before 'return'
>>>    2917 |  return srp;
>>>         |  ^~~~~~
>>> drivers/scsi/sg.c:2918:1: error: expected identifier or '(' before '}' token
>>>    2918 | }
>>>         | ^
>>> drivers/scsi/sg.c: In function 'sg_find_srp_by_id':
>>> drivers/scsi/sg.c:2912:2: error: control reaches end of non-void function [-Werror=return-type]
>>>    2912 |  }
>>>         |  ^
>>>
>>> Caused by commit
>>>
>>>     7323ad3618b6 ("scsi: sg: Replace rq array with xarray")
>>>
>>> SG_LOG() degenerates to "{}" in some configs ...
>>>
>>> I have used the scsi-mkp tree from next-20210122 for today.
>>
>> I sent a new patchset to the linux-scsi list about 4 hours ago to
>> fix that.
>>
>> Doug Gilbert
> 
> I am still getting this build failure.

Hi,
I resent the original patch set, with fixes, against the linux-scsi
list yesterday but that was not the form that Martin Petersen needs
it in. That was against his 5.12/scsi-queue branch which is roughly
lk 5.11.0-rc2. He has referred me to his 5.12/scsi-staging branch
which looks half applied from the 45 patch set that I have been
sending to the linux-scsi list. Trying to find out if that was the
intention or a mistake.

The other issue is a large patchset that removes the first function
argument from blk_execute_rq_nowait() which is used by the sg driver.

Doug Gilbert


