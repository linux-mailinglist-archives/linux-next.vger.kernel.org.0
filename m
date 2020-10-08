Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39CE22875AF
	for <lists+linux-next@lfdr.de>; Thu,  8 Oct 2020 16:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730486AbgJHOJ1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Oct 2020 10:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730469AbgJHOJV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Oct 2020 10:09:21 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87DCAC061755;
        Thu,  8 Oct 2020 07:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=xQnI5k0UWbQqEXwkaaqkzKf//Jwim2eyhVqcWr5X3k0=; b=eyb/ytN85F4OFwh/oOn68rQQiT
        AmoWru00FPRzao0qpCuB9UwUnJrsyO7m8PQ5sn+WuLeZpbFR6WVWuuhWY7XqgoWdzZKDmvRb9gI9/
        aX+eWxsLCaXmpmJORZFG0WhLmCWaMTB1AfEJv6gf2E725IQ6EY9YsGh7UHJ9gCr4y1vC3osHCNT/5
        M7JK76IZ4zjMZXRsWgkQUGqk4eQPInphO1SoPm8SyN7r5rYPFKj3bDP2iDqiUZWiwC5tVKX0BFxrR
        k4S717MFQ1Zbx8VIbgChK4RvzrmdKuBYFQvMJYYpeCA8s+Ih2WoT9RLpV1Hi8dDJbreDHzxuRurqU
        Pf0urdbw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kQWbf-0003EA-2z; Thu, 08 Oct 2020 14:09:19 +0000
Date:   Thu, 8 Oct 2020 15:09:19 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the xarray tree
Message-ID: <20201008140919.GF20115@casper.infradead.org>
References: <20201008175540.13dc645d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008175540.13dc645d@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 08, 2020 at 05:55:40PM +1100, Stephen Rothwell wrote:
> After merging the xarray tree, today's linux-next build (x86_64
> allmodconfig) failed like this:

Thanks, fixed both problems.

