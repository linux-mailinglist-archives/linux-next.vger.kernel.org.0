Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0814E3E147A
	for <lists+linux-next@lfdr.de>; Thu,  5 Aug 2021 14:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237231AbhHEMMa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Aug 2021 08:12:30 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:33094 "EHLO
        mail.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232222AbhHEMMa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Aug 2021 08:12:30 -0400
Received: from localhost (unknown [149.11.102.75])
        by mail.monkeyblade.net (Postfix) with ESMTPSA id 711AA50227ABE;
        Thu,  5 Aug 2021 05:12:14 -0700 (PDT)
Date:   Thu, 05 Aug 2021 13:12:09 +0100 (BST)
Message-Id: <20210805.131209.906112545233883548.davem@davemloft.net>
To:     broonie@kernel.org
Cc:     loic.poulain@linaro.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: linux-next: build failure after merge of the net-next tree
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20210805120138.23953-1-broonie@kernel.org>
References: <20210805120138.23953-1-broonie@kernel.org>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2 (mail.monkeyblade.net [0.0.0.0]); Thu, 05 Aug 2021 05:12:15 -0700 (PDT)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Mark Brown <broonie@kernel.org>
Date: Thu,  5 Aug 2021 13:01:38 +0100

> Hi all,
> 
> After merging the mac80211-next tree, today's linux-next build
> (x86 allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/net/wwan/mhi_wwan_mbim.c: In function 'mhi_mbim_probe':
> /tmp/next/build/drivers/net/wwan/mhi_wwan_mbim.c:611:8: error: too few arguments to function 'mhi_prepare_for_transfer'
>   err = mhi_prepare_for_transfer(mhi_dev);
>         ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from /tmp/next/build/drivers/net/wwan/mhi_wwan_mbim.c:18:
> /tmp/next/build/include/linux/mhi.h:726:5: note: declared here
>  int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
>      ^~~~~~~~~~~~~~~~~~~~~~~~
> Caused by commit
> 
>    aa730a9905b7b079ef2ff ("net: wwan: Add MHI MBIM network driver")
> 
> That API has been modified in ce78ffa3ef16810 ("net: really fix the
> build...") in the net tree.  I've used the net-next tree from yesterday.

Should be fixed now, thanks.
