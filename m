Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 067733AACA9
	for <lists+linux-next@lfdr.de>; Thu, 17 Jun 2021 08:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhFQGqD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Jun 2021 02:46:03 -0400
Received: from gateway30.websitewelcome.com ([192.185.148.2]:27200 "EHLO
        gateway30.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229551AbhFQGqD (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Jun 2021 02:46:03 -0400
X-Greylist: delayed 1290 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Jun 2021 02:46:03 EDT
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway30.websitewelcome.com (Postfix) with ESMTP id 4401ACFCD
        for <linux-next@vger.kernel.org>; Thu, 17 Jun 2021 01:22:25 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id tlQ1lxjp1hbxptlQ1le8Sm; Thu, 17 Jun 2021 01:22:25 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YpYo8R+ALsdZs0nfFrr56oJTZtzTTuJTWlJI4l2f+fY=; b=MJVdustfzukyOFLzCb7YbxxZyD
        bAtQajHqTwDYsCOjPh7rrFw6SPgv7bUyW1LcyYcOO4VkBQoh/WYJO4+1uJ63mj4Tl0KYkfV2H59ny
        l7LJtlV724s1Svwhx5zet7jU7ntVQINXkFAkG4wDTOxjNspJa3iEWQ7kPSHAW21EVVhVer6ePIXGm
        0k08ZfyWiuw20L0UM5Zk4TJZ2RVG+BdPO3pCUHh+Gq8glxaWCPRCzhq4fUCpN6g8AJ7aFI9+Ck1D7
        0J+cObOkeP6O9mlrx4lb0YCo5HWz9/ekbjZfWnrNOaRcat0q+K0ZOSu9TheAqnLpkZidiaguKjY8T
        qPZINfMA==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:35874 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1ltlQ0-001i9J-1P; Thu, 17 Jun 2021 01:22:24 -0500
Subject: Re: linux-next: Fixes tag needs some work in the kspp-gustavo tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210617081112.25e57b9b@canb.auug.org.au>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <b5ec84d4-d58f-99bb-3bb8-115d507ac785@embeddedor.com>
Date:   Thu, 17 Jun 2021 01:23:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617081112.25e57b9b@canb.auug.org.au>
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
X-Exim-ID: 1ltlQ0-001i9J-1P
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:35874
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 6/16/21 17:11, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   d5f3d2f175ce ("media: venus: hfi_cmds: Fix packet size calculation")
> 
> Fixes tag
> 
>   Fixes: 701e10b3fd9f ("media: venus: hfi_cmds.h: Replace one-element array with flexible-array member")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 380f3bbd9562 ("media: venus: hfi_cmds.h: Replace zero-length array with flexible-array member")
> 

I'll fix it up.

Thanks for the report!
--
Gustavo
