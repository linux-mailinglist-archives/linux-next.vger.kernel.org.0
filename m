Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04BED2FF331
	for <lists+linux-next@lfdr.de>; Thu, 21 Jan 2021 19:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729279AbhAUSbD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Jan 2021 13:31:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728883AbhAUSa6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Jan 2021 13:30:58 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C631DC06174A;
        Thu, 21 Jan 2021 10:30:18 -0800 (PST)
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 569F6615C;
        Thu, 21 Jan 2021 18:30:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 569F6615C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1611253818; bh=eutz1kougsyfLJTOd3EAZ39w9HGEbO41o66idr6PIUo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oqh67FIHJGdN9yzrJh1qJGYDs7d16p4J3bu9fc2H4GztKFuJWPxnU3f6SvQc8Ej3x
         qAAPPa1Dp1+CFebSkJXVcax7H5tTXvXa/jg9rmzoA6y8m8I5tMH/NFqJm01+/pMcnQ
         MKrIH0DamOV32uxpZdF6RkItIJUxyFRbomcsJWcgVZVK5rTe0JIyOJsQt6j9S7fsoQ
         9+YLcxPfPzAgOchm8ESgqVK+ucomXU8ru0reRbcmRMQ3EOLcBXgq4RqPwPTdYj2zcN
         iEZen+MjVaQ73WYUiAh3MJOtfM0b/MT23E5WzAaSaQxu0fVXE0UCXljEYSdLuPXZDb
         fiKcJhSPjivfw==
Date:   Thu, 21 Jan 2021 11:30:17 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     =?UTF-8?B?5Y+45bu26IW+?= <siyanteng@loongson.cn>
Cc:     "Stephen Rothwell" <sfr@canb.auug.org.au>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20210121113017.62286f45@lwn.net>
In-Reply-To: <4b5a642b.4d7e.17722b2a4af.Coremail.siyanteng@loongson.cn>
References: <20210113150748.1efc75aa@canb.auug.org.au>
        <20210113162730.4f6dc0ac@lwn.net>
        <4b5a642b.4d7e.17722b2a4af.Coremail.siyanteng@loongson.cn>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 21 Jan 2021 10:07:48 +0800 (GMT+08:00)
司延腾 <siyanteng@loongson.cn> wrote:

> Sorry, I apologize for the inconvenience caused to you, I do not
> quibble, but I have been studying for nearly a week, please pay
> attention to my future patches.

Please don't worry, mistakes happen; we just have to learn from them.  I'm
looking forward to your future work.

Thanks,

jon
