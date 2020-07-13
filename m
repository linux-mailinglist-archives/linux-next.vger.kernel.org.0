Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B67B21CD44
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 04:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728523AbgGMCde (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jul 2020 22:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbgGMCdd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Jul 2020 22:33:33 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A18E0C061794;
        Sun, 12 Jul 2020 19:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=EHPXCEzSJa6SaNgEICLzZ8YoTYGpgUhz5fRJo8BU8FY=; b=JWFAE3JkENCQ/mkHE3dFyQex4X
        Uz7ixIp9oFumfx9yWFEeWF2QHzpXzGypS2cQcfNB1bdGHJ58BNrXrbHP0tb7kytfELZ+KEsv4g5yk
        gVlYJQckKP6Pl6g2X47KMo6FJ4nZ2FQjjttoBB3ASLAXPIhfQf/e9PKKtl03SZMyzZXy4W7HBukaO
        tddBVSxnyuUhO4saqfZ/JZ3btVd3fgmgHWTleJUcakObfEx/AF7Mu/orXFxu/NI65d+t9ojdmrQJi
        N1DSmjCqyMZ3HN+DBRJCCQ+VVKYjyvl29HO6KCLS+9ukamnKfD9WWLU2qjYSVIy6ugeEfDl00U9g+
        fFALzsDg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1juoHY-0005lL-J3; Mon, 13 Jul 2020 02:33:31 +0000
Subject: Re: linux-next: Tree for Jul 10
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200710183318.7b808092@canb.auug.org.au>
 <20200712155604.GA342822@smile.fi.intel.com>
 <20200713080152.63ee1246@canb.auug.org.au>
 <e519f1c2-9761-4866-4878-09cc3da23d1f@infradead.org>
 <CAHk-=wib+gfHwo0zADm-rMXuBaHMdosudtBXeUk0qfQEna9Hjw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f5a764f8-74d9-c11f-c1d7-2b22fc42f6c6@infradead.org>
Date:   Sun, 12 Jul 2020 19:33:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wib+gfHwo0zADm-rMXuBaHMdosudtBXeUk0qfQEna9Hjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/12/20 7:27 PM, Linus Torvalds wrote:
> On Sun, Jul 12, 2020 at 7:20 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>>
>>> Not that I am aware of at the moment.  Does next-20200709 work?  Does
>>> Linus' tree work?  The only obvious thing I can think of is commit
>>
>> I'm hitting this same thing on 5.8-rc5. (x86_64)
>>
>>> 6ec4476ac825 ("Raise gcc version requirement to 4.9")
>>>
>>> The commmit message says:
>>>
>>>     Using _Generic also means that you will need to have a very recent
>>>     version of 'sparse', but thats easy to build yourself, and much less of
>>>     a hassle than some old gcc version can be.
> 
> Yes, you need a very recent version of sparse.
> 
> I was oging to hold off that sparse upgrade requirement for 5.9, but
> we had independent reasons to just say "gcc 4.9", and at that point
> the code that allowed old versions of sparse to work was entirely dead
> outside of sparse.
> 
> Sparse is really easy to build and install as a regular user. Just do
> 
>     mkdir -p ~/src ; cd ~/src
>     git clone git://git.kernel.org/pub/scm/devel/sparse/sparse.git
>     cd sparse
>     make && make install
> 
> and it will install the sparse binaries in your ~/bin directory. No
> need to be root, it just works.

Thanks for replying.

I've already got it built & working.

-- 
~Randy
