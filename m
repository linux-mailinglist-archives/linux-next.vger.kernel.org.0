Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076741E236C
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 15:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbgEZNxh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 09:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728283AbgEZNxh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 09:53:37 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FC7C03E96E
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 06:53:37 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id a13so8719969pls.8
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 06:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uMNgaG6xJWfxbhj/av+CAUmXsi69iufIz9696TQYiKc=;
        b=uWQHN09LppWoFpxMndAZIfR7haL72VD3ldLDHtqItNHm8e3D2dphntouLS+B4WonTK
         MiABkJicdNbsTfvcIuG+/m1tqjP8dJnp3Q46OCsHLzKD7xYKg/i76wDy045kdcnMaeDf
         YnVgCeRMf6ML38RhjEyeJK/4/sHk1WfPeJTVHZuPDr8XAB4Jloab/aee1KKgTcVxemnV
         GI3pPVNS1U4Uqd+ApGQoq5U1towXyetLmNY2OPBHIIzzl6HomNiNUI+G3ilSFUHVxtzM
         1IvbCeYmLPjOemFVFSuVAe4z3aqTMGjR5zyYghh9jnp2Fr9ob7kK63VKy354ugUPepI0
         zK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uMNgaG6xJWfxbhj/av+CAUmXsi69iufIz9696TQYiKc=;
        b=WW/R+zpmn+G4Iag+KG5dy+h4TQYr5aj+Of2bJu0g78IZEekYyDheXNwJCQguoaKN4G
         kKigEAYe1MkDixqMYo0vCIsQQfvF7Dk8CwdjukKjFHFSanyzQfUXBQchWbtXA85eQNEH
         h+fRgj+lqE7f8mVwm2h6lPbk/N4H5C1rwQ0cGNuH1B6lB8iACIpeMAALgH+Fpi7J+Oz8
         xqiuXqw1D2MgWvzPr9irSIxK1z3xXFIv0w38zuS1InUKt0rV+SRazCy2OLGZfiut/jVd
         ca5+9qtZ6IR1X7bQ76kvJz1KnJxa6JRaB/jwWbKb4udlYFLnNtZP8Jhc1mMqcJdtx+Ym
         h13Q==
X-Gm-Message-State: AOAM531HEN9hKTDC11gxShZereoOHnJhvhWlhgSXDfnpSsPk6rMBgNr0
        V2gNvMvfeOD0dypAKOy2gj0+9TDK4Wd0/w==
X-Google-Smtp-Source: ABdhPJxh34GNEboejhY3krw53dAsQQkEXHaHUfhIgeQl3e+VNf16EWSQ3J7RwvcUhsTlRNuNIeslWw==
X-Received: by 2002:a17:90a:ad08:: with SMTP id r8mr27366554pjq.154.1590501217028;
        Tue, 26 May 2020 06:53:37 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:a9e6:df54:e55e:4c47? ([2605:e000:100e:8c61:a9e6:df54:e55e:4c47])
        by smtp.gmail.com with ESMTPSA id b4sm12253334pfo.140.2020.05.26.06.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 06:53:36 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Sterba <dsterba@suse.cz>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Goldwyn Rodrigues <rgoldwyn@suse.com>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        Christoph Hellwig <hch@lst.de>
References: <20200525150837.54fe6977@canb.auug.org.au>
 <c0e6af76-46d8-ccf0-3874-0751f7622caf@kernel.dk>
 <20200526143630.7e7fbc79@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <b2418ce5-839d-43d4-e5ea-416be9f63b1a@kernel.dk>
Date:   Tue, 26 May 2020 07:53:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200526143630.7e7fbc79@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/25/20 10:36 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 25 May 2020 13:03:44 -0600 Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 5/24/20 11:08 PM, Stephen Rothwell wrote:
>>>
>>> After merging the block tree, today's linux-next build (arm
>>> multi_v7_defconfig) failed like this:
>>>
>>> mm/filemap.c: In function 'generic_file_buffered_read':
>>> mm/filemap.c:2075:9: error: 'written' undeclared (first use in this function); did you mean 'writeb'?
>>>  2075 |     if (written) {
>>>       |         ^~~~~~~
>>>       |         writeb
>>>
>>> Caused by commit
>>>
>>>   23d513106fd8 ("mm: support async buffered reads in generic_file_buffered_read()")
>>>
>>> from the block tree interacting with commit
>>>
>>>   6e66f10f2cac ("fs: export generic_file_buffered_read()")
>>>
>>> from the btrfs tree.
>>>
>>> [Aside: that btrfs tree commit talks about "correct the comments and variable
>>>     names", but changes "written" to "copied" in the function definition
>>>     but to "already_read" in the header file declaration ...]
>>>
>>> I ave applied the following merge fix patch:  
>>
>> Looks like a frivolous change... Thanks for fixing this up Stephen.
> 
> The variable name change has been removed from the btrfs tree.

Thanks - I'd encourage that name changing late in the merge window
instead. The change is obviously fine, but a) it should not be done in
an unrelated change, and b) it can be done without risking causing silly
merge issues.

-- 
Jens Axboe

