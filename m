Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7DD545505E
	for <lists+linux-next@lfdr.de>; Wed, 17 Nov 2021 23:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241148AbhKQW0U (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Nov 2021 17:26:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235955AbhKQW0S (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Nov 2021 17:26:18 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37689C061570;
        Wed, 17 Nov 2021 14:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=U7Fg/mSCLjyOxFMKC7qrp5K7AnLexlMRldKZ82FgQE4=; b=bJnnRW0NGjejpyid9PCCtHYxJw
        QA4ZPny06UGw29tRssK2eIEhh67JX3JFT9fkwVV6BAMX052/UW8PS2fV0Fed38HwVet2d87Un5Tb3
        9gaXMMZJbbZ5QCxSXQKnMrZyAH3BUhvbHipxpztIQYjhvyLOO4r+CH8Gyzt6M1zHUvf9R24yvh94y
        QqN2H7KSHL9ZWWxl1H3n6sNTgRjIwOFxqiP5rvpT/IXmGBErKlkYEBDQ4eRQ5T2FTdE1lPkVh0tiB
        QS8Kxr5I4Gkrwzb4t+9dJSG/B/ECZxGcPhow59UDBRhtGEX0K38Q7O/M8O1kg6jrQwSuBghSta8/J
        wdq+RGxQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mnTKf-006R7n-Hf; Wed, 17 Nov 2021 22:23:09 +0000
Subject: Re: linux-next: Tree for Nov 17 (fs/dlm/lowcomms.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexander Aring <aahringo@redhat.com>,
        David Teigland <teigland@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20211117135800.0b7072cd@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <70141efe-8137-4491-f234-110b24f9d623@infradead.org>
Date:   Wed, 17 Nov 2021 14:23:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211117135800.0b7072cd@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/16/21 6:58 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20211116:
> 

on m68k (but probably other places as well):
when CONFIG_IPV6 is not set/enabled:

In file included from ../fs/dlm/lowcomms.c:46:
../fs/dlm/lowcomms.c: In function 'lowcomms_error_report':
../include/net/sock.h:386:45: error: 'struct sock_common' has no member named 'skc_v6_daddr'; did you mean 'skc_daddr'?
   386 | #define sk_v6_daddr             __sk_common.skc_v6_daddr
       |                                             ^~~~~~~~~~~~


-- 
~Randy
