Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF60906D4
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 19:27:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbfHPR1W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 13:27:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:51894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727034AbfHPR1W (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Aug 2019 13:27:22 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C66322086C;
        Fri, 16 Aug 2019 17:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565976441;
        bh=kTKmZzBgXDWt1e25uw3p2j+RuQe/5bkWXTr26124Kcc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oT0yZFJBq6qNnNbDnyTJc/Sk55EqaLI4m3PlmCk0g95heW2smIMqbO7gVmT5vWGYs
         ApVSGTrPqw/5rJJRQjVgHytB9mUHBSB2eQ3nZk3jYFlHh4SHmp72u7WNxGrtBiKAgC
         p8f/JZkgdsbknIezZnW7iXCl11gsPC6uLMv8kV5M=
Date:   Fri, 16 Aug 2019 18:27:16 +0100
From:   Will Deacon <will@kernel.org>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Peter Collingbourne <pcc@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        benh@kernel.crashing.org, paulus@samba.org
Subject: Re: linux-next: build failure after merge of the arm64 tree
Message-ID: <20190816172715.i7wib7ilhua5gkuw@willie-the-truck>
References: <20190807095022.0314e2fc@canb.auug.org.au>
 <CAMn1gO6P_VfDRjGZb67ZS4Kh0wjTEQi0cbOkmibTokHQOgP7qw@mail.gmail.com>
 <20190807114614.ubzlkulk7aidws3p@willie-the-truck>
 <87ftm17luv.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ftm17luv.fsf@concordia.ellerman.id.au>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Michael,

On Fri, Aug 16, 2019 at 02:52:40PM +1000, Michael Ellerman wrote:
> Will Deacon <will@kernel.org> writes:
> > Although Alpha, Itanic and PowerPC all override NM, only PowerPC does it
> > conditionally so I agree with you that passing '--synthetic' unconditionally
> > would resolve the problem and is certainly my preferred approach if mpe is
> > ok with it.
> 
> I'd rather we keep passing --synthetic, otherwise there's the potential
> that symbols go missing that were previously visible.

Yup -- that was my suggestion above.

> I think we can keep the new_nm check, but drop the dependency on
> CONFIG_PPC64, and that will fix it. Worst case is we start passing
> --synthetic on ppc32, but that's probably not a problem.
> 
> This seems to fix it for me, and 32-bit builds fine.

Brill, thanks for confirming!

> Do you want me to send a proper patch for this, or do you want to squash
> it into the original series?

I'd prefer not to rebase the arm64 queue, so if you send this as a proper
patch, please, then I can queue it on top before reverting the hack we
currently have.

Will
