Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C873B20B4
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 21:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhFWTCW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Jun 2021 15:02:22 -0400
Received: from gateway34.websitewelcome.com ([192.185.149.101]:27745 "EHLO
        gateway34.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229523AbhFWTCW (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Jun 2021 15:02:22 -0400
X-Greylist: delayed 1311 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Jun 2021 15:02:22 EDT
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway34.websitewelcome.com (Postfix) with ESMTP id 2E3C933A5C3
        for <linux-next@vger.kernel.org>; Wed, 23 Jun 2021 13:38:13 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id w7lNlSzCD7sOiw7lNlXNII; Wed, 23 Jun 2021 13:38:13 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=C0MW5eb4P1KjrPDoV0Rq3MvNLJoSwHEP7qEI/WvdwRU=; b=pPzvkIo1r+5iK2//1v631kMFt5
        gOCTU/+VJlm/+WLEudiNmods2jwPO+07eta+qiuaN+00VO3LfDivShSk3pPJ7GyL4ErKG16oqvd8Y
        sYA/SdQODzOca88dq0etZAjW6RmuyTGXv9M3eLmCZnr505kANZ8uaVYmoCFD63H/Cl2O+1VXZk1t8
        gEwLW/MdjQYxssK4EnmcNz8nVz4yTa8kNjEg5yMb515qZOosy7ZQD7ua/Jy1yqztlgHhCP5C+08SV
        St1K2XXtKhvtJI6lV3JCEcWv4MsIa3CcIEQ+NPX88wRUIWM3jGYl/6nk+/mmc1KeF4Za1qXoG4QPO
        HwtuFt6g==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:48326 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1lw7lK-000Lfm-Pt; Wed, 23 Jun 2021 13:38:10 -0500
Subject: Re: linux-next: build warning after merge of the kspp-gustavo tree
To:     dsterba@suse.cz, Stephen Rothwell <sfr@canb.auug.org.au>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210623083901.1d49d19d@canb.auug.org.au>
 <20210623131455.GM28158@suse.cz>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <9f18da33-7446-7237-91be-e52a274877d8@embeddedor.com>
Date:   Wed, 23 Jun 2021 13:39:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623131455.GM28158@suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lw7lK-000Lfm-Pt
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:48326
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 6/23/21 08:14, David Sterba wrote:
> On Wed, Jun 23, 2021 at 08:39:01AM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the kspp-gustavo tree, today's linux-next build (powerpc
>> ppc64_defconfig) produced this warning:
>>
>> In file included from fs/btrfs/ctree.h:9,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/struct-funcs.c: In function 'btrfs_get_token_16':
>> fs/btrfs/struct-funcs.c:80:46: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>>    80 |  token->kaddr = page_address(token->eb->pages[idx + 1]);  \
>>       |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
> 
> The warning is correct, on powerpc and 64k pages the array has only 1
> item, ie. only index 0 is valid. The overflow won't happen in practice
> though because of previous branch that would happen in 100% cases. The
> code handles when some bytes cross 2 pages but on 64k pages it's all
> just one page.
> 
> To allow the warning to be enabled globally we'll fix it, I'll let
> Gustavo know once it's done.

Awesome. :)

Thanks, David.
--
Gustavo

