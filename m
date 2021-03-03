Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F36132C8F3
	for <lists+linux-next@lfdr.de>; Thu,  4 Mar 2021 02:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232258AbhCDA7V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 19:59:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:57012 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235238AbhCCThJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Mar 2021 14:37:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9A2364EDF;
        Wed,  3 Mar 2021 19:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614799637;
        bh=MHM99VviRIapg5RL8JoOki2zh5ooLbvZ1+hyyhnsZ3E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dIyH47FyjSW1wITEdvNZiAzramvu6U9hH6kU1M/FfRAAmePx+jKpQlre2h9aGEi42
         ZfTAkpi7ZUR3vAmDhKCFa8U7hE+uVrmLyt4hEOdDG2OJCxILxoIlXx7JdWAdGT1Ly7
         YY269NEWi0mSl5FzHsFqWIGJSvBGDhaVucQkKW98k/uhFs0lCWSyMPDwuQSUYExENb
         oCabCAbVXLNdYdjKBkA2bEgarXqs4UjYVagF/mO5im/GefbqiXQ5Y1OASwcCPMx6BW
         b6LcuZdSk3XiAHCictz7SdcV2JIVS3lFuw+o1heo9VM/xEEyKwbp5UL0leeeb7GMBt
         w7Oya6rJo88YQ==
Date:   Wed, 3 Mar 2021 11:27:16 -0800
From:   Jaegeuk Kim <jaegeuk@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the f2fs tree
Message-ID: <YD/jFHcnj8wJ/b09@google.com>
References: <20210303092351.35b015e3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303092351.35b015e3@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 03/03, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the f2fs tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> fs/f2fs/sysfs.c:576:25: warning: 'f2fs_attr_ovp_segments' defined but not used [-Wunused-variable]
>   576 | static struct f2fs_attr f2fs_attr_##name = __ATTR(name, 0444, name##_show, NULL)
>       |                         ^~~~~~~~~~
> fs/f2fs/sysfs.c:639:1: note: in expansion of macro 'F2FS_GENERAL_RO_ATTR'
>   639 | F2FS_GENERAL_RO_ATTR(ovp_segments);
>       | ^~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   10e0b8ef8715 ("f2fs: expose # of overprivision segments")

Thanks. Should be fixed soon.

> 
> -- 
> Cheers,
> Stephen Rothwell


