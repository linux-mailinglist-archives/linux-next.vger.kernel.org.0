Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28183C681D
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 03:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbhGMBgH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Jul 2021 21:36:07 -0400
Received: from gateway21.websitewelcome.com ([192.185.45.147]:31033 "EHLO
        gateway21.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230182AbhGMBgH (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Jul 2021 21:36:07 -0400
X-Greylist: delayed 1428 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Jul 2021 21:36:06 EDT
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway21.websitewelcome.com (Postfix) with ESMTP id 1AB4E400FFBEA
        for <linux-next@vger.kernel.org>; Mon, 12 Jul 2021 20:08:41 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 36ufmPRl5oIHn36ufmhvIn; Mon, 12 Jul 2021 20:08:41 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=EI1PdhcyIjOXIfe/hfGHB5sXwHWmQq3DmZIYcGdVqWg=; b=E26bAC7yDErpC4ph9r7W+bxcCg
        xqbGz/pupPDoveAWQ1GVuXWRH7SRBtsDpnFyPtOP7e/znJqUQY6VZB5DzEto2m6Zhw8B+Lauju03O
        W58dCahuW5GwfZ9pOMGH8cJ6J1hnqNofMb2SYQYYGUMPqgagIyYbiTpvnQpOkwatHFSRpQAQojIhP
        xuHAs38EDCt4/4ADUzegjdg9uWLUmjpS4vMR1Xzr91M9d/5nK1ejtf/RrzYohGljv9tMQwu/Lr3NF
        VAco5U8GYbu4rnCOK+uriQoy39JlxGN59WKAHO86d9mir5mTxgJr3ym3ijb+YSrGM8KBG7wcadtNg
        zjmlHZmw==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:35582 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1m36uc-003ZE9-Lr; Mon, 12 Jul 2021 20:08:38 -0500
Subject: Re: linux-next: build warning after merge of the kspp-gustavo tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kees Cook <keescook@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210713102230.728b4899@canb.auug.org.au>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <26f2ec3c-35ae-4361-62a4-ad0a84fc2399@embeddedor.com>
Date:   Mon, 12 Jul 2021 20:10:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713102230.728b4899@canb.auug.org.au>
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
X-Exim-ID: 1m36uc-003ZE9-Lr
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:35582
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 7/12/21 19:22, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp-gustavo tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> /home/sfr/next/next/drivers/gpu/drm/msm/msm_gem.c: In function 'msm_gem_new_impl':
> /home/sfr/next/next/drivers/gpu/drm/msm/msm_gem.c:1170:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
>  1170 |   if (priv->has_cached_coherent)
>       |      ^
> /home/sfr/next/next/drivers/gpu/drm/msm/msm_gem.c:1173:2: note: here
>  1173 |  default:
>       |  ^~~~~~~
> 
> Introduced by commit
> 
>   d12e339044a0 ("drm/msm: add MSM_BO_CACHED_COHERENT")
> 
> Presumably exposed by commit
> 
>   73ffc61f4a8b ("Makefile: Enable -Wimplicit-fallthrough for Clang")
> 
> though I am not sure why since I am building with gcc.  The first
> commit above introduces a new use of /* fallthrough */

We have previously adopted the new pseudo-keyword macro fallthrough; So,
we want to avoid having more /* fallthrough */ comments being introduced.
This is also being enforced by commit

	73ffc61f4a8b ("Makefile: Enable -Wimplicit-fallthrough for Clang")

for both GCC and Clang.

So, the fix for this issue is merely to replace the /* fallthrough */ comment
with fallthrough;

Thanks
--
Gustavo


