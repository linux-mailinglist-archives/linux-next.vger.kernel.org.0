Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDAA2954BD
	for <lists+linux-next@lfdr.de>; Thu, 22 Oct 2020 00:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506617AbgJUWTq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Oct 2020 18:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506612AbgJUWTq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2020 18:19:46 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E80AC0613CE
        for <linux-next@vger.kernel.org>; Wed, 21 Oct 2020 15:19:46 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 89EC12C8;
        Wed, 21 Oct 2020 22:19:45 +0000 (UTC)
Date:   Wed, 21 Oct 2020 16:19:44 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Fam Zheng <famzheng@amazon.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the jc_docs
 tree
Message-ID: <20201021161944.14fb7d9f@lwn.net>
In-Reply-To: <20201022085542.0abc028d@canb.auug.org.au>
References: <20201022085542.0abc028d@canb.auug.org.au>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 22 Oct 2020 08:55:42 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Commit
> 
>   9467739c239d ("docs: Add two missing entries in vm sysctl index")
> 
> is missing a Signed-off-by from its author.

Argh, I should have caught that.  I'd blame wildfires, but that would be
lame.

Offending commit removed; Fam, can you send a properly signed-off
replacement?  Meanwhile I'm going to go look at my tooling so this doesn't
happen again...

Thanks for the heads-up,

jon
