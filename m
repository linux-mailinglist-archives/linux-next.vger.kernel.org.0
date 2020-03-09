Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF86817EC8B
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 00:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgCIXRm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Mar 2020 19:17:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:40156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726698AbgCIXRm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Mar 2020 19:17:42 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 94F312146E;
        Mon,  9 Mar 2020 23:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583795861;
        bh=wa+lBkf3egB7zRHwcS9hbPziO+9VWjfRhmzJ9OncfhU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G1JR/s2UTlzLt0tpi1/04f6wBI8VwOzSxJwSrp4qLheDI2MPWk4mavivfdGql7bnb
         4stwQkgd84rA/09sXtz9CV/avYAGmLRbLshkkMg5tRN4WAspUiEcDVXk/GY0jy2Mfy
         XgnNmQyL7nmLbFHZLb69XKfpE31I2SYP30OKRhgo=
Received: by pali.im (Postfix)
        id 9A556BE0; Tue, 10 Mar 2020 00:17:39 +0100 (CET)
Date:   Tue, 10 Mar 2020 00:17:39 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@ZenIV.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Namjae Jeon <namjae.jeon@samsung.com>,
        Sungjong Seo <sj1557.seo@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build warning after merge of the vfs tree
Message-ID: <20200309231739.2w45cleifsmwbfd6@pali>
References: <20200310095918.3ea6432f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310095918.3ea6432f@canb.auug.org.au>
User-Agent: NeoMutt/20180716
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tuesday 10 March 2020 09:59:18 Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> warning: same module names found:
>   fs/exfat/exfat.ko
>   drivers/staging/exfat/exfat.ko
> 
> Introduced by commit
> 
>   b9d1e2e6265f ("exfat: add Kconfig and Makefile")
> 
> and not fixed by commit
> 
>   1a3c0509ce83 ("staging: exfat: make staging/exfat and fs/exfat mutually exclusive")

Hello Stephen!

exfat.ko from fs/exfat subdirectory is a rewrite/cleanup of staging
exfat driver. It means that fs/exfat replaces staging/exfat and so after
fs/exfat is merged, the old staging/exfat code is not needed anymore.

Therefore I think that instead of hacking Kconfig/Makefile files to
define mutually exclusivity, it is better to remove staging/exfat code.

Removal of old staging code should be easy and should fix this problem.

Any objections? Or other ideas?
