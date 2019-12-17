Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32E41123ABC
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2019 00:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfLQXXF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 17 Dec 2019 18:23:05 -0500
Received: from muru.com ([72.249.23.125]:49072 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725940AbfLQXXF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Dec 2019 18:23:05 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A89FC8116;
        Tue, 17 Dec 2019 23:23:44 +0000 (UTC)
Date:   Tue, 17 Dec 2019 15:23:02 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: linux-next: Fixes tag needs some work in the omap-fixes tree
Message-ID: <20191217232302.GF35479@atomide.com>
References: <20191218071348.024f73e4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20191218071348.024f73e4@canb.auug.org.au>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

* Stephen Rothwell <sfr@canb.auug.org.au> [191217 20:53]:
> Hi all,
> 
> In commit
> 
>   d094e1b4b232 ("ARM: dts: am571x-idk: Fix gpios property to have the correct  gpio number")
> 
> Fixes tag
> 
>   Fixes: d23f3839fe97d8dce03d ("ARM: dts: DRA7: Add pcie1 dt node for
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
> 
> Please do not break FIxes tags over more that one line.  Also, keep all
> the tags together at the end of the commit message.

Thanks will fix up.

Tony

