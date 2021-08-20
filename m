Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9099E3F29EC
	for <lists+linux-next@lfdr.de>; Fri, 20 Aug 2021 12:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237943AbhHTKMZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Aug 2021 06:12:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42424 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237267AbhHTKMX (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 20 Aug 2021 06:12:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629454306;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PjEaCYCRogYG/WsTjECE7ZORWN2nCY9AZG2C4Rf3ynA=;
        b=WK5kf+yeZ+Ds1KqEbPAcX8VYBAaFzc7vq+k74iCWTmnn2yEfMs9etXU2agQ8gXhAZ6Lle9
        FbyPxvaAsAjv85Ioid2DeGNtGvH0NHk+SLRX4Uw5rNJxVIrB6t0WQJxXuvPkuWKTtcAcQW
        ZPOF++FZ12txD0q3/1f3vAoqjz912wQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-qmb-fuCQPmafbrPjBiAR4A-1; Fri, 20 Aug 2021 06:11:44 -0400
X-MC-Unique: qmb-fuCQPmafbrPjBiAR4A-1
Received: by mail-ed1-f70.google.com with SMTP id z4-20020a05640240c4b02903be90a10a52so4299056edb.19
        for <linux-next@vger.kernel.org>; Fri, 20 Aug 2021 03:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PjEaCYCRogYG/WsTjECE7ZORWN2nCY9AZG2C4Rf3ynA=;
        b=O17aOSaxtyqbtMDthu9Bc6O49FxAKPg0D/BCwPXKMgTzEmhnuK6k/kUGuprEU9GGFh
         fw/HomIDnJ7UxKCvXsRv6UcdunP+QvuLIeI/iTsPrFClCD1Z1jMT1qZG4lB62ex2jyqD
         0C5P88BzwMoLA5i5PLyHABUt89XbyaRN7/wb5HhEgG9PvJ9HI4q24lifW4g5UNYDCKgR
         6FfVBPtDry3ceaVYqQ00YYxvYa4vm2yB2NTynBZOA+USHJbtgsxlmOH+535yGsgqC+H0
         wKRfJO3fod88to12zLIp2b+btF53x0oUB3Rxs6sNcLrqhD08BEMB7X1sjdH7/jPKE8KK
         lfLw==
X-Gm-Message-State: AOAM531UZzEh+csw7NM83f7K0BO2TGpMVskT1OtkuDQlJH6GXFwP1yK2
        m6wxaSR3fU+76xzbiUWDMITmt1tdWXV7yA945t41wouhNjY1V71rxYGz92EQY65lJZgRJCwoN0l
        5kzAfAuAI/IaZ3h20/7FkIIiOiMHf5/66BZIjrSmIbws603NXy2u5OsWtso3dH8sSBBbBRbSqNw
        ==
X-Received: by 2002:aa7:db95:: with SMTP id u21mr21114911edt.152.1629454302809;
        Fri, 20 Aug 2021 03:11:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcCyAeKEwj9goJVz7uy5NTJA6ZvwLj4KDC64me3YtwjFIqVstziwCl9YjISimG4vhWk7iBlA==
X-Received: by 2002:aa7:db95:: with SMTP id u21mr21114873edt.152.1629454302486;
        Fri, 20 Aug 2021 03:11:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f19sm3323541edt.44.2021.08.20.03.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Aug 2021 03:11:41 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
To:     M D <whenov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Gross <mark.gross@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210820150022.2160a348@canb.auug.org.au>
 <CAA2grmaYg8Qc4LXhcFAvNRN-zJaPcq+y3=MFVSFETr2pNb-Vgw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d6099b61-d825-5a3d-4088-da865db35451@redhat.com>
Date:   Fri, 20 Aug 2021 12:11:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAA2grmaYg8Qc4LXhcFAvNRN-zJaPcq+y3=MFVSFETr2pNb-Vgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 8/20/21 9:31 AM, M D wrote:
> On Fri, Aug 20, 2021 at 1:00 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi all,
>>
>> After merging the drivers-x86 tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/platform/x86/ideapad-laptop.c: In function 'ideapad_wmi_notify':
>> drivers/platform/x86/ideapad-laptop.c:1469:3: error: a label can only be part of a statement and a declaration is not a statement
>>  1469 |   unsigned long result;
>>       |   ^~~~~~~~
>>
>> Caused by commit
>>
>>   18cfd76e7b84 ("ideapad-laptop: Fix Legion 5 Fn lock LED")
>>
>> I have used the drivers-x86 tree from next-20210819 for today.
>>
>> --
>> Cheers,
>> Stephen Rothwell
> 
> Hi Stephen,
> 
> Thanks for your work!
> 
> This error occurs because only a statement is allowed after a label,
> but a definition is not a statement in C99.
> This can be fixed by wrapping the case block with curly braces like this:
> case 208: {
> ...
> }

Yes, or just move the declaration of result to the beginning of
the function, which is a bit cleaner IMHO.

I've moved the declaration to the beginning of the function and
squashed this fix into the original commit. I'll do a forced
push with the squashed in fix to for-next as soon as a test-compile
completes.

Stephen, as always thank you your work on linux-next and for reporting this.

> However I don't know why my compiler did not report this error. I was
> using gcc 11.1.0 under Arch Linux.

Yes gcc 11.2.1 under Fedora also happily compiles this, and this
sat in my review-hans branch for a while and got happily compiled
by "kernel test robot <lkp@intel.com> " there too.

So this compile error slipped through the crack of all our (compile)
testing until Stephen caught it :)

Regards,

Hans

