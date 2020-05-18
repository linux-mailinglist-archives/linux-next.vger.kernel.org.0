Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962B11D786E
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 14:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgERMW4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 08:22:56 -0400
Received: from ms.lwn.net ([45.79.88.28]:33700 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726585AbgERMW4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 May 2020 08:22:56 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 897EA2CC;
        Mon, 18 May 2020 12:22:54 +0000 (UTC)
Date:   Mon, 18 May 2020 06:22:53 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@ZenIV.linux.org.uk>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Kitt <steve@sk2.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the jc_docs tree with the vfs and
 net-next trees
Message-ID: <20200518062253.24709cec@lwn.net>
In-Reply-To: <20200518123013.6e4cb3cc@canb.auug.org.au>
References: <20200518123013.6e4cb3cc@canb.auug.org.au>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 18 May 2020 12:30:13 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the jc_docs tree got a conflict in:
> 
>   kernel/sysctl.c
> 
> between commit:
> 
>   f461d2dcd511 ("sysctl: avoid forward declarations")
> 
> from the vfs tree and commit:
> 
>   2f4c33063ad7 ("docs: sysctl/kernel: document ngroups_max")
> 
> from the jc_docs tree.

Hmm...that's somewhat messy.  I somehow managed to miss the change to
kernel/sysctl.c that doesn't have much to do with documentation.  Stephen
(Kitt): I've reverted that change for now.  Could I ask you to resubmit it
as two different patches?  I'll happily take the actual docs change; the
sysctl change can be sent to the VFS tree on top of the changes there.

In general we really don't want to mix unrelated changes like this.

Thanks,

jon
