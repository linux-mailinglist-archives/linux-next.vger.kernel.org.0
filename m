Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40A8517F2A9
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 10:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgCJJE0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 05:04:26 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56179 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726195AbgCJJE0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Mar 2020 05:04:26 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 1F27E21EBC;
        Tue, 10 Mar 2020 05:04:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 10 Mar 2020 05:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=uatK4ds+rmul1mRriGcrKyF/spn
        Qea/id1rAEINGl3w=; b=XXsXuouY7BuRN3rXbfvoUn57graVW/NVR5a8/96Mvsi
        hvLOkUQYjK66xoqjljmfXr08gzhlbfiGX4uW9yr1lIgMggYcxrzjywqv7vu9l+hi
        BlG/qDUDIEr26w6MeepzWyWQBSTglWR75hDfg4FuCE5a/M75yNqt3Q6mf3LE+AKo
        0AeUW+FgHyzBkXhA2dtFRsJ3LKlERchyl3ESyro+dvgySt8UC61g9ULQM9ygbY2H
        C885gchkLJlHb3AabL2bNjGEufdWRvHuoQr23fwZHa+zh+WXXtR/SJJkGEvSLtJW
        W7vxWYvOGhCh3ZvMltEPNIecVnSI5fXyPgn4ImCe+Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uatK4d
        s+rmul1mRriGcrKyF/spnQea/id1rAEINGl3w=; b=epIKnBDy3QLd/vkX2YNGB+
        58BK51/dq1HOwaMyadHz5C0aQpUQQk86MBCXP8sOLHk5eSq6zAh9anxZ590Hpad7
        Bf267Ue8QHvT7ODd2B/oGn4NrRkX4h56W1cEEGawNtB1y8FxcfhGiaWApDyV4m5s
        iBhRb4CdUaKYj5/HwerD3D+yv0J/lE8tzt2O/klofxKiVW4NDCOAF6Xul6lQVTQP
        8DZHSFaewgS+Za8tjVHIXHYWcahhFHCy3WcJ4vhXshKyxW2ynCrpPpzzR4Dcc/kD
        5QjTYzet678vPilm4CV4x6lbCXefEQJPdx9T/rCNM3k2zNHYkyr3PnDPZmK51Ucw
        ==
X-ME-Sender: <xms:GFhnXliTxr80ghzg69QEHLKVo47_4VUy2n9RRAQEGvl-e85_QHxIcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudduledguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledrud
    dtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehg
    rhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:GFhnXkvZp3U3C_OGY09YoE3qV3ZYBJe0bnm2rY5UQoxOpGFRFtcg9w>
    <xmx:GFhnXhhIVa7Nh5wmjv1C9Y-T-RP4AcXappCtRc7SLMRw9i8ztP4fDA>
    <xmx:GFhnXgQVBslFMxEbJWAaoQO_41BrL2G_K62ZcDERfgQpg0dqumdV5w>
    <xmx:GVhnXvJFAjKxRB4HR8DkAeZwRWWa7UK5qaBtck7Fiw0rNrRWQbKcTQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3B4EA3280069;
        Tue, 10 Mar 2020 05:04:24 -0400 (EDT)
Date:   Tue, 10 Mar 2020 10:04:22 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jslaby@suse.cz>
Subject: Re: linux-next: manual merge of the tty tree with Linus' tree
Message-ID: <20200310090422.GB2445065@kroah.com>
References: <20200310144013.6df85b46@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310144013.6df85b46@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 10, 2020 at 02:40:13PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tty tree got a conflict in:
> 
>   drivers/tty/vt/selection.c
> 
> between commits:
> 
>   4b70dd57a15d ("vt: selection, push console lock down")
>   e8c75a30a23c ("vt: selection, push sel_lock up")
> 
> from Linus' tree and commits:
> 
>   9256d09f1da1 ("vt: selection, create struct from console selection globals")
>   bc80932cc25a ("vt: selection, indent switch-case properly")
> 
> from the tty tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thank you for this, I hadn't gotten to it yet.

Your merge looks the same as mine, and I've pushed out the merge
resolution in my tree.

Jiri, can you double-check to verify that the merge is correct in my
tree?

thanks,

greg k-h
