Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F561262863
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 09:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgIIHU6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 03:20:58 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:38989 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725864AbgIIHU4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 03:20:56 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id B92C3772;
        Wed,  9 Sep 2020 03:20:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 09 Sep 2020 03:20:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=Ui0sqITKNHLMEBUtqjpfFktW/6v
        sZATzAgvExiygMVg=; b=qIEe/lP1ky86vhV0x1O8GBKSN4dvS5W4cnNjdddkBaB
        43J0ntxc2QujfyTBV+NtgH9nMQF5B5q5/T4z/dwvEhLJUQcsFMvLTHUBStlJegaP
        Pb+hl0HgnlLDZqpLggqHNQGMwrU3BZIsy4a0s5GySv5zJgzj44U8pi6BDAwy68KU
        i78KFa3bUyZO7etjbic2sBz4E0u20oBJcR1w9TnC0InuPmGuslGy9WeZp83jIIVF
        +XxEI2lrOEfobiSDNfwQdwmw0IohuiHPb6g6P2bC6V2MoU4vhxsnp7MENvfsh8iB
        5v+4w6jR8jsXcz7EY7A8plgsu+P04Numtfr2m6GhB/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Ui0sqI
        TKNHLMEBUtqjpfFktW/6vsZATzAgvExiygMVg=; b=Fi9hoFHhjYmHPJb6hIDT9e
        6X4+LtsWzlDsoaGY6iz/X8f9LD0dMewfjEJv9/uEeLiRbZdFYrLFVJ65B0Z+dSIQ
        +WwDHycrmllSK2i0jYEY/o44MvfZEZ2GykKLOzKjr2P72gx+WIM/cQ5VRbhnB2n8
        /DIrdbjjueaAUaXhlHZ4Ks3e9jFYWx/+OpsRQBCiqAJnw+xpeQPti1y4raJi6wQ/
        TEwCT6SuAycsM0jI/lbsMn1Ku5+eMIexnaDdIlFkGTTBU1EnCKUmE9QWmI+90g5a
        rkmMW7Jbak/aEWRP6XkNcCQ4j7+j2OpzTbp5yLtUFFO3Phf8S54JEhyp1Tzr5Lnw
        ==
X-ME-Sender: <xms:VoJYX9Of3rQEVU401WQ_cKClztpxSYNb9emEOwVqmUFP02i5QOqjhQ>
    <xme:VoJYX_-6255vI4vr9PdKv9CBCdNcSc153nA0WcRdsDpEk0OfL5L8oveVxZRV0w8bl
    J9uWH0a2NV6cQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehgedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:VoJYX8QQBIr2pA9I82ARQOvF0k6QXxPO2G3OVBTwJA4Oc8BhbkJS5A>
    <xmx:VoJYX5unXhzkXLCCAwhc4xSsV1KwBRetqCJT7x_4ZMuUSiGtivkY8Q>
    <xmx:VoJYX1djCkh_Qe34pZ5s8lKClJ9F1izb7QPXaw5ko3jVAQOKK4Azow>
    <xmx:V4JYX1HrCgz9hLsUjOBfonzpalcePKDclT0rWoyQRUEPudCdXgIOpQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1A26A30649C8;
        Wed,  9 Sep 2020 03:20:54 -0400 (EDT)
Date:   Wed, 9 Sep 2020 09:21:05 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <20200909072105.GA438160@kroah.com>
References: <20200909154709.619fe9bb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909154709.619fe9bb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 09, 2020 at 03:47:09PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the driver-core tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> lib/test_firmware.c: In function 'trigger_request_platform_store':
> lib/test_firmware.c:517:35: error: 'efi_embedded_fw_list' undeclared (first use in this function); did you mean 'efi_embedded_fw_desc'?
>   517 |  list_add(&efi_embedded_fw.list, &efi_embedded_fw_list);
>       |                                   ^~~~~~~~~~~~~~~~~~~~
>       |                                   efi_embedded_fw_desc
> lib/test_firmware.c:517:35: note: each undeclared identifier is reported only once for each function it appears in
> lib/test_firmware.c:518:34: error: 'efi_embedded_fw_checked' undeclared (first use in this function); did you mean 'saved_efi_embedded_fw_checked'?
>   518 |  saved_efi_embedded_fw_checked = efi_embedded_fw_checked;
>       |                                  ^~~~~~~~~~~~~~~~~~~~~~~
>       |                                  saved_efi_embedded_fw_checked
> 
> Caused by commit
> 
>   18efb2f9e897 ("test_firmware: Test platform fw loading on non-EFI systems")

{sigh}

I'll go revert this, sorry about that.

Kees, can you fix up this whole series and resend it again?  I'm
dropping it from my trees now...

thanks,

greg k-h
