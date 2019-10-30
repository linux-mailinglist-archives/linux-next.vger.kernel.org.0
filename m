Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AFE2E9A7A
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2019 11:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfJ3K4F (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Oct 2019 06:56:05 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:59654 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbfJ3K4F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Oct 2019 06:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=uIegkZQzkn1zcqdyq67bNlxNwZqbG1dPi+BTChwc7jw=; b=Toq0Mv2v84YfwvtbALBytVUt2
        tVFOKbqj5yElqIGud8SkSy5s0ilJ9aeo7zs3Yfcn4dVVHqjmP4hXHVYNOZ6ouyr9OSwR2oybr895m
        oDsyqNEcS8AkLyA44zjEkH62Hxv6LZu6rkCp9FQ7M46IpkAl9U4K46IDC+NNIPAyDIfwe9aZRDxlb
        g9qe1+h0Ai4OtVpFj7zm1fr+/fkuxZj52NhnBUAhDIhysi0Q6Aum7izpBQpCDomhfzZ6VE0ibOFUW
        iDZZlot+hHl8yhVo7WjSfEdQjZAj5UkzOQVgxedpGwKP7zAr/wGg9vlQMie/5RcdG7asheA0JWQFR
        7VXrEswKA==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:56890)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1iPlds-0007ur-Rj; Wed, 30 Oct 2019 10:55:56 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1iPldp-0005So-HG; Wed, 30 Oct 2019 10:55:53 +0000
Date:   Wed, 30 Oct 2019 10:55:53 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-trace-devel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: linux-next: Tree for Oct 29
Message-ID: <20191030105553.GH25745@shell.armlinux.org.uk>
References: <20191029180731.2153b90c@canb.auug.org.au>
 <CADYN=9+aqqHVP8tKFFCTKi_zzSt=PW5JVyU2sdaThgrHpYSjzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADYN=9+aqqHVP8tKFFCTKi_zzSt=PW5JVyU2sdaThgrHpYSjzQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Please trim your replies; there's no need to force everyone to page
through 500 lines of Stephen's email to get to the content of your
message.

On Wed, Oct 30, 2019 at 11:25:19AM +0100, Anders Roxell wrote:
> When I'm building an arm kernel with this .config [1], I can see this
> build error on next tag next-20191029 and next-20191030. Tag
> next-20191028 built fine.
> 
> 
> $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- -skj$(getconf
> _NPROCESSORS_ONLN) O=obj-arm-20191029 zImage
> arm-linux-gnueabi-ld: kernel/trace/trace_preemptirq.o: in function
> `trace_hardirqs_on':
> trace_preemptirq.c:(.text+0x2a0): undefined reference to `return_address'
> arm-linux-gnueabi-ld: trace_preemptirq.c:(.text+0x2dc): undefined
> reference to `return_address'
> arm-linux-gnueabi-ld: kernel/trace/trace_preemptirq.o: in function
> `trace_hardirqs_off':
> trace_preemptirq.c:(.text+0x468): undefined reference to `return_address'
> arm-linux-gnueabi-ld: trace_preemptirq.c:(.text+0x494): undefined
> reference to `return_address'
> arm-linux-gnueabi-ld: kernel/trace/trace_irqsoff.o: in function
> `start_critical_timings':
> trace_irqsoff.c:(.text+0x798): undefined reference to `return_address'
> arm-linux-gnueabi-ld:
> kernel/trace/trace_irqsoff.o:trace_irqsoff.c:(.text+0xed4): more
> undefined references to `return_address' follow
> make[1]: *** [/srv/src/kernel/next-testing/Makefile:1074: vmlinux] Error 1
> make[1]: Target 'zImage' not remade because of errors.
> make: *** [Makefile:179: sub-make] Error 2
> make: Target 'zImage' not remade because of errors.

Known problem with one of Ben Dooks patches, which was dropped very
quickly when Olof's builder spotted the issue... though it looks like
I didn't push it out.  Ben doesn't seem to be responding about his
broken patch though...

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
