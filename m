Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E09FE43C891
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 13:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbhJ0Lbe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 07:31:34 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:35447 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237421AbhJ0Lbe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 07:31:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfRKb41TQz4xbP;
        Wed, 27 Oct 2021 22:29:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
        s=201909; t=1635334148;
        bh=MHq64eZS9Jri3BDBh8LS9jVHE07Z90nQn+T4OkS25Qg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=o6u2CEpOxGBJvNemtoJ2GOBbPtwJQy/PgPE76ook/TmAX8J+i482whrIrJmiNgzsL
         pZcK4uTPRvoHWa1kBw9ER9Z5IvA5HEUmo4kaGmqWR3gcyPilWeR4Vnubb7mH0/dXo5
         MAD37mlLtxFGYW6MRFktS7hqlVO1vi4js4K2T7pC7KRygNrc/KIgxUu15IT57A+iqI
         1HDWdmAm03vjeQubfeoZZD2/AeFGiOsD2LdwvBAHhYqOjHCb5QTmb5R7WcbSeSTZAd
         BYrezRd5CfBV8G1tXX1ta70GfaBcwVPTbM8fG34tlfQidUtrBpyIws4JGqT6GE5PTt
         QEVWRkmaKiU8g==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Paul Moore <paul@paul-moore.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Richard Guy Briggs <rgb@redhat.com>
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
In-Reply-To: <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
References: <20211026133147.35d19e00@canb.auug.org.au>
 <87k0i0awdl.fsf@mpe.ellerman.id.au>
 <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
Date:   Wed, 27 Oct 2021 22:29:06 +1100
Message-ID: <87tuh2aepp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Paul Moore <paul@paul-moore.com> writes:
> On Tue, Oct 26, 2021 at 6:55 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>> > Hi all,
>> >
>> > Today's linux-next merge of the audit tree got conflicts in:
>> >
>> >   arch/powerpc/kernel/audit.c
>> >   arch/powerpc/kernel/compat_audit.c
>> >
>> > between commit:
>> >
>> >   566af8cda399 ("powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPAT_GENERIC")
>> >
>> > from the powerpc tree and commits:
>> >
>> >   42f355ef59a2 ("audit: replace magic audit syscall class numbers with macros")
>> >   1c30e3af8a79 ("audit: add support for the openat2 syscall")
>> >
>> > from the audit tree.
>>
>> Thanks.
>>
>> I guess this is OK, unless the audit folks disagree. I could revert the
>> powerpc commit and try it again later.
>>
>> If I don't hear anything I'll leave it as-is.
>
> Hi Michael,
>
> Last I recall from the powerpc/audit thread there were still some
> issues with audit working properly in your testing, has that been
> resolved?

No.

There's one test failure both before and after the conversion to use the
generic code.

> If nothing else, -rc7 seems a bit late for this to hit -next for me to
> feel comfortable about this.

OK. I'll revert the patch in my tree.

cheers
