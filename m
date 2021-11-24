Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5683C45C8CC
	for <lists+linux-next@lfdr.de>; Wed, 24 Nov 2021 16:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241381AbhKXPiW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Nov 2021 10:38:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235626AbhKXPiW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Nov 2021 10:38:22 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEF2C061574;
        Wed, 24 Nov 2021 07:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=HR2bPhOh6y/Sf5n3jhbYJzVMzoIIcULV90TnyCvdCuc=; b=aRhazJxBSfJbaE77TdGnnejHwm
        dcAdMLbzN58H5/FwM3asc3PuurCBNF6Upei0LnxAyDAE4+Vyz8nU+JiwoIPsYrncPkn7lW5CIaUal
        fBc+AEb18gLB2ixUN3Ma30q/DdvPaxu/a4Vr3YeCklnINhLEiLuaEuQbtNeZOYa3lymriJVqWfurf
        H+jfQ3LGQ1ZglWJnFjFfWMFKnf4w3UqOfmJxPDwZbogRdBL0m68Fe/5TVYqx7/0chg0Vi3/+2+nFf
        8C1l7pHTaBPviaNyW7JiIV6d+XAapfeHNUtQ3pKVujn8xW5GoLeriOdKHEeCvQbRC5jbU8N2d7Ah/
        9KKhWB4A==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mpuIg-00566i-JH; Wed, 24 Nov 2021 15:35:10 +0000
Subject: Re: linux-next: Tree for Nov 24
 (drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.o)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        amd-gfx@lists.freedesktop.org,
        DRI <dri-devel@lists.freedesktop.org>
References: <20211124161632.1aabe7a5@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4084c3ab-1467-8da6-200d-9f123c3b99ac@infradead.org>
Date:   Wed, 24 Nov 2021 07:35:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211124161632.1aabe7a5@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/23/21 9:16 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20211123:
> 

on i386:

ld: drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.o: in function `dscc_compute_dsc_parameters':
rc_calc_dpi.c:(.text+0x31f): undefined reference to `__udivdi3'


-- 
~Randy
