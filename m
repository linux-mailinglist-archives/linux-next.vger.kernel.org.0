Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A48340AD71
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 14:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232386AbhINMXE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Sep 2021 08:23:04 -0400
Received: from ozlabs.org ([203.11.71.1]:50681 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232341AbhINMXC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Sep 2021 08:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1631622102;
        bh=SGmkhJPGIfCGzEckYi2O+WbmHpSLcYp+HxFHaUuDvuk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=HVq0sP8J8jzizJQOnivhASlokwaA8svM2hXDsjMztq3yrz9mFfliD1mxwmYq6P1oy
         5OQAi86EFUQ2s2w5VpKQ+mYhNhsy+7dLmgehyd+ixnkRXL+3jNyzBDLODNS7W4MVmh
         cqTiasrsAdGozGGNtoPpsSlcO8uTh6AtwzoGyYYKVEYea68dOAx3BGEapQ7chzzm1Y
         ZmRYtuQHAAlNx7IXGY50Ks89slzj6cO7xs5sXTio2eskFipkseH8TqYO7eeiNtSVzg
         qepcoFdtz16P3Upu+NIf393xxtfIy7VOLr4xkvBdmRomHTM/Kolh+10miFt7CJEw1t
         FDTbfkwKmyMhg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H82X6487zz9sW4;
        Tue, 14 Sep 2021 22:21:42 +1000 (AEST)
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the origin tree
In-Reply-To: <CAHk-=wieb251-L9D-v3BeF-Cna8r5kLz2MeyXDS3mrNUmXNYrg@mail.gmail.com>
References: <20210914100853.3f502bc9@canb.auug.org.au>
 <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
 <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
 <20210914105359.5c651d55@canb.auug.org.au>
 <CAHk-=whyWUdJDeOBN1hRWYSkQkvzYiQ5RbSW5rJjExgnbSNX9Q@mail.gmail.com>
 <20210914120818.4a102b46@canb.auug.org.au>
 <CAHk-=wieb251-L9D-v3BeF-Cna8r5kLz2MeyXDS3mrNUmXNYrg@mail.gmail.com>
Date:   Tue, 14 Sep 2021 22:21:41 +1000
Message-ID: <87h7enl54a.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Mon, Sep 13, 2021 at 7:08 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> That patch works for me - for the ppc64_defconfig build at least.
>
> Yeah, I just tested the allmodconfig case too, although I suspect it's
> essentially the same wrt the boot *.S files, so it probably doesn't
> matter.
>
> I'd like to have Michael or somebody who can actually run some tests
> on the end result ack that patch (or - even better - come up with
> something cleaner) before committing it.
>
> Because yeah, the build failure is annoying and I apologize, but I'd
> rather have the build fail overnight than commit something that builds
> but then is subtle buggy for some reason.
>
> But if I don't get any other comments by the time I'm up again
> tomorrow, I'll just commit it as "fixes the build".

I ended up doing a more minimal version of your change.

I sent it separately, or it's here:

  https://lore.kernel.org/lkml/20210914121723.3756817-1-mpe@ellerman.id.au/


cheers
