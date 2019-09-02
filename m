Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42C2AA576F
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 15:12:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730618AbfIBNL7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 09:11:59 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33443 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729768AbfIBNL7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Sep 2019 09:11:59 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so3930706pfl.0;
        Mon, 02 Sep 2019 06:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dKBlu/uJD1E27uZkZUHPL5g33kiGPBY8pyXH2GoFqbo=;
        b=g+TiADkqSxyb/cFMNoxRYD9JtVAeM20eO8vWnTPdjiTrAzflpVTr562UTnmhs6LdBZ
         9v3MuQD3iIpsSBISydHCOSAx4e1k5h4Y3fbH+6W/XjQe6Q9KIbSXIG1zeFGkE8/skka/
         3yAn+kBdD3qA9Gs8hcmql1Yx5jp7/b8Jc/OHNN+8NQsPOB3ZvH/thUoshvlBlNIqtO9t
         TeJmm3qrkAcituxpSsGyXwm+gqlUCg77JrFBukRh80qlVlWR7aKh6kUEgjOPp6q2rorQ
         oG8dAm0XlpG3hYi4SpDkG8Tuw8VRh64RwXcplmh8Yz59Y7wEUpOr1DOZcj2LGnXtJgWf
         14YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dKBlu/uJD1E27uZkZUHPL5g33kiGPBY8pyXH2GoFqbo=;
        b=YQGjRaML6cGIZ4kNkBLHPTe660fLsNofUt9KQyAcRUUsohtQ6CRYcbKD+wfmWL7Po5
         2+aVEovP56z509Oi6yhsj4GCTIn5vmLgK1K2Qi3otlw/25UiRHu/I/oFOUgs77dniLp+
         Mq7iE4BI1VjQeEChajeyueUpZelu8gK6z5moDRiKjsPboQ+UTiUNDsUMIa0zNZ4qK8Gc
         ZJlN0hAOb6pqmnv4eACHq61BsF5aoKE3a9zYymQ0EegJ7O4ywaU1ZiM/2quQtq5Uj/Yp
         YOhdQlff+8YaO+b2fnGlnI29Q+F0ZHRiThMDwkcPWn30FZsGtFpCn6xrbosmjxhqh14V
         kpNg==
X-Gm-Message-State: APjAAAVKoS6KqltFqGp+vR76N7daJ4kK5QBUIi1d3ierMnnDJiexMsEy
        T33S94zki6XHksuvGjOcdtDXZJOh
X-Google-Smtp-Source: APXvYqzrc7KbiqBdBBaqp5St91rHSUbyTY5rJ6vPrnD+ayy4FMR7weVumUG3nZNutBhZRgjgraJCpQ==
X-Received: by 2002:a63:c006:: with SMTP id h6mr24997331pgg.290.1567429918514;
        Mon, 02 Sep 2019 06:11:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f188sm9374682pfa.170.2019.09.02.06.11.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Sep 2019 06:11:57 -0700 (PDT)
Subject: Re: linux-next: Tree for Aug 30
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20190831003613.7540b2d7@canb.auug.org.au>
 <20190901182226.GA20315@roeck-us.net> <20190902075520.GB28967@lst.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <937bab44-f2fd-6b4c-48ee-7aedc142d9d8@roeck-us.net>
Date:   Mon, 2 Sep 2019 06:11:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902075520.GB28967@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/2/19 12:55 AM, Christoph Hellwig wrote:
> On Sun, Sep 01, 2019 at 11:22:26AM -0700, Guenter Roeck wrote:
>> On Sat, Aug 31, 2019 at 12:36:13AM +1000, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20190829:
>>>
>>> The compiler-attributes tree gained a build failure for which I reverted
>>> a commit.
>>>
>>> The arm-soc tree gained a conflict against the arm tree.
>>>
>>> The csky tree gained a conflict against the dma-mapping tree.
>>>
>>> The fuse tree gained a conflict against the fsverity tree.
>>>
>>> The vfs tree gained conflicts against the fuse tree.
>>>
>>> The pci tree gained a build failure for which I revereted a commit.
>>>
>>> The net-next tree still had its build failure for which I applied a patch.
>>> It also gained a conflict against the net tree.
>>>
>>> The regulator tree still has its build failure for which I reverted
>>> a commit.
>>>
>>> The keys tree still has its build failure so I used the version from
>>> next-20190828.
>>>
>>> The driver-core tree lost its build failure.
>>>
>>> The staging tree got conflicts against the net-next and usb trees.
>>>
>>> The akpm-current tree gained a build failure due to an interaction with
>>> the hmm tree for which I applied a patch.
>>>
>>
>> Something in the fixup patch seems to be wrong. I get the following
>> error with sh4 boot tests when booting from usb.
>>
>> sm501-usb sm501-usb: OHCI Unrecoverable Error, disabled
>> sm501-usb sm501-usb: HC died; cleaning up
>>
>> Unfortunately, bisect doesn't help much (see below). Reverting the fixup
>> patch as well as the offending patch (plus a context patch) alone does
>> not help either. Further analysis shows that the problem exists since
>> at least next-20190823. Another round of bisect on next-20190827 suggests
>> another culprit (see second bisect below). Reverting all the offending
>> patches doesn't help either, though, only result in a different error.
>>
>> usb 1-1: new full-speed USB device number 2 using sm501-usb
>> sm501-usb sm501-usb: DMA map on device without dma_mask
>>
>> With that, I am giving up. Copying Christoph as he appears to be heavily
>> involved in the patch series causing the problems.
> 
> What was the last tree you tested that works perfectly?
> 
next-20190822

Guenter

