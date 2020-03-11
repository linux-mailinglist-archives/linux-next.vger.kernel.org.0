Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0160618231C
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 21:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731246AbgCKUGR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Mar 2020 16:06:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:35458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731214AbgCKUGR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Mar 2020 16:06:17 -0400
Received: from vulkan (unknown [170.249.165.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BDCB20739;
        Wed, 11 Mar 2020 20:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583957177;
        bh=Dtt1T1Eb5jXEhAvGJ7Ls7woWlnRZjlxMlJnfziDzxGI=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=GkM2H7MJNd77kCGIRkhj+XqKeDRo+1Ox+VfAM9vIhMN/qZxrnNfZf+/hAa0+5bWhO
         GC3YhLmyzPgQJV2DvRoSjyGnzKsZDp6AyXDex7mbmcmN+vTqETw5sgy1b8OOzvxjom
         8GJ53xlJV2nP9a1EZCq7yiQ3KSdZrI39z/6FE2qQ=
Message-ID: <7d4c32b94a2ae900afa316c12047f7d79a31aaba.camel@kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the file-locks
 tree
From:   Jeff Layton <jlayton@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NeilBrown <neilb@suse.de>
Date:   Wed, 11 Mar 2020 15:06:14 -0500
In-Reply-To: <20200312011809.408fd045@canb.auug.org.au>
References: <20200312011809.408fd045@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 2020-03-12 at 01:18 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   e2de130a568c ("locks: reintroduce locks_delete_lock shortcut")
> 
> is missing a Signed-off-by from its author.
> 

Yes, sorry. Neil sent a draft patch and I went ahead and pulled it in
before he had a chance to fix up the changelog and add his SoB. Once he
does we'll get that fixed (and before I send this up to Linus).

Thanks,
Jeff

