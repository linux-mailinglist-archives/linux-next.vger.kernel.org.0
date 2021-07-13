Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076993C68E8
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 05:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhGMDei (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Jul 2021 23:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhGMDei (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Jul 2021 23:34:38 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 036E7C0613DD;
        Mon, 12 Jul 2021 20:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=N9iPnfeFi3bu3+N51yDyZ0F7PsjrvY2hj036hiPLuuE=; b=vRMIz/FHPFGTLcXpZet0WWw85o
        Qy7a6dQ3sNqYBIKbQxyUtxsVWqcEVuu4lcPshc0n0OIJ/pAsPk9W2ao7zYxH52ZVqJ6BOzrvenzkI
        sAz3LB9fortPR3ZwBlB/gAAVJqvzzO+EvSEj1cEaR0e0RHT+7DQn4psuewHGhtLMyGnQ5x+PBqVQV
        aRyF9JnyWePWudJG48rOAPaQZJv4pr6TuzpqNd+y2CLluTHT/NlPPaGzkthJ5LIOUYH6l/UGyRksH
        lRffszMrBboEfyDnF6woO/QShMJyHOd9OicfE/YFO3nEF+apAL0IfvLg3tKbTsL5dkDxHYVsh773R
        G/VuDK/Q==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m3999-0091TQ-Bt; Tue, 13 Jul 2021 03:31:47 +0000
Subject: Re: linux-next: Tree for Jul 12 (no Rust)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@rothwell.id.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
References: <20210712120828.5c480cdc@canb.auug.org.au>
 <c47a7f0b-4b5a-30c3-ee1e-2973793a9534@infradead.org>
 <20210713111029.77bfb9bb@elm.ozlabs.ibm.com>
 <56341950-abd6-8a9c-42ca-7eb91c55cc90@infradead.org>
 <8ed74a96-7309-3370-4b8b-376bface7cc6@infradead.org>
Message-ID: <47f394e5-c319-3b79-92ad-d33b0d96993e@infradead.org>
Date:   Mon, 12 Jul 2021 20:31:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8ed74a96-7309-3370-4b8b-376bface7cc6@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/12/21 8:03 PM, Randy Dunlap wrote:
> On 7/12/21 6:43 PM, Randy Dunlap wrote:
>> On 7/12/21 6:10 PM, Stephen Rothwell wrote:
>>> Hi Randy,
>>>
>>> On Mon, 12 Jul 2021 08:24:16 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>
>>>> I am getting no builds completing. I see this:
>>>>
>>>> Error: No compiler specified.
>>>> Usage:
>>>> 	../scripts/rust-version.sh <rust-command>
>>>> init/Kconfig:71: syntax error
>>>> init/Kconfig:70: invalid statement
>>>>
>>>> and then 'bc' running continuously until I kill it.
>>>
>>> OK, this is weird.  init/Kconfig has not changed from Friday and I
>>> don't see these errors at all in my builds.  I also have no rust
>>> compiler installed.  And the kernel ci bot seems happy (well nothing
>>> like this anyway).
>>>
>>
>> Hm, OK, I'll check for patch/merge problems (since I am using
>> tarballs and patches).
> 
> I'm still checking. I see a bunch of build errors in 2021-07-12 but
> they could just be source tree problems -- I don't have much confidence
> in them.  I'll hope for better results tomorrow (07-13) but see if I
> can determine what is going on here.
> 
> thanks.
> 

OK, I found some 'patch' failures in my download logs, so something
in my scripts didn't do its job.

Thanks for bringing it up!

-- 
~Randy

