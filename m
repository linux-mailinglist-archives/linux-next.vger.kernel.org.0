Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C1222E9DB
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 12:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgG0KRp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 06:17:45 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:46921 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726139AbgG0KRp (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jul 2020 06:17:45 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 9161F3FC;
        Mon, 27 Jul 2020 06:17:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 27 Jul 2020 06:17:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=ZDs/129nDxe4od5CuQldkDJUHjv
        hQGEA4HL1+Z4NwB0=; b=UenlOqPNa8ALR+X82P4+hNkZ2XzF4zV1VnRbnINe360
        t5OnKx0CfbRQaOiqDzGx8j3GyPwwHUoFGQ7QufLraaMnNfetVMjKjpk+F40g/v2N
        jvCQLWDWvUizvK6yiQ//OBM32NOA4O7ZxMQZ6vChAQ1fNQKyJvm2tS5siEfZXQua
        uT/AHhgogs/DXHnebxT68OWS7hH0ok/JfZmXloTyq3UDeHF2gmmTmk2PmudUDzjA
        dOaHzX+8+SThg2hnQh1xAIAkyiwipQx/P277UVG936oVToyaQE5zQsP774SxbOnL
        9+RyWrzbsCfCD9i5e2kf54VyxaFIuk90WSCAuqQHl1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZDs/12
        9nDxe4od5CuQldkDJUHjvhQGEA4HL1+Z4NwB0=; b=Oh+o8qIiSx0zx7tH0opo/Y
        OQxaaQ7rOyDgx8yC/hIiAgVhSorjS9PkiOhVblPuIZ+laa/+furai2vMk8h5trKa
        WO4yy2t62j5IY6W5RvnOTBgPPAxV/H5BVMHpEGUQCkyYO7VG4yPpSU2O/1yqc0Jf
        VsGZCDUd46YE65tEjE2yBLMbo+VZAloEncRA1MhD3Wi6x1rblErneXTwK/0w13wg
        bAiJG8DoxtNUOB8JZZBy1EpIIge1+diQ0wdOlALQddPP5K4krUh7qKxj5FvpdJ1d
        F8BxwOhG3ilEwF2t3lfNjzkxd+kcCnSUb4AxNWKblVJOshmPDGmNMO1WIrmCmVJw
        ==
X-ME-Sender: <xms:x6keX2OwXvklkq8BK0gfhBX6e5MwA20ukZlEJe1oZDFztnZ0Vx_jdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedtgddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:x6keX08oBP0w5nyK56rmVJi2WxmW3V3Cv9Nntmt8jcajLGMtY00ZmA>
    <xmx:x6keX9R7MBnIfQ7F2RM5JIe9sijGy2tmq5GRZN3yF8SQld4_CY44ow>
    <xmx:x6keX2udOI1VK8pCJoNeA93QkIoeYsm2AsJw1PyhAZNiPEb1_oBROg>
    <xmx:yKkeXyHL364vxT4qg3XRHEWKlnIideKqnS0FKzeKMTpEbTJMbQgHuQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 17F2A3280063;
        Mon, 27 Jul 2020 06:17:42 -0400 (EDT)
Date:   Mon, 27 Jul 2020 12:17:38 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Scott Branden <scott.branden@broadcom.com>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <20200727101738.GA1923289@kroah.com>
References: <20200727165539.0e8797ab@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727165539.0e8797ab@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 27, 2020 at 04:55:39PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from include/linux/dmi.h:5,
>                  from drivers/firmware/efi/embedded-firmware.c:8:
> drivers/firmware/efi/embedded-firmware.c:25:38: error: static declaration of 'efi_embedded_fw_list' follows non-static declaration
>    25 | EFI_EMBEDDED_FW_VISIBILITY LIST_HEAD(efi_embedded_fw_list);
>       |                                      ^~~~~~~~~~~~~~~~~~~~
> include/linux/list.h:24:19: note: in definition of macro 'LIST_HEAD'
>    24 |  struct list_head name = LIST_HEAD_INIT(name)
>       |                   ^~~~
> In file included from drivers/firmware/efi/embedded-firmware.c:17:
> drivers/firmware/efi/embedded-firmware.h:16:25: note: previous declaration of 'efi_embedded_fw_list' was here
>    16 | extern struct list_head efi_embedded_fw_list;
>       |                         ^~~~~~~~~~~~~~~~~~~~
> drivers/firmware/efi/embedded-firmware.c:26:33: error: static declaration of 'efi_embedded_fw_checked' follows non-static declaration
>    26 | EFI_EMBEDDED_FW_VISIBILITY bool efi_embedded_fw_checked;
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/firmware/efi/embedded-firmware.c:17:
> drivers/firmware/efi/embedded-firmware.h:17:13: note: previous declaration of 'efi_embedded_fw_checked' was here
>    17 | extern bool efi_embedded_fw_checked;
>       |             ^~~~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   2d38dbf89a06 ("test_firmware: Test platform fw loading on non-EFI systems")
> 
> CONFIG_TEST_FIRMWARE=m for this build.
> 
> I have used the driver-core tree from next-20200724 for today.

Thanks, I've reverted this from my tree now.

greg k-h
