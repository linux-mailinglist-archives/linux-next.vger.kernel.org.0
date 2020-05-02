Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC6E51C24C5
	for <lists+linux-next@lfdr.de>; Sat,  2 May 2020 13:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726745AbgEBLjW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 2 May 2020 07:39:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:59366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726654AbgEBLjV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 2 May 2020 07:39:21 -0400
Received: from localhost (unknown [117.99.89.89])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1419520787;
        Sat,  2 May 2020 11:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588419561;
        bh=R2c9GRwkqg5iMS+mfsOlh/LedPet/Kp3Dl1mwW0bj5Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yyBYV/IPd2affxFisvqeym5Rm6VhI1d4KNswL/S2QxIm9nSs3wVtq4Sr0Brv4GhXf
         6owOxp8m2NeB64Arvog40TMU/OloOshj7QmVXOSOW32yo2gGGcRSwsvuMlVMhP0ko1
         zAUeFEEPZvIhZdkY2fnuCuSSWIxA9x8kpl2Ris0A=
Date:   Sat, 2 May 2020 17:09:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: Re: linux-next: build warning after merge of the soundwire tree
Message-ID: <20200502113909.GP948789@vkoul-mobl.Dlink>
References: <20200429181403.07a54d40@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429181403.07a54d40@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 29-04-20, 18:14, Stephen Rothwell wrote:
> Hi all,
> 
> [Sorry that I did not report this earlier.]
> 
> After merging the soundwire tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/soundwire/intel_init.c:193:14: warning: 'sdw_intel_init' defined but not used [-Wunused-function]
>   193 | static void *sdw_intel_init(acpi_handle *parent_handle,
>       |              ^~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   2978a43e7690 ("soundwire: intel: Make sdw_intel_init static")

Thanks for the report, will fix it

-- 
~Vinod
