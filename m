Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834BA366557
	for <lists+linux-next@lfdr.de>; Wed, 21 Apr 2021 08:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235156AbhDUGXT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Apr 2021 02:23:19 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44827 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229536AbhDUGXT (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Apr 2021 02:23:19 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id A70B15C00DC;
        Wed, 21 Apr 2021 02:22:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 21 Apr 2021 02:22:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=OePD+OMRf+l3dBtkpSzPl8BchZh
        pgHwh7yf0EO5qpQ0=; b=DLd71EToOLNGiPofhKoqBsC5KoCEOQYSd6dw6b0R9oA
        bJDMKt6Gwri3EmjDq2Gq/pmCYa2OIM/tO7ZZzspupykcU2hFJW7a+Ymow5wua0i0
        jv3JIpCKB6JBqREP1EAoUaUl3Dzx2okZN5JKkR2Dq6HG9pNv/8S+qlOTijhZzLJl
        FJEaUPD/mkAynkzF10yvDDa/MUa8zfCOSTbwuAkotc+CdHtSwvg1EHn+ckm3jNbY
        D8yUqLh1Am0S1lQ0+100KS5bFH6rSmQ25XgphoNNm+VKF2TSHp2EFWpo8lJFRci2
        g9+/9VhWZ6AvaAnHkS6++81gnl0lHEc7a4BlzIiv3QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OePD+O
        MRf+l3dBtkpSzPl8BchZhpgHwh7yf0EO5qpQ0=; b=aegX+gFLaOiT0MAp3527XZ
        hPQiX7EtmhpfwnhcJRQPqn38vgB9fGAH6XIRM0Jsn0wRplEKFyvMfMl2AbOvPHZs
        xKkVRfV8E7plqmMIYda0sOuIJrT9oDMG3W6j6deXr2gG/HE+eETpYTV9C9Imqmry
        MwtMn1Das/NvdTiKmvxkHnY0ydn+ZfSng8XhoWztk84VEjHj9oUkmMbfS/Gqofop
        vzgrAWyYS3diKU9j3MSJDbv35sWKYUHhrMzd3XQRvAVDwM8jHrnZpIzlS/iG+e6q
        4KHc/XsFd0Q7tRw9NxwA0Bx28ZiDtwDvx5r2ITsE0Y+OF0RWPjqMeAH8PSRSCsvQ
        ==
X-ME-Sender: <xms:tMR_YI5ho_hYz8lkBrTFQOK68zGZEKw38QcdR9vfAZGgAXRfK5MzOA>
    <xme:tMR_YJ45FAKC1jiGtlcCqhjFSEmiGqvYvsICXRKNOmYv5VHL7jgBIr2KPmfgxd0LA
    1Og-Q0zXa9QeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtjedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:tMR_YHfUaCf-It3DYFnKRMOX4b9w0xT1xxzYW6Mx1wUG9NVfeUB1mg>
    <xmx:tMR_YNLMHEtnKq1sl8H6fUHXqRaLNbk2uc0hYa5n_QZ2G2UTLqFfew>
    <xmx:tMR_YMKlIwUxgfluwuL5CKzDxPs_rKmX8g7VbOm1POsiF7JkyQKEIg>
    <xmx:tcR_YGjgnbWAMEF5oscgfFZ1Xdg7sCK2ACCkvEHJAYrsYbFOC1nlEg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id B4BE7108005B;
        Wed, 21 Apr 2021 02:22:44 -0400 (EDT)
Date:   Wed, 21 Apr 2021 08:22:40 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <YH/EsCvkbm0q6kCT@kroah.com>
References: <20210310134916.367c96b5@canb.auug.org.au>
 <20210421160725.5623cbd8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421160725.5623cbd8@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Apr 21, 2021 at 04:07:25PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 10 Mar 2021 13:49:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > After merging the usb tree, today's linux-next build (htmldocs) produced
> > this warning:
> > 
> > include/linux/usb/ch9.h:1: warning: no structured comments found
> > 
> > Introduced by commit
> > 
> >   855b35ea96c4 ("usb: common: move function's kerneldoc next to its definition")
> 
> I am still seeing thus warning (as of next-20210420).

Ick, sorry, will go dig...
