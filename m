Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D75926E6CA
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 22:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgIQUdS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 16:33:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbgIQUdS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Sep 2020 16:33:18 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1249C06174A;
        Thu, 17 Sep 2020 13:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=s0bHR6yIgC0vs5d1tZYbUL56OKBKLAeNni8dcjltGjw=; b=lhQVowPwTHSxDlNTuZr7guKYFT
        KaD+KqIb4kqDJw4XcFY7wuJ3n11OwHdjVnDV2Kjq4fIpPQzmYYpH8dq8EdIigI7jvKX3i/3cTrT0Q
        Ch+01DTHMOATWdDDuDk549v5iQWIlKWY/2KLfQFyyG+fqRiEYOOHMPD2ENySpiCiJlAiF40HDM8F6
        +ElhHDrEXxl4x9pfqAjx6sbU8QXen0C49yyAD2YCLxE2NJQjZl42Ikrm4rsi2xgEYytZ8sAnCvMas
        1kkTRrs/OSlr+45/akbv7Y8kSXhDtYUmcJ5L6Djsl48EcZZxyRGu8kgY8+wItSRkbQsZhGBTRP/Qh
        NSpd2bQQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kJ0aa-0007EN-Ug; Thu, 17 Sep 2020 20:33:09 +0000
Subject: Re: linux-next: Tree for Sep 17 (netdevice.h:
 net_has_fallback_tunnels when SYSCTL is not set)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mahesh Bandewar <maheshb@google.com>,
        David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
References: <20200917202313.143f66f3@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20f0b8f7-bbe8-fd31-819e-998054e41766@infradead.org>
Date:   Thu, 17 Sep 2020 13:33:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917202313.143f66f3@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/17/20 3:23 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200916:
> 

I am seeing build errors when CONFIG_SYSCTL is not set:

ld: net/ipv4/ip_tunnel.o: in function `ip_tunnel_init_net':
ip_tunnel.c:(.text+0x2ea0): undefined reference to `sysctl_fb_tunnels_only_for_init_net'
ld: net/ipv6/ip6_vti.o: in function `vti6_init_net':
ip6_vti.c:(.text+0x1b56): undefined reference to `sysctl_fb_tunnels_only_for_init_net'
ld: net/ipv6/sit.o: in function `sit_init_net':
sit.c:(.text+0x4568): undefined reference to `sysctl_fb_tunnels_only_for_init_net'
ld: net/ipv6/ip6_tunnel.o: in function `ip6_tnl_init_net':
ip6_tunnel.c:(.text+0x27d6): undefined reference to `sysctl_fb_tunnels_only_for_init_net'
ld: net/ipv6/ip6_gre.o: in function `ip6gre_init_net':
ip6_gre.c:(.text+0x3a5e): undefined reference to `sysctl_fb_tunnels_only_for_init_net'

due to 316cdaa1158af:

commit 316cdaa1158af17250397054f92bb339fbd8e282
Author: Mahesh Bandewar <maheshb@google.com>
Date:   Wed Aug 26 09:05:35 2020 -0700

    net: add option to not create fall-back tunnels in root-ns as well


This was first reported to netdev@ on Sept. 02 but Mahesh was not cc-ed
on that report.


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
