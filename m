Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D613E3287
	for <lists+linux-next@lfdr.de>; Sat,  7 Aug 2021 03:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbhHGBNK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Aug 2021 21:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbhHGBNK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Aug 2021 21:13:10 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF4DC0613CF;
        Fri,  6 Aug 2021 18:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=txGQ5Wn2PkicGaZivAf2nmECESRY9SKFpccnqdXlr2o=; b=HZC4uE9OLrojsS+zH+jx1MK3Ia
        VSZcKKqQCdXLGIhxqcyaBGZaYA5gSlYo12aHIBxvbKVbRYuKXCrb5/tkxLyq+WebYzA8Dj5bp6CWE
        G8GbxY2sQIoBfmRR604FdrozYtroJGvZn0Ad00ToYaH1beBZ9Ey/t2ketVIFVb6djHyO+qUw6rZHU
        k8djL/WaInvpoP7EqcGRbX2T7VaG/ZXfDBWuPvi99Fk0wNygt+UHrzjpUWY+kPoTA10yPHRaq6xmi
        KEZtmResjUEVg4boagNAdzYqeLMIl7D4taYR9SG8CwWI+IPErtAetLYOM87PEvjcDZh/1c2uDDOLJ
        2wsLMtfg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mCAt9-008l7I-5r; Sat, 07 Aug 2021 01:12:38 +0000
Subject: Re: linux-next: Tree for Aug 6
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Brown <broonie@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210806165351.10621-1-broonie@kernel.org>
 <20210807110250.365b18a8@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <12e0e763-f4ef-86f1-a570-27369f9a7706@infradead.org>
Date:   Fri, 6 Aug 2021 18:12:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210807110250.365b18a8@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/6/21 6:02 PM, Stephen Rothwell wrote:
> Hi Mark,
> 
> On Fri,  6 Aug 2021 17:53:51 +0100 Mark Brown <broonie@kernel.org> wrote:
>>
>> Stephen should be back on Monday and normal service resumed.
> 
> Yep, hopefully :-)
> 
> I just want to thank you publicly for taking linux-next on again.  It
> is very much appreciated.
> 

Ditto. Thanks.

-- 
~Randy

