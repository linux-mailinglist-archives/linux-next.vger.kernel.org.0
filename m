Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 497172F0D27
	for <lists+linux-next@lfdr.de>; Mon, 11 Jan 2021 08:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725917AbhAKHZ3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Jan 2021 02:25:29 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:38703 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbhAKHZ3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Jan 2021 02:25:29 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 584282246;
        Mon, 11 Jan 2021 02:24:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 11 Jan 2021 02:24:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=oTk9qxjggj8k3+Jk6DND6iSQdC6
        Ga0j20+wE6NXltGY=; b=5MYhJGyr7kD08MauMhWMTdmuJOJou1czYlyOgK/mdmJ
        zdjz0BlK0FylnQgLcbQDy80nsuf+DTGB+T+BJ+Tfz0WYOcv+FDKIWn1dW5oiDePF
        iN4xzwzNVL1/ERR4yk+X1clWR+8xG92BvWlUPNmJdeai5oWWg92jeWmtmFg17k4p
        OHdEUf6umHwGA+uX/TIGLR5H6LWQoxvK/8Jrr+6kWGmF3Go98SNPvPmoejfBzzBH
        BUx93qfVoCS5mWT4Xl7OVWLjzAV7KqLN6SjT1JgVtSzY+ULw7RbTprNvLkyuW/zw
        DE2UWsx2tPgLofHnc5epAtiY0eGnMsDZ+u7AH+g22Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=oTk9qx
        jggj8k3+Jk6DND6iSQdC6Ga0j20+wE6NXltGY=; b=O8QBLDiBEFsZ1PzxHwqmW+
        t2RJcrWgX3lpeAhUlATqcYDHuhfNlfZUfx9kh4ffQMq3KtA2/+qnCWap7nioWu1c
        XvUmWpaKnLq02P+gzGY9QImauBzNSMoORD1LYQhxFZ9CMlw7FZkeuHmRSRjwH3LA
        q5djFnOZYzHLwI+flfMmPgIFONxyR92fdYaeMVK4FURyxNQamkXq5LjcEOt1e9ic
        3fQ70WSZInH8QMSXJb2O7JQmr/lQ/L+8wUJzPZGixiC3JNQeHdM1bh0XtPz35zvg
        9NMNPg7g/vpYvaZoMoq9NB0mEkzf3S1BA4TKlQf0x9rNwY5EBNHkqxz8JInXfpeg
        ==
X-ME-Sender: <xms:JP37Xz4CMa3dFDkiOYuQKZBQEfJxE8blDan2o4EsvJqkBe1mrpxTiQ>
    <xme:JP37X47E_-LQVe2nVU0rvP2s69uiUDjBsfDlhdwEx2Yb2pZXkcRNPJWuq2TsgHBQK
    GHbRvqJRIQMFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehtddguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:JP37X6ecxr84qGvVhAXlcFkBidA9Z7z4n544g8Ji-NVszs2Ph_IeTg>
    <xmx:JP37X0IpJpm3hUlbQ3r47I1Ar2iShJLZWAVRG3sKRgc6M87CRqfsRA>
    <xmx:JP37X3KhbP_tsD9WvsXrHWNcu-QXaExMZO-bbB5_7LBrS-j517MkTg>
    <xmx:Jf37X4UeAL5aPHcywkYazKGY5PE9uMXyiy4_1ZCqZ06_y6mm08zb-MrmGD8>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id AD6061080057;
        Mon, 11 Jan 2021 02:24:19 -0500 (EST)
Date:   Mon, 11 Jan 2021 08:25:32 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Matthew Gerlach <matthew.gerlach@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Moritz Fischer <mdf@kernel.org>,
        Russ Weight <russell.h.weight@intel.com>,
        Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 drivers-x86 tree
Message-ID: <X/v9bAznWVNMupY7@kroah.com>
References: <20210111130851.374bf4ea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210111130851.374bf4ea@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 11, 2021 at 01:08:51PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got conflicts in:
> 
>   include/linux/mod_devicetable.h
>   scripts/mod/devicetable-offsets.c
>   scripts/mod/file2alias.c
> 
> between commit:
> 
>   eb0e90a82098 ("platform/surface: aggregator: Add dedicated bus and device type")
> 
> from the drivers-x86 tree and commits:
> 
>   9326eecd9365 ("fpga: dfl: move dfl_device_id to mod_devicetable.h")
>   4a224acec597 ("fpga: dfl: add dfl bus support to MODULE_DEVICE_TABLE()")
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, this looks correct, and expected as new subsystems add
auto-loading capabilities at the same time.

greg k-h
