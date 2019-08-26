Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA8AC9C96F
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 08:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728020AbfHZGa2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 02:30:28 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:34133 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727650AbfHZGa2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Aug 2019 02:30:28 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 35EC9321;
        Mon, 26 Aug 2019 02:30:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 26 Aug 2019 02:30:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=vVTMyUMt6Pj6Ue/YwOdzlubQ7qZ
        c/n/fXB43Fd8eoqQ=; b=QbqX3+W5w8vIpNDhKYNQpd1JoAxo2tFZAWGcVBBXPS0
        KEfnh5MVFSh3Nn863+kXnsJjNth/V9jb2+RlYEvTVJu11KRflBTbdhaC7GwZLmaX
        lNdv66O7P244+ctG7iuwby2QjDTOGeqi92P/mIyHVLgjjOVozS/Kpc4ze9rw55zX
        AHqAobFwBBvcpBKvULxpqbyOg1wQcNxJFFkl1ulb2cJx8kAXYkqWIWwEUoa7tpaV
        E+k9TY9ia5RY4CnVpjaBUtMAMFz7aVxfMBopdcd4bQEwoPIvllgd6fQAMqkKtWHS
        8/0NWuAojWz+ww4H1YR3ia2MX+CxXAgzgkVOP7wYRpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vVTMyU
        Mt6Pj6Ue/YwOdzlubQ7qZc/n/fXB43Fd8eoqQ=; b=fbroD+uLiAb2674oGIhao/
        V6yom8Pr0g7I8F2dhx1XVMeJzWznRi/qC1G1y7d7Xi9CTxB3PEll8HPda7tJoXED
        NiuMO+L/a4we6CNiyx9vp3eytcLMF2uFAJeKQgkXqUyeUG+Rhu0zBmH9zUAF84Lr
        9Fes00qtFd7bHLqNPve/Mh7cErrUn+l9HfMNM55pCodbYiruulwZCum8BWlw3MQD
        WfPQtyTsEf6pmP3P0Bw1pNtZ+wWw81k/VYaSBRPcD2+g1nRL/oAdxA3ko+3f0zNP
        3Grfp3TK+2dEexLV683m/fCtvnYj0McqBbTueB7IgNjz12ZXjYufmBquyOHmL+Ag
        ==
X-ME-Sender: <xms:gnxjXYauSuR5J8x3ytpwcQQEe4mc0MWWxrlzLbOC60Qnl6P1XDFIAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehfedguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrd
    dutdejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhen
    ucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:gnxjXQwztb7sGQ9zoP-1uu2V4Nke3x32lnp1yWQ4PxUY15nkM8B4aQ>
    <xmx:gnxjXYI-EYIIeG0bnnMzzIY1G_hAaYFlx2nl_AUVkPWHGHwDZ38nYw>
    <xmx:gnxjXQCELY6SIbmceBLL7JA7z2KBteQx6nzd-0AC3Qez3xynPxFQtw>
    <xmx:gnxjXa816b8ixi7E5wBJu9Bj1ORTsPN_3NBvewLSrpKHw8L0PuRK1A>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 16303D60066;
        Mon, 26 Aug 2019 02:30:25 -0400 (EDT)
Date:   Mon, 26 Aug 2019 08:30:24 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Gao Xiang <hsiangkao@aol.com>
Subject: Re: linux-next: build warning after merge of the staging tree
Message-ID: <20190826063024.GA1217@kroah.com>
References: <20190826162432.11100665@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826162432.11100665@canb.auug.org.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 26, 2019 at 04:24:32PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the staging tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> In file included from include/trace/events/erofs.h:8,
>                  from <command-line>:
> include/trace/events/erofs.h:28:37: warning: 'struct dentry' declared inside parameter list will not be visible outside of this definition or declaration
>   TP_PROTO(struct inode *dir, struct dentry *dentry, unsigned int flags),
>                                      ^~~~~~
> include/linux/tracepoint.h:233:34: note: in definition of macro '__DECLARE_TRACE'
>   static inline void trace_##name(proto)    \
>                                   ^~~~~
> include/linux/tracepoint.h:396:24: note: in expansion of macro 'PARAMS'
>   __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
>                         ^~~~~~
> include/linux/tracepoint.h:532:2: note: in expansion of macro 'DECLARE_TRACE'
>   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
>   ^~~~~~~~~~~~~
> include/linux/tracepoint.h:532:22: note: in expansion of macro 'PARAMS'
>   DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
>                       ^~~~~~
> include/trace/events/erofs.h:26:1: note: in expansion of macro 'TRACE_EVENT'
>  TRACE_EVENT(erofs_lookup,
>  ^~~~~~~~~~~
> include/trace/events/erofs.h:28:2: note: in expansion of macro 'TP_PROTO'
>   TP_PROTO(struct inode *dir, struct dentry *dentry, unsigned int flags),
>   ^~~~~~~~
> 
> and moany more like this ...
> 
> Introduced by commit
> 
>   47e4937a4a7c ("erofs: move erofs out of staging")
> 
> (or, at least, exposed by it).  It needs, at least, a "struct dentry;"
> added to the file.

Odd, why has this never been seen before when the same files were in
drivers/staging/ and why 0-day isn't reporting this?

Gao, can you send me a patch for this?

thanks,

greg k-h
