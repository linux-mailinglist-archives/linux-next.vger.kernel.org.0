Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3968250C32
	for <lists+linux-next@lfdr.de>; Tue, 25 Aug 2020 01:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgHXXSQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Aug 2020 19:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHXXSQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Aug 2020 19:18:16 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15822C061574;
        Mon, 24 Aug 2020 16:18:15 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9CFC42CB;
        Mon, 24 Aug 2020 23:18:15 +0000 (UTC)
Date:   Mon, 24 Aug 2020 17:18:14 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the jc_docs
 tree
Message-ID: <20200824171814.7905b7c9@lwn.net>
In-Reply-To: <20200825091346.63395129@canb.auug.org.au>
References: <20200825091346.63395129@canb.auug.org.au>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 25 Aug 2020 09:13:46 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Commit
> 
>   09824ed3a906 ("Documentation/locking/locktypes: fix local_locks documentation")
> 
> is missing a Signed-off-by from its committer.

*That* is weird...it was applied with the same "git am" script as all the
rest...  Thanks for the heads-up, sure wish I knew what's going on.

jon
