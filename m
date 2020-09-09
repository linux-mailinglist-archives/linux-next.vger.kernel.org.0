Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E81262898
	for <lists+linux-next@lfdr.de>; Wed,  9 Sep 2020 09:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728954AbgIIH2a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Sep 2020 03:28:30 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:38881 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726738AbgIIH20 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Sep 2020 03:28:26 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id AA1F7873;
        Wed,  9 Sep 2020 03:28:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 09 Sep 2020 03:28:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=ztv3pYM9if/AKbtduMXThCKbXls
        eUt+U5+kl5SHucvo=; b=nTjUSHXvCf0Z1Nz7ii7cQ2jTR9AQHTr+DTUfjS6gxNB
        Ldg3j5KnpdWg3OMTWH4oGB/9/06f/N3ptPyLNeP2S0BtdIRpU9svieZ3hkTYTIr4
        vl4YfOJlXJGjvn2R8u/v50A4UIXHyuqv3ku/9Iw9zLEYCK9GGiWOiGuRUlrA3tR9
        CeadJIYap4+GHjCTj63abC4EIQBEQNNqixtmHlxuA3hzRfZyG08K/yMA6850Z3R5
        9H9+KnWATswB3k6ftRV6LDXTVKf5LszDf8+mWihzgpJsUVRCs5EixniI8U7S+Li3
        p1ts3Ad70YPjGU5xP7lyFyMoOALu3zRof8aF7YITxkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ztv3pY
        M9if/AKbtduMXThCKbXlseUt+U5+kl5SHucvo=; b=n4siJob6OsV/ePASdIHLaB
        5hZZkFtEo9kjbde8xW3BImB/NbaeiyiegpCmsIYTX3ZVurDXuP5Z/FvuGvuE+bVz
        PFbdqyx85BjYAJYP8joqWsfco9nE3e95UGLSWUEkAV7hNHnmq09t1q6y7AgZ+6UI
        g7g4cZaCpSzkP3UksU/YA6sdCp8FpS8AoDBP49wDjuHS30hwcGaT+baqo1yD+kWm
        0PzWGS96LtP2/z8Utl26puk6Frf8PMPj2GIC5LjbPiuDR6ClrK4mtXFegJ2LZtBI
        1IJBCTrgBsP+E4nWvaavt4Yo5x+pzYxeXb419Wm3zIK8kFs1Pocmtr5VEFEo5z4g
        ==
X-ME-Sender: <xms:GIRYX-6blghuaOAZLLEu36Cfi1RDZwYKdA7AL3JnYkccwLsjk_o46Q>
    <xme:GIRYX35UlmPRBkP9ROdvW9VBOmdu2mGxmGbMyMaC1f3r1jcuEdrA4jm5Bq239zJ29
    IRzo6VeHgkzSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehgedguddvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeek
    fedrkeeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:GIRYX9eFc5ZmBxtazoCf7_z_lx6MX7hAJysxQNdX5mnZVkBK1dSRSg>
    <xmx:GIRYX7KShvIsNkVwiYudOuJtBpm84AcMUvgiEtq9hFU-JyeaGJ2rdg>
    <xmx:GIRYXyImdP9UpdWdQPyVFHDKa3svFzHiQeDjSOHx6JnxDEYiV4ZdtQ>
    <xmx:GYRYX0iChrX7yp4TYoWXP0l7gQ0_XMAjzhLPr_RrQAIDL15-cU3ewA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6F7C93064A01;
        Wed,  9 Sep 2020 03:28:24 -0400 (EDT)
Date:   Wed, 9 Sep 2020 09:28:35 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <20200909072835.GA439753@kroah.com>
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
> 
> I have reverted that commit for today.

Now reverted in my tree too, thanks.

greg k-h
