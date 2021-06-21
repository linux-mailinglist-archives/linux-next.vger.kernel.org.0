Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6920A3AE49E
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 10:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhFUIU2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 04:20:28 -0400
Received: from infomag.iguana.be ([185.87.124.46]:44040 "EHLO
        infomag.iguana.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhFUIU2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 04:20:28 -0400
X-Greylist: delayed 592 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Jun 2021 04:20:27 EDT
Received: by infomag.iguana.be (Postfix, from userid 1001)
        id 37AFB603CACE; Mon, 21 Jun 2021 10:08:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 infomag.iguana.be 37AFB603CACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iguana.be;
        s=infomag-20180602; t=1624262900;
        bh=R1BOYJmyCsFjrpCi/j6BH+ZFJ9mn3RCuXqY+n3LYg1I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IVFd18VMfUmYlLGEAUwJpFegqlCCeutC+mBJIIqPQficpCelq181BgZaXo5MPIofn
         i3b2WAWa+RR8Gj7rTrywq9oKBzpYAiFcYg27BOJe4VvDJFnXHz2MLHeUa2s9+NGpHN
         zJusf5tBJAMybEeqO3kCYysurd6RfWDU4cr/8P7k=
Date:   Mon, 21 Jun 2021 10:08:20 +0200
From:   Wim Van Sebroeck <wim@iguana.be>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the watchdog tree
Message-ID: <20210621080820.GA20712@infomag.iguana.be>
References: <20210621153839.43dd423e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621153839.43dd423e@canb.auug.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Fixed for tomorrow's pull.

Kind regards,
Wim.

> Hi all,
> 
> After merging the watchdog tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: modpost: "bd70528_wdt_unlock" [drivers/rtc/rtc-bd70528.ko] undefined!
> ERROR: modpost: "bd70528_wdt_lock" [drivers/rtc/rtc-bd70528.ko] undefined!
> ERROR: modpost: "bd70528_wdt_set" [drivers/rtc/rtc-bd70528.ko] undefined!
> 
> Caused by commit
> 
>   f2a5178b0b9f ("watchdog: bd70528 drop bd70528 support")
> 
> I have used the watchdog tree from next-20210618 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell


