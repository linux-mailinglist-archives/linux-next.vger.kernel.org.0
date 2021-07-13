Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 093693C6895
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 04:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhGMCka (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Jul 2021 22:40:30 -0400
Received: from gateway21.websitewelcome.com ([192.185.45.155]:26986 "EHLO
        gateway21.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230022AbhGMCka (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Jul 2021 22:40:30 -0400
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
        by gateway21.websitewelcome.com (Postfix) with ESMTP id 47128400DF906
        for <linux-next@vger.kernel.org>; Mon, 12 Jul 2021 21:37:41 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 38InmgClR7sOi38InmZUF6; Mon, 12 Jul 2021 21:37:41 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=wpv8psm02uZEIzGe4pfHvQI+mzbvtCWaDHm6UbEsKjo=; b=Xy0fNMGCoGgpSiPCxIEYNcFbUF
        8OblOSuek7fviIUlxqlv/XmRV6oUcmBAgWXJGPhLSn9zE2wG/xcJPuVH9xUkUWYf9m+sPv9m/b4HK
        BO+UXIqgHswD+SBV1v5m/L6n332Y85uiGjll4w93JOED1tOAyK+74AKqElfXrJcTqwlotBo6RSepu
        gI5bYF2Z2IWSpIuSAbjFToQBMWreO93Ysma6gtKZJLiRmbHXgg6tyALvZi72g2TDhnfQgI+Ai14zr
        UYnUymVjAqN/guLbI62QUh1nJtuXPL/UVsXdVG2UCPz0eMSEfeyGY2w9MZUN/VbDcL7FU6GzmUy+M
        ksm2zJfw==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:36036 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1m38Ik-000fX5-Th; Mon, 12 Jul 2021 21:37:38 -0500
Subject: Re: linux-next: build warning after merge of the kspp-gustavo tree
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kees Cook <keescook@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210713102230.728b4899@canb.auug.org.au>
 <26f2ec3c-35ae-4361-62a4-ad0a84fc2399@embeddedor.com>
Message-ID: <8242dd71-57ad-1c69-900e-db1773be643e@embeddedor.com>
Date:   Mon, 12 Jul 2021 21:39:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <26f2ec3c-35ae-4361-62a4-ad0a84fc2399@embeddedor.com>
Content-Type: text/plain; charset=windows-1252
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
X-Exim-ID: 1m38Ik-000fX5-Th
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:36036
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen

On 7/12/21 20:10, Gustavo A. R. Silva wrote:
> Hi Stephen,
> 
> On 7/12/21 19:22, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the kspp-gustavo tree, today's linux-next build (arm
>> multi_v7_defconfig) produced this warning:
>>
>> /home/sfr/next/next/drivers/gpu/drm/msm/msm_gem.c: In function 'msm_gem_new_impl':
>> /home/sfr/next/next/drivers/gpu/drm/msm/msm_gem.c:1170:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
>>  1170 |   if (priv->has_cached_coherent)
>>       |      ^
>> /home/sfr/next/next/drivers/gpu/drm/msm/msm_gem.c:1173:2: note: here
>>  1173 |  default:
>>       |  ^~~~~~~
>>
>> Introduced by commit
>>
>>   d12e339044a0 ("drm/msm: add MSM_BO_CACHED_COHERENT")
>>
>> Presumably exposed by commit
>>
>>   73ffc61f4a8b ("Makefile: Enable -Wimplicit-fallthrough for Clang")
>>
>> though I am not sure why since I am building with gcc.  The first
>> commit above introduces a new use of /* fallthrough */
> 
> We have previously adopted the new pseudo-keyword macro fallthrough; So,
> we want to avoid having more /* fallthrough */ comments being introduced.
> This is also being enforced by commit
> 
> 	73ffc61f4a8b ("Makefile: Enable -Wimplicit-fallthrough for Clang")
> 
> for both GCC and Clang.
> 
> So, the fix for this issue is merely to replace the /* fallthrough */ comment
> with fallthrough;

I've already added a fix for this to my -next branch:

https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?h=for-next/kspp&id=e181ad43887c6b6b5995e9b191666f04242d77eb

Thanks for the report!
--
Gustavo
