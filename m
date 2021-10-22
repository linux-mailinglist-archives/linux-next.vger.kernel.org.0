Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C69C43757E
	for <lists+linux-next@lfdr.de>; Fri, 22 Oct 2021 12:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbhJVKdt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Oct 2021 06:33:49 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:55807 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232573AbhJVKds (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 Oct 2021 06:33:48 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id DD65B3200A1E;
        Fri, 22 Oct 2021 06:31:30 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute3.internal (MEProxy); Fri, 22 Oct 2021 06:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm2; bh=KbMpnRh1mWwjoX89UJ/WIrnsgzEo
        huauhd3dYa3aqWQ=; b=R9bFt/6UFPwHQr8DQO6aCJbcQIJIwqBGhBfPKUV2GpLB
        99WYb/K7rOvMFJv6E0HbSgdpOtnun6Zdg+hcE+NcopHSfTV1kv8R6JYPgnN1GyAo
        plGZsqHhGt0KxCsftm7e5sDZa6dCTVi2UbbQG9p5JXP444JGKlQ8kMtYOZ3smpLZ
        +r9gxTmMQLUyHv0O4cr65i/qblEiy5xZXhr3Fyiw6WptwQj+hRwE7c2K1JVln2mb
        TX9dd5DQmhFgCDf37/98IKO6Swqile9nr4R4ZwboQsAiHnkeulh42UMKUDEH26jj
        NmfdPuVtv1iIlZO6G74mS/BOalK4lIIsn1nysgmu1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KbMpnR
        h1mWwjoX89UJ/WIrnsgzEohuauhd3dYa3aqWQ=; b=babQCnMTJIsdx1498obkxE
        1e/jsWUbFsLUKg4LvJuf4RqvqJjm9BjWIZ3fhFpGoeFnUZ/aEV5R6nv7xVFfQn4S
        3kCeonT3UHodPFskBqYxHoYbV9Uxas1z1O2tbMK+mmNmo8kv1hadlOiSmXUHhP3V
        1t8aTzy1BW0n+eadmtQ59dO9rbuFW8n2Di7Uq/75bbH23uDs9crMuxB37kuFreEm
        DutXlpA8+eVMSnDxFM5CmW8uFO4FzZtT4JDy0sUwirq69E5McQajw4CBf1QhoWDe
        0lLUPDYzLcMQWmAUAp+7IBCMf2rSSWxmzZmCXww6ODNzPvgAqIwz/Vl/lE8wnhIw
        ==
X-ME-Sender: <xms:AZNyYbca8DV0CaeN_82ihSCNa13XFDrf9pQnaJV78VvwLZImI529Tw>
    <xme:AZNyYRPm5UkAD4Izv7qnXlqM_W1txNZkb3q3ocBeqPFU5FU2OdclwGj0rGot1JLKo
    VHchO4T5jV85OqaxT0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvkedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomheptehlihhs
    thgrihhruceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrg
    htthgvrhhnpeeuffekveehjeeltdeuveeikeelkeejhfejheduhfdtgfdtgfejjeekvdev
    jeevueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:AZNyYUhgfI7b4HaXKZYfwGDKjsrVj3K1IctuoOQmQoB-0Xpqx1P5cQ>
    <xmx:AZNyYc8aueCabnglVa746m2N2nbaqComQZjrSZpw-70WlTfF6XwRQg>
    <xmx:AZNyYXso_nGlJJz4aZJUGT6fER1J7bjcyo5GetesBb5omBaUgElWeQ>
    <xmx:ApNyYQ6qeYgbOeTFW1P61Ru7RaMPZ_nQL1rN6Z6fv4DWpGYSeV_KgA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id DAD0AAC0DD1; Fri, 22 Oct 2021 06:31:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <bd49c44d-372e-453a-ac8e-04252b2eaba8@www.fastmail.com>
In-Reply-To: <20211022125323.132b950d@canb.auug.org.au>
References: <20211022125323.132b950d@canb.auug.org.au>
Date:   Fri, 22 Oct 2021 20:31:08 +1000
From:   Alistair <alistair@alistair23.me>
To:     "Stephen Rothwell" <sfr@canb.auug.org.au>,
        "Mark Brown" <broonie@kernel.org>,
        "Liam Girdwood" <lgirdwood@gmail.com>
Cc:     "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the regulator tree
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 22, 2021, at 11:53 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the regulator tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/regulator/sy7636a-regulator.c:14:10: fatal error: linux/mfd/sy7636a.h: No such file or directory
>    14 | #include <linux/mfd/sy7636a.h>
>       |          ^~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   cb17820ef71e ("regulator: sy7636a: Remove requirement on sy7636a mfd")

The above patch allows the sy7636a regulator to be built, as it no longer depends on
the mfd driver directly.
This fails to build on current upstream as the sy7636a header file isn't upstream
yet. The header file is added earlier in the patch series.

This patch should probably not be applied until after:

mfd: simple-mfd-i2c: Enable support for the silergy,sy7636a

Or if preferred I can split adding the header file into it's own patch that can be
applied.

Alistair


> 
> I have used the regulator tree from next-20211021 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
