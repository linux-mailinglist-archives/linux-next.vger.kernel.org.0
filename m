Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5181DB513D
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 17:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729204AbfIQPR3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 11:17:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:49008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727937AbfIQPR3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Sep 2019 11:17:29 -0400
Received: from linux-8ccs (unknown [193.86.95.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8667721852;
        Tue, 17 Sep 2019 15:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568733448;
        bh=sVZ6ge+yfDjOXzOx4fIF/VKvl5Za4ZNZw0rEy3EqVMI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Uidq5re/aDTm1kY0VHPyJmXnqXLfjBxvObr6X32OsT0ANckL0KLeYr0j50KrxIkfN
         QbkxO0PlvkqF6/mwjes4EKl2v9jM5ihlg3kAkw8y8WHqEb598VQklOrEELSDadHy//
         9DTjpLCMe99vlZ7BQ6xs7gzNzsB1Jj6bhpZ1wizI=
Date:   Tue, 17 Sep 2019 17:17:22 +0200
From:   Jessica Yu <jeyu@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Martijn Coenen <maco@android.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the modules tree with the
 compiler-attributes tree
Message-ID: <20190917151721.GB4116@linux-8ccs>
References: <20190915222720.GL4352@sirena.co.uk>
 <20190916155927.GI4352@sirena.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190916155927.GI4352@sirena.co.uk>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.28-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+++ Mark Brown [16/09/19 16:59 +0100]:
>On Sun, Sep 15, 2019 at 11:27:20PM +0100, Mark Brown wrote:
>
>> Since this conflcit is non-trivial, it's late and there's a good chance
>> I'm not going to actually finish building -next today I've just used the
>> commit from the last time -next was built, 3b5be16c7e90a69c, for the
>> modules tree - sorry.  I'll have another go tomorrow.  This means none
>> of the changes in modules-next are in -next as they were all committed
>> in the past week.
>
>I had another look but I'm still not comfortable doing this merge in a
>sensible timeframe so I punted again, sorry.  I'll probably carry on
>doing this.

Hi Mark,

Sorry for the trouble. We are currently working out a resolution
(https://lore.kernel.org/lkml/20190917150902.GA4116@linux-8ccs/).
Feel free to leave it at 3b5be16c7e90a69c until this gets resolved in
the next day or two..

Thanks,

Jessica
