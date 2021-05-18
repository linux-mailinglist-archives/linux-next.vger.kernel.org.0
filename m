Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04073877C6
	for <lists+linux-next@lfdr.de>; Tue, 18 May 2021 13:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241051AbhERLf2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 May 2021 07:35:28 -0400
Received: from mx2.suse.de ([195.135.220.15]:60304 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240092AbhERLf2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 May 2021 07:35:28 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 8D915ABC2;
        Tue, 18 May 2021 11:34:09 +0000 (UTC)
Subject: Re: [PATCH v3] mm, slub: change run-time assertion in kmalloc_index()
 to compile-time
To:     Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc:     Nathan Chancellor <nathan@kernel.org>, akpm@linux-foundation.org,
        iamjoonsoo.kim@lge.com, rientjes@google.com, penberg@kernel.org,
        cl@linux.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        naresh.kamboju@linaro.org, clang-built-linux@googlegroups.com,
        linux-next@vger.kernel.org, ndesaulniers@google.com,
        lkft-triage@lists.linaro.org, sfr@canb.auug.org.au, arnd@arndb.de,
        Marco Elver <elver@google.com>
References: <20210511173448.GA54466@hyeyoo> <20210515210950.GA52841@hyeyoo>
 <41c65455-a35b-3ad3-54f9-49ca7105bfa9@suse.cz>
 <YKC9CeAfw3aBmHTU@archlinux-ax161> <20210518003859.GC80297@hyeyoo>
 <a1287a21-bcbb-77ed-c88d-f5890b785213@kernel.org>
 <71416382-2e4c-5e03-df9c-265fda41c2de@suse.cz>
 <20210518111814.GA114501@hyeyoo>
From:   Vlastimil Babka <vbabka@suse.cz>
Message-ID: <aa74a894-8b39-b1c9-cfe8-2fcf879b7624@suse.cz>
Date:   Tue, 18 May 2021 13:34:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518111814.GA114501@hyeyoo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/18/21 1:18 PM, Hyeonggon Yoo wrote:
> On Tue, May 18, 2021 at 11:28:17AM +0200, Vlastimil Babka wrote:
>> On 5/18/21 2:43 AM, Nathan Chancellor wrote:
>> > On 5/17/2021 5:38 PM, Hyeonggon Yoo wrote:
>> >> On Sat, May 15, 2021 at 11:34:49PM -0700, Nathan Chancellor wrote:
>> >>> This should work I think:
>> >>
>> >> compiled well with clang-10.0.1, clang-11.0.0,
>> >> and gcc-10.2.0 with x86_64 default config.
>> >>
>> >> is the condition CONFIG_CLANG_VERSION > 110000,
>> >> not including 110000 it self?
>> 
>> Good spot.
> 
> Thanks!
> 
>> > Ah sorry, that should definitely be >= :(
>> > 
>> > That is what I get for writing an email that late... in reality, it probably
>> > won't matter due to the availability of 11.0.1 and 11.1.0 but it should
>> > absolutely be changed.
>> > 
>> > I have not given Nick's patch a go yet but would something like this be
>> > acceptable?
>> 
>> Yes.
> 
> You mean Nick's patch to added with Nathan's code?

No, I thought Nathan was asking about his own proposal. I don't think Nick's
patch that adds 26 index solves the issue. Nathan's proposal fixed with '>=' is OK.

> I'm not sure we need this, but will add it if you can accept it.
> 
> I'll send fixup patch soon. tell me if I can improve
> anything on it.
> 
> Thanks,
> Hyeonggon
> 

