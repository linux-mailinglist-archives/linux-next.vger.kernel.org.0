Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08FAF33E1E4
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 00:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbhCPXJ1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 19:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbhCPXJW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Mar 2021 19:09:22 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59E46C06174A
        for <linux-next@vger.kernel.org>; Tue, 16 Mar 2021 16:09:22 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 938652C4;
        Tue, 16 Mar 2021 23:09:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 938652C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1615936161; bh=YhhOvum9iXY4lewyjauMY6yZc3qc/NHGkDJk3gXdbxw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=rqsqV7eyUX6AKMkFfS+B0R9nN9DVCgJA1A65kCv2G9o5CT8bWYldVmV667Koshj2G
         kNhxhBDHnWjfbI381HXEHnunlVwtU2WVYXRB0GzvkNEci4jtVfZ7idKqw/BSsyeZwd
         4zftGOi0kYmM9Lsi/e4ws86WftxHc49lQfKoSNRyDKR8uzAac1J/jbU2Xv2Llc2ApR
         EiDd0V487/nAtVtISrvI9TZslHdq4F8kdN15Vh+d6aJVA/F8PVdewM2e7pZiCxEvyW
         7pBkHGbeQh0rSzgZXxMTVCXaI6GgrldRF8o9vzbjajQlAg0dFQzrodB7GQeR0zpqoQ
         x+Qk5s27e5CxQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Minchan Kim <minchan@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
In-Reply-To: <20210317084924.2ba4c3ea@canb.auug.org.au>
References: <20210315163522.589bc67a@canb.auug.org.au>
 <YFD2Y++LQHmWMx68@google.com> <20210317084924.2ba4c3ea@canb.auug.org.au>
Date:   Tue, 16 Mar 2021 17:09:20 -0600
Message-ID: <875z1qy9un.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

[Adding Mauro]

> On Tue, 16 Mar 2021 11:18:11 -0700 Minchan Kim <minchan@kernel.org> wrote:
>>
>> On Mon, Mar 15, 2021 at 04:35:22PM +1100, Stephen Rothwell wrote:
>> > Hi all,
>> > 
>> > After merging the akpm-current tree, today's linux-next build (htmldocs)
>> > produced this warning:
>> > 
>> > Documentation/ABI/testing/sysfs-kernel-mm-cma:2: WARNING: Inline interpreted text or phrase reference start-string without end-string.
>> > 
>> > Introduced by commit
>> > 
>> >   439d477342a3 ("mm: cma: support sysfs")
>> >   
>> 
>> Hmm, I don't get it what happened here. Was it false-positive?
>
> I get the above from a "make htmldocs" run ... I don't know what causes
> it, sorry.  [cc'ing Jon]

OK, this took a while to figure out.  The problem is this text in
sysfs-kernel-mm-cma:

> 		Each CMA heap subdirectory (that is, each
> 		/sys/kernel/mm/cma/<cma-heap-name> directory) contains the
> 		following items:

When scripts/get_abi.pl sees the /sys/kernel/mm/... string it wants to
turn it into a link to the matching ABI entry; at that point, the
<text in angle brackets> collides with the Sphinx directive and you get
that totally useless warning.

I think this is a bug in get_abi.pl.  Honestly I wonder if all these
cross-links are needed at all; if they truly are, then we shouldn't be
making bogus ones.  Mauro, how hard would it be to make this do the
right thing?

Thanks,

jon
