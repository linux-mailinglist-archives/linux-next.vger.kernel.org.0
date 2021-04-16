Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33080361B76
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 10:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235027AbhDPILP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Apr 2021 04:11:15 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:57349 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234708AbhDPILO (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 16 Apr 2021 04:11:14 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 3CE585804BC;
        Fri, 16 Apr 2021 04:10:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 16 Apr 2021 04:10:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=yPZi+7KiR50TB/v3JPVHEco9xo9
        fjXzN5jg2sgQKdFM=; b=mjgw0FuD0Jin/r8kx/exjEhE1tnZCaSNmsiVg+4lnKA
        KKD0Fw/Wdlh3JHb9QRZjqVSS4rpjIQHxjZI7lnHY2Jh7xOOZtPqzP+JJkAojOTDt
        GdazMszYE9YfogxKegPmtY14D5WSZourRmjWA8bsF4p3tyjV62G8FOHnWxxRYx8O
        PfwzfU+nSt+Sl+RmUb/nkjkpOzVa9M9M81ER6DbqVA45OrgzezMF7dyVigW2wuW3
        UEOcLiV9OhZzLedAHDT332jAINkrDEwdU1UMVklbwjP/T2QWJJf787DSRYfX3tEV
        Oaev3LXFovVllgXykGtTUHOPhAgTYvgGQtCsSmFXGOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=yPZi+7
        KiR50TB/v3JPVHEco9xo9fjXzN5jg2sgQKdFM=; b=YZN4FkBAj+Bl0O1WbmyJmv
        8EyEzbkflaXJNaHbBrnMgbYccSpcg0QTwuelrGr/Cp1bZRhJUOD89cJyq1js/8Gg
        VbHghK+iY5uY6QKr9Q+91XI1NEi0CNAsOB0GnD63Saqy3nt6D6lDVYR9R/L9afPh
        7CcIx0lMJhy0vz40ZKaSQrRAGQTiu09QoewXkGza59n2A+OQYJGBZx/S0RUflM2R
        Y7SDlPkEdkmaQXoi2tC/0UY5CLOZkZj1/JY4zvjOCZkzd3pfk1P9tMSYWNapVtXg
        ZTKeNPy3vHdo0SVz5U5aBXjMvvEPV1SxFCyRuEHC3v8sTTDJBWcT3dljp3bK+RHg
        ==
X-ME-Sender: <xms:iEZ5YENYoU7ae4OjwmN5Xp_NbS9ufbbZsJpuIlmSW4Okio8Bxfa3KA>
    <xme:iEZ5YK_iuC-mPDBQ0WzuPBoeRW4UGafdSDdmJY5Lbebfls_-VRE6dEF6Z8er8xswC
    EFtU177Vav3Bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelhedgtdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:iEZ5YLQWFiDkS28ddLNjUlK5yXsed2hePUdUmTOjuvLn9ZULIdVGZQ>
    <xmx:iEZ5YMvOoMxg2RmLKuyUPMyO_oZX5YTxEv_qXjmxuiZ9I8ipQRKLgQ>
    <xmx:iEZ5YMcyqoM1H-D7bLfDuGHAyrAO7K8g_RJeanRKBwP9We39AZEsAQ>
    <xmx:ikZ5YDwUCFNL6qJL7b_ZBn8hUFlpBgPCEj037n-7hlfhHfsjcs_MJQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 81D0624005B;
        Fri, 16 Apr 2021 04:10:48 -0400 (EDT)
Date:   Fri, 16 Apr 2021 10:10:46 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Hang Lu <hangl@codeaurora.org>,
        Li Li <dualli@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Marco Ballesio <balejs@google.com>,
        Miguel Ojeda <ojeda@kernel.org>, Todd Kjos <tkjos@google.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: linux-next: manual merge of the rust tree with the char-misc tree
Message-ID: <YHlGhmEEQIc8u9uj@kroah.com>
References: <20210416175806.2acd314b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416175806.2acd314b@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 16, 2021 at 05:58:06PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rust tree got a conflict in:
> 
>   include/uapi/linux/android/binder.h
> 
> between commits:
> 
>   432ff1e91694 ("binder: BINDER_FREEZE ioctl")
>   ae28c1be1e54 ("binder: BINDER_GET_FROZEN_INFO ioctl")
>   a7dc1e6f99df ("binder: tell userspace to dump current backtrace when detected oneway spamming")
> 
> from the char-misc tree and commit:
> 
>   1fed5dee5fbb ("Android: Binder IPC in Rust (WIP)")
> 
> from the rust tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hah, yeah, it is going to hit this and needs to be fixed up in the rust
code.  If they really want this as an enum, we can talk about it :)

thanks,

greg k-h
