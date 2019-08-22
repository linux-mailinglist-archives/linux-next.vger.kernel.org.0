Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFC7F98B5B
	for <lists+linux-next@lfdr.de>; Thu, 22 Aug 2019 08:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729731AbfHVG0Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 22 Aug 2019 02:26:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:47822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729416AbfHVG0Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Aug 2019 02:26:24 -0400
Received: from localhost (unknown [171.61.89.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52A26205ED;
        Thu, 22 Aug 2019 06:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566455183;
        bh=rPBSwpnS+cnfcPZ3TBKKII3gNOdcXoeSX+9+ZfKdTOE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sL6yD2PeEptr4pH9jGIbJ5a0drDZUwXzUFuXBX7Ghd5XMQTVbOZfizl2+qo2avInh
         xyIYMx19kGx8mW3WuGZ5LbcRHBKoGnzlb8avvzUethT9xTAKjO/8yxF3osScy0Ivm9
         YBD6SYPbYM1Zimox+JQnKv+ZzqFMbQrXkrMfLhok=
Date:   Thu, 22 Aug 2019 11:55:12 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: linux-next: build warning after merge of the soundwire tree
Message-ID: <20190822062512.GL12733@vkoul-mobl.Dlink>
References: <20190822160425.6998054e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822160425.6998054e@canb.auug.org.au>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 22-08-19, 16:04, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the soundwire tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/soundwire/intel.c: In function 'sdw_master_read_intel_prop':
> drivers/soundwire/intel.c:829:12: warning: unused variable 'i' [-Wunused-variable]
>   int nval, i;
>             ^
> drivers/soundwire/intel.c:829:6: warning: unused variable 'nval' [-Wunused-variable]
>   int nval, i;
>       ^~~~
> 
> Introduced by commit
> 
>   085f4ace103d ("soundwire: intel: read mclk_freq property from firmware")

Thanks Stephen for the report. I have fixed it up by removing these.
Posting the patch now

Thanks
-- 
~Vinod
