Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA0A3256EC8
	for <lists+linux-next@lfdr.de>; Sun, 30 Aug 2020 16:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbgH3OyY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 30 Aug 2020 10:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbgH3OyX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 30 Aug 2020 10:54:23 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D95C061573;
        Sun, 30 Aug 2020 07:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=9PPKfXe7kpGFMgrqa1M7KwlEZAb+8W2f+PfTg/rKw7I=; b=G1mmmW/EIxwt023nrxILPhAH/s
        Xo8ENT3bIsLT+HOa7g93ZU7ub5qI1LCn/zR7OlGzg+Q/wy4KC+nU8TEkTFpskuKr3dKu1ALhHczs1
        kb5/3hCDOTMafg2v/6Ll/BSDx2Z+vboeLb8mys/3po4soBaBy4hCLn9+WIDdxufdCJloKeGYIhLnm
        WZHf3+XqaSMyckU0aaJerEGf0mQeqiRcaz1roFy0EyqWfu3zLtds7q0z5ywZQmoIcbF/Z+BEYlRL3
        nEY5SO9MqM1hrnNBOkVFWFt3eSQTFUQQ+QkObnhNYwW8PtsbvieNHR2z7pPY/VTozCkHPg9rIgegG
        OxKyiEFQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kCOip-0003tk-QL; Sun, 30 Aug 2020 14:54:20 +0000
Subject: Re: [PATCH] Documentation: submit-checklist: add Documentation clean
 builds
To:     Mike Rapoport <rppt@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
References: <e38b108c-afec-fd0e-ad09-b4dd5da59fd1@infradead.org>
 <20200830114153.GC423750@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <203a91be-4ee4-5466-acd7-531e24792422@infradead.org>
Date:   Sun, 30 Aug 2020 07:54:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200830114153.GC423750@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/30/20 4:41 AM, Mike Rapoport wrote:
> On Sun, Aug 23, 2020 at 05:38:12PM -0700, Randy Dunlap wrote:
>> From: Randy Dunlap <rdunlap@infradead.org>
>>
>> Add to Documentation/process/submit-checklist.rst that patch
>> submitters should run "make htmldocs" and verify that any
>> Documentation/ changes (patches) are clean (no new warnings/errors).
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>>  Documentation/process/submit-checklist.rst |    4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> --- linux-next-20200821.orig/Documentation/process/submit-checklist.rst
>> +++ linux-next-20200821/Documentation/process/submit-checklist.rst
>> @@ -24,6 +24,10 @@ and elsewhere regarding submitting Linux
>>  
>>    c) Builds successfully when using ``O=builddir``
>>  
>> +  d) Any Documentation/ changes build successfully without warnings/errors.
> 
> Maybe "... without new warnings/errors"?
> Unfortunately we still have plenty of old ones...

Yes, I'll change that.
Thanks.

>> +     Use ``make htmldocs`` or ``make pdfdocs`` to check the build and
>> +     fix any issues.
>> +
>>  3) Builds on multiple CPU architectures by using local cross-compile tools
>>     or some other build farm.
>>  
>>

-- 
~Randy

