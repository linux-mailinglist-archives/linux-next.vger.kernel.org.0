Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62A309584C
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2019 09:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729181AbfHTH1s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 03:27:48 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:35785 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729047AbfHTH1s (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 03:27:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46CMns1myNz9s4Y;
        Tue, 20 Aug 2019 17:27:45 +1000 (AEST)
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Will Deacon <will@kernel.org>
Cc:     Peter Collingbourne <pcc@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        benh@kernel.crashing.org, paulus@samba.org
Subject: Re: linux-next: build failure after merge of the arm64 tree
In-Reply-To: <20190816172715.i7wib7ilhua5gkuw@willie-the-truck>
References: <20190807095022.0314e2fc@canb.auug.org.au> <CAMn1gO6P_VfDRjGZb67ZS4Kh0wjTEQi0cbOkmibTokHQOgP7qw@mail.gmail.com> <20190807114614.ubzlkulk7aidws3p@willie-the-truck> <87ftm17luv.fsf@concordia.ellerman.id.au> <20190816172715.i7wib7ilhua5gkuw@willie-the-truck>
Date:   Tue, 20 Aug 2019 17:27:40 +1000
Message-ID: <87o90k5mab.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Will Deacon <will@kernel.org> writes:
> Hi Michael,
>
> On Fri, Aug 16, 2019 at 02:52:40PM +1000, Michael Ellerman wrote:
>> Will Deacon <will@kernel.org> writes:
>> > Although Alpha, Itanic and PowerPC all override NM, only PowerPC does it
>> > conditionally so I agree with you that passing '--synthetic' unconditionally
>> > would resolve the problem and is certainly my preferred approach if mpe is
>> > ok with it.
>> 
>> I'd rather we keep passing --synthetic, otherwise there's the potential
>> that symbols go missing that were previously visible.
>
> Yup -- that was my suggestion above.
>
>> I think we can keep the new_nm check, but drop the dependency on
>> CONFIG_PPC64, and that will fix it. Worst case is we start passing
>> --synthetic on ppc32, but that's probably not a problem.
>> 
>> This seems to fix it for me, and 32-bit builds fine.
>
> Brill, thanks for confirming!
>
>> Do you want me to send a proper patch for this, or do you want to squash
>> it into the original series?
>
> I'd prefer not to rebase the arm64 queue, so if you send this as a proper
> patch, please, then I can queue it on top before reverting the hack we
> currently have.

Cool, just sent a patch.

cheers
