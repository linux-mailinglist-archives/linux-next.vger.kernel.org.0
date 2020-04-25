Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9360F1B8A04
	for <lists+linux-next@lfdr.de>; Sun, 26 Apr 2020 01:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgDYXas (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 25 Apr 2020 19:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbgDYXas (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 25 Apr 2020 19:30:48 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD85C061A0C;
        Sat, 25 Apr 2020 16:30:47 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 498nN26kybz9sRf;
        Sun, 26 Apr 2020 09:30:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1587857444;
        bh=uv3lA2XY+H/XFYmi/vOH8WtXRb5rxH0D4Y5J2qWZdGY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=LYQj7EcGN9s0+gYICyi9eeoKZUQFWk63x/WtPZ32BtG1grbg55dGoKDF5/kbwhP3Q
         HlVYsX5RP53O+teXh6b+Ap7xPQB7gNUC6pva7r9HBY8o7uI/866IoXw1XMKwAZ5hQz
         eJUeYpv7+b1xQduwad58nQh/dMuv6ecTUPQjlPIQegqnz6d/awFyqTOg4XidUCwvxC
         NofsKmeyqRbM0o7vSQxXq9l7L1dU1/fUTLso5vbDAToegbTuEnTFasKAT0mBOxK90/
         90xyS9+ct0zDNl3eP01ELB9jiv24avUXfzfWK4zs48Dul5UgXXf3rvqJuvOT/dMgCn
         IvJ6+iPdEg9Tw==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Mark Brown <broonie@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
In-Reply-To: <20200423142114.GJ4808@sirena.org.uk>
References: <20200423155539.4492a0cc@canb.auug.org.au> <20200423113041.GI4808@sirena.org.uk> <20200423230400.2cb1a285@canb.auug.org.au> <20200423142114.GJ4808@sirena.org.uk>
Date:   Sun, 26 Apr 2020 09:30:57 +1000
Message-ID: <87a72zgn2m.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Mark Brown <broonie@kernel.org> writes:
> On Thu, Apr 23, 2020 at 11:04:00PM +1000, Stephen Rothwell wrote:
>> On Thu, 23 Apr 2020 12:30:41 +0100 Mark Brown <broonie@kernel.org> wrote:
>
>> > It looks like this is triggered by PowerPC not including
>> > drivers/firmware - there are missing dependencies but it works for other
>> > all*configs since the dependencies all get built in those.  It would be
>> > helpful if PowerPC were fixed to include the firmware directory to
>> > improve coverage.
>
>> $ git grep drivers/firmware 'arch/*/*Kconfig*'
>> arch/arm/Kconfig:source "drivers/firmware/Kconfig"
>> arch/arm64/Kconfig:source "drivers/firmware/Kconfig"
>> arch/ia64/Kconfig:source "drivers/firmware/Kconfig"
>> arch/mips/Kconfig:source "drivers/firmware/Kconfig"
>> arch/x86/Kconfig:source "drivers/firmware/Kconfig"
>
>> so, sure, it works for some architectures.  We would need someone to do
>> the work to make sure that adding drivers/firmware to all the others
>> does not break other stuff.  Until then, please add the needed
>> dependencies.
>
> I am doing that but that still doesn't mean that the architectures
> shouldn't be updated - to me this is like the architectures that don't
> implement standard APIs, we should fix the issues they bring up but it'd
> be a lot less noisy to sidestep the issue.

I don't think it's really like architectures that don't implement
standard APIs.

It's more like architectures not building code they don't need, AFAICS
none of the drivers under there can ever be used on powerpc.

Similarly we don't build drivers/acpi.

But if there's a good reason that we should be building it then I'm
happy to take a patch adding it.

cheers
