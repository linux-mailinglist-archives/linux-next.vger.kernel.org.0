Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C11916ED5A
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2020 18:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731098AbgBYR72 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Feb 2020 12:59:28 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:39164 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730829AbgBYR72 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Feb 2020 12:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=/kPd72L2NTbA3prrCkJX+T5HQUkpWtEmXQRVd+BkfJ0=; b=AcufC8xSi1fboQhsUYGFToSFOR
        78qYe41745VJ22m4tMZ1rEHdv7ghQ8RZZ9FQFWO9KN3O87ToWyXBaJiMxGBRT4qLo/Vaa1S3TTY5K
        Bg+chVynEZjdk3F6MhkRnBWxvWwvDDQzqLOZbbh3FTOz57vEOtDO9CWTmEAbrru8adqN8M1bq4n7N
        7tkGFSV2aAdu+P9HEb3HiZAlmUsfr85SfCGusyQA7994aaRrs/EqkNdTotVK8Yd3bug0hV1MjssMg
        CnqwnjynmSwuZYTeSKl9+9tMgrIRCYfz7gubrrGTuH5kfyRPM6ca/aaBUbY8OAeE+ZFS/iM4+/urK
        ntXvLOEw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j6eUQ-00043g-VW; Tue, 25 Feb 2020 17:59:27 +0000
Subject: Re: [PATCH] bootconfig: Fix CONFIG_BOOTTIME_TRACING dependency issue
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200225220551.d9a409bc04b77cdf48eae3ea@kernel.org>
 <158264140162.23842.11237423518607465535.stgit@devnote2>
 <c9604764-bd0f-67e9-56c8-fb6ffaf9b430@infradead.org>
 <20200225125335.5bbc3ed4@gandalf.local.home>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <aa78add3-a6d9-e316-cfba-3432e347bec4@infradead.org>
Date:   Tue, 25 Feb 2020 09:59:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225125335.5bbc3ed4@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/25/20 9:53 AM, Steven Rostedt wrote:
> On Tue, 25 Feb 2020 09:49:25 -0800
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>>> Fixes: d8a953ddde5e ("bootconfig: Set CONFIG_BOOT_CONFIG=n by default")
>>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>>> Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>  
>>
>> Hi,
>> I'm no fan of "select", but this does fix the kconfig warnings and
>> build errors that I have reported.  Thanks.
> 
> I'm not big on select either, but this is fine (I'm running it through my
> tests now).
> 
>>
>> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> 
> Is it OK if I change this to "Tested-by:"?

Yes, as long as someone doesn't read (interpret) that as runtime-tested-by. :)

-- 
~Randy

