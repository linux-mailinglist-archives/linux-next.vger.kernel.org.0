Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E40EB340DA3
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 19:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbhCRS6w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 14:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232772AbhCRS6h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 14:58:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE02DC06174A;
        Thu, 18 Mar 2021 11:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=3PjOp+lk4bp+j1ybJzbccJCr44SWPFydI7o9KoqHLQs=; b=EBJEDA+bSKteXzmolNEj5iWl9m
        q6nJjUmAnJkUIhDdaoeP8Y/7V+XatW5vMwwXrNmTjmT9rDFZetrav2sdVoIo2vC/v4/ndZSM0XXfO
        m3Hdcqmy8SIWO1mcocYrcWeLxvRDLWI3jL9yxbE/ph+zqtGiEY973dZVYyQwZsW+3X5iEOy+qg26F
        K51/lvIZK1LL+Ayrb4kopqBSqaO5PX1wUiCcRFyy5Nbx3AXiFrrXf7yqO5wO+JS44oSqbxWPPCrRm
        aaLS+l3/UPzYqeve92nf3lKvB1o919Je5j1+Agxr2a454P+q624/5zZPNheCPUnuXzUhaYrqr9w6X
        QS/sUrEw==;
Received: from [2601:1c0:6280:3f0::9757]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lMxq0-003NeF-Kl; Thu, 18 Mar 2021 18:57:44 +0000
Subject: Re: linux-next: Tree for Mar 18 (cifsd: Kconfig)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
        linux-cifsd-devel@lists.sourceforge.net,
        Hyunchul Lee <hyc.lee@gmail.com>,
        Steve French <sfrench@samba.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Namjae Jeon <namjae.jeon@samsung.com>
References: <20210318210844.5e9adf1e@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3497bc60-51be-04ba-50c8-4bc258df7f31@infradead.org>
Date:   Thu, 18 Mar 2021 11:57:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318210844.5e9adf1e@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/18/21 3:08 AM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next release on Friday this week.
> 
> Warning: Some of the branches in linux-next are still based on v5.12-rc1,
> so please be careful if you are trying to bisect a bug.
> 
> News: if your -next included tree is based on Linus' tree tag
> v5.12-rc1{,-dontuse} (or somewhere between v5.11 and that tag), please
> consider rebasing it onto v5.12-rc2. Also, please check any branches
> merged into your branch.
> 
> Changes since 20210317:
> 
> The cifsd tree lost its build failure.

kconfig warning in cifsd:

WARNING: unmet direct dependencies detected for CRYPTO_ARC4
  Depends on [n]: CRYPTO [=y] && CRYPTO_USER_API_ENABLE_OBSOLETE [=n]
  Selected by [y]:
  - SMB_SERVER [=y] && NETWORK_FILESYSTEMS [=y] && INET [=y]



Either
	select CRYPTO_ARC4 if CRYPTO_USER_API_ENABLE_OBSOLETE
or add
	select CRYPTO_USER_API
	select CRYPTO_USER_API_ENABLE_OBSOLETE

The first choice is certainly more palatable if it is OK.


thanks.
-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
