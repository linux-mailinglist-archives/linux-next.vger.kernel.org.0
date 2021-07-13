Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1B13C77CC
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 22:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234933AbhGMUXg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jul 2021 16:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbhGMUXg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jul 2021 16:23:36 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE671C0613DD;
        Tue, 13 Jul 2021 13:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=dhbQxyrFl3CfKp7xzNNUas2IGsDrcFUOGAeAIrSwHtI=; b=rbJ6V1nOj2nMu6v64xZVW9Z2qu
        VnxdjwdiLFEzHpM6p97e6HQWi6xv2ztm1oIhQXTmtDLHXil9F6VHS/9fmHjvJ8ysiwumNnG0loP1a
        zP0QoxVhb8EV2qcMXkG3ajuNF7MpNQrgLu1YUPi5zLmb9hFb4zru36fJ+1FOjFGBrQNYWVaEMrbdZ
        1ZtTFePSNwM9u5tQ95H02r13Z0hMs1ttZ+yj5mH7cKj9OC4rXi5F74wu6K4jQao38gYCRalJF4nQ3
        FEAG+HX+0Sjjsx+di5eg7k4a+UCmrhJOXiWzC/M5EkrVMlzP5YjmYJsrxtsoRqD7kuKb2+fzhlUh2
        Zl7Uu4KA==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m3OtY-00BIag-Eh; Tue, 13 Jul 2021 20:20:44 +0000
Subject: Re: linux-next: Tree for Jul 12 (no Rust)
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
References: <20210712120828.5c480cdc@canb.auug.org.au>
 <c47a7f0b-4b5a-30c3-ee1e-2973793a9534@infradead.org>
 <20210713111029.77bfb9bb@elm.ozlabs.ibm.com>
 <56341950-abd6-8a9c-42ca-7eb91c55cc90@infradead.org>
 <8ed74a96-7309-3370-4b8b-376bface7cc6@infradead.org>
 <47f394e5-c319-3b79-92ad-d33b0d96993e@infradead.org>
 <CANiq72mDL+CA9CnhDG5Sij4ufVzGHrWvZ9eaWSSXQMDYbpL-6w@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c8349e27-4941-e639-9a26-b665b2fa6a68@infradead.org>
Date:   Tue, 13 Jul 2021 13:20:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CANiq72mDL+CA9CnhDG5Sij4ufVzGHrWvZ9eaWSSXQMDYbpL-6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/13/21 10:36 AM, Miguel Ojeda wrote:
> Hi Randy,
> 
> On Tue, Jul 13, 2021 at 5:31 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> OK, I found some 'patch' failures in my download logs, so something
>> in my scripts didn't do its job.
>>
>> Thanks for bringing it up!
> 
> Thanks for looking -- if I can help with something on my side on the
> Rust tree, please let me know.
> 
> Also, if you found what went wrong (e.g. the end result after `patch`
> failed applying something), it would be nice to know, in case this
> comes up again.

Hi Miguel,

It was either a script bug (but I haven't seen this one before)
or a user error (more likely).
My daily linux-next builds are started by a cron job but the don't
always start when they should (IMO), so I may have started it
manually... but then the error that I saw would have only happened
if 2 linux-next builds were started at almost the same time (one
by cron, one manually by me) - I don't know if that happened or not.

Today's linux-next builds didn't have any similar problem and I doubt
that I can reconstruct what happened exactly.

Thanks.

